
struct Reduction{P, A, B}
    new_system::ODE{P}
    new_vars::Dict{A, B}
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
    new_initialconds(r::Reduction, ics::Dict)

    Returns a dictionary of initial conditions for the new variables
    as defined by the given reduction.
"""
function new_initialconds(r::Reduction, ics::Dict{P, T}) where {P, T}
    newv = new_vars(r)
    newics = Dict(v => eval_at_dict(expr, ics) for (v, expr) in newv)
    newics
end

Base.isempty(r::Reduction) = isempty(r.new_system)
Base.length(r::Reduction) = length(r.new_system)

_emptyreduction(ring) = Reduction(ODE(ring), Dict{elem_type(ring), elem_type(ring)}())

function Base.show(io::IO, red::Reduction)
    if isempty(equations(red.new_system))
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


struct ChainOfReductions#{P, A, B}
    # this is actually a vector of Reduction{A, A, A}
    reductions#::Vector{Reduction{P, A, B}}
end

Base.length(cor::ChainOfReductions) = length(cor.reductions)
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
