
#=
    The File contains `Densik<T>` and related funcs implementation

    `Densik` implements `AbstractSparseObject` interface
=#

#------------------------------------------------------------------------------

include("sparsik.jl")


#------------------------------------------------------------------------------

"""
Densik
"""
mutable struct Densik{T<:Field} <: AbstractSparseVector{T}
    field::T
    data::Vector{<:FieldElem}
end

#------------------------------------------------------------------------------


density(v::Densik) = error("O(n)")
nnz(v::Densik) = error("O(n)")

ground(v::Densik) = v.field

#------------------------------------------------------------------------------

function Base.deepcopy_internal(x::Densik, stackdict::IdDict)
    y = Densik(x.field, Base.deepcopy_internal(x.data, stackdict))
    stackdict[x] = y
    return y
end

#------------------------------------------------------------------------------

first_nonzero(v::Densik) = error("O(n)")

#------------------------------------------------------------------------------

scale!(v::Densik, c) = error("O(n)")
scale(v::Densik, c) = error("O(n)")

#------------------------------------------------------------------------------

# returns v + c * u
# mutates v
# if vector `u` has k nonzeroes
# O(k)
function reduce!(v::Densik{T}, u::AbstractSparseObject{T}, c) where {T}
    for (idx, val) in u
        v[idx] += val * c
    end
    return v
end

# returns v + c * u
# if vector `u` has k nonzeroes
# O(k)
function Base.reduce(v::Densik{T}, u::AbstractSparseObject{T}, c) where {T}
    return reduce!(deepcopy(v), u, c)
end

#------------------------------------------------------------------------------

# returns standard inner product of v and u
# if vector `u` has k nonzeroes
# O(k)
function inner(v::Densik{T}, u) where {T}
    ans = zero(ground(v))

    for (idx, val) in u
        ans += val * v[idx]
    end

    return ans
end

inner(v, u::Densik{T}) where {T} = inner(u, v)

#------------------------------------------------------------------------------

Base.empty!(v::Densik) = error("O(n)")

#------------------------------------------------------------------------------


#------------------------------------------------------------------------------

Base.zero(v::Densik) = zero_sparsik(dim(v), v.field)
Base.iszero(v::Densik) = error("O(n)")

Base.get(v::Densik, i::Int) = v.data[i]
Base.getindex(v::Densik, i::Int) = v.data[i]

Base.setindex!(v::Densik, val, i::Int) = v.data[i] = val

Base.size(v::Densik) = (length(v.data), )
Base.size(v::Densik, i::Int) = size(v)[i]
Base.length(v::Densik) = length(v.data)
dim(v::Densik) = length(v)


Base.isempty(v::Densik) =  error("O(n)")

# -----------------------------------------------------------------------------

==(v::Densik{T}, u::Densik{T}) where {T} = (v.data = u.data)
!=(v::Densik{T}, u::Densik{T}) where {T} = !(v == u)

# -----------------------------------------------------------------------------

Base.repr(::MIME"text/plain", A::Densik) = "($(join(map(idx -> A[idx], 1 : dim(A)), ", ")))"
Base.show(io::IO, A::Densik) = print(io, repr(MIME("text/plain"), A))

# -----------------------------------------------------------------------------

function Base.iterate(v::Densik, state=1)
    if state <= length(v)
        state += 1
        return ((state, v[state]), state)
    else
        return nothing
    end
end

# -----------------------------------------------------------------------------

Base.valtype(v::Densik) = elem_type(ground(v))
Base.eltype(v::Densik) = (Int, valtype(v))

#-----------------------------------------------------------------------------

# Returns a new Densik object consisting of elements
# from the given `v` each converted to the `field`
# Throws if any of the denominators reduces to zero
#
# O(n)
function modular_reduction(v::Densik, field)
    ans = Densik(zeros(dim(v)), field)

    for (i, x) in v.data
        y = modular_reduction(x, field)
        ans.data[i] = y
    end

    return ans
end

#-----------------------------------------------------------------------------

# returns a new Sparsik object consisting of elements
# from the `v` each reconstructed from v.field to QQ
#
# O†(k) if k is the number of nonzero in `v`
# † reconstruction cost not included
function rational_reconstruction(v::Densik)
    ans = Densik(zeros(dim(v)), QQ)

    tmp_type = BigInt
    if isa(ground(v), GaloisField)
        tmp_type = Int
    end
    ch = convert(tmp_type, characteristic(v.field))

    for (i, x) in v.data
        y = rational_reconstruction(convert(tmp_type, x), ch)
        ans.data[i] = y
    end

    return ans
end

#-----------------------------------------------------------------------------


#-----------------------------------------------------------------------------

function random_densik(sz::Int, field::T) where {T<:Field}
    if T <: FracField
        # todo!  ??????
        return unit_sparsik(sz, rand(1:sz), field)
    elseif T <: Union{GaloisField, GaloisFmpzField}
        dense_repr = rand(field, sz)
        return Densik(field, dense_repr)
    end

    error("random sparsik over $field is not implemented!")
end

function random_densik(sz::Tuple{Int, Int}, field::T) where {T<:Field}
    random_densik(prod(sz), field)
end

#-----------------------------------------------------------------------------

# v[idx] += c
# mutates v
# O(1)
function reduce!(v::Densik{T}, idx::Int, c) where {T}
    v[idx] += c
    return v
end
