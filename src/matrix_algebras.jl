"""
    full_matrix_algebra(n)

For an integer `n`, returns the full n-by-n matrix algebra over QQ as a Subspace object
"""
function full_matrix_algebra(n)
    return Subspace(Nemo.QQ, Dict((j - 1) * n + i => begin
        a = spzeros(Nemo.fmpq, n, n)
        a[i, j] = 1
        a
    end for i in 1:n for j in 1:n))
end

#------------------------------------------------------------------------------

"""
    find_radical(algebra)

Finds a basis of the radical of given matrix `algebra`.
"""
function find_radical(algebra::Subspace)
    As = basis(algebra)
    F = base_ring(algebra)
    n = dim(algebra)

    if n == 0
        return []
    end

    A = gram_matrix(As)
    if iszero(A)
        return As
    end

    pivs = zeros(Int64, n)
    V = Subspace(F)
    
    for r in eachrow(A)
        eat_sparsik!(V, sparse(r))
    end

    orig_pivs = collect(keys(V.echelon_form))

    if length(orig_pivs) == n
        return []
    end

    radical_basis = []

    for i in orig_pivs
        pivs[i] = 1
    end

    for i in 1:n
        if pivs[i] == 0
            y = unit_sparse_vector(n, i, F)
            # y = Sparsik(n, F, Int[], Dict{Int, elem_type(F)}())
            # reduce!(y, i, one(F))
            for j in orig_pivs
                # reduce!(y, j, -V.echelon_form[j][i])
                y[j] = y[j] - V.echelon_form[j][i]
            end
            push!(radical_basis, y)
        end
    end

    rad = []
    # summator(x, y) = reduce(x, y, 1)
    for vect in radical_basis
        vectors = []
        for j in 1:length(As)
            if !iszero(vect[j])
                push!(vectors, scale(As[j], vect[j]))
            end
        end
        push!(rad, reduce(+, vectors))
    end

    @debug "computed the radical of dimension $(length(rad))"

    return rad
end

#------------------------------------------------------------------------------

"""
    invariant_subspace_semisimple(algebra)

For a given semisimple matrix `algebra` returns a chain of invariant subspaces such that
no new invariant subspace can be inserted between the element of the chain. If there is no
invariant subspaces, an empty list will be returned.
If `overQ` parameter is set to be `true`, computes subspaces over Q only. It is guaranteed
to find them unless there are identical blocks in the representation. In the latter case,
a warning will be displayed.
"""
function invariant_subspace_semisimple(algebra::Subspace; overQ=true)
    es = basis(algebra)
    
    n = size(first(es), 1)
    F = base_ring(algebra)

    # we want to do dense LA here
    MSpace = MatrixSpace(F, n, n)
    PSpace, x = F["x"]

    # randomization parameter
    count = BigInt(5)

    while true
        M = random_element(algebra, count=count)
        count = 2 * count

        # reconstruct!(M)

        chpoly = charpoly(PSpace, MSpace(collect(M)))

        factors = collect(AbstractAlgebra.factor(chpoly))
        @debug "Factors of the charpoly $(factors)"

        if length(factors) == 1
            Z = center(algebra)
            C = nothing # to be the centralizer
            num_blocks = n ÷ Nemo.degree(first(factors)[1])
            if first(factors)[2] == 1 # multiplicity of the only factor
                C = Z
                @warn "No invariant subspaces defined over Q"
		        if overQ
		            return []
		        end
            else
                C = centralizer(algebra)
                if length(C) < length(Z) * num_blocks^2
                    continue
                end
                if overQ
                    @warn """There are subspaces defined over Q but they come only from equal blocks.
                    If you wish to compute them, run the code over Qbar"""
                    return []
                end
            end

            @info "Computing eigenspaces a random element in the centralizer"
            count_center = BigInt(1)
            while true
                Celem = sum([rand(0:count_center) * z for z in C])
                chpoly = charpoly(PSpace, Celem)
                factors = AbstractAlgebra.factor(chpoly)
                @debug "Factors: $factors"
                @debug "Dimension of the center is $(length(Z)) and the number of blocks is $num_blocks"
                if (length(factors) > 1) || (Nemo.degree(first(factors)[1]) < length(Z) * num_blocks)
                    count_center *= 2
                    @warn "Nongeneric element of the center sampled"
                    continue
                end
                eigensp = eigenspaces(Celem)
                @debug "Eigenspaces of $Celem done $eigensp"
                to_return = [[]]
                for j in 1:(length(eigensp) - 1)
                    prev = to_return[end]
                    push!(
                        to_return, 
                        vcat(
                            prev, 
                            [sparse([v[i] for i in 1:n]) for v in eigensp[j]]
                        )
                    )
                end
                @debug "To return $to_return"
                return to_return[2:end]
            end
        end

        f = first(factors)[1]
        # computing the kernel of f(M)
        factored = evaluate(f, M)
        V = last(kernel(MSpace(collect(factored))))
        
        @debug "Eval in invariant_subspace_semisimple" factored

        # convert to sparse repr
        V = [
            sparse(v)
            for v in [[V[:, j]...]
                for j in 1:size(V, 2)]
        ]
        
        @debug "V in invariant_subspace_semisimple" V

        # if is proper and invaiant
        if 0 < length(V) < n && check_invariance!(es, deepcopy(V))
            return [V]
        end
        @debug "There was a spurious factorization, resampling a matrix"
    end
end

#------------------------------------------------------------------------------

"""
    centralizer(algebra, ambient)

For a matrix subspace `algebra` and a matrix subspace `ambient` of the same order,
the function returns a basis of the subspace of `ambient` commuting with all the elements of the `algebra`
"""
function centralizer(algebra::Subspace, ambient::Subspace)
    es = basis(algebra)
    fs = basis(ambient)
    n = size(first(es), 1)
    S = MatrixSpace(Nemo.QQ, n^2 * length(es), length(fs))
    A = zero(S)
    for (i, v) in enumerate(fs)
        for (j, u) in enumerate(es)
            comm = v * u - u * v
            for k in 1:n
                for l in 1:n
                    A[(j - 1) * n^2 + (k - 1) * n + l, i] = comm[k, l]
                end
            end
        end
    end
    sols = kernel(A)
    result = []
    SS = MatrixSpace(Nemo.QQ, n, n)
    for i in 1:sols[1]
        Z = zero(SS)
        for j in 1:length(fs)
            Z += sols[2][j, i] * SS(collect(fs[j]))
        end
        push!(result, Z)
    end
    return result
end

"""
    centralizer(algebra)

For a matrix subspace `algebra`, returns a basis of the space of all the matrices
commuting with `algebra`
"""
function centralizer(algebra::Subspace)
    n = size(first(basis(algebra)), 1)
    return centralizer(algebra, full_matrix_algebra(n))
end

"""
    center(algebra)

For a matrix subspace `algebra`, returns a basis of all the matrices in this subspace
commuting with all other matrices in `algebra`
"""
function center(algebra::Subspace)
    return centralizer(algebra, algebra)
end
