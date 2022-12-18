
"""
    ODE{P}

    The main structure that represents input ODE system.
    Stores information about states (`x_vars`), and the equations.
    This structure is constructed via `@ODEmodel` macro.
"""
struct ODE{P}
    poly_ring::MPolyRing
    x_vars::Array{P, 1}
    x_equations::Dict{P, P}

    function ODE{P}(
            eqs::Dict{P, P},
        ) where {P <: Union{fmpq_mpoly, MPolyElem{<: FieldElem}}}
        # Initialize ODE

        isempty(eqs) && error("Empty ODE system")
        ring = parent(first(keys(eqs)))
        vars = gens(ring)
        new{P}(ring, vars, eqs)
    end
end

"""
    equations(ode::ODE)

    Returns the equations that define the given ODE system.
"""
equations(ode::ODE)   = [ode.x_equations[v] for v in ode.x_vars]
Nemo.parent(ode::ODE) = ode.poly_ring

#------------------------------------------------------------------------------

function macrohelper_extract_vars(equations::Array{Expr, 1})
    x_vars = Vector()
    funcs, all_symb = Set(), Set()
    aux_symb = Set([:(+), :(-), :(=), :(*), :(^), :t, :(/), :(//)])
    for eq in equations
        MacroTools.postwalk(
            x -> begin
                if @capture(x, f_'(t))
                    push!(x_vars, f)
                    push!(all_symb, f)
                elseif @capture(x, f_(t))
                    push!(funcs, f)
                elseif (x isa Symbol) && !(x in aux_symb)
                    push!(all_symb, x)
                end
                return x
            end,
            eq
        )
    end
    io_vars = setdiff(funcs, Set(x_vars))
    all_symb = collect(all_symb)
    return x_vars, collect(io_vars), collect(all_symb)
end

function macrohelper_extract_vars(equations::Array{Symbol, 1})
    return macrohelper_extract_vars(map(Expr, equations))
end

#------------------------------------------------------------------------------

function macrohelper_clean(ex::Expr)
    ex = MacroTools.postwalk(x -> @capture(x, f_'(t)) ? f : x, ex)
    ex = MacroTools.postwalk(x -> @capture(x, f_(t)) ? f : x, ex)
    ex = MacroTools.postwalk(x -> x == :(/) ? :(//) : x, ex)
    return ex
end

#------------------------------------------------------------------------------

"""
    @ODEsystem

    Macro for creating an ODE from a list of equations.
    Also injects all variables into the global scope.
    This macro accepts a sybolically written ODE system and generates an `ODE` structure instance:
    ```julia
    ode = @ODEsystem(
        x1'(t) = -k1 * x1(t),
        x2'(t) = -k2 * x2(t)
    )
    [ Info: Summary of the model:
    [ Info: State variables: x2, x1
    [ Info: Parameters: k1, k2
    k2'(t) = 0
    x2'(t) = -x2(t)*k2(t)
    x1'(t) = -k1(t)*x1(t)
    k1'(t) = 0
    ```
"""
macro ODEsystem(ex::Expr...)
    equations = [ex...]
    x_vars, io_vars, all_symb = macrohelper_extract_vars(equations)

    # order of variables in the polynomial ring is the following:
    # 1. diferential variables,
    #   in the order they appear on the left-hand side,
    # 2. paramenters,
    #   sorted lexicographically.
    #
    # the same order appears when the ODE system is displayed
    sort!(all_symb, by=x -> !(x in x_vars))
    all_symb[1:length(x_vars)] = x_vars
    sort!(view(all_symb, length(x_vars)+1:length(all_symb)))

    # creating the polynomial ring
    vars_list = :([$(all_symb...)])
    R = gensym()
    vars_aux = gensym()
    exp_ring = :(($R, $vars_aux) = ExactODEReduction.Nemo.PolynomialRing(
        ExactODEReduction.Nemo.QQ,
        map(string, $all_symb)
    ))
    assignments = [:($(all_symb[i]) = $vars_aux[$i]) for i in 1:length(all_symb)]
    
    # preparing equations
    equations = map(macrohelper_clean, equations)
    x_dict = gensym()
    y_dict = gensym()
    y_vars = Set()
    x_dict_create_expr = :($x_dict = Dict{
        ExactODEReduction.Nemo.fmpq_mpoly,
        ExactODEReduction.Nemo.fmpq_mpoly
    }())
    y_dict_create_expr = :($y_dict = Dict{
        ExactODEReduction.Nemo.fmpq_mpoly,
        ExactODEReduction.Nemo.fmpq_mpoly
    }())
    eqs_expr = []
    for eq in equations
        if eq.head != :(=)
            throw("Problem with parsing at $eq")
        end
        lhs, rhs = eq.args[1:2]
        loc_all_symb = macrohelper_extract_vars([rhs])[3]
        to_insert = undef
        if lhs in x_vars
            to_insert = x_dict
        elseif lhs in io_vars
            to_insert = y_dict
            push!(y_vars, lhs)
        else
            throw("Unknown left-hand side $lhs")
        end
        if isempty(loc_all_symb)
            push!(eqs_expr, :($to_insert[$lhs] = $R($rhs)))
        else
            push!(eqs_expr, :($to_insert[$lhs] = ($rhs)))
        end
    end

    u_vars = setdiff(io_vars, y_vars)
    params = setdiff(all_symb, union(x_vars, y_vars, u_vars))

    # add constant equations
    to_insert = x_dict
    for p in params
        push!(eqs_expr, :($to_insert[$p] = $R($0)))
    end

    @info "Summary of the model:"
    @info "State variables: " * join(map(string, collect(x_vars)), ", ")
    @info "Parameters: " * join(map(string, collect(params)), ", ")

    # creating the ode object
    ode_expr = :(ExactODEReduction.ODE{ExactODEReduction.Nemo.fmpq_mpoly}($x_dict))

    result = Expr(
        :block,
        exp_ring, assignments...,
        x_dict_create_expr, y_dict_create_expr, eqs_expr...,
        ode_expr
    )
    return esc(result)
end

#------------------------------------------------------------------------------

function Base.show(io::IO, ode::ODE)
    varstr = Dict(x => var_to_str(x) * "(t)" for x in ode.x_vars)
    R_print, vars_print = Nemo.PolynomialRing(base_ring(ode.poly_ring), [varstr[v] for v in gens(ode.poly_ring)])
    # output the equations sorted w.r.t. variables
    for x in ode.x_vars
        eq = ode.x_equations[x]
        print(io, var_to_str(x) * "'(t) = ")
        print(io, evaluate(eq, vars_print))
        print(io, "\n")
    end
end

#------------------------------------------------------------------------------

function polys_to_ODE_assume_order(eqs::Vector{T}) where {T}
    R = parent(first(eqs))
    vs = gens(R)
    @assert length(vs) == length(eqs)
    basedict = Dict(v => e for (v, e) in zip(vs, eqs))
    ODE{elem_type(R)}(basedict)
end

function do_nothing()
    
end

