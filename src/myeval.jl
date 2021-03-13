# Adapted from https://discourse.julialang.org/t/expression-parser/41880/7
# code by Alan R. Rogers, Professor of Anthropology, University of Utah

import Nemo: fmpq_mpoly

function myeval(e::Union{Expr,Symbol,Number}, map::Dict{Symbol,fmpq_mpoly})
    try
        return f(e, map)
    catch ex
        println("Can't parse \"$e\"")
        rethrow(ex)
    end
end

function f(s::Symbol, map::Dict{Symbol,fmpq_mpoly})
    if haskey(map, s)
        return map[s]
    else
        throw(UndefVarError(s))
    end
end

# Numbers are converted to fmpq.
function f(x::Number, map::Dict{Symbol,fmpq_mpoly})
    return fmpq(x)
end

# To parse an expression, convert the head to a singleton
# type, so that Julia can dispatch on that type.
function f(e::Expr, map::Dict{Symbol,fmpq_mpoly})
    return f(Val(e.head), e.args, map)
end

# Call the function named in args[1]
function f(::Val{:call}, args, map::Dict{Symbol,fmpq_mpoly})
    return f(Val(args[1]), args[2:end], map)
end

# Addition
function f(::Val{:+}, args, map::Dict{Symbol,fmpq_mpoly})
    x = 0
    for arg ∈ args
        x += f(arg, map)
    end
    return x
end

# Subtraction and negation
function f(::Val{:-}, args, map::Dict{Symbol,fmpq_mpoly})
    len = length(args)
    if len == 1
        return -f(args[1], map)
    else
        return f(args[1], map) - f(args[2], map)
    end
end

# Multiplication
function f(::Val{:*}, args, map::Dict{Symbol,fmpq_mpoly})
    x = 1
    for arg ∈ args
        x *= f(arg, map)
    end
    return x
end

# Division
function f(::Val{:/}, args, map::Dict{Symbol,fmpq_mpoly})
    return f(args[1], map) / f(args[2], map)
end
