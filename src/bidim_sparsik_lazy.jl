

#=
    The File contains the BidimSparsikLazy<Real> -
        - The Lazy Sparse Matrix Implementation
        and related funcs

    The core of the BidimSparsikLazy interface is the same as of BidimSparsiks

    Overloaded functions:
        get, zero, iszero, length, prod, empty!, reduce,
        show
=#


#------------------------------------------------------------------------------

if !isdefined(Main, :(==))
    import Base: ==, !=, +, -, *, get
end

if !isdefined(Main, :Sparsik)
    include("sparsik.jl")
end

#------------------------------------------------------------------------------

struct BidimSparsikLazy

    # This implementation stores rows data regularly while constructing
    # columns data only when needed
    #
    # key-word: `thorough BidimSparsikLazy` - a BidimSparsikLazy object with valid
    #                   `nnz_cols` and `cols` fields

    # dimensions
    m::Int
    n::Int

    # Nonzero rows indices
    # Guaranteed to be sorted
    nnz_rows::Vector{Int}

    # Nonzero cols indices
    # Guaranteed to be sorted
    # Defaults to [] when self is not thorough
    nnz_cols::Vector{Int}

    # `Dict` of items: Index{Int} => Row{Sparsik}
    # where Row contains at least 1 nonzero value
    rows::Dict{Int, Sparsik}

    # `Dict` of items: Index{Int} => Column{Sparsik}
    # where Column contains at least 1 nonzero value
    # Defaults to Dict() when self is not thorough
    cols::Dict{Int, Sparsik}

    # default ctor
    # O(1)
    function BidimSparsikLazy(m, n, nnz_rows, nnz_cols, rows, cols)
        return new(m, n, nnz_rows, nnz_cols, rows, cols)
    end

end

#------------------------------------------------------------------------------

# checks whether the `A.col` and `A.nnz_cols` fields are valid
# note that zero matrix object is always thorough
# O(1)
function is_thorough(A::BidimSparsikLazy)
    return length(A.nnz_cols) != 0 || length(A.nnz_rows) == 0
end

#------------------------------------------------------------------------------

# returns the tuple of `A` dimensions
# (actually, the product of returned elements equals
#    the dimension of the ambient space of matrix `A`)
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

# returns the ith column of `A` or `zero(Sparsik)` if not present
# O(1) (randomized, amortized)
function get_col(A::BidimSparsikLazy, i::Int)
    return get(A.cols, i, zero_sparsik(size(A, 1)))
end

# returns the ith row of `A` or `zero(Sparsik)` if not present
# O(1) (randomized, amortized)
function get_row(A::BidimSparsikLazy, i::Int)
    return get(A.rows, i, zero_sparsik(size(A, 2)))
end

#------------------------------------------------------------------------------

# returns the list of nonzero columns of `A`
# essentially `get_nnz_cols(A) == sort(keys(A.cols))`
# note that no data validity checks are implied
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
#
# let n = size(A, 2), k = length(A)
# O(n + k) (randomized, amortized)
function reconstruct!(A::BidimSparsikLazy)

    # one thought:
    # the constructing of columns data essentially
    # reducts to a problem of merging some ordered lists (rows),
    # which can be done optimally with the help of a Huffman Tree
    # and a modified binsearch
    #
    # despite such an approach seems a bit cumbersome, someday I will code it


    # in present implementation we will use the fact that `size(A, 2)` is
    # relatively a small number
    # so the counting sort will do

    if is_thorough(A)
        return A
    end

    # `cols_data` maps the column index j to the pair (Indices, Vals) where
    # Indices is an ordered Array of row coordinates of nonzeroes at the jth column
    # and Vals is the Dict of pairs (row_idx, value)
    # (its essentially an Array of Sparsiks)
    cols_data = [Vector{Int}() => Dict{Int, Any}() for _ in 1 : size(A, 2)]

    for i in get_nnz_rows(A)
        for j in get_row(A, i).nonzero
            push!(cols_data[j][1], i)
            cols_data[j][2][i] = get(A, i, j)
        end
    end

    for (j, col) in enumerate(cols_data)
        if !isempty(col[1])
            A.cols[j] = Sparsik(size(A, 1), col...)
            push!(A.nnz_cols, j)
        end
    end

    return A
end

#------------------------------------------------------------------------------

# constructs `BidimSparsikLazy` object from
#   `m`           - number of rows
#   `n`           - number of cols
#   `nnz_rows`    - ordered 1-dimensional Array of indices of nonzero rows
#   `rows`        - Dict of items (i => row) where i is
#                       the index of the nonzero row in the matrix
#                       and row - its Sparsik representation
#
# the resulting object is Not Thorough
#
# O(1)
function from_rows(m::Int, n::Int, nnz_rows, rows)
    return BidimSparsikLazy(m, n, nnz_rows, [], rows, Dict())
end

#------------------------------------------------------------------------------

# constructs `BidimSparsikLazy` object from
#   `m`           - number of rows
#   `n`           - number of cols
#   `nnz_coords`  - `Dict` of items ((i, j) => x) where i and j mark
#                       the position of the nonzero element
#                       in the matrix and x - its value
#
# the resulting object is Thorough
#
# O(mn) (randomized, amortized)
function from_COO(m::Int, n::Int, nnz_coords)

    # it's not fast, though it's not used
    a = fill(0, m, n)
    for ((i, j), x) in nnz_coords
        a[i, j] = x
    end
    return from_dense(a)
end

#------------------------------------------------------------------------------

# constructs `BidimSparsikLazy` object from
#   `A`           - a collection-like object of 2 dimensions
#
# the resulting object is Thorough
#
# let (m, n) = size(A)
# O(mn) (randomized, amortized)
function from_dense(A)
    m, n = size(A, 1), size(A, 2)
    nnz_rows = []
    rows = Dict{Int, Sparsik}()

    for i in 1 : m

        row_vals = Dict{Int, Any}()
        row_nnz = []

        for j in 1 : n
            if !iszero(A[i, j])
                push!(row_nnz, j)
                row_vals[j] = A[i, j]
            end
        end

        if !isempty(row_nnz)
            push!(nnz_rows, i)
            rows[i] = Sparsik(n, row_nnz, row_vals)
        end

    end

    return reconstruct!(from_rows(m, n, nnz_rows, rows))
end

#------------------------------------------------------------------------------

# Gleb: it looks like you do not use reduce function for Sparsik's here,
#       I suggest to do so, hope this will simplify the code
#
# Alex: actually we used `reduce` implicitly when calling `new_row = row1 + c * row2`
#       I could not come up with any feasible code modification on this (
#
#
# returns A + c * B
# the resulting object is Not Thorough
#
# note that `length(A)` and `number of nonzeroes in A` are synonyms
# let k = length(A), r = length(B)
# O(k + r) (randomized, amortized)
function Base.reduce(A::BidimSparsikLazy, B::BidimSparsikLazy, c)
    m, n = size(A)
    nnz_rows = []
    rows = Dict{Int, Sparsik}()

    i, j = 1, 1
    A_nnz_rows, B_nnz_rows = get_nnz_rows(A), get_nnz_rows(B)

    while i <= length(A_nnz_rows) || j <= length(B_nnz_rows)

        if i > length(A_nnz_rows)
            push!(nnz_rows, B_nnz_rows[j])
            rows[B_nnz_rows[j]] = get_row(B, B_nnz_rows[j])
            j += 1
        elseif j > length(B_nnz_rows)
            push!(nnz_rows, A_nnz_rows[i])
            rows[A_nnz_rows[i]] = get_row(A, A_nnz_rows[i])
            i += 1
        else

            new_row = reduce(get_row(A, A_nnz_rows[i]),
                            get_row(B, B_nnz_rows[j]),
                            c)

            new_idx = A_nnz_rows[i]

            if A_nnz_rows[i] > B_nnz_rows[j]
                new_idx = B_nnz_rows[j]
                new_row = get_row(B, B_nnz_rows[j])
                j += 1
            elseif A_nnz_rows[i] < B_nnz_rows[j]
                new_idx = A_nnz_rows[i]
                new_row = get_row(A, A_nnz_rows[i])
                i += 1
            else
                i += 1
                j += 1
            end

            if (!iszero(new_row))
                push!(nnz_rows, new_idx)
                rows[new_idx] = new_row
            end

        end
    end

    return from_rows(
        m, n,
        nnz_rows,
        rows
    )
end

#------------------------------------------------------------------------------

# Gleb: two thoughts:
#   - I think you can avoid one of the sortings depending on the order of iteration
#     (first i, then j or vice versa)
#   - Maybe you can construct first "a half" of the product
#     (row or col) and then compute the transpose (should be linear in size)
# Combining them, it may be possible to get rid of the log part
#
# Alex: something is done
#
#
# returns A × B
# the resulting object is Not Thorough
#
# let k = length(A), r = length(B)
# O(kr) if `B` Is Thorough
# O(kr + n) where `n = size(B, 2)` otherwise
function Base.prod(A::BidimSparsikLazy, B::BidimSparsikLazy)

    if !is_thorough(B)
        reconstruct!(B)
    end

    nnz_rows = []
    rows = Dict{Int, Sparsik}()

    for i in get_nnz_rows(A)

        row_vals = Dict{Int, Any}()
        row_indices = []

        for j in get_nnz_cols(B)

            product = inner_2(get_row(A, i), get_col(B, j))

            if !iszero(product)

                push!(row_indices, j)
                row_vals[i] = product

            end
        end

        if !isempty(row_indices)
            push!(nnz_rows, i)
            rows[i] = Sparsik(size(A, 2), row_indices, row_vals)
        end

    end

    return from_rows(
        size(A, 1), size(B, 2),
        nnz_rows, rows
    )
end

#------------------------------------------------------------------------------

# returns A(v) = Av
#
# if k = length(A) and r = length(v)
# roughly
# O(kr)
function apply_vector(A::BidimSparsikLazy, v::Sparsik)
    nonzero = []
    data = Dict{Int, Any}()

    for row_idx in get_nnz_rows(A)
        product = inner(get_row(A, row_idx), v)

        if !iszero(product)
            push!(nonzero, row_idx)
            data[row_idx] = product
        end
    end

    return Sparsik(size(A, 1), nonzero, data)
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
        scale!(get_row(A, i), c)
    end

    return A
end

# returns A * c, does not modify `A`
# the resulting object is Not Thorough
#
# let k = length(A)
# O(k) (randomized, amortized)
function scale(A::BidimSparsikLazy, c)
    return scale!(deepcopy(A::BidimSparsikLazy), c)
end

#------------------------------------------------------------------------------

# returns A[i, j] or zero if not present
# O(1) (randomized, amortized)
function Base.get(A::BidimSparsikLazy, i::Int, j::Int)
    if !haskey(A.rows, i)
        # why 0
        return 0
    end
    return get_row(A, i)[j]
end

#------------------------------------------------------------------------------

# erases all entries of `A`
# the resulting object is Thorough
# ( since empty matrix object is )
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
zero_matrix(m, n) = from_rows(m, n, [], Dict())

# returns zero matrix of the dimensions of `A`
Base.zero(A::BidimSparsikLazy) = from_rows(size(A)..., [], Dict())

#------------------------------------------------------------------------------

Base.iszero(A::BidimSparsikLazy) = length(get_nnz_rows(A)) == 0

#------------------------------------------------------------------------------

# we can check only rows
==(A::BidimSparsikLazy, B::BidimSparsikLazy) = (size(A) == size(B) &&
            A.rows == B.rows;
            A.nnz_rows == B.nnz_rows)
!=(A::BidimSparsikLazy, u::BidimSparsikLazy) = !(A == B)

+(A::BidimSparsikLazy, B::BidimSparsikLazy) = reduce(A, B, 1)
-(A::BidimSparsikLazy, B::BidimSparsikLazy) = reduce(A, B, -1)
-(A::BidimSparsikLazy) = scale(A, -1)

*(A::BidimSparsikLazy, c) = scale(A, c)
*(c, A::BidimSparsikLazy) = scale(A, c)
*(A::BidimSparsikLazy, B::BidimSparsikLazy) = prod(A, B)

#------------------------------------------------------------------------------

function Base.show(A::BidimSparsikLazy)
    return "$(join(map(i -> "|$(join(map(j -> get(A, i, j), 1 : A.n), "\t"))|", 1 : A.m), "\n"))"
end

function print_matrix(A::BidimSparsikLazy)
    println(show(A))
end

#------------------------------------------------------------------------------
