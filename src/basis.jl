
#------------------------------------------------------------------------------

# transformes V to the smallest subspace invariant under
# the given matrices and containing the original one
function apply_matrices_inplace!(V::Subspace, matrices; ω=1.)
    dense_vectors = []
    new_pivots = collect(keys(V.echelon_form))
    i = 0

    while !isempty(new_pivots)
        pivots_to_process = sort(deepcopy(new_pivots))
        empty!(new_pivots)

        for pivot in pivots_to_process
            for (vectidx, vect) in enumerate(matrices)
                # Alex: sparse-dense product
                # 
                #   S × D
                #
                # S is a matrix in CSR format (maybe, absolute column values ?)
                # 
                # D is a matrix in Dense format, but nonzero columns indices are stored
                #
                # for each nnz row rr in S
                #   for each nnz col cc in D
                #       add <rr, cc> to its position in the product 
                #
                # if D is Dense then
                #   <rr, cc> is computed in 
                #   O(nnz(rr)) flops 
                #   O(nnz(rr)) loads
                # if D is Sparse then
                #   <rr, cc> is computed in 
                #   O(min(nnz(rr), nnz(cc))) flops, 
                #   O(nnz(rr) + nnnz(cc)) loads
                #   try first one !
                #
                # matrix --> vector    easily ?
                # solution: CSR with absolute column indides
                # example :
                #   [5, 0, 6]
                #   [0, 0, 7]
                #   [8, 9, 0]
                #
                #   vals = [5, 6, 7, 8, 9]
                #   cols = [1, 3, 3, 1, 2]  (relative)
                #   rows = [1, 3, 4, 4, 6]
                #   cols = [1, 3, 6, 7, 8]  (absolute)
                # 
                # (absolute cols .% n  .+ absolute cols .== n) == relative cols
                # Compute relative cols on the fly, store only absolute ones!
                #
                # Conversion matrix --> vector :
                #   Take vals and absolute cols from the matrix.
                #
                product = V.echelon_form[pivot] * vect

                i += 1
                i % 500 == 0 && print(".")
            
                # Alex: 90% or more of products are zero,
                # need to detect zero products during matmul:
                #  S × D
                # 
                # <Si, Dj^T> = 0 ?
                # For each row in S and each column in D 
                # additionaly store a UInt8 (or larger type) 
                # for the sparsity pattern (spattern) :
                # Example: 
                #  row1 = { vals={1, 2, 3}, cols={1, 3, 7} }
                #  spattern1 = 10100010 (as UInt8)
                #
                #  row2 = { vals={4, 5},    cols={2, 4} }
                #  spattern2 = 01010010 (as UInt8)
                #
                # (!) spattern1 & spattern2 == 0
                #      =>
                #  <row1, row2^T> == 0   (hopefully the most frequent case)
                #
                # (!) spattern1 & spattern2 == power of two
                #      =>
                #  <row1, row2^T> != 0
                #
                #  spattern1 & spattern2 == anything else
                #  no info  
                #
                # 
                # thoughts on implementation:
                # UInt64 for an spattern object;
                # n - number of columns (say, 200);
                # split n into blocks of div(n+64, 64) 
                # (say, div(200+64, 64) = 5)
                # then div(200, 5) = 40 bits of UInt64 will be used.
                if !iszero(product)
                    # Alex: Low-Rank Sparse Gaussian Elimination
                    # 
                    # do not reduce the product immediately;
                    # instead, collect k products. 
                    # then, take a random (dense) linear combination of them,
                    # and reduce the combination;
                    # repeate k times, or until first
                    # linearly dependent combination is produced 
                    # (whichever comes first);
                    # obtained are several (0 to k) new pivots;
                    new_pivot = eat_sparsik!(V, product, ω=ω)

                    if isdeferred(new_pivot)
                        push!(dense_vectors, product)
                    elseif !isreduced(new_pivot)
                        push!(new_pivots, new_pivot)
                    end
                end

            end
        end

    end

    dense_vectors
end

#------------------------------------------------------------------------------

function find_basis_1(vectors)
    alg = linear_span!(deepcopy(vectors))
    apply_matrices_inplace!(alg, deepcopy(vectors))
    alg
end

#------------------------------------------------------------------------------

function find_basis_1_β(vectors)
    # eat all input vectors
    alg = linear_span!(deepcopy(vectors))

    # apply them with the threshold of ω
    dense_vectors = apply_matrices_inplace!(alg, deepcopy(vectors), ω=0.05)

    # eat discarded vectors
    for vect in dense_vectors
        eat_sparsik!(alg, vect)
    end

    # apply again, but not no vectors would be discarded
    apply_matrices_inplace!(alg, deepcopy(vectors), ω=1.0)
    
    alg
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
