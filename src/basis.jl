
#------------------------------------------------------------------------------

function find_basis_1(vectors)
    alg = linear_span!(deepcopy(vectors))
    apply_matrices_inplace!(alg, deepcopy(vectors))
    return alg
end

#------------------------------------------------------------------------------

function find_basis_1_β(vectors)
    # eat all input vectors
    alg = linear_span!(deepcopy(vectors))

    # apply them with the threshold of ω
    fat_vectors = apply_matrices_inplace!(alg, deepcopy(vectors), ω=0.05)

    # eat discarded vectors
    for vect in fat_vectors
        eat_sparsik!(alg, vect)
    end

    # apply again, but not no vectors would be discarded
    apply_matrices_inplace!(alg, deepcopy(vectors), ω=1.0)

    return alg
end

#------------------------------------------------------------------------------

# input:
#       vectors - an array-like of AbstractSparsiks over Q
# output:
#       V - a Subspace consisting of basis vectors
# O(∞)
"""
    find_basis(vectors; used_algorithm, initialprime)

Finds a basis of the algebra generated with the given `vectors`
using the provived default method `used_algorithm` while reducing input coefficients
modulo `initialprime`. By default, `find_basis_1_β` stands for the algorithm and
`2147483647` for the initial reduction modulo.

Each element in `vector` to be a subtype of `AbstractSparseObject`
"""
function find_basis(vectors; used_algorithm=find_basis_1_β, initialprime=2^31-1)
    # used_algorithm is assumed not to throw normally
    # and to handle errors by thyself
    @info "generating a basis for Algebra using $used_algorithm"

    V = Subspace(Nemo.QQ)
    primes = BigInt[initialprime]

    i = 0

    while true
        prime = last(primes)
        field = Nemo.GF(fmpz(prime))
        # TODO: !!!
        set_modular_globals!(field)

        @info "new reduction modulo, $prime"

        xs = [ modular_reduction(x, field)
               for x in vectors ]

        V = used_algorithm(xs)

        V = rational_reconstruction(V)

        if check_inclusion!(deepcopy(V), deepcopy(vectors))
            if check_invariance!(deepcopy(vectors), deepcopy(V))
                break
            end
            @warn "invariance check failed.."
        else
            @warn "inclusion check failed.."
        end

        # how to choose the next better?
        push!(primes, Primes.nextprime(prime ^ 2 + 1))

        i += 1
        i % 10 == 0 && error("something is wrong")
    end

    @info "generated a basis for Algebra of dimension $(dim(V))"

    return V
end
