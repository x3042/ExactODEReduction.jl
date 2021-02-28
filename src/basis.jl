
#=
    The file contains bases searching related code
=#

#------------------------------------------------------------------------------

include("parsik.jl")
include("gizmos.jl")
include("wiedemannchik.jl")
include("../src/structs/dok_sparsik.jl")
include("../src/structs/sparsik.jl")
include("../src/structs/subspacik.jl")

#------------------------------------------------------------------------------

import Primes: nextprime
import Nemo: fmpz

#------------------------------------------------------------------------------

function find_basis_1_γβ(vectors)
    domain = ground(first(vectors))
    sz = size(first(vectors))

    # what if..
    hash_vector = random_sparsik(sz, domain, density=1.0)
    alg = linear_span!(deepcopy(vectors), hash_vector)

    fat_vectors = apply_matrices_inplace!(alg, deepcopy(vectors), ω=0.05)

    for vect in fat_vectors
        eat_sparsik!(alg, vect)
    end

    apply_matrices_inplace!(alg, deepcopy(vectors), ω=1.0)

    return alg
end

#------------------------------------------------------------------------------

function find_basis_1(vectors)
    alg = linear_span!(deepcopy(vectors))
    apply_matrices_inplace!(alg, deepcopy(vectors))
    return alg
end

function find_basis_1_beta(vectors)
    # eat all input vectors
    alg = linear_span!(deepcopy(vectors))

    # apply them with the threshold of ω
    fat_vectors = apply_matrices_inplace!(alg, deepcopy(vectors), ω=0.05)

    # eat discarded veced vectors
    for vect in fat_vectors
        eat_sparsik!(alg, vect)
    end

    # apply again, but not no vectors would be discarded
    apply_matrices_inplace!(alg, deepcopy(vectors), ω=1.0)

    return alg
end

#
#          3 players
#    990                1420
#     >_<                ^=^
#
#
#
#            UωU
#              590
#
#
#                 54
#------------------------------------------------------------------------------

#
function find_basis_2(vectors)

    first_vector = first(vectors)
    first_pivot = first_nonzero(first_vector)
    n = dim(first_vector)

    # the size of the current square
    k = 1
    field = ground(first_vector)

    # indices of column pivots
    current_pivots = Int[ first_pivot ]

    # long rows, not restricted to current_pivots
    current_vectors = [ deepcopy(first_vector) ]

    # select hashing vector
    # we should adjust the hash_vector density
    # Gleb: I think we should just make it dense, otherwise we can loose some vectors
    hash_vector = random_sparsik(size(first_vector), field, density=1)
    hash_col = [ inner(hash_vector, first_vector) ]


    # this is the rows of the `square` k×k of our big matrix
    # actually, current_rows = current_vectors|current_pivots
    # if `|` is the restriction to some coordinates
    first_row = Sparsik(1, field, Int[1], Dict(1 => first_vector[first_pivot]))
    current_square = from_rows(
        1, 1, field, Int[1],
        Dict(1 => first_row)
    )
    current_rows = Dict(
        1 => deepcopy(first_row)
    )

    first_row_extended = restrict(first_vector, first_pivot, first(hash_col))
    current_rows_extended = Dict(
        1 => first_row_extended
    )

    # ort vector of size 2×1 ( orthogonal for extended rows with hashes )
    ort_vector = find_orthogonal!(current_rows_extended)

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
                    product_restricted_extended = restrict(product, current_pivots, product_hash)

                    # (ii) checking for linear dependency
                    if ! iszero(inner(product_restricted_extended, ort_vector))

                        # now we want `y`, such that rows of A|k with coeffs `y`
                        # give us the product|k  ,  so we transpose A|k
                        # ( because otherwise y will be the coeffs of the columns, not of the rows )
                        # (iii) finding dependencies

                        transpose!(current_square)
                        # Gleb: we can do randomized as it is is guaranteed to give a correct result
                        # Alex: seems untrue..., but randomized one is indeed much faster
                        y = square_nonsingular_randomized_wiedemann(current_square, product_restricted)
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
                            # Gleb: I think we should skip the columns that are already pivots, this can be a big speedup
                            # Another option for the future would be to do sort-of binary search by multiplying by some
                            # new hash vectors
                            # Alex: Agreed.
                            #       I tried searching for new pivot by descending the binary tree
                            #       induced by multiple hash-vectors
                            #       It works fine in test and that Algorithm is
                            #       guaranteed to be better asymptotically,
                            #       but I do not want to paste it here just yet
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
                        current_rows_extended[k] = product_restricted_extended
                        current_rows[k] = product_restricted

                        push!(current_pivots, new_pivot)
                        push!(hash_col, product_hash)

                        # append -> find_orthogonal -> pop
                        # it must be simplified
                        # Gleb: how about making the value of the hash to be
                        # the first coordinate of the restricted vector?
                        # Then there will be non need in this push-pop every time
                        # Done
                        for i in 1 : k
                            append!(current_rows_extended[i],
                                    current_vectors[i][new_pivot])

                            append!(current_rows[i],
                                    current_vectors[i][new_pivot])
                        end
                        ort_vector = find_orthogonal!(current_rows_extended)

                        current_square = from_rows(k, k, field, Array(1 : k), current_rows)

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

    # NEW LINE
    #

    V = Subspacik(QQ)
    primes = BigInt[ 2^31 - 1 ]
    i = 0

    while true
        prime = last(primes)
        # GF can not be constructed from BigInt,
        # yet BigInt -> fmpz -> GF works fine
        field = GF(fmpz(prime))

        @info "new modulo = $prime"

        # reduction
        xs = [ modular_reduction(x, field)
               for x in vectors ]
        # brrrr...
        @time V = used_algorithm(xs)

        # THIS SHOULD BE HIDDEN INTO SUBSPACIK
        # reconstruction
        xs = [ rational_reconstruction(x)
               for x in values(V.echelon_form) ]

        # postcheck
        # ---
        # how can one say "причесать векторы" ?)
        # Gleb: why would you want to do this anyway?
        # Alex: ((

        # newline
        break

        V = linear_span!(xs)

        if true && check_inclusion!(V, vectors)
            if true && check_invariance!(V, vectors)
                break
            end
            @info "invariance check failed.."
        else
            @info "inclusion check failed.."
        end

        # how to choose the next better?
        push!(primes, nextprime(prime ^ 2 + 1))

        i += 1
        i % 5 == 0 && error("something is wrong")
    end

    return V
end

#------------------------------------------------------------------------------

timeit(start) = (time_ns() - start) * 1e-9

times_γβ = []
times_β = []

function owo()
    for (i, (mfn, mdim, msz, mdata)) in enumerate(load_COO_if(from_dim=80, to_dim=150))

        @info "$i-th model : $mfn of dim : $mdim"
        i == 1 && continue

        As = map(matr -> from_COO(matr..., QQ), mdata)


        start = time_ns()
        @time V = find_basis(deepcopy(As), used_algorithm=find_basis_1_γβ)
        push!(times_γβ, timeit(start))


        start = time_ns()
        @time V = find_basis(deepcopy(As), used_algorithm=find_basis_1_beta)
        push!(times_β, timeit(start))

    end
end

owo()


#=
plot(1:length(norm), norm, label="norm")
plot!(1:length(norm), alpha, label="alpha")
plot!(1:length(norm), beta, label="beta")
=#


# Strange SuitSparse
#   ### Big Rationals??
#       bfwa62/bfwa62.mtx, bfwb62/bfwb62.mtx, west0067/west0067.mtx
#   ### What??
#       Journals/Journals.mtx
#
# !! BIOMD0000000259.json
# !! MODEL1604100000.json


# big numbers:
#   Hamrle1/Hamrle1.mtx
