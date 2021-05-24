# Adapted from https://discourse.julialang.org/t/expression-parser/41880/7
# code by Alan R. Rogers, Professor of Anthropology, University of Utah

import Nemo: fmpq_mpoly

function myeval(e::Union{Expr,Symbol,Number}, map::Dict{Symbol,fmpq_mpoly})
    try
        return _myeval(e, map)
    catch ex
        println("Can't parse \"$e\"")
        rethrow(ex)
    end
end

function _myeval(s::Symbol, map::Dict{Symbol,fmpq_mpoly})
    if haskey(map, s)
        return map[s]
    else
        throw(UndefVarError(s))
    end
end

# Numbers are converted to fmpq.
function _myeval(x::Number, map::Dict{Symbol,fmpq_mpoly})
    return fmpq(x)
end

# a helper definition for floats
function _myeval(x::Float64, map::Dict{Symbol,fmpq_mpoly})
    result = fmpq(0)

    # Getting the result from the string representation in order
    # to avoid approximations caused by the float representation
    s = string(x)
    denom = 1
    extra_num = 1
    if occursin(r"[eE]", s)
        s, exp = split(s, r"[eE]")
        if exp[1] == "-"
            denom = fmpq(10)^(-parse(Int, exp))
        else
            extra_num = fmpq(10)^(parse(Int, exp))
        end
    end
    frac = split(s, ".")
    if length(frac) == 1
        result = fmpq(parse(fmpz, s)) * extra_num // denom
    else 
        result = fmpq(parse(fmpz, frac[1] * frac[2])) * extra_num // (denom * 10^(length(frac[2])))
    end
    
    # too verbose for now
    # @warn "a possibility of inexact float conversion" from=x to=result
    return result
end

# To parse an expression, convert the head to a singleton
# type, so that Julia can dispatch on that type.
function _myeval(e::Expr, map::Dict{Symbol,fmpq_mpoly})
    return _myeval(Val(e.head), e.args, map)
end

# Call the function named in args[1]
function _myeval(::Val{:call}, args, map::Dict{Symbol,fmpq_mpoly})
    return _myeval(Val(args[1]), args[2:end], map)
end

# Addition
function _myeval(::Val{:+}, args, map::Dict{Symbol,fmpq_mpoly})
    x = 0
    for arg ∈ args
        x += _myeval(arg, map)
    end
    return x
end

# Subtraction and negation
function _myeval(::Val{:-}, args, map::Dict{Symbol,fmpq_mpoly})
    len = length(args)
    if len == 1
        return -_myeval(args[1], map)
    else
        return _myeval(args[1], map) - _myeval(args[2], map)
    end
end

# Multiplication
function _myeval(::Val{:*}, args, map::Dict{Symbol,fmpq_mpoly})
    x = 1
    for arg ∈ args
        x *= _myeval(arg, map)
    end
    return x
end

# Division
function _myeval(::Val{:/}, args, map::Dict{Symbol,fmpq_mpoly})
    return _myeval(args[1], map) // _myeval(args[2], map)
end
