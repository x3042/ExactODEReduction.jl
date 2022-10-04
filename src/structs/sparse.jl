
#=
    The File contains `Sparsik<T>` and related funcs implementation

    `Sparsik` implements `AbstractSparseObject` interface
=#

#------------------------------------------------------------------------------

"""
    Sparsik{T<:Field}

Provides basic 1-dimensional sparse vector interface. Parametrized with the type of coefficient field `T`.

Supports these *fast* operations:

 `inner`, `scale`, `reduce`, `iterate`.

One can construct `Sparsik` from a dense vector with the `from_dense` function.
"""
mutable struct Sparsik{T<:AbstractAlgebra.Field}
    dim::Int
    field::T
    nonzero::Vector{Int}
    data::Dict{Int, <:AbstractAlgebra.FieldElem}
end

#------------------------------------------------------------------------------

# returns the density of `v`,
# i.e the percentage of nonzero-valued elements in `v`
density(v::Sparsik) = length(v.nonzero) / v.dim

# returns the number of nonzero-valued elements in `v`
SparseArrays.nnz(v::Sparsik) = length(v.nonzero)

# ground field!
Nemo.base_ring(v::Sparsik) = v.field

#------------------------------------------------------------------------------

function extend_field(v::Sparsik, F)
    return Sparsik(v.dim, F, copy(v.nonzero), Dict(i => F(x) for (i, x) in v.data))
end

#------------------------------------------------------------------------------

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
    if iszero(base_ring(v)(c))
        return empty!(v)
    end

    for idx in v.nonzero
        v.data[idx] *= c
    end
    return v
end

# returns v * c
function scale(v::Sparsik, c)
    return scale!(deepcopy(v), c)
end

#------------------------------------------------------------------------------

function Base.lcm(v::Sparsik)
    lcm(denominator.(values(v.data)))
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

# returns v + c * u
# O(k + r)
function Base.reduce(v::Sparsik{T}, u::Sparsik{T}, c) where {T}
    return reduce!(deepcopy(v), u, c)
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
    for i in v.nonzero
        # zero values can be skipped instantly
        # TODO: fix
        if haskey(u.data, i)
            ans += v.data[i] * u.data[i]
        end
    end

    return ans
end

function inner(A::Sparsik{T}, c::AbstractAlgebra.FieldElem) where {T}
    if iszero(c)
        return zero(c)
    end

    error("not implemented!")
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
    # return zero(field)
end

#------------------------------------------------------------------------------

Base.zero(v::Sparsik) = zero_sparsik(v.dim, v.field)
Base.iszero(v::Sparsik{T}) where {T} = length(v) == 0

Base.get(v::Sparsik, i::Int) = get(v.data, i, zero(v.field))

function Base.haskey(A::Sparsik, i::Int)
    return haskey(A.data, i)
end

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

*(v::Sparsik, c::Number) = scale(v, c)
*(c::Number, v::Sparsik) = v * c

==(v::Sparsik{T}, u::Sparsik{T}) where {T} = (v.dim == u.dim &&
            v.field == u.field &&
            v.data == u.data &&
            v.nonzero == u.nonzero)
!=(v::Sparsik{T}, u::Sparsik{T}) where {T} = !(v == u)

# -----------------------------------------------------------------------------

Base.repr(::MIME"text/plain", A::Sparsik) = "($(join(map(idx -> A[idx], 1 : A.dim), ", ")))"
Base.show(io::IO, A::Sparsik) = print(io, repr(MIME("text/plain"), A))

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

# Returns a new Sparsik object consisting of elements
# from the given `v` each converted to the `field`
# Throws if any of the denominators reduces to zero
#
# O(k) if k is the number of nonzero in `v`
function modular_reduction(v::Sparsik, field)
    new_nonzero = Int[]
    new_data = Dict{Int, elem_type(field)}()

    for i in v.nonzero
        # wrapped into a function
        y = modular_reduction(v.data[i], field)
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
    ground = base_ring(v)

    tmp_type = BigInt
    if isa(ground, Nemo.GaloisField)
        tmp_type = Int
    end
    ch = convert(tmp_type, characteristic(ground))

    for (i, x) in v
        y = rational_reconstruction(convert(tmp_type, x), ch)
        if !iszero(y)
            push!(new_nonzero, i)
            new_data[i] = y
        end
    end

    return Sparsik(dim(v), Nemo.QQ, new_nonzero, new_data)
end

#-----------------------------------------------------------------------------

function unit_sparsik(dim, i, field)
    # Int unfolding results into Int
    # Tuple{Int} unfolding results into Int
    # We can generalize it!
    return Sparsik(dim..., field, [i], Dict(i => one(field)))
end

#-----------------------------------------------------------------------------


# returns a Sparsik object consisting of O(sz * density) nnz entries,
# each entry is generated uniformly and independently
function random_sparsik(sz::Int, field::T; density=0.1) where {T <: AbstractAlgebra.Field}
    λ = density * sz

    nnz = Int[]
    data = Dict{Int, elem_type(field)}()
    for _ in 1:λ
        while (idx = rand(1:sz)) != nothing
            !haskey(data, idx) && break
        end
        X = rand(field)
        push!(nnz, idx)
        data[idx] = X
    end

    sort!(nnz)

    return Sparsik(sz, field, nnz, data)
end

function random_sparsik(sz::Tuple{Int}, field::T; density=0.1) where {T <: AbstractAlgebra.Field}
    random_sparsik(sz..., field, density=density)
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

function restrict(v::Sparsik, coords)
    field = base_ring(v)
    nonzero = Int[]
    data = Dict{Int, elem_type(field)}()

    for (i, col) in enumerate(coords)
        if ! iszero(v[col])
            push!(nonzero, i)
            data[i] = v[col]
        end
    end

    return Sparsik(length(coords), field, nonzero, data)
end

#-----------------------------------------------------------------------------

function to_dense(A::Sparsik)
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
function reduce!(v::Sparsik{T}, idx::Int, c) where {T}
    if iszero(c)
        return v
    end

    if haskey(v.data, idx)
        v.data[idx] += c
        if !iszero(v.data[idx])

        else
            popat!(v.nonzero, idx)
            delete!(v.data, idx)
        end
    else
        v.data[idx] = c
        pos = searchsortedfirst(v.nonzero, idx)
        insert!(v.nonzero, pos, idx)
    end
    return v
end
