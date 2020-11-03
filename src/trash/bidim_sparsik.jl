

#=
    The File contains the BidimSparsik<Real> - the straightforward
        implementation of a Sparse Matrix
    and related funcs

    Overloaded functions:
        get, zero, length, transpose!, prod, empty!, reduce
=#


#=
    Questions to be asked

        - BidimSparsik contains fields `rows/cols` each of which
            is essentially a combination of nested `Dicts`
          So, if Objects are constructed recursively,
            then creating a BidimSparsik object will cost us an instant
            allocation of 2×(2⁴)² buckets for several discontinuous hashtables
          It seems to be quite a number..

          Gleb: 2 * (2^4)^2 = 2^9 = 512 - I would not worry about this too much, but
          let us keep this in mind. Two things:
          1. I am not sure that you will get this number of buckets because you do not
             create 2 * 2^4 Sparsik's immediately. Am I missing something?
          2. Doing
          @btime a = BidimSparsik(10, 10, Vector{Int}(), Vector{Int}(), Dict{Int, Sparsik}(), Dict{Int, Sparsik}())
          on my laptop gives 240 nanoseconds of execution time. I think we can live with this.

          (2⁴ is a default number of buckets in Dict hashtable)

          Alex: On an instantiation of Dict{Any, Dict} object there is an Array of 16 values
                of type `Dict` to be allocated internally. Since it is filled
                with `undef` values on creation, I guess no recursive Dict creation occurs


=#



# TODO:
#           - rewrite in terms of array-subscription


#------------------------------------------------------------------------------

if !isdefined(Main, :(==))
    import Base: ==, !=, +, -, *, get
end

if !isdefined(Main, :Sparsik)
    include("sparsik.jl")
end

#------------------------------------------------------------------------------

# declared mutable for being able to store T ~ `transposed` info
mutable struct BidimSparsik

    # This implementation has `rows` field to store pairs (row_idx, row)
    # for every row of matrix which contains at least 1 nonzero value
    #
    # Field `cols` stores pairs (col_idx, col) and intrinsically duplicates
    # the `rows`

    # dimensions
    m::Int
    n::Int

    # is_transposed
    T::Bool

    # nonzero rows/columns indices
    # Guaranteed to be sorted
    nnz_rows::Vector{Int}
    nnz_cols::Vector{Int}

    # `Dict` of items: Index{Int} => Row{Sparsik}
    # where Row contains at least 1 nonzero value
    rows::Dict{Int, Sparsik}

    # `Dict` of items: Index{Int} => Column{Sparsik}
    # where Column contains at least 1 nonzero value
    cols::Dict{Int, Sparsik}

    # default ctor
    function BidimSparsik(m, n, nnz_rows, nnz_cols, rows, cols)
        return new(m, n, false, nnz_rows, nnz_cols, rows, cols)
    end

end

#------------------------------------------------------------------------------

# transposes matrix modifying the `A` object itself
function transpose!(A::BidimSparsik)
    A.T = !A.T
    return A
end

# transposes the object representation never touching the `A` object
# O(k) where k = length(A)
# note that it is not an overloaded function
function transposed(A::BidimSparsik)
    return transpose!(deepcopy(A))
end

# checks whether the `A` object is `transposed`
# O(1)
# Gleb: this function looks a bit strange to me as there is no such a matrix
#       property "to be transposed", it is more like a detail of your implementation
function is_transposed(A::BidimSparsik)
    return A.T
end

#------------------------------------------------------------------------------

# returns the tuple of `A` dimensions
# (actually, the product of returned elements equals
#    the dimension of the ambient space of `A`)
# O(1)
# Gleb: why do you return n => m, not, say, a tuple?
# Alex: fixed
function Base.size(A::BidimSparsik)
    if is_transposed(A)
        return (A.n, A.m)
    end
    return (A.m, A.n)
end

# returns the ith dimension of `A`
function Base.size(A::BidimSparsik, i::Int)
    return size(A)[i]
end

# returns number of nonzero entries of `A`
# O(k) where k is the number of nonzeroes in `A`
function Base.length(A::BidimSparsik)
    return sum(map(row -> length(row), values(A.rows)))
end

#------------------------------------------------------------------------------

# returns the ith column of `A` or `zero(Sparsik)` if not present
# O(1) (randomized, amortized)
function get_col(A::BidimSparsik, i::Int)
    if is_transposed(A)
        return get(A.rows, i, zero_sparsik(size(A, 2)))
    end
    return get(A.cols, i, zero_sparsik(size(A, 1)))
end

# returns the ith row of `A` or `zero(Sparsik)` if not present
# O(1) (randomized, amortized)
function get_row(A::BidimSparsik, i::Int)
    if is_transposed(A)
        return get(A.cols, i, zero_sparsik(size(A, 1)))
    end
    return get(A.rows, i, zero_sparsik(size(A, 2)))
end

#------------------------------------------------------------------------------

# returns the list of nonzero columns of `A`
# essentially `get_nnz_cols(A) == sort(keys(A.cols))`
# O(1)
function get_nnz_cols(A::BidimSparsik)
    if is_transposed(A)
        return A.nnz_rows
    end
    return A.nnz_cols
end

# returns the list of nonzero rows of `A`
# essentially `get_nnz_rows(A) == sort(keys(A.rows))`
# O(1)
function get_nnz_rows(A::BidimSparsik)
    if is_transposed(A)
        return A.nnz_cols
    end
    return A.nnz_rows
end

#------------------------------------------------------------------------------

# constructs `BidimSparsik` object from
#   `m`           - number of rows
#   `n`           - number of cols
#   `nnz_rows`    - indices of the future matrix rows every of which contains
#       at least one nonzero value
#       Must be sorted
#   `nnz_cols`    - −//−
#   `nnz_coords`  - `Dict` of items ((i, j) => x) where i and j mark
#       the position of the nonzero element in the matrix and x - its value
#
# let k = length(nnz_coords)
# O(k) (randomized, amortized)
function from_COO(m::Int, n::Int, nnz_rows, nnz_cols, nnz_coords)

    new_rows = Dict(map(i -> i => (Vector() => Dict()), nnz_rows))
    new_cols = Dict(map(i -> i => (Vector() => Dict()), nnz_cols))

    for ((i, j), x) in nnz_coords

        push!(new_rows[i][1], j)
        new_rows[i][2][j] = x

        push!(new_cols[j][1], i)
        new_cols[j][2][i] = x

    end

    return BidimSparsik(
        m, n,
        nnz_rows, nnz_cols,
        Dict(map(i -> i[1] => Sparsik(n, i[2]...), collect(new_rows))),
        Dict(map(i -> i[1] => Sparsik(m, i[2]...), collect(new_cols)))
    )
end

#------------------------------------------------------------------------------

# constructs `BidimSparsik` object from
#   `A`           - a collection-like object of 2 dimensions
#
# let n = length(A)
# O(n) (randomized, amortized)
function from_dense(A)
    nnz_rows, nnz_cols = [], []

    # ok
    nonzero_coords = Dict{Pair{Int, Int}, Any}()

    for idx in findall(!iszero, A)
        nonzero_coords[idx[1] => idx[2]] = A[idx]
    end

    nnz_rows = filter(i -> any(!iszero, map(j -> A[i, j], 1 : size(A, 2))),
                        1 : size(A, 1))
    nnz_cols = filter(i -> any(!iszero, map(j -> A[j, i], 1 : size(A, 1))),
                        1 : size(A, 2))

    return from_COO(
        size(A, 1), size(A, 2),
        nnz_rows, nnz_cols,
        nonzero_coords
    )
end

#------------------------------------------------------------------------------

# returns the trace of `A`
# let n be the first dimension of A
#   and k - the number of nonzeroes in A
# O(min(n, k)) (randomized, amortized)
function trace(A::BidimSparsik)
    ans = 0
    for i in get_nnz_rows(A)
        ans += get(A, i, i)
    end
    return ans
end

#------------------------------------------------------------------------------

# returns A + c * B
# note that `length(A)` and `number of nonzeroes in A` are synonyms
# let k = length(A), r = length(B)
# O(k + r) (randomized, amortized)
#
# Gleb: it looks like you do not use reduce function for Sparsik's here,
#       I suggest to do so, hope this will simplify the code
function Base.reduce(A::BidimSparsik, B::BidimSparsik, c)
    m, n = size(A)
    new_nnz_rows, new_nnz_cols = [], []
    new_rows = Dict{Int, Sparsik}()
    new_cols = Dict{Int, Sparsik}()

    for (new_nnz_indices, new_nnz_data) in [new_nnz_rows => new_rows,
                                            new_nnz_cols => new_cols]
        i, j = 1, 1
        A_nnz_rows, B_nnz_rows = get_nnz_rows(A), get_nnz_rows(B)

        while i <= length(A_nnz_rows) || j <= length(B_nnz_rows)

            if i > length(A_nnz_rows)
                push!(new_nnz_indices, B_nnz_rows[j])
                new_nnz_data[B_nnz_rows[j]] = get_row(B, B_nnz_rows[j])
                j += 1
            elseif j > length(B_nnz_rows)
                push!(new_nnz_indices, A_nnz_rows[i])
                new_nnz_data[A_nnz_rows[i]] = get_row(A, A_nnz_rows[i])
                i += 1
            else

                new_row = reduce(get_row(A, A_nnz_rows[i]), get_row(B, B_nnz_rows[j]), c)
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
                    push!(new_nnz_indices, new_idx)
                    new_nnz_data[new_idx] = new_row
                end

            end
        end

        transpose!(A)
        transpose!(B)

    end

    return BidimSparsik(
        m, n,
        new_nnz_rows, new_nnz_cols,
        new_rows, new_cols
    )
end

#------------------------------------------------------------------------------

# returns A × B
# let k = length(A), r = length(B)
# O(kr + klogk + rlogr) (randomized, amortized)
#
# Gleb: two thoughts:
#   - I think you can avoid one of the sortings depending on the order of iteration
#     (first i, then j or vice versa)
#   - Maybe you can construct first "a half" of the product
#     (row or col) and then compute the transpose (should be linear in size)
# Combining them, it may be possible to get rid of the log part
#
function Base.prod(A::BidimSparsik, B::BidimSparsik)
    new_nnz_rows = []
    new_nnz_cols = []
    new_coords = Dict{Pair{Int, Int}, Any}()

    for i in get_nnz_rows(A)
        for j in get_nnz_cols(B)

            product = inner_2(get_row(A, i), get_col(B, j))

            if !iszero(product)

                push!(new_nnz_rows, i)
                push!(new_nnz_cols, j)

                new_coords[i => j] = product

            end
        end
    end

    # seems like `unique!` is linear for sorted collections
    unique!(sort!(new_nnz_rows))
    unique!(sort!(new_nnz_cols))

    return from_COO(
        size(A, 1), size(B, 2),
        new_nnz_rows, new_nnz_cols,
        new_coords
    )
end

#------------------------------------------------------------------------------

# returns A × v
# where v is considered to be a column vector
# let k = length(A), r = length(v)
# O(kr) (randomized, amortized)
# to be covered in tests
function apply_vector(A::BidimSparsik, v::Sparsik)
    new_nonzero = []
    new_data = Dict()

    for i in get_nnz_rows(A)
        product = inner_2(get_row(A, i), v)

        if !iszero(product)
            push!(new_nonzero, i)
            new_data[i] = product
        end

    end

    return Sparsik(size(A, 1), new_nonzero, new_data)
end

#------------------------------------------------------------------------------

# returns A * c modifying the `A` object itself
# let k = length(A)
# O(k) (randomized, amortized)
function scale!(A::BidimSparsik, c)
    if iszero(c)
        return empty!(A)
    end

    for k in 1 : 2
        for i in get_nnz_rows(A)
            scale!(get_row(A, i), c)
        end
        transpose!(A)
    end

    return A
end

# returns A * c, does not modify `A`
# let k = length(A)
# O(k) (randomized, amortized)
function scale(A::BidimSparsik, c)
    return scale!(deepcopy(A::BidimSparsik), c)
end

#------------------------------------------------------------------------------

# returns A[i, j] or zero if not present
# O(1) (randomized, amortized)
function Base.get(A::BidimSparsik, i::Int, j::Int)
    # TODO: rewrite
    return get_row(A, i)[j]
end

#------------------------------------------------------------------------------

# erases all entries of `A`
# let k = length(A)
# O(k)
function Base.empty!(A::BidimSparsik)
    empty!(A.nnz_rows)
    empty!(A.rows)
    empty!(A.nnz_cols)
    empty!(A.cols)
    A.T = false
    return A
end

#------------------------------------------------------------------------------

# returns zero matrix of the dimensions of `A`
Base.zero(A::BidimSparsik) = from_COO(size(A)..., [], [], Dict())

#------------------------------------------------------------------------------

# this should be checked in other way
==(A::BidimSparsik, B::BidimSparsik) = (size(A) == size(B) &&
            A.rows == B.rows;
            A.cols == B.cols;
            A.nnz_cols == B.nnz_cols;
            A.nnz_rows == B.nnz_rows)
!=(A::BidimSparsik, u::BidimSparsik) = !(A == B)

+(A::BidimSparsik, B::BidimSparsik) = reduce(A, B, 1)
-(A::BidimSparsik, B::BidimSparsik) = reduce(A, B, -1)
-(A::BidimSparsik) = scale(A, -1)

*(A::BidimSparsik, c) = scale(A, c)
*(c, A::BidimSparsik) = scale(A, c)
*(A::BidimSparsik, B::BidimSparsik) = prod(A, B)

#------------------------------------------------------------------------------

function print_matrix(A::BidimSparsik)
    println("$(join(map(i -> "|$(join(map(j -> get(A, i, j), 1 : A.n), "\t"))|", 1 : A.m), "\n"))")
end

#------------------------------------------------------------------------------
