
# extended here
import Base: convert

# conversions between Nemo field elements and julia Numbers
Base.convert(::Type{Int}, x::Nemo.gfp_elem) = Int(data(x))
Base.convert(::Type{BigInt}, x::Nemo.gfp_fmpz_elem) = BigInt(data(x))
Base.convert(::Type{Nemo.FlintIntegerRing}, x::Nemo.gfp_fmpz_elem) = Nemo.ZZ(data(x))
Base.convert(::Type{Nemo.FlintIntegerRing}, x::Nemo.gfp_elem) = Nemo.ZZ(data(x))

# extends random generator to Nemo Rational field
Base.rand(::Nemo.FlintRationalField) = Nemo.QQ(rand(-2^16:2^16))
Base.rand(::Nemo.FlintRationalField, n::Int) = [rand(Nemo.QQ) for _ in 1:n]

# extends random generator to Nemo Integer ring
Base.rand(::Nemo.FlintIntegerRing) = Nemo.ZZ(rand(-2^16:2^16))
Base.rand(::Nemo.FlintIntegerRing, n::Int) = [rand(Nemo.ZZ) for _ in 1:n]

# interesting
function var_to_str(v::Nemo.MPolyElem)
    ind = findfirst(vv -> vv == v, gens(parent(v)))
    string(symbols(parent(v))[ind])
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
