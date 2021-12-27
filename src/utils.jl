#------------------------------------------------------------------------------

function Base.convert(::Type{Int}, x::gfp_elem)
    return Int(x.data)
end

function Base.convert(::Type{BigInt}, x::gfp_fmpz_elem)
    return BigInt(x.data)
end

function Base.convert(::Type{FlintIntegerRing}, x::gfp_fmpz_elem)
    return ZZ(x.data)
end

function Base.convert(::Type{FlintIntegerRing}, x::gfp_elem)
    return ZZ(x.data)
end

#------------------------------------------------------------------------------

function var_to_str(v::MPolyElem)
    ind = findfirst(vv -> vv == v, gens(parent(v)))
    return string(symbols(parent(v))[ind])
end

# Bad
# Base.zero(::Type{gfp_elem}) = GF(2)(2)

#------------------------------------------------------------------------------

# extends random generator to Rational field
Base.rand(::FlintRationalField) = Nemo.QQ(rand(-2^16:2^16))
Base.rand(::FlintRationalField, n::Int) = [rand(Nemo.QQ) for _ in 1:n]

Base.rand(::FlintIntegerRing) = Nemo.ZZ(rand(-2^16:2^16))
Base.rand(::FlintIntegerRing, n::Int) = [rand(Nemo.ZZ) for _ in 1:n]

#------------------------------------------------------------------------------

function normtime(x)
     x/1e9
end

# estimates the elapsed time for `ex` and stores the result into the `storage`
macro savetime(ex, storage)
    return quote
        local t0 = time_ns()
        local val = $(esc(ex))
        local t1 = time_ns()
        push!($storage, normtime(t1-t0))
        val
    end
end

#------------------------------------------------------------------------------

# conveniece wrapper for `from_dense` function,
# which returns a sparse representation of an array
# and generally defaults to
#   1D vector --> Sparsik
#   2D vector --> DOK_Sparsik
# over the Rational field of Nemo.QQ instance
"""
    @sparse(ex)

Converts an `Array` in `ex` to sparse representation
"""
macro sparse(ex)
    return quote
        from_dense($(esc(ex)), Nemo.QQ)
    end
end

#------------------------------------------------------------------------------

# make the given path absolute w.r.t the project and normalize it
function normalizepath(path)
    replace("$(normpath(joinpath(@__FILE__, "..", "..")))$path", "\\" => "/")
end
