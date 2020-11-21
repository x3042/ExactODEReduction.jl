
#=
    The File contains `BidimSparsikLazy<T>` and related funcs implementation

    `BidimSparsikLazy` implements `AbstractSparsik` interface
=#

#------------------------------------------------------------------------------

include("sparsik.jl")

#------------------------------------------------------------------------------

import Base: ==, !=, +, -, *
import DataStructures: BinaryMaxHeap
import AbstractAlgebra: elem_type, Field, FieldElem, FracField,
                        characteristic

#------------------------------------------------------------------------------

struct BidimSparsikLazy{T<:Field} <: AbstractSparsik{T}
    # This implementation stores rows data regularly while constructing
    # columns data only when needed
    m::Int
    n::Int

    field::T

    nnz_rows::Vector{Int}
    nnz_cols::Vector{Int}

    rows::Dict{Int, Sparsik{T}}
    cols::Dict{Int, Sparsik{T}}
end

#------------------------------------------------------------------------------

# x2
#
# O(k) where k is the number of nonzeroes in `other`
function BidimSparsikLazy(other::BidimSparsikLazy{T}) where {T}
    # should check Julia metaprogramming
    return BidimSparsikLazy(other.m, other.n,
            other.field,
            deepcopy(other.nnz_rows), deepcopy(other.nnz_cols),
            Dict(map(i -> (i => Sparsik(other.rows[i])), other.nnz_rows)),
            Dict(map(i -> (i => Sparsik(other.cols[i])), other.nnz_cols)))
end

#------------------------------------------------------------------------------

# checks whether the `A.col` and `A.nnz_cols` fields are valid
# note that zero matrix object is always thorough
# O(1)
# Problems with data relevance when scaling/reducing inplace,
# have not broke everything, yet keep this feature in mind
function is_thorough(A::BidimSparsikLazy)
    return length(A.nnz_cols) != 0 || length(A.nnz_rows) == 0
end

#------------------------------------------------------------------------------

# returns the dim of the ambient space
function dim(A::BidimSparsikLazy)
    return size(A, 1) * size(A, 2)
end

#------------------------------------------------------------------------------

# returns the tuple of `A` dimensions
# O(1)
function Base.size(A::BidimSparsikLazy)
    return (A.m, A.n)
end

# returns the ith dimension of `A`
function Base.size(A::BidimSparsikLazy, i::Int)
    return size(A)[i]
end

# returns number of nonzero entries of `A`
# O(k) where k is the number of nonzeroes in `A`
function Base.length(A::BidimSparsikLazy)
    return sum(map(row -> length(row), values(A.rows)))
end

#------------------------------------------------------------------------------

# returns the density of `A`
# which equals the number of nonzeroes
# divied by the dim of the ambient space
# O(k) where k is the number of nonzeroes in `A`
function density(A::BidimSparsikLazy)
    return length(A) / dim(A)
end

#------------------------------------------------------------------------------

# returns the ith column of `A` or `zero(Sparsik)` if not present
# note that NO data validity checks are implied
# O(1)
function get_col(A::BidimSparsikLazy, i)
    return get(A.cols, i, zero_sparsik(size(A, 1), A.field))
end

# returns the ith row of `A` or `zero(Sparsik)` if not present
# O(1)
function get_row(A::BidimSparsikLazy, i)
    return get(A.rows, i, zero_sparsik(size(A, 2), A.field))
end

#------------------------------------------------------------------------------

# returns the list of nonzero columns of `A`
# essentially `get_nnz_cols(A) == sort(keys(A.cols))`
# note that NO data validity checks are implied
# O(1)
function get_nnz_cols(A::BidimSparsikLazy)
    return A.nnz_cols
end

# returns the list of nonzero rows of `A`
# essentially `get_nnz_rows(A) == sort(keys(A.rows))`
# O(1)
function get_nnz_rows(A::BidimSparsikLazy)
    return A.nnz_rows
end

#------------------------------------------------------------------------------

# reconstructs fields `A.cols` and `A.nnz_cols` from rows data
# so that the resulting object is considered to be thorough
# let n = size(A, 2), k = length(A)
# O(n + k) (randomized, amortized)
function reconstruct!(A::BidimSparsikLazy)
    if is_thorough(A)
        return A
    end

    cols_data = [Int[] => Dict{Int, valtype(A)}()
                for _ in 1 : size(A, 2)]

    for i in get_nnz_rows(A)
        for (j, x) in get_row(A, i)
            push!(cols_data[j][1], i)
            cols_data[j][2][i] = x
        end
    end

    for (j, col) in enumerate(cols_data)
        if !isempty(col[1])
            A.cols[j] = Sparsik(size(A, 1), A.field, col...)
            push!(A.nnz_cols, j)
        end
    end

    return A
end

#------------------------------------------------------------------------------

# reconstructs fields `A.cols` and `A.nnz_cols` from rows data
# so that the resulting object is considered to be thorough
# let K = length(A)
#     k = length(A.nnz_rows)
# O(Klogk)
function reconstruct_2!(A::BidimSparsikLazy)
    # k-way merge
    nnz_buffer = DataStructures.BinaryMinHeap(
                    [(first_nonzero(row), idx, 1)
                    for (idx, row) in A.rows]
                )

    # reconstructing ordered cols-nnz list
    while !isempty(nnz_buffer)
        (col_idx, row_idx, rel_idx) = pop!(nnz_buffer)
        row = A.rows[row_idx]

        if isempty(A.nnz_cols) || last(A.nnz_cols) != col_idx
            push!(A.nnz_cols, col_idx)
        end
        if rel_idx < length(row)
            rel_idx += 1
            push!(nnz_buffer, row.nonzero[rel_idx], row_idx, rel_idx)
        end
    end

    # reconstructing cols-data dict
    for i in get_nnz_rows(A)
        for (j, x) in get_row(A, i)
            if !haskey(A.cols, j)
                A.cols[j] = zero_sparsik(size(A, 1), A.field)
            end
            push!(A.cols[j].nonzero, i)
            A.cols[j].data[i] = x
        end
    end

    return A
end

#------------------------------------------------------------------------------

# constructs `BidimSparsikLazy` object from
#   `m`           - number of rows
#   `n`           - number of cols
#   `field`       - field of coefficients
#   `nnz_rows`    - ordered 1-dimensional Array of indices of nonzero rows
#   `rows`        - Dict of items (i => row) where i is
#                       the index of the nonzero row in the matrix
#                       and row - its Sparsik representation
#                   data must be converted to fmpq
#
# the resulting object is Not Thorough
# O(1)
function from_rows(m, n, field, nnz_rows, rows)
    return BidimSparsikLazy(m, n, field,
                            nnz_rows, Int[],
                            rows, Dict{Int, Sparsik{typeof(field)}}())
end

#------------------------------------------------------------------------------

# constructs `BidimSparsikLazy` object from
#   `m`           - number of rows
#   `n`           - number of cols
#   `nnz_coords`  - a collection-like object of items (i, j, x),
#                       where i and j mark
#                       the position of the nonzero element
#                       in the matrix and x - its value,
#                       the order is not implied
#   `field`       - field of coefficients
#
# the resulting object is Thorough
#
# O(klogk + R)
# where k is length(nnz_coords) and R is the reconstruction cost
function from_COO(m, n, nnz_coords, field)
    nnz_rows = Int[]
    rows = Dict{Int, Sparsik{typeof(field)}}()

    for (i, j, x) in nnz_coords
        if !haskey(rows, i)
            rows[i] = zero_sparsik(n, field)
        end
        rows[i].data[j] = field(x)
        push!(rows[i].nonzero, j)
        push!(nnz_rows, i)
    end

    unique!(sort!(nnz_rows))
    map(xs -> unique!(sort!(get_nnz(xs))), values(rows))

    # and this can be speed up
    return reconstruct!(from_rows(m, n, field, nnz_rows, rows))
end

#------------------------------------------------------------------------------

# constructs `BidimSparsikLazy` object from
#   `A`           - a collection-like object of 2 dimensions
#   `field`       - field of coefficients
#
# the resulting object is Thorough
#
# let (m, n) = size(A)
# O(mn + R)
# where R is reconstruction cost
function from_dense(A::AbstractMatrix, field)
    m, n = size(A, 1), size(A, 2)
    nnz_rows = Int[]
    rows = Dict{Int, Sparsik{typeof(field)}}()

    for i in 1 : m
        row_vals = Dict{Int, elem_type(field)}()
        row_nnz = Int[]

        for j in 1 : n
            if !iszero(A[i, j])
                push!(row_nnz, j)
                row_vals[j] = field(A[i, j])
            end
        end

        if !isempty(row_nnz)
            push!(nnz_rows, i)
            rows[i] = Sparsik(n, field, row_nnz, row_vals)
        end
    end

    return reconstruct!(from_rows(m, n, field, nnz_rows, rows))
end

#------------------------------------------------------------------------------

# returns A + c * B
# mutates A
# the resulting object is Not Thorough
#
# note that `length(A)` and `number of nonzeroes in A` are synonyms
# let k = length(A), r = length(B)
# O(k + r) (randomized, amortized)
function reduce!(A::BidimSparsikLazy{T}, B::BidimSparsikLazy{T}, c) where {T}
    nnz_rows = Int[]
    # equality of field types ensures that
    # valtype(A) == valtype(B)
    rows = Dict{Int, valtype(A)}()

    i, j = 1, 1
    A_nnz_rows = deepcopy(get_nnz_rows(A))
    B_nnz_rows = get_nnz_rows(B)
    empty!(A.nnz_rows)

    while i <= length(A_nnz_rows) || j <= length(B_nnz_rows)
        if i > length(A_nnz_rows)
            new_idx = B_nnz_rows[j]
            j += 1
        elseif j > length(B_nnz_rows)
            new_idx = A_nnz_rows[i]
            i += 1
        else
            new_idx = min(A_nnz_rows[i], B_nnz_rows[j])
            if A_nnz_rows[i] > B_nnz_rows[j]
                j += 1
            elseif A_nnz_rows[i] < B_nnz_rows[j]
                i += 1
            else
                i += 1
                j += 1
            end
        end

        if (!haskey(A.rows, new_idx))
            A.rows[new_idx] = zero_sparsik(size(A, 2), A.field)
        end
        reduce!(A.rows[new_idx], get_row(B, new_idx), c)

        if (!iszero(get_row(A, new_idx)))
            push!(A.nnz_rows, new_idx)
        else
            delete!(A.rows, new_idx)
        end
    end

    return A
end

#------------------------------------------------------------------------------

# returns A + c * B
# the resulting object is Not Thorough
#
# let k = length(A), r = length(B)
# O(k + r) (randomized, amortized)
function Base.reduce(A::BidimSparsikLazy, B::BidimSparsikLazy, c)
    return reduce!(BidimSparsikLazy(A), B, c)
end

#------------------------------------------------------------------------------

# returns A × B
# the resulting object is Not Thorough
#
# let k = length(A), r = length(B)
# O(kr) if `B` Is Thorough
# O(kr + R) where R is reconstruction cost otherwise
function Base.prod(A::BidimSparsikLazy{T}, B::BidimSparsikLazy{T}) where {T}
    if !is_thorough(B)
        reconstruct!(B)
    end

    nnz_rows = Int[]
    rows = Dict{Int, Sparsik{T}}()

    for i in get_nnz_rows(A)
        row_vals = Dict{Int, valtype(A)}()
        row_indices = Int[]

        for j in get_nnz_cols(B)
            product = inner(get_row(A, i), get_col(B, j))

            if !iszero(product)
                push!(row_indices, j)
                row_vals[j] = product
            end
        end

        if !isempty(row_indices)
            push!(nnz_rows, i)
            rows[i] = Sparsik(size(A, 2), A.field, row_indices, row_vals)
        end
    end

    return from_rows(
        size(A, 1), size(B, 2), A.field,
        nnz_rows, rows
    )
end

#------------------------------------------------------------------------------

# returns A(v) = Av
# if k = length(A) and r = length(v)
# O(k)
function apply_vector(A::BidimSparsikLazy, v::Sparsik)
    nonzero = Int[]
    data = Dict{Int, valtype(A)}()

    for row_idx in get_nnz_rows(A)
        product = inner(get_row(A, row_idx), v)
        if !iszero(product)
            push!(nonzero, row_idx)
            data[row_idx] = product
        end
    end

    return Sparsik(size(A, 1), A.field, nonzero, data)
end

# redefinition for find_basis in Subspace
function apply_vector(A::BidimSparsikLazy, B::BidimSparsikLazy)
    return prod(A, B)
end

#------------------------------------------------------------------------------

# returns A * c modifying the `A` object itself
# the resulting object is Not Thorough
#
# let k = length(A)
# O(k) (randomized, amortized)
function scale!(A::BidimSparsikLazy, c)
    if iszero(c)
        return empty!(A)
    end

    for i in get_nnz_rows(A)
        scale!(A.rows[i], c)
    end

    return A
end

#------------------------------------------------------------------------------

# returns A * c, does not modify `A`
# the resulting object is Not Thorough
#
# let k = length(A)
# O(k) (randomized, amortized)
function scale(A::BidimSparsikLazy, c)
    return scale!(BidimSparsikLazy(A), c)
end

#------------------------------------------------------------------------------

# returns A[i, j] or zero if not present
# O(1) (randomized, amortized)
function Base.get(A::BidimSparsikLazy, i::Int, j::Int)
    if !haskey(A.rows, i)
        return zero(A.field)
    end
    return A.rows[i][j]
end

#------------------------------------------------------------------------------

# erases all entries of `A`
# the resulting object is Thorough
# (since empty object is)
#
# let k = length(A)
# O(k)
function Base.empty!(A::BidimSparsikLazy)
    empty!(A.nnz_rows)
    empty!(A.rows)
    empty!(A.nnz_cols)
    empty!(A.cols)
    return A
end

#------------------------------------------------------------------------------

# returns zero matrix of the dimensions (m, n)
function zero_sparsik(m, n, field)
    from_rows(m, n, field, Int[], Dict{Int, typeof(field)}())
end
zero_sparsik(sz::Tuple{Int, Int}, field) = zero_sparsik(sz..., field)

# returns zero matrix of the dimensions of `A`
Base.zero(A::BidimSparsikLazy) = zero_sparsik(size(A)..., A.field)

Base.iszero(A::BidimSparsikLazy) = length(get_nnz_rows(A)) == 0

#------------------------------------------------------------------------------

# 1. we can check only rows
# 2. explicit type asserting
==(A::BidimSparsikLazy{T}, B::BidimSparsikLazy{T}) where {T} = (size(A) == size(B) &&
            A.field == B.field;
            A.rows == B.rows;
            A.nnz_rows == B.nnz_rows)
!=(A::BidimSparsikLazy{T}, u::BidimSparsikLazy{T}) where {T} = !(A == B)

+(A::BidimSparsikLazy{T}, B::BidimSparsikLazy{T}) where {T} = reduce(A, B, one(A.field))
-(A::BidimSparsikLazy{T}, B::BidimSparsikLazy{T}) where {T} = reduce(A, B, - one(A.field))
-(A::BidimSparsikLazy) = scale(A, -one(A.field))

*(A::BidimSparsikLazy, c) = scale(A, c)
*(c, A::BidimSparsikLazy) = scale(A, c)
*(A::BidimSparsikLazy{T}, B::BidimSparsikLazy{T}) where {T} = prod(A, B)

#------------------------------------------------------------------------------

function Base.show(A::BidimSparsikLazy)
    return "$(join(map(i -> "|$(join(map(j -> get(A, i, j), 1 : A.n), "\t"))|", 1 : A.m), "\n"))"
end

print_sparsik(A::BidimSparsikLazy) = println(show(A))

#------------------------------------------------------------------------------

# Gleb: why do you create a separate function and not just overload Base.getindex?
# Alex: as far as I understand, that feature has a semantic purpose -
#   - to show that calling A[i] returns nothing but i-th matrix-as-a-vector element
#   (function signature changed, now it returns indices instead of element)
function to_cartesian(A::BidimSparsikLazy, idx::Int)
    cols = size(A, 2)
    if mod(idx, cols) == 0
        i = div(idx, cols)
    else
        i = div(idx, cols) + 1
    end
    j = idx - cols * (i - 1)
    return (i, j)
 end

 function to_plain(A, i::Int, j::Int)
     return (i - 1) * size(A, 1) + j
 end

#------------------------------------------------------------------------------

Base.getindex(m::BidimSparsikLazy, idx::Int) = m[to_cartesian(m, idx)...]

Base.getindex(m::BidimSparsikLazy, i::Int, j::Int) = get(m, i, j)

function first_nonzero(m::BidimSparsikLazy)
    if iszero(m)
        return -1
    end
    return (m.nnz_rows[1] - 1) * size(m, 2) + first_nonzero(m.rows[m.nnz_rows[1]])
end

#------------------------------------------------------------------------------

Base.valtype(A::BidimSparsikLazy) = elem_type(A.field)
Base.eltype(A::BidimSparsikLazy) = (Int, valtype(A))

#------------------------------------------------------------------------------

# linear in size
function Base.iterate(A::BidimSparsikLazy, state=(1, 1))
    (i, j) = state
    if i > length(A.nnz_rows) || j > length(A.rows[A.nnz_rows[i]])
        (i, j) = (i + 1, 1)
    end

    if i > length(A.nnz_rows)
        return nothing
    else
        r_idx = A.nnz_rows[i]
        c_idx = A.rows[r_idx].nonzero[j]
        state = (i, j + 1)
        return ((to_plain(A, r_idx, c_idx), A[r_idx, c_idx]), state)
    end
end

# -----------------------------------------------------------------------------

function modular_reduction(A::BidimSparsikLazy, field)
    new_nnz_rows = Int[]
    new_rows = Dict{Int, Sparsik{typeof(field)}}()

    for i in A.nnz_rows
        y = modular_reduction(get_row(A, i), field)
        if !iszero(y)
            push!(new_nnz_rows, i)
            new_rows[i] = y
        end
    end

    return from_rows(size(A)..., field, new_nnz_rows, new_rows)
end

# -----------------------------------------------------------------------------

function rational_reconstruction(A::BidimSparsikLazy)
    new_nnz_rows = Int[]
    new_rows = Dict{Int, Sparsik{typeof(QQ)}}()

    for i in A.nnz_rows
        y = rational_reconstruction(get_row(A, i))
        if !iszero(y)
            push!(new_nnz_rows, i)
            new_rows[i] = y
        end
    end

    return from_rows(size(A)..., QQ, new_nnz_rows, new_rows)
end

# -----------------------------------------------------------------------------
