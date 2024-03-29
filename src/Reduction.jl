
"""
    Reduction

Represents a single reduction of some ODE system. 
This is returned from reduction functions.

Example:
```julia
using ExactODEReduction
odes = @ODEsystem(
    x'(t) = x + y,
    y'(t) = x - y - z,
    z'(t) = 2x - z
)

reduction = find_some_reduction(odes)

## prints
Reduction of dimension 1.
New system:
y1'(t) = y1(t)
New variables:
y1 = x + 1//2*y - 1//4*z

new_system(reduction)
## prints
y1'(t) = y1(t)

new_vars(reduction)
## prints
Dict{Nemo.fmpq_mpoly, Nemo.fmpq_mpoly} with 1 entry:
  y1 => x + 1//2*y - 1//4*z
```

"""
struct Reduction{A, B, C}
    new_system::ODE{A}
    new_vars::Dict{A, B}
    old_system::ODE{C}
    lumping_matrix::Union{Nothing, Matrix{Any}}

    function Reduction{A, B, C}(new_system::ODE{A}, new_vars::Dict{A, B}, old_system::ODE{C}) where {A, B, C}
        lumping_matrix = nothing
        if !isempty(new_vars)
            lumping_vars = [new_vars[x] for x in gens(parent(new_system))]
            lumping_combs = [sum(collect(coefficients(comb)) .* exponent_vectors(comb)) for comb in lumping_vars]
            lumping_matrix = mapreduce(permutedims, vcat, lumping_combs)
        end
        return new{A, B, C}(new_system, new_vars, old_system, lumping_matrix)
    end

    function Reduction{P}(old_ode::ODE{P}, subspace, parameter_strategy=:inhertiance) where {P}
        (lumping_matrix, transformation, new_equations) = perform_change_of_variables(equations_extended(old_ode), subspace)
        
        # (!) assumes the correct order in new_equations, i.e.,
        # ∂y[1] ~ new_equations[1],
        # ∂y[2] ~ new_equations[2],
        # ...
        new_ode = polystoODE_assumeorder(new_equations)
        new_vars = Dict(new_ode.x_vars .=> transformation)

        eval_point = merge(
            Dict(string.(states(old_ode)) .=> initial_conditions(old_ode)), 
            Dict(string.(parameters(old_ode)) .=> parameter_values(old_ode))
        )
        allvars = gens(parent(first(transformation)))
        if elem_type(parent(new_ode)) == fmpq_mpoly
            for i in 1:length(states(new_ode))
                initial_conditions(new_ode)[i] = sum([eval_point[string(x)] * convert(Float64, coeff(transformation[i], x)) for x in allvars])
            end
        else
            @warn "Complex-valued reduction, skipping the initial conditions"
        end

        if parameter_strategy == :inheritance
            for (v, trans) in new_vars
                if all(x -> x in parameters(old_ode), vars(trans))
                    new_ode = to_parameter(new_ode, v) 
                end
            end
        elseif parameter_strategy == :constants
            for v in states(new_ode)
                if iszero(new_ode.x_equations[v])
                    new_ode = to_parameter(new_ode, v) 
                end
            end
        elseif parameter_strategy != :none
            @warn "Unknown parameter handling strategy $parameter_strategy, using none"
        end

        return new{elem_type(parent(new_ode)), elem_type(parent(first(transformation))), elem_type(parent(old_ode))}(new_ode, new_vars, old_ode, lumping_matrix)
    end
end

"""
    new_system(r::Reduction)

Returns the `ODE` object that defines the reduced system.
"""
new_system(r::Reduction) = r.new_system

"""
    new_system(r::Reduction)

Returns the dictionary of new macro-variables expressed
as linear combinations of the original variables.
"""
new_vars(r::Reduction) = r.new_vars

"""
    old_system(r::Reduction)

Returns the `ODE` object that defines the original system.
"""
old_system(r::Reduction) = r.old_system

"""
    new_initialconds(r::Reduction, ics::Dict)

Returns a dictionary of initial conditions for the new variables
as defined by the given reduction.
"""
function new_initialconds(r::Reduction, ics::Dict{P, T}) where {P, T}
    newv = new_vars(r)
    newics = Dict(v => eval_at_dict(expr, ics) for (v, expr) in newv)
    newics
end

"""
    reduce_data(data::Array{Any, 2}, r::Reduction)

For a time-series data for the original system, returns 
the corresponding time series for the reduction
"""
function reduce_data(data::Matrix, r::Reduction)
    old_sys = old_system(r)
    new_sys = new_system(r)
    result = Matrix{Any}(undef, length(states(new_sys)), size(data, 2))
    eval_param = Dict{fmpq_mpoly, Any}(p => parameter_values(old_sys)[i] for (i, p) in enumerate(parameters(old_sys)))
    for i in 1:size(data, 2)
        eval_point = merge(eval_param, Dict{fmpq_mpoly, Any}(x => data[j, i] for (j, x) in enumerate(states(old_sys))))
        for j in 1:size(result, 1)
            result[j, i] = eval_at_dict(new_vars(r)[states(new_sys)[j]], eval_point)
        end
    end
    return result
end

Base.isempty(r::Reduction) = isempty(r.new_system)
Base.length(r::Reduction) = length(r.new_system)

_emptyreduction(ode::ODE{P}) where {P} = Reduction{P, P, P}(ODE(parent(ode)), Dict{P, P}(), ode)

function Base.show(io::IO, red::Reduction)
    if isempty(equations(red.new_system)) && isempty(parameters(red.new_system))
        println(io, "Empty reduction")
        return nothing
    end
    println(io, "Reduction of dimension $(length(red.new_vars)).")
    printstyled(io, "New system:\n", bold=true)
    print(io, red.new_system)
    printstyled(io, "New variables:\n", bold=true)
    nv = gens(parent(first(collect(keys(red.new_vars)))))
    veqs = [red.new_vars[v] for v in nv]
    for (v, veq) in zip(nv, veqs)
        println(io, "$v = $veq")
    end
    nothing
end

"""
    Reduction

Represents a chain of `Reduction`s of some ODE system. 
This is returned from the `find_reductions` function.

Example:
```julia
using ExactODEReduction
odes = @ODEsystem(
    x'(t) = x + y,
    y'(t) = x - y - z,
    z'(t) = 2x - z
)

reductions = find_reductions(odes)

## prints
A chain of 2 reductions of dimensions 1, 2.
==================================
1. Reduction of dimension 1.
New system:
y1'(t) = y1(t)
New variables:
y1 = x + 1//2*y - 1//4*z
==================================
2. Reduction of dimension 2.
New system:
y1'(t) = y2(t)
y2'(t) = 2*y1(t) - y2(t)
New variables:
y1 = x - 1//2*z
y2 = y + 1//2*z

reduction2 = reductions[2]
## prints
Reduction of dimension 2.
New system:
y1'(t) = y2(t)
y2'(t) = 2*y1(t) - y2(t)
New variables:
y1 = x - 1//2*z
y2 = y + 1//2*z

```

"""
struct ChainOfReductions#{P, A, B}
    # this is actually a vector of Reduction{A, A, A}
    reductions#::Vector{Reduction{P, A, B}}
end

"""
    length(cor::ChainOfReductions)

Returns the number of reductions in the chain.
"""
Base.length(cor::ChainOfReductions) = length(cor.reductions)

"""
    getindex(cor::ChainOfReductions, i::Integer)

Returns the `i`-th reduction in the chain. Returned object is of type `Reduction`.
"""
Base.getindex(cor::ChainOfReductions, i::Integer) = cor.reductions[i]

Base.isempty(cor::ChainOfReductions) = isempty(cor.reductions)
Base.iterate(cor::ChainOfReductions) = isempty(cor) ? nothing : (cor.reductions[1], 2)
function Base.iterate(cor::ChainOfReductions, i)
    if i > length(cor)
        nothing
    else
        cor.reductions[i], i + 1
    end
end

function Base.show(io::IO, reds::ChainOfReductions)
    if isempty(reds.reductions)
        println(io, "An empty chain of reductions")
        return nothing
    end
    print(io, "A chain of $(length(reds.reductions)) reductions of dimensions ")
    println(io, join(map(red -> length(red.new_vars), reds.reductions), ", "), ".")
    println(io, "==================================")
    for (i, red) in enumerate(reds.reductions)
        printstyled(io, "$i. ", bold=true)
        print(io, red)
        if i != length(reds.reductions)
            println(io, "==================================")
        end
    end
    nothing
end
