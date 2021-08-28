
#=
    The File contains `DOK_Sparsik<T>` and related funcs implementation

    `DOK_Sparsik` implements `AbstractSparseMatrix` interface
=#
#------------------------------------------------------------------------------

"""
    DOK_Sparsik{T<:Field}

Provides basic 2-dimensional sparse vector interface, i.e Sparse Matrix.
Parametrized with the type of coefficient field `T`.

Supports these *fast* operations:

 `inner`, `scale`, `reduce`, `iterate`, matvec and matmat (`Base.prod`).

One can construct `BidimSparsik` from a dense matrix with the `from_dense` function.
"""
mutable struct DOK_Sparsik{T <: AbstractAlgebra.Field} <: AbstractSparseMatrix{T}
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

Nemo.base_ring(v::DOK_Sparsik) = v.field

#------------------------------------------------------------------------------

# O(k)
function Base.deepcopy_internal(x::DOK_Sparsik, stackdict::IdDict)
    y = DOK_Sparsik(x.m, x.n, x.field,
            Base.deepcopy_internal(x.nnz_rows, stackdict),
            Base.deepcopy_internal(x.nnz_cols, stackdict),
            Base.deepcopy_internal(x.rows, stackdict),
            Base.deepcopy_internal(x.cols, stackdict))
    stackdict[x] = y
    return y
end

#------------------------------------------------------------------------------

# checks whether the `A.col` and `A.nnz_cols` fields are valid
# note that zero matrix object is always thorough
# O(1)
# Problems with data relevance when scaling/reducing inplace,
# have not broke everything, yet keep this feature in mind
function is_thorough(A::DOK_Sparsik)
    return length(A.nnz_cols) != 0 || length(A.nnz_rows) == 0
end

#------------------------------------------------------------------------------

function field(A::DOK_Sparsik)
    return A.field
end

# returns the dim of the ambient space
function dim(A::DOK_Sparsik)
    return size(A, 1) * size(A, 2)
end

# returns the order of the matrix
# `A` must be square
function order(A::DOK_Sparsik)
    return size(A, 1)
end

function issquare(A::DOK_Sparsik)
    return size(A, 1) == size(A, 2)
end

#------------------------------------------------------------------------------

# returns the tuple of `A` dimensions
# O(1)
function Base.size(A::DOK_Sparsik)
    return (A.m, A.n)
end

# returns the ith dimension of `A`
function Base.size(A::DOK_Sparsik, i::Int)
    return size(A)[i]
end

# returns number of nonzero entries of `A`
# O(k) where k is the number of nonzeroes in `A`
function Base.length(A::DOK_Sparsik)
    return sum(map(row -> length(row), values(A.rows)))
end

#------------------------------------------------------------------------------

# returns the density of `A`
# which equals the number of nonzeroes
# divied by the dim of the ambient space
# O(k) where k is the number of nonzeroes in `A`
function density(A::DOK_Sparsik)
    return length(A) / dim(A)
end

#------------------------------------------------------------------------------


# Export the matrix as a list of tripes [row_idx, col_idx, entry]
# for the nonzero entries
# In case `one_based` is set, add 1 to every index
function export_as_triples(A::DOK_Sparsik)
    result = []
    for i in A.nnz_rows
        for (j, x) in A.rows[i]
            push!(result, [i, j, x])
        end
    end
    return result
end


#------------------------------------------------------------------------------

# reconstructs fields `A.cols` and `A.nnz_cols` from rows data
# so that the resulting object is considered to be thorough
# let n = size(A, 2), k = length(A)
# O(n + k)
function reconstruct!(A::DOK_Sparsik)
    #if is_thorough(A)
    #    return A
    #end

    cols_data = [Int[] => Dict{Int, valtype(A)}()
                for _ in 1 : size(A, 2)]

    for i in A.nnz_rows
        for (j, x) in A.rows[i]
            push!(cols_data[j][1], i)
            cols_data[j][2][i] = x
        end
    end

    map(x-> unique!(sort!(x[1])), cols_data)

    for (j, col) in enumerate(cols_data)
        if !isempty(col[1])
            A.cols[j] = Sparsik(size(A, 1), A.field, col...)
            push!(A.nnz_cols, j)
        end
    end

    unique!(sort!(A.nnz_cols))

    return A
end

#------------------------------------------------------------------------------

# reconstructs fields `A.cols` and `A.nnz_cols` from rows data
# so that the resulting object is considered to be thorough
# let K = length(A)
#     k = length(A.nnz_rows)
# O(Klogk)
function reconstruct_2!(A::DOK_Sparsik)
    if is_thorough(A)
        return A
    end

    # k-way merge
    nnz_buffer = BinaryMinHeap(
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
            push!(nnz_buffer, (row.nonzero[rel_idx], row_idx, rel_idx))
        end
    end

    # reconstructing cols-data dict
    for i in A.nnz_rows
        for (j, x) in A.rows[i]
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

# constructs `DOK_Sparsik` object from
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
    return DOK_Sparsik(m, n, field,
                            nnz_rows, Int[],
                            rows, Dict{Int, Sparsik{typeof(field)}}())
end

#------------------------------------------------------------------------------

# constructs `DOK_Sparsik` object from
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
            rows[i] = Sparsik(n, field, Int[], Dict{Int, elem_type(field)}())
        end
        rows[i].data[j] = field(x)
        push!(rows[i].nonzero, j)
        push!(nnz_rows, i)
    end

    unique!(sort!(nnz_rows))
    map(xs -> unique!(sort!(xs.nonzero)), values(rows))

    # and this can be speed up
    return reconstruct!(from_rows(m, n, field, nnz_rows, rows))
end

function from_COO(m, n, x::Dict, field)
    from_COO(m, n, ((k[1], k[2], x[k]) for k in keys(x)), field)
end

#------------------------------------------------------------------------------

# constructs `DOK_Sparsik` object from
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

        row = from_dense(A[i, :], field)

        if !iszero(row)
            push!(nnz_rows, i)
            rows[i] = row
        end
    end

    return reconstruct!(from_rows(m, n, field, nnz_rows, rows))
end

#------------------------------------------------------------------------------

# returns A + c * B
# mutates A, constructs A.rows inplace
# the resulting object is Not Thorough
#
# note that `length(A)` and `number of nonzeroes in A` are synonyms
# let k = length(A), r = length(B)
# O(k + r)
function reduce!(A::DOK_Sparsik{T}, B::DOK_Sparsik{T}, c) where {T}
    FF = base_ring(A)
    nnz_rows = Int[]
    # equality of field types ensures that
    # valtype(A) == valtype(B)
    rows = Dict{Int, valtype(A)}()

    i, j = 1, 1
    A_nnz_rows = deepcopy(A.nnz_rows)
    B_nnz_rows = deepcopy(B.nnz_rows)
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

        if !haskey(A.rows, new_idx)
            A.rows[new_idx] = zero_sparsik(size(A, 2), A.field)
        end
        if haskey(B.rows, new_idx)
            reduce!(A.rows[new_idx], B.rows[new_idx], c)
        end

        if !iszero(A.rows[new_idx])
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
# O(k + r)
function Base.reduce(A::DOK_Sparsik, B::DOK_Sparsik, c)
    return reduce!(deepcopy(A), B, c)
end

#------------------------------------------------------------------------------

# returns A × B
# the resulting object is Not Thorough
#
# let k = length(A), r = length(B)
# O(kr) if `B` Is Thorough
# O(kr + R) where R is reconstruction cost otherwise
function Base.prod(A::DOK_Sparsik{T}, B::DOK_Sparsik{T}) where {T}
    if !is_thorough(B)
        reconstruct!(B)
    end

    FF = base_ring(A)

    nnz_rows = Int[]

    # we can create it only when needed
    # TODO: fix
    rows = Dict{Int, Sparsik{T}}()

    for i in A.nnz_rows

        # we can create it only when needed
        # TODO: fix
        row_vals = Dict{Int, valtype(A)}()
        row_indices = Int[]

        for j in B.nnz_cols
            product = inner(A.rows[i], B.cols[j])
            # TODO
            # global ZEROS
            # global TOTALS
            # TOTALS += 1
            # iszero(product) && (ZEROS += 1)

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

    # we can return 0 instead of instantiating new object
    # as long as this method is not a part of interface
    return from_rows(
        size(A, 1), size(B, 2), FF,
        nnz_rows, rows
    )
end

function do_overlap(bv::UInt64, bu::UInt64)
    return (bv & bu) != 0
end

function prod_bloom(
    A::DOK_Sparsik{T}, B::DOK_Sparsik{T},
    bloomA::Dict{Int, UInt64}, bloomB::Dict{Int, UInt64}) where {T}

    FF = base_ring(A)
    nnz_rows = Int[]
    rows = Dict{Int, Sparsik{T}}()

    for i in A.nnz_rows
        row_vals = Dict{Int, valtype(A)}()
        row_indices = Int[]
        for j in B.nnz_cols
            if do_overlap(bloomA[i], bloomB[j])
                product = inner(A.rows[i], B.cols[j])
                if !iszero(product)
                    push!(row_indices, j)
                    row_vals[j] = product
                end
            end
        end

        if !isempty(row_indices)
            push!(nnz_rows, i)
            rows[i] = Sparsik(size(A, 2), A.field, row_indices, row_vals)
        end
    end

    return from_rows(
        size(A, 1), size(B, 2), FF,
        nnz_rows, rows
    )
end

#------------------------------------------------------------------------------

#
# returns A(v) = Av
# if k = length(A) and r = length(v)
# O(k)
function Base.prod(A::DOK_Sparsik, v::Sparsik)
    nonzero = Int[]
    field = base_ring(A)
    data = Dict{Int, elem_type(field)}()

    for idx in A.nnz_rows
        product = inner(A.rows[idx], v)
        if ! iszero(product)
            push!(nonzero, idx)
            data[idx] = product
        end
    end

    return Sparsik(size(A, 1), field, nonzero, data)
end

#------------------------------------------------------------------------------

# returns A * c modifying the `A` object itself
# the resulting object is Not Thorough
#
# let k = length(A)
# O(k)
function scale!(A::DOK_Sparsik, c)
    if iszero(c)
        return empty!(A)
    end

    for i in A.nnz_rows
        scale!(A.rows[i], c)
    end

    return A
end

#------------------------------------------------------------------------------

# returns A * c, does not modify `A`
# the resulting object is Not Thorough
#
# let k = length(A)
# O(k)
function scale(A::DOK_Sparsik, c)
    return scale!(deepcopy(A), c)
end

#------------------------------------------------------------------------------

# returns A[i, j] or zero if not present
# O(1)
function Base.get(A::DOK_Sparsik, i::Int, j::Int)
    if !haskey(A.rows, i)
        return zero(A.field)
    end
    return A.rows[i][j]
end

function Base.haskey(A::DOK_Sparsik, i::Int, j::Int)
    return haskey(A.rows, i) && haskey(A.rows[i].data, j)
end

function Base.haskey(A::DOK_Sparsik, i::Int)
    return haskey(A, to_cartesian(A, i)...)
end

#------------------------------------------------------------------------------

# erases all entries of `A`
# the resulting object is Thorough
# (since empty object is)
#
# let k = length(A)
# O(k)
function Base.empty!(A::DOK_Sparsik)
    empty!(A.nnz_rows)
    empty!(A.rows)
    empty!(A.nnz_cols)
    empty!(A.cols)
    return A
end

#------------------------------------------------------------------------------

# returns zero matrix of the dimensions (m, n)
function zero_sparsik(m, n, field)
    from_rows(m, n, field, Int[], Dict{Int, Sparsik{typeof(field)}}())
    #zero(field)
end

zero_sparsik(sz::Tuple{Int, Int}, field) = zero_sparsik(sz..., field)

# returns zero matrix of the dimensions of `A`
Base.zero(A::DOK_Sparsik) = zero_sparsik(size(A)..., A.field)

Base.iszero(A::DOK_Sparsik{T}) where {T} = length(A.nnz_rows) == 0

#------------------------------------------------------------------------------

==(A::DOK_Sparsik{T}, B::DOK_Sparsik{T}) where {T} = (size(A) == size(B) &&
            A.field == B.field;
            A.rows == B.rows;
            A.nnz_rows == B.nnz_rows)
!=(A::DOK_Sparsik{T}, u::DOK_Sparsik{T}) where {T} = !(A == u)

+(A::DOK_Sparsik{T}, B::DOK_Sparsik{T}) where {T} = reduce(A, B, one(A.field))
-(A::DOK_Sparsik{T}, B::DOK_Sparsik{T}) where {T} = reduce(A, B, - one(A.field))
-(A::DOK_Sparsik) = scale(A, -one(A.field))

*(A::DOK_Sparsik, c::Number) = scale(A, c)
*(c::Number, A::DOK_Sparsik) = scale(A, c)
*(A::DOK_Sparsik, c::AbstractAlgebra.FieldElem)= scale(A, c)
*(c::AbstractAlgebra.FieldElem, A::DOK_Sparsik) = scale(A, c)
*(A::DOK_Sparsik{T}, B::DOK_Sparsik{T}) where {T} = prod(A, B)

*(A::DOK_Sparsik{T}, v::Sparsik{T}) where {T} = prod(A, v)

#------------------------------------------------------------------------------

Base.repr(::MIME"text/plain", A::DOK_Sparsik) = "$(join(map(i -> "|$(join(map(j -> get(A, i, j), 1 : A.n), "\t"))|", 1 : A.m), "\n"))"
Base.show(io::IO, A::DOK_Sparsik) = print(io, repr(MIME("text/plain"), A))

#------------------------------------------------------------------------------

function to_cartesian(A::DOK_Sparsik, idx::Int)
    return to_cartesian(size(A), idx)
 end

 function to_plain(A, i::Int, j::Int)
     return to_plain(size(A), i, j)
 end

function to_cartesian(sz::Tuple{Int, Int}, idx::Int)
    cols = sz[2]
    if mod(idx, cols) == 0
        i = div(idx, cols)
    else
        i = div(idx, cols) + 1
    end
        j = idx - cols * (i - 1)
    return (i, j)
 end

function to_plain(sz::Tuple{Int, Int}, i::Int, j::Int)
    return (i - 1) * sz[1] + j
end


#------------------------------------------------------------------------------

# returns the idx-th element of m if m is treated as
# a vector stretched across the rows
# O(1)
Base.getindex(m::DOK_Sparsik, idx::Int) = m[to_cartesian(m, idx)...]

# returns the (i, j) element of m as a matrix
# O(1)
Base.getindex(m::DOK_Sparsik, i::Int, j::Int) = get(m, i, j)

function first_nonzero(m::DOK_Sparsik)
    if iszero(m)
        return -1
    end
    return (m.nnz_rows[1] - 1) * size(m, 2) + first_nonzero(m.rows[m.nnz_rows[1]])
end

#------------------------------------------------------------------------------

Base.valtype(A::DOK_Sparsik) = elem_type(A.field)
Base.eltype(A::DOK_Sparsik) = (Int, valtype(A))

#------------------------------------------------------------------------------

# iterates over A nonzeroes
# each returned item is of type eltype(A)
# linear in the nimber of nonzeroes in A
function Base.iterate(A::DOK_Sparsik, state=(1, 1))
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

#-----------------------------------------------------------------------------

# returns a new AbstractSparsik object consisting of elements
# from the given `A` each converted to the `field`
#
# O(k) if k is the number of nonzero in `A`
function modular_reduction(A::DOK_Sparsik, field)
    new_nnz_rows = Int[]
    new_rows = Dict{Int, Sparsik{typeof(field)}}()

    for i in A.nnz_rows
        y = modular_reduction(A.rows[i], field)
        if !iszero(y)
            push!(new_nnz_rows, i)
            new_rows[i] = y
        end
    end

    return from_rows(size(A)..., field, new_nnz_rows, new_rows)
end

#-----------------------------------------------------------------------------

# returns a new DOK_Sparsik object consisting of elements
# from the `A` each reconstructed from A.field to QQ
#
# roughly
# O(klog²(ch)) if k is the number of nonzero in `v`
# and ch is the field characteristic
function rational_reconstruction(A::DOK_Sparsik)
    new_nnz_rows = Int[]
    new_rows = Dict{Int, Sparsik{typeof(Nemo.QQ)}}()

    for i in A.nnz_rows
        y = rational_reconstruction(A.rows[i])
        if !iszero(y)
            push!(new_nnz_rows, i)
            new_rows[i] = y
        end
    end

    return from_rows(size(A)..., Nemo.QQ, new_nnz_rows, new_rows)
end

#-----------------------------------------------------------------------------

# returns standard inner product of A and B
# if the vectors A and B have k and r nonzeroes respectively
# O(min(k, r))
function inner(A::DOK_Sparsik{T}, B::DOK_Sparsik{T}) where {T}
    ans = zero(A.field)

    if length(A) > length(B)
        inner(B, A)
    end

    for (i, row) in A.rows
        if haskey(B.rows, i)
            ans += inner(row, B.rows[i])
        end
    end

    return ans
end

# ad-hoc inner
function inner(A::DOK_Sparsik{T}, c::AbstractAlgebra.FieldElem) where {T}
    if iszero(c)
        return zero(c)
    end

    error("not implemented!")
end

inner(c::AbstractAlgebra.FieldElem, A::DOK_Sparsik{T}) where {T} = inner(A, c)

#-----------------------------------------------------------------------------

# returns the Id matrix
# this one can be pretty slow
function Base.one(A::DOK_Sparsik{T}) where {T}
    field = base_ring(A)
    reconstruct!(from_rows(
        size(A)...,
        field,
        Array(1:order(A)),
        Dict{Int, Sparsik{T}}(
            i => unit_sparsik(order(A), i, field)
            for i in 1:order(A)
        )
    ))
end

#-----------------------------------------------------------------------------

function random_sparsik(sz::Tuple{Int, Int}, field; density=0.1)
    @assert 0 <= density <= 1

    # outer product
    ×(xs, ys) = (i, j) -> (xs[i], ys[j])

    underlying = (1:sz[1]) × (1:sz[2])
    n = prod(sz)
    λ = density * n

    nnz = Dict{Tuple{Int, Int}, elem_type(field)}()
    for _ in 1:λ
        while (idx = to_cartesian(sz, rand(1:n))) != nothing
            !haskey(nnz, idx) && break
        end
        nnz[idx...] = rand(field)
    end

    return from_COO(sz..., nnz, field)
end

#-----------------------------------------------------------------------------

# vectorizes the matrix
# O(k) if k is nnz count
function Base.vec(A::DOK_Sparsik)
    m, n = size(A)
    field = base_ring(A)
    nonzero = Int[]
    data = Dict{Int, elem_type(field)}()
    for idx in A.nnz_rows
        for (i, x) in A.rows[idx]
            data[i + (idx - 1) * n] = x
            push!(nonzero, i + (idx - 1) * n)
        end
    end

    return Sparsik(m*n, field, nonzero, data)
end

#-----------------------------------------------------------------------------

# restricts the given DOK_Sparsik object to the given `coords`
# if the sparsik is treated as a vector
# `coords` - a collection-like object of Ints
#
# O(length(coords))
function restrict(A::DOK_Sparsik, coords)
    nonzero = Int[]
    field = base_ring(A)
    data = Dict{Int, elem_type(field)}()
    for (i, idx) in enumerate(coords)
        if !iszero(A[idx])
            push!(nonzero, i)
            data[i] = A[idx]
        end
    end
    return Sparsik(length(coords), field, nonzero, data)
end

# the same as the above
# BUT !
# O(length(coords))
function restrict(A::DOK_Sparsik, coords, first_value)
    nonzero = Int[]
    field = base_ring(A)
    data = Dict{Int, elem_type(field)}()

    if ! iszero(first_value)
        push!(nonzero, 1)
        data[1] = first_value
    end

    for (i, idx) in enumerate(coords)
        if !iszero(A[idx])
            push!(nonzero, i + 1)
            data[i + 1] = A[idx]
        end
    end
    return Sparsik(length(coords) + 1, field, nonzero, data)
end

# -----------------------------------------------------------------------------

# well, it transposes the matrix
# O(R)
# where R is the reconstruction cost
function transpose!(A::DOK_Sparsik)
    reconstruct!(A)
    A.m, A.n = A.n, A.m
    A.nnz_rows, A.nnz_cols = A.nnz_cols, A.nnz_rows
    A.rows, A.cols = A.cols, A.rows
    return A
end

# -----------------------------------------------------------------------------

function to_dense(A::DOK_Sparsik)
    ans = fill(zero(base_ring(A)), size(A))
    for (i, x) in A
        ans[to_cartesian(A, i)...] = x
    end
    return ans
end

# -----------------------------------------------------------------------------

function unit_sparsik(sz::Tuple{Int, Int}, idx::Int, field)
    i, j = to_cartesian(sz, idx)
    return DOK_Sparsik(
        sz...,
        field,
        [ i ],
        Int[],
        Dict(i => unit_sparsik(sz[2], j, field)),
        Dict{Int, Sparsik{typeof(field)}}()
    )
end

# -----------------------------------------------------------------------------

function tr(A::DOK_Sparsik)
    if iszero(A)
        return zero(base_ring(A))
    end
    sum(A[i, i] for i in A.nnz_rows)
end
