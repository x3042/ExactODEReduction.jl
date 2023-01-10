
# extended here
import Base: convert

# conversions between Nemo field elements and julia Numbers
Base.convert(::Type{Int}, x::Nemo.gfp_elem) = Int(data(x))
Base.convert(::Type{BigInt}, x::Nemo.gfp_fmpz_elem) = BigInt(data(x))
Base.convert(::Type{Nemo.FlintIntegerRing}, x::Nemo.gfp_fmpz_elem) = Nemo.ZZ(data(x))
Base.convert(::Type{Nemo.FlintIntegerRing}, x::Nemo.gfp_elem) = Nemo.ZZ(data(x))
Base.convert(::Type{Float64}, x::Nemo.fmpq) = convert(Float64, numerator(x)) / convert(Float64, denominator(x))

# extends random generator to Nemo Rational field
Base.rand(::Nemo.FlintRationalField) = Nemo.QQ(rand(-2^16:2^16))
Base.rand(::Nemo.FlintRationalField, n::Int) = [rand(Nemo.QQ) for _ in 1:n]

# extends random generator to Nemo Integer ring
Base.rand(::Nemo.FlintIntegerRing) = Nemo.ZZ(rand(-2^16:2^16))
Base.rand(::Nemo.FlintIntegerRing, n::Int) = [rand(Nemo.ZZ) for _ in 1:n]

getnewrandomseed() = floor(Int, time())

Base.:*(::AbstractAlgebra.RingElem, ::Missing) = missing
Base.:*(::Missing, ::AbstractAlgebra.RingElem) = missing

# -----------------------------------------------------------------------------

function evaluate(p::fmpq_mpoly, v::Vector{<: Union{Float64, Missing}})
    result = 0.0
    for (c, m) in zip(Nemo.coefficients(p), Nemo.exponent_vectors(p))
        result += convert(Float64, c) * prod([(b == 0 ? 1 : a^b) for (a, b) in zip(v, m)])
    end
    return result
end

# -----------------------------------------------------------------------------

# interesting
function var_to_str(v::Nemo.MPolyElem)
    ind = findfirst(vv -> vv == v, gens(parent(v)))
    string(symbols(parent(v))[ind])
end

# ------------------------------------------------------------------------------
# This section is adapted from StructuralIdentifiability.jl

function str_to_var(s::String, ring::Nemo.MPolyRing)
    ind = findfirst(v -> (string(v) == s), symbols(ring))
    if ind === nothing
        throw(Base.KeyError("Variable $s is not found in ring $ring"))
    end
    return gens(ring)[ind]
end

"""
    eval_at_dict(f, d)
Evaluates a polynomial/rational function on a dictionary of type `var => val` and missing values are replaced with zeroes
"""
function eval_at_dict(poly::P, d::Dict{P,T}) where {P <: Nemo.MPolyElem, T}
    R = parent(first(values(d)))
    point = [get(d, v, zero(R)) for v in gens(parent(poly))]
    return evaluate(poly, point)
end

function eval_at_nemo(e::ModelingToolkit.Num, vals::Dict)
    e = ModelingToolkit.Symbolics.value(e)
    return eval_at_nemo(e, vals)
end

function eval_at_nemo(e, vals::Dict)
    if ModelingToolkit.Symbolics.istree(e)
        args = map(a -> eval_at_nemo(a, vals), ModelingToolkit.Symbolics.arguments(e))
        if ModelingToolkit.Symbolics.operation(e) in [+, -, *]
            return ModelingToolkit.Symbolics.operation(e)(args...)
        elseif isequal(ModelingToolkit.Symbolics.operation(e), /)
            return //(args...)
        end
        if ModelingToolkit.Symbolics.operation(e) === ^
            if args[2] >= 0
                return args[1]^args[2]
            end
            return 1 // args[1]^(-args[2])
        end
        throw(Base.ArgumentError("Function $(ModelingToolkit.Symbolics.operation(e)) is not supported"))
    end
end

function eval_at_nemo(e::Union{ModelingToolkit.Symbolics.Sym,ModelingToolkit.Symbolics.Term}, vals::Dict)
    if typeof(e) <: ModelingToolkit.Symbolics.Term{Real,Nothing}
        throw(Base.ArgumentError("Function $(ModelingToolkit.Symbolics.operation(e)) is not supported"))
    end
    return get(vals, e, e)
end

function eval_at_nemo(e::Union{Integer,Rational}, vals::Dict)
    return e
end

function eval_at_nemo(e::Union{Float16,Float32,Float64}, vals::Dict)
    if isequal(e % 1, 0)
        out = Int(e)
    else
        out = rationalize(e)
    end
    @warn "Floating points are not allowed, value $e will be converted to $(out)."
    return out
end

#------------------------------------------------------------------------------

second2nanos(x) = x/1e9

# estimates the elapsed time for `ex` and stores the result into the `storage`
macro savetime(ex, storage)
    return quote
        local t0 = time_ns()
        local val = $(esc(ex))
        local t1 = time_ns()
        push!($storage, second2nanos(t1-t0))
        val
    end
end

# make the given path absolute w.r.t the project and normalize it
function normalizepath(path)
    replace("$(normpath(joinpath(@__FILE__, "..", "..")))$path", "\\" => "/")
end
