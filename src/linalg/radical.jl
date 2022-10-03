# Finds the radical of the given matrix Algebra by
# computing the radical of the Algebra *directly*

"""
    find_radical_sup(Algebra)

Finds a basis of the radical of given matrix Algebra.
"""
function find_radical_sup(Algebra::Subspacik)
    As = basis(Algebra)
    F = base_ring(Algebra)
    n = dim(Algebra)

    if n == 0
        return []
    end

    A = gram_matrix(As)
    if isempty(A.nnz_rows)
        return As
    end

    pivs = zeros(Int64, n)
    V = Subspacik(F)
    for (piv, vec) in A.rows
        eat_sparsik!(V, vec)
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
           y = Sparsik(n, F, Int[], Dict{Int, elem_type(F)}())
           reduce!(y, i, one(F))
            for j in orig_pivs
                reduce!(y, j, -V.echelon_form[j][i])
            end
            push!(radical_basis, y)
        end
    end

    rad = []
    summator(x, y) = reduce(x, y, 1)
    for vect in radical_basis
        vectors = []
        for j in 1:length(As)
            if !iszero(vect[j])
                push!(vectors, scale(As[j], vect[j]))
            end
        end
        push!(rad, reduce(summator, vectors))
    end

    @info "computed the radical of dimension $(length(rad))"

    return rad
end

#------------------------------------------------------------------------------

# returns an invariant subspace of the given Algebra
# in case the latter is semisimple
function invariant_subspace_semisimple(Algebra::Subspacik; overQ=true)
    es = basis(Algebra)
    
    n = size(first(es), 1)
    F = base_ring(Algebra)

    # we want to do dense LA here
    MSpace = MatrixSpace(F, n, n)
    PSpace, x = F["x"]

    # randomization parameter
    count = 5

    while true
        M = random_element(Algebra, count=count)
        count = 2 * count

        reconstruct!(M)

        chpoly = charpoly(PSpace, MSpace(to_dense(M)))

        factors = collect(AbstractAlgebra.factor(chpoly))

        if length(factors) == 1
            if first(factors)[2] == 1 # multiplicity of the only factor
                @warn "No invariant subspaces defined over Q, taking eigenvectors"
		if overQ
		    return []
		end
                eigensp = eigenspaces(MSpace(to_dense(M)))
                @debug "Eigenspaces done"
                to_return = [[]]
                for j in 1:(n - 1)
                    prev = to_return[end]
                    push!(
                        to_return, 
                        vcat(
                            prev, 
                            [from_dense([v[i] for i in 1:n], Nemo.QQBar) for v in eigensp[j]]
                        )
                    )
                end
                return to_return[2:end]
            end
            @warn "Charpoly is a power of irreducible $M"
            continue
        end

        f = first(factors)[1]
        # computing the kernel of f(M)
        factored = evaluate(f, M)
        V = last(kernel(MSpace(to_dense(factored))))
        
        @debug "Eval in invariant_subspace_semisimple" factored

        # convert to sparse repr
        V = [
            from_dense(v, Nemo.QQ)
            for v in [[V[:, j]...]
                for j in 1:size(V, 2)]
        ]
        
        @debug "V in invariant_subspace_semisimple" V

        # if is proper and invaiant
        if 0 < length(V) < n && check_invariance!(es, deepcopy(V))
            return [V]
        end
    end
end

#------------------------------------------------------------------------------

# finds the general kernel of the given matrices
function general_kernel(matrices::AbstractArray)
    stacked = vcat(matrices...)
    Space = MatrixSpace(Nemo.QQ, size(stacked)...)
    return Array(last(kernel(Space(stacked))))
end

#------------------------------------------------------------------------------
