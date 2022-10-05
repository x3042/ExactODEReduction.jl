# Finds the radical of the given matrix Algebra by
# computing the radical of the Algebra *directly*

"""
    find_radical_sup(Algebra)

Finds a basis of the radical of given matrix Algebra.
"""
function find_radical_sup(Algebra::Subspace)
    As = basis(Algebra)
    F = base_ring(Algebra)
    n = dim(Algebra)

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

    @info "computed the radical of dimension $(length(rad))"

    return rad
end

#------------------------------------------------------------------------------

# returns an invariant subspace of the given Algebra
# in case the latter is semisimple
function invariant_subspace_semisimple(Algebra::Subspace; overQ=true)
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

        # reconstruct!(M)

        chpoly = charpoly(PSpace, MSpace(collect(M)))

        factors = collect(AbstractAlgebra.factor(chpoly))
        @debug "Factors of the charpoly $(factors)"

        if length(factors) == 1
            if first(factors)[2] == 1 # multiplicity of the only factor
                @warn "No invariant subspaces defined over Q"
		        if overQ
		            return []
		        end
                @info "Computing eigenspaces of the center"
                Z = center(Algebra)
                count_center = 1
                while true
                    Zelem = sum([rand(0:count_center) * z for z in Z])
                    chpoly = charpoly(PSpace, Zelem)
                    factors = AbstractAlgebra.factor(chpoly)
                    if (length(factors) > 1) || (Nemo.degree(first(factors)[1]) < length(Z))
                        count_center *= 2
                        @warn "Nongeneric element of the center sampled"
                        continue
                    end
                    eigensp = eigenspaces(Zelem)
                    @debug "Eigenspaces of $Zelem done $eigensp"
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
            @warn "Charpoly is a power of irreducible $M"
            continue
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
        @warn "There was a spurious factorization, resampling a matrix"
    end
end

#------------------------------------------------------------------------------

function center(algebra::Subspace)
    es = basis(algebra)
    n = size(first(es), 1)
    S = MatrixSpace(Nemo.QQ, n^2 * length(es), length(es))
    A = zero(S)
    for (i, v) in enumerate(es)
        for (j, u) in enumerate(es)
            comm = es[i] * es[j] - es[j] * es[i]
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
        for j in 1:length(es)
            Z += sols[2][j, i] * SS(collect(es[j]))
        end
        push!(result, Z)
    end
    return result
end

#------------------------------------------------------------------------------

# finds the general kernel of the given matrices
function general_kernel(matrices::AbstractArray)
    stacked = vcat(matrices...)
    Space = MatrixSpace(Nemo.QQ, size(stacked)...)
    return Array(last(kernel(Space(stacked))))
end

#------------------------------------------------------------------------------
