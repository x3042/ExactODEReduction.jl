
#=
    The File contains `BloomSparsik<T>` and related funcs implementation

    `BloomSparsik` implements `AbstractSparseObject` interface
=#

#------------------------------------------------------------------------------

include("../typics.jl")
include("../gizmos.jl")

#------------------------------------------------------------------------------

import Base: ==, !=, +, -, *
import Nemo: GaloisField, GaloisFmpzField, fmpq, ZZ
import Distributions: Bernoulli
import AbstractAlgebra: elem_type, Field, FieldElem,
                        characteristic, FracField
import StaticArrays: SA

#------------------------------------------------------------------------------

_powersof2 = SA[UInt64(1), UInt64(2), UInt64(4), UInt64(8), UInt64(16),
                UInt64(32), UInt64(64), UInt64(128), UInt64(256), UInt64(512),
                UInt64(1024), UInt64(2048), UInt64(4096), UInt64(8192), UInt64(16384),
                UInt64(32768), UInt64(65536), UInt64(131072), UInt64(262144), UInt64(524288),
                UInt64(1048576), UInt64(2097152), UInt64(4194304), UInt64(8388608), UInt64(16777216),
                UInt64(33554432), UInt64(67108864), UInt64(134217728), UInt64(268435456),
                UInt64(536870912), UInt64(1073741824), UInt64(2147483648), UInt64(4294967296),
                UInt64(8589934592), UInt64(17179869184), UInt64(34359738368), UInt64(68719476736),
                UInt64(137438953472), UInt64(274877906944), UInt64(549755813888), UInt64(1099511627776),
                UInt64(2199023255552), UInt64(4398046511104), UInt64(8796093022208), UInt64(17592186044416),
                UInt64(35184372088832), UInt64(70368744177664), UInt64(140737488355328), UInt64(281474976710656),
                UInt64(562949953421312), UInt64(1125899906842624), UInt64(2251799813685248), UInt64(4503599627370496),
                UInt64(9007199254740992), UInt64(18014398509481984), UInt64(36028797018963968), UInt64(72057594037927936),
                UInt64(144115188075855872), UInt64(288230376151711744), UInt64(576460752303423488), UInt64(1152921504606846976),
                UInt64(2305843009213693952), UInt64(4611686018427387904), UInt64(9223372036854775808)]

_defaultbloom(x) = _powersof2[(x % 64) + 1]

#------------------------------------------------------------------------------

mutable struct BloomSparsik{T<:Field} <: AbstractSparseVector{T}
    dim::Int
    field::T
    nonzero::Vector{Int}
    data::Dict{Int, <:FieldElem}
    nnzbloom::UInt64
    funcbloom
end

#------------------------------------------------------------------------------

# returns the density of `v`,
# i.e the percentage of nonzero-valued elements in `v`
density(v::BloomSparsik) = length(v.nonzero) / v.dim

# returns the number of nonzero-valued elements in `v`
nnz(v::BloomSparsik) = length(v.nonzero)

# ground field!
Nemo.base_ring(v::BloomSparsik) = v.field

#------------------------------------------------------------------------------

# hitherto `Sparsik(other::Sparik)` has stood for the `deepcopy`,
# from now on we override Base.deepcopy
function Base.deepcopy_internal(x::BloomSparsik, stackdict::IdDict)
    y = Sparsik(x.dim, x.field,
            Base.deepcopy_internal(x.nonzero, stackdict),
            Base.deepcopy_internal(x.data, stackdict),
            nnzhash, funcbloom)
    stackdict[x] = y
    return y
end

#------------------------------------------------------------------------------

# returns the index of first nonzero or -1 if not present
# O(1)
function first_nonzero(v::BloomSparsik)
    if iszero(v)
        return -1
    end
    return first(v.nonzero)
end

#------------------------------------------------------------------------------

# returns v * c
# does modify `v`
# if `v` has k nonzeroes
# O(k)
function scale!(v::BloomSparsik, c)
    if iszero(base_ring(v)(c))
        return empty!(v)
    end

    for idx in v.nonzero
        v.data[idx] *= c
    end
    return v
end

# returns v * c
function scale(v::BloomSparsik, c)
    return scale!(deepcopy(v), c)
end

#------------------------------------------------------------------------------

# returns v + c * u
# mutates v
# if the vectors `v` and `u` have k and r nonzeroes respectively
# O(k + r)
function reduce!(v::BloomSparsik{T}, u::BloomSparsik{T}, c) where {T}
    new_nonzero = Int[]
    i, j = 1, 1

    v_nnz = deepcopy(v.nonzero)
    u_nnz = u.nonzero
    empty!(v.nonzero)

    while i <= length(v_nnz) || j <= length(u_nnz)
        new_idx = 0

        if i > length(v_nnz)
            new_idx = u_nnz[j]
            j += 1
        elseif j > length(u_nnz)
            new_idx = v_nnz[i]
            i += 1
        else
            new_idx = min(v_nnz[i], u_nnz[j])
            if v_nnz[i] < u_nnz[j]
                i += 1
            elseif v_nnz[i] > u_nnz[j]
                j += 1
            else
                i += 1
                j += 1
            end
        end
        v.data[new_idx] = v[new_idx] + c * u[new_idx]
        if !iszero(v[new_idx])
            push!(v.nonzero, new_idx)
            v.nnzbloom |= v.funcbloom(new_idx)
        else
            delete!(v.data, new_idx)
        end
    end

    return v
end

# returns v + c * u
# O(k + r)
function Base.reduce(v::BloomSparsik{T}, u::BloomSparsik{T}, c) where {T}
    return reduce!(deepcopy(v), u, c)
end

#------------------------------------------------------------------------------

# returns standard inner product of v and u
# if the vectors `v` and `u` have k and r nonzeroes respectively
# O(min(k, r))
#
# This should not be called in case of non-overlapping
function inner(v::BloomSparsik{T}, u::BloomSparsik{T}) where {T}
    ans = zero(v.field)

    if length(v) > length(u)
        inner(u, v)
    end

    for i in v.nonzero
        # zero values can be skipped instantly
        # TODO: fix
        if haskey(u.data, i)
            ans += v.data[i] * u.data[i]
        end
    end

    return ans
end

function inner(A::BloomSparsik{T}, c::FieldElem) where {T}
    if iszero(c)
        return zero(c)
    end

    error("not implemented!")
end

#------------------------------------------------------------------------------

# constructs a `BloomSparsik` instance from a dense Vector,
# the provided field and the function for bloom hashing
# each `a` element is explicitly converted to its field representation
# O(n) where n = length(a)
function from_dense(a::AbstractVector, field, funcbloom)
    new_nonzero = Int[]
    nnzbloom = UInt64(0)
    new_data = Dict{Int, elem_type(field)}()

    for idx in findall(!(iszero ∘ field), a)
        push!(new_nonzero, idx[1])
        nnzbloom |= funcbloom(idx)
        new_data[idx[1]] = field(a[idx])
    end

    return BloomSparsik(length(a), field, new_nonzero, new_data, nnzbloom, funcbloom)
end

#------------------------------------------------------------------------------

# empties the `v`
# if the vector `v` has k nonzeroes
# O(k)
function Base.empty!(v::BloomSparsik)
    empty!(v.nonzero)
    empty!(v.data)
    v.nnzbloom = zero(v.nnzbloom)
    return v
end

#------------------------------------------------------------------------------

# function for Sparsiks compatibility
# O(1)
function zero_sparse_vector(dim, field, funcbloom)
    return BloomSparsik(dim, field, Int[], Dict{Int, elem_type(field)}(), UInt64(0), funcbloom)
    # return zero(field)
end

#------------------------------------------------------------------------------

Base.zero(v::BloomSparsik) = zero_sparse_vector(v.dim, v.field, _default_bloom)
Base.iszero(v::BloomSparsik{T}) where {T} = length(v) == 0

Base.get(v::BloomSparsik, i::Int) = get(v.data, i, zero(v.field))

function Base.haskey(A::BloomSparsik, i::Int)
    return haskey(A.data, i)
end

Base.getindex(v::BloomSparsik, i::Int) = get(v, i)

Base.size(v::BloomSparsik) = (v.dim, )
Base.size(v::BloomSparsik, i::Int) = size(v)[i]
Base.length(v::BloomSparsik) = length(v.nonzero)
dim(v::BloomSparsik) = v.dim


Base.isempty(v::BloomSparsik) = length(v.nonzero) == 0

# -----------------------------------------------------------------------------

# Strategy of types promotion:
# explicit restriction to the operands types
+(v::BloomSparsik{T}, u::BloomSparsik{T}) where {T} = reduce(v, u, one(v.field))
-(v::BloomSparsik{T}, u::BloomSparsik{T}) where {T} = reduce(v, u, - one(v.field))
-(v::BloomSparsik) = scale(v, - one(v.field))

*(v::BloomSparsik, c::Number) = scale(v, c)
*(c::Number, v::BloomSparsik) = v * c

==(v::BloomSparsik{T}, u::BloomSparsik{T}) where {T} = (v.dim == u.dim &&
            v.field == u.field &&
            v.data == u.data &&
            v.nonzero == u.nonzero)
!=(v::BloomSparsik{T}, u::BloomSparsik{T}) where {T} = !(v == u)

# -----------------------------------------------------------------------------

Base.repr(::MIME"text/plain", A::BloomSparsik) = "bloom: $(A.nnzbloom)\n($(join(map(idx -> A[idx], 1 : A.dim), ", ")))"
Base.show(io::IO, A::BloomSparsik) = print(io, repr(MIME("text/plain"), A))

# -----------------------------------------------------------------------------

# iterates over all nonzeroes in `v`
# each returned element is a pair (idx, value)
# representing a nonzero element from `v`
# linear in number of nonzeroes
function Base.iterate(v::BloomSparsik, state=1)
    if state <= length(v)
        idx = v.nonzero[state]
        state += 1
        return ((idx, v[idx]), state)
    else
        return nothing
    end
end

# -----------------------------------------------------------------------------

Base.valtype(v::BloomSparsik) = elem_type(v.field)
Base.eltype(v::BloomSparsik) = (Int, valtype(v))

#-----------------------------------------------------------------------------

# Returns a new Sparsik object consisting of elements
# from the given `v` each converted to the `field`
# Throws if any of the denominators reduces to zero
#
# O(k) if k is the number of nonzero in `v`
function modular_reduction(v::BloomSparsik, field)
    new_nonzero = Int[]
    new_data = Dict{Int, elem_type(field)}()
    nnzbloom = UInt64(0)

    for i in v.nonzero
        # wrapped into a function
        y = modular_reduction(v.data[i], field)
        if !iszero(y)
            push!(new_nonzero, i)
            nnzbloom |= v.funcbloom(i)
            new_data[i] = y
        end
    end

    return BloomSparsik(dim(v), field, new_nonzero, new_data, nnzbloom, v.funcbloom)
end

#-----------------------------------------------------------------------------

# returns a new Sparsik object consisting of elements
# from the `v` each reconstructed from v.field to QQ
#
# O†(k) if k is the number of nonzero in `v`
# † reconstruction cost not included
function rational_reconstruction(v::BloomSparsik)
    new_nonzero = Int[]
    new_data = Dict{Int, fmpq}()
    ground = base_ring(v)
    nnzbloom = UInt64(0)

    tmp_type = BigInt
    if isa(ground, GaloisField)
        tmp_type = Int
    end
    ch = convert(tmp_type, characteristic(ground))

    for (i, x) in v
        y = rational_reconstruction(convert(tmp_type, x), ch)
        if !iszero(y)
            push!(new_nonzero, i)
            nnzbloom |= v.funcbloom(i)
            new_data[i] = y
        end
    end

    return BloomSparsik(dim(v), QQ, new_nonzero, new_data, nnzbloom, v.funcbloom)
end

#-----------------------------------------------------------------------------

function unit_sparse_vector(dim, i, field, funcbloom)
    return BloomSparsik(dim..., field, [i], Dict(i => one(field)), _powersof2[i], funcbloom)
end

#-----------------------------------------------------------------------------


# returns a Sparsik object consisting of O(sz * density) nnz entries,
# each entry is generated uniformly and independently
function random_sparse_vector(sz::Int, field::T, funcbloom; density=0.1) where {T<:Field}
    λ = density * sz

    nnz = Int[]
    nnzbloom = UInt64(0)
    data = Dict{Int, elem_type(field)}()
    for _ in 1:λ
        while (idx = rand(1:sz)) != nothing
            !haskey(data, idx) && break
        end
        X = rand(field)
        push!(nnz, idx)
        nnzbloom |= funcbloom(idx)
        data[idx] = X
    end

    sort!(nnz)

    return BloomSparsik(sz, field, nnz, data, nnzbloom, funcbloom)
end

function random_sparse_vector(sz::Tuple{Int}, field::T, funcbloom; density=0.1) where {T<:Field}
    random_sparse_vector(sz..., field, funcbloom, density=density)
end

#-----------------------------------------------------------------------------

# Inserts `value` to the `idx`-th position in `v`
# If idx is already present, rewrites it
# if k = length(v)
# O(klogk)
#
# it is not used
function Base.insert!(v::BloomSparsik, idx::Int, value)
    if iszero(value)
        return v
    end
    if iszero(v[idx])
        pos = searchsortedfirst(v.nonzero, idx)
        insert!(v.nonzero, pos, idx)
    end
    v.data[idx] = value
    return v
end

#-----------------------------------------------------------------------------

# Appends `value` to the vector treated as an array
# and increments the dimension of the sparsik by one
# O(1)
function Base.append!(v::BloomSparsik, value)
    v.dim += 1
    if iszero(value)
        return v
    end

    v.data[v.dim] = value
    push!(v.nonzero, v.dim)
    nnzbloom |= funcbloom(v.dim)

    return v
end

# Erases the value at the last vector index
# and decrements the dimension of the sparsik by one
# Throws if v is 0-dim
# O(1)
function Base.pop!(v::BloomSparsik)
    if v.dim == 0
        error("sparsik $v is very very empty")
    end

    if haskey(v.data, v.dim)
        pop!(v.nonzero)
        nnzbloom ^= funcbloom(v.dim)
    end
    delete!(v.data, v.dim)
    v.dim -= 1
    return v
end

#-----------------------------------------------------------------------------

function restrict(v::BloomSparsik, coords)
    field = base_ring(v)
    nonzero = Int[]
    data = Dict{Int, elem_type(field)}()
    nnzbloom = UInt64(0)

    for (i, col) in enumerate(coords)
        if ! iszero(v[col])
            push!(nonzero, i)
            data[i] = v[col]
            v.nnzbloom |= _powerof2[idx]
        end
    end

    return BloomSparsik(length(coords), field, nonzero, data)
end

#-----------------------------------------------------------------------------

function to_dense(A::BloomSparsik)
    ans = fill(zero(base_ring(A)), size(A))
    for (i, x) in A
        ans[i] = x
    end
    return ans
end

#-----------------------------------------------------------------------------

# v[idx] += c
# mutates v
# O(k)
# ( but O(1) generically )
#
function reduce!(v::BloomSparsik{T}, idx::Int, c) where {T}
    if iszero(c)
        return v
    end

    if haskey(v.data, idx)
        v.data[idx] += c
        if !iszero(v.data[idx])

        else
            v.nnzbloom ^= _powerof2[idx]
            popat!(v.nonzero, idx)
            delete!(v.data, idx)
        end
    else
        v.data[idx] = c
        pos = searchsortedfirst(v.nonzero, idx)
        v.nnzbloom |= _powerof2[idx]
        insert!(v.nonzero, pos, idx)
    end
    return v
end
