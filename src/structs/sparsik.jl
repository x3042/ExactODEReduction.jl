
#=
    The File contains `Sparsik<T>` and related funcs implementation

    `Sparsik` implements `AbstractSparsik` interface
=#

#------------------------------------------------------------------------------

include("../typics.jl")
include("../gizmos.jl")

#------------------------------------------------------------------------------

import Base: ==, !=, +, -, *
import Nemo: GaloisField, fmpq
import Distributions: Bernoulli
import AbstractAlgebra: elem_type, Field, FieldElem,
                        characteristic, FracField

#------------------------------------------------------------------------------

"""
Sparsik
"""
mutable struct Sparsik{T<:Field} <: AbstractSparsik{T}
    dim::Int
    field::T
    nonzero::Vector{Int}
    data::Dict{Int, <:FieldElem}
end

#------------------------------------------------------------------------------

# this is a substitute for deepcopy,
# as we do not want to change the behavior of original one
function Sparsik(other::Sparsik{T}) where {T}
    return Sparsik(other.dim,
                    other.field,
                    deepcopy(other.nonzero),
                    deepcopy(other.data))
end

# hitherto `Sparsik(other::Sparik)` has stood for the `deepcopy`,
# from now on we override Base.deepcopy
function Base.deepcopy_internal(x::Sparsik, stackdict::IdDict)
    y = Sparsik(x.dim, x.field,
            Base.deepcopy_internal(x.nonzero, stackdict),
            Base.deepcopy_internal(x.data, stackdict))
    stackdict[x] = y
    return y
end

#------------------------------------------------------------------------------

# returns the index of first nonzero or -1 if not present
# O(1)
function first_nonzero(v::Sparsik)
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
function scale!(v::Sparsik, c)
    if iszero(v.field(c))
        return empty!(v)
    end

    for idx in v.nonzero
        v.data[idx] *= c
    end
    return v
end

#------------------------------------------------------------------------------

# returns v * c
# if `v` has k nonzeroes
#  O(k)
function scale(v::Sparsik, c)
    return scale!(Sparsik(v), c)
end

#------------------------------------------------------------------------------

# returns v + c * u
# mutates v
# if the vectors `v` and `u` have k and r nonzeroes respectively
# O(k + r)
function reduce!(v::Sparsik{T}, u::Sparsik{T}, c) where {T}
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
        else
            delete!(v.data, new_idx)
        end
    end

    return v
end

#------------------------------------------------------------------------------

# returns v + c * u
# O(k + r)
function Base.reduce(v::Sparsik{T}, u::Sparsik{T}, c) where {T}
    return reduce!(Sparsik(v), u, c)
end

#------------------------------------------------------------------------------

# returns standard inner product of v and u
# if the vectors `v` and `u` have k and r nonzeroes respectively
# O(min(k, r))
function inner(v::Sparsik{T}, u::Sparsik{T}) where {T}
    ans = zero(v.field)

    if length(v) > length(u)
        inner(u, v)
    end
    for (i, x) in v.data
        ans += x * u[i]
    end

    return ans
end

#------------------------------------------------------------------------------

# constructs a `Sparsik` instance from a dense Vector
# and the provided field
# each `a` element is explicitly converted to its field representation
# O(n) where n = length(a)
function from_dense(a::AbstractVector, field)
    new_nonzero = Int[]
    new_data = Dict{Int, elem_type(field)}()

    for idx in findall(!(iszero ∘ field), a)
        push!(new_nonzero, idx[1])
        new_data[idx[1]] = field(a[idx])
    end

    return Sparsik(length(a), field, new_nonzero, new_data)
end

#------------------------------------------------------------------------------

# empties the `v`
# if the vector `v` has k nonzeroes
# O(k)
function Base.empty!(v::Sparsik)
    empty!(v.nonzero)
    empty!(v.data)
    return v
end

#------------------------------------------------------------------------------

# function for Sparsiks compatibility
# O(1)
function zero_sparsik(dim, field)
    return Sparsik(dim, field, Int[], Dict{Int, elem_type(field)}())
end

#------------------------------------------------------------------------------

Base.zero(v::Sparsik) = zero_sparsik(v.dim, v.field)
Base.iszero(v::Sparsik) = length(v) == 0

Base.get(v::Sparsik, i::Int) = get(v.data, i, zero(v.field))
Base.getindex(v::Sparsik, i::Int) = get(v, i)

Base.size(v::Sparsik) = (v.dim, )
Base.size(v::Sparsik, i::Int) = size(v)[i]
Base.length(v::Sparsik) = length(v.nonzero)
dim(v::Sparsik) = v.dim


Base.isempty(v::Sparsik) = length(v.nonzero) == 0

# -----------------------------------------------------------------------------

# Strategy of types promotion:
# explicit restriction to the operands types
+(v::Sparsik{T}, u::Sparsik{T}) where {T} = reduce(v, u, one(v.field))
-(v::Sparsik{T}, u::Sparsik{T}) where {T} = reduce(v, u, - one(v.field))
-(v::Sparsik) = scale(v, - one(v.field))

*(v::Sparsik, c) = scale(v, c)
*(c, v::Sparsik) = v * c

==(v::Sparsik{T}, u::Sparsik{T}) where {T} = (v.dim == u.dim &&
            v.field == u.field &&
            v.data == u.data &&
            v.nonzero == u.nonzero)
!=(v::Sparsik{T}, u::Sparsik{T}) where {T} = !(v == u)

# -----------------------------------------------------------------------------

Base.show(v::Sparsik) = "($(join(map(idx -> v[idx], 1 : v.dim), ", ")))"

function print_sparsik(v::Sparsik)
    println(show(v))
end

# -----------------------------------------------------------------------------

# iterates over all nonzeroes in `v`
# each returned element is a pair (idx, value)
# representing a nonzero element from `v`
# linear in number of nonzeroes
function Base.iterate(v::Sparsik, state=1)
    if state <= length(v)
        idx = v.nonzero[state]
        state += 1
        return ((idx, v[idx]), state)
    else
        return nothing
    end
end

# -----------------------------------------------------------------------------

Base.valtype(v::Sparsik) = elem_type(v.field)
Base.eltype(v::Sparsik) = (Int, valtype(v))

#-----------------------------------------------------------------------------

# Gleb: should raise an exception if any of the denominators reduces to zero
#
# returns a new Sparsik object consisting of elements
# from the given `v` each converted to the `field`
#
# O(k) if k is the number of nonzero in `v`
function modular_reduction(v::Sparsik, field)
    new_nonzero = Int[]
    new_data = Dict{Int, elem_type(field)}()

    for (i, x) in v
        d = field(denominator(x))
        if iszero(d)
            error("the denominator $(denominator(x)) vanishes under $field !")
        end
        y = field(numerator(x)) // d

        if !iszero(y)
            push!(new_nonzero, i)
            new_data[i] = y
        end
    end

    return Sparsik(dim(v), field, new_nonzero, new_data)
end

#-----------------------------------------------------------------------------

# returns a new Sparsik object consisting of elements
# from the `v` each reconstructed from v.field to QQ
#
# O†(k) if k is the number of nonzero in `v`
# † reconstruction cost not included
function rational_reconstruction(v::Sparsik)
    new_nonzero = Int[]
    new_data = Dict{Int, fmpq}()
    ch = convert(Int, characteristic(v.field))

    for (i, x) in v
        y = rational_reconstruction(convert(Int, x), ch)
        if !iszero(y)
            push!(new_nonzero, i)
            new_data[i] = y
        end
    end

    return Sparsik(dim(v), QQ, new_nonzero, new_data)
end

#-----------------------------------------------------------------------------

function unit_sparsik(dim, i, field)
    return Sparsik(dim, field, [i], Dict(i => one(field)))
end

#-----------------------------------------------------------------------------

# actually, seems as we need slightly different 'random'
# for different purposes:
#   for hashing,
#   for augmenting matrix n×(n-1) to square to calc the orthogonal,
#   for randomized wiedemann
#   ...
#
# thinking about it
#
function random_sparsik(sz::Int, field::T) where {T<:Field}
    # the function looks so nice and compact..  Julia <3
    if T <: FracField
        # todo!
        return unit_sparsik(sz, rand(1:sz), field)
    elseif T <: GaloisField
        # todo!
        coin_flips = rand(Bernoulli(0.2), sz)
        nonzero = filter(i -> !iszero(coin_flips[i]), 1:sz)
        # generating some zeroes in addition, ignoring this fact for now
        data = Dict(i => rand(field) for i in nonzero)
        return Sparsik(sz, field, nonzero, data)
    end

    error("random sparsik over $field is not implemented!")
end

function random_sparsik(sz::Tuple{Int}, field::T) where {T<:Field}
    random_sparsik(sz..., field)
end

#-----------------------------------------------------------------------------

# Inserts `value` to the `idx`-th position in `v`
# If idx is already present, rewrites it
# if k = length(v)
# O(klogk)
#
# it is not used
function Base.insert!(v::Sparsik, idx::Int, value)
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
function Base.append!(v::Sparsik, value)
    v.dim += 1
    if iszero(value)
        return v
    end

    v.data[v.dim] = value
    push!(v.nonzero, v.dim)
    return v
end

# Erases the value at the last vector index
# and decrements the dimension of the sparsik by one
# Throws if v is 0-dim
# O(1)
function Base.pop!(v::Sparsik)
    if v.dim == 0
        error("sparsik $v is very very empty")
    end

    if haskey(v.data, v.dim)
        pop!(v.nonzero)
    end
    delete!(v.data, v.dim)
    v.dim -= 1
    return v
end

#-----------------------------------------------------------------------------
