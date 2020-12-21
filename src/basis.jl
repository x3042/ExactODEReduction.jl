
#=

=#

#------------------------------------------------------------------------------

include("parsik.jl")
include("gizmos.jl")
include("wiedemannchik.jl")
include("../src/structs/bidim_sparsik_lazy.jl")
include("../src/structs/sparsik.jl")
include("../src/structs/subspacik.jl")

#------------------------------------------------------------------------------

import Primes: nextprime
import Nemo: fmpz

# TODO:
#           Tests
#           Measure time

#------------------------------------------------------------------------------

function find_basis_1(vectors)
    alg = linear_span!(deepcopy(vectors))
    apply_matrices_inplace!(alg, deepcopy(vectors))
    return alg
end

#------------------------------------------------------------------------------

#
function find_basis_2(vectors)

    first_vector = first(vectors)
    first_pivot = first_nonzero(first_vector)
    n = dim(first_vector)

    # the size of the current square
    k = 1
    field = first_vector.field

    # indices of column pivots
    current_pivots = Int[ first_pivot ]

    # long rows, not restricted to current_pivots
    current_vectors = [ deepcopy(first_vector) ]

    # this is the rows of the `square` k×k of our big matrix
    # actually, current_rows = current_vectors|current_pivots
    # if `|` is the restriction to some coordinates
    current_rows = [
        Sparsik(1, field, Int[1],
            Dict(1 => first_vector[first_pivot])
        )
    ]

    # the same as the `current_rows`, but as a matrix
    current_square = from_rows(
        1, 1, field, Int[1],
        Dict(1 => current_rows[1])
    )

    # select hashing vector
    # we should adjust the hash_vector density
    hash_vector = random_sparsik(size(first_vector), field)
    hash_col = [ inner(hash_vector, first_vector) ]

    # the feature with append/pop actually appends the hash to the vector
    #  ( so it would look like (v₁, v₂, ..., vₙ, hash(v))ᵀ )
    # treated as an array, computes the orthogonal vector,
    # and then pops the appended hash
    append!(first(current_rows), first(hash_col))
    # ort vector of size 2×1 ( orthogonal for extended rows with hashes )
    ort_vector = find_orthogonal!(current_rows)
    pop!(first(current_rows))

    new_vectors = deepcopy(vectors)
    i = 0

    while ! isempty(new_vectors)
        # multiplyiing vectors as long as new ones appear
        # if no new_vectors were produced, we stop

        buffer = deepcopy(new_vectors)
        empty!(new_vectors)

        for new_vect in buffer
            for vect in vectors
                product = apply_vector(new_vect, vect)

                i += 1
                i % 10 == 0 && print(".")

                if !iszero(product)
                    product_hash = inner(hash_vector, product)

                    # product is a square matrix,
                    # product_restricted is a Sparsik vector ( plain , one dimension )
                    # and only columns from `current_pivots` are present in product_restricted
                    product_restricted = restrict(product, current_pivots)

                    append!(
                        product_restricted,
                        product_hash
                    )

                    # (ii) checking for linear dependency
                    if !iszero(inner(product_restricted, ort_vector))
                        # the inverse of append!
                        pop!(product_restricted)

                        # now we want `y`, such that rows of A|k with coeffs `y`
                        # give us the product|k  ,  so we transpose A|k
                        # ( because otherwise y will be the coeffs of the columns, not of the rows )
                        # (iii) finding dependencies
                        transpose!(current_square)
                        y = square_nonsingular_deterministic_wiedemann(current_square, product_restricted)
                        # should be O(1)
                        transpose!(current_square)

                        # new pivot is the column in `product` that is not zero
                        # if we add all `current_rows` with coeffs `y` to `product`
                        # (iv) selecting new pivot
                        # this one can be very slow
                        new_pivot = 0
                        accum = zero(field)
                        col = 0
                        while iszero(accum)
                            col += 1
                            accum = sum(y[j] * current_vectors[j][col]
                                          for j in 1:k) - product[col]
                        end
                        new_pivot = col

                        # Here we are just updating everything: adding new vector,
                        # new pivot, new orthogonal vector and etc.
                        # ...
                        # (v) updating rows
                        k += 1

                        push!(current_vectors, product)
                        push!(current_rows, product_restricted)

                        push!(current_pivots, new_pivot)
                        push!(hash_col, product_hash)

                        # append -> find_orthogonal -> pop
                        # it must be simplified
                        for (i, row) in enumerate(current_rows)
                            append!(row, current_vectors[i][new_pivot])
                        end
                        idx_to_row = Dict(
                            i => append!(current_rows[i], hash_col[i])
                            for i in 1 : k
                        )
                        ort_vector = find_orthogonal!(idx_to_row)
                        for row in current_rows
                            pop!(row)
                        end

                        current_square = from_rows(
                            k, k, field,
                            Array(1 : k),
                            idx_to_row
                        )

                        push!(new_vectors, product)

                    end
                end
            end
        end

    end

    return linear_span!(current_vectors)
end

#------------------------------------------------------------------------------

# input:
#       vectors - an array-like of AbstractSparsiks over Q
# output:
#       V - a Subspacik consisting of basis vectors
# O(∞)
function find_basis(vectors; used_algorithm=find_basis_1)
    # used_algorithm is assumed not to throw normally
    # and to handle errors by thyself
    V = Subspacik(QQ)
    primes = BigInt[ 2^31 - 1 ]

    while true
        prime = last(primes)
        # GF can not be constructed from BigInt,
        # yet BigInt -> fmpz -> GF works fine
        field = GF(fmpz(prime))

        @info "new modulo = $prime"

        # reduction
        xs = [ modular_reduction(x, field) for x in vectors ]
        # brrrr...
        V = used_algorithm(xs)
        # reconstruction
        xs = [ rational_reconstruction(x)
               for x in values(V.echelon_form) ]

        # postcheck
        # ---
        # how can one say "причесать векторы" ?)
        V = linear_span!(xs)
        #
        if check_inclusion(V, vectors)
            if check_invariance(V, vectors)
                break
            end
            @info "invariance check failed.."
        end
        @info "inclusion check failed.."

        # how to choose the next better?
        push!(primes, nextprime(prime ^ 2))
    end

    return V
end

#------------------------------------------------------------------------------

# I've broke find_basis_2 a bit, but it worked fine

function owo()
    for (i, (mfn, mdim, msz, mdata)) in enumerate(load_COO_if(from_dim=4, to_dim=8))

        println("$(i)th model: $mfn, dim = $mdim, size = $msz")
        As = map(matr -> from_COO(matr..., QQ), mdata)

        @time V = find_basis(As, used_algorithm=find_basis_1)

        println("~~~~~~~~~~~~~~~")
        println()

    end
end

owo()
