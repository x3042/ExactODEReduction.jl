# Finds the radical of the given matrix Algebra by
# computing the center of the Algebra using
# the characteristic polynomial of the Gramian matrix
function find_radical(Algebra::Subspacik)
    As = basis(Algebra)
    F = base_ring(Algebra)
    n = dim(Algebra)

    traces = Dict{Tuple{Int, Int}, elem_type(F)}(
        (i, j) => tr(As[i] * As[j])
        for i in 1 : n
            for j in i : n
    )

    nnz_coords = [
        (i, j, traces[min(i, j), max(i, j)])
        for i in 1 : n
            for j in 1 : n
                if ! iszero(traces[min(i, j), max(i, j)])
    ]

    if isempty(nnz_coords)
        return As
    end

    ZZ = Nemo.GF(2^31 - 1)
    A = from_COO(n, n, nnz_coords, F)

    A = modular_reduction(A, ZZ)

    # wiedemannchik.jl
    PolySpace, _ = ZZ["x"]
    MSpace = MatrixSpace(ZZ, n, n)
    char_poly = minimal_polynomial_wiedemann(
        A,
        subspace_minpoly=__randomized_wiedemann_minpoly
    )
    # char_poly = charpoly(PolySpace, MSpace(to_dense(A)))

    radical_basis = []

    # hm??
    # Gleb: why "hm??"
    if (!iszero(coeff(char_poly, 0)))
        return radical_basis
    end

    while iszero(coeff(char_poly, 0))
        char_poly = shift_right_x(char_poly)
    end

    Image = evaluate_2(char_poly, A)

    Image = rational_reconstruction(Image)
    # Gleb: technically, there should be some way to check and rerun with larger prime
    # however, if this is not the winner-radical-algorithm, not needed really

    transpose!(Image)

    basis_cols = linear_span!(collect(values(Image.rows)))

    summator(x, y) = reduce(x, y, 1)
    for (piv, vect) in basis_cols.echelon_form
        vectors = []
        for j in 1 : size(Image, 2)
            if !iszero(vect[j])
                push!(vectors, scale(As[j], vect[j]))
            end
        end
        push!(radical_basis, reduce(summator, vectors))
    end

    @info "computed the radical of dimension $(length(radical_basis))"

    return radical_basis
end


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



# Finds the radical of the given matrix Algebra by
# computing the center of the Algebra *directly*
# with the means of Nemo.jl functions
function find_radical_2(Algebra::Subspacik)
    As = basis(Algebra)
    F = base_ring(Algebra)
    n = dim(Algebra)

    # Gleb: to a function (see above)
    traces = Dict{Tuple{Int, Int}, elem_type(F)}(
        (i, j) => tr(As[i] * As[j])
        for i in 1 : n
            for j in i : n
    )

    nnz_coords = [
        (i, j, traces[min(i, j), max(i, j)])
        for i in 1 : n
            for j in 1 : n
                if ! iszero(traces[min(i, j), max(i, j)])
    ]

    if isempty(nnz_coords)
        return As
    end

    ZZ = Nemo.GF(2^31 - 1)
    A = zeros(ZZ, n, n)
    for (i, j, x) in nnz_coords
        A[i, j] = modular_reduction(x, ZZ)
    end

    MSpace = MatrixSpace(ZZ, n, n)
    sz, vectors = kernel(MSpace(A))

    sz == 0 && return As

    basis_cols = linear_span!([
                rational_reconstruction(
                    from_dense([vectors[:, i]...], ZZ)
                )
                for i in 1:sz
    ])

    radical_basis = []

    summator(x, y) = reduce(x, y, 1)
    for (piv, vect) in basis_cols.echelon_form
        vectors = []
        for j in 1:length(As)
            if !iszero(vect[j])
                push!(vectors, scale(As[j], vect[j]))
            end
        end
        push!(radical_basis, reduce(summator, vectors))
    end

    @info "computed the radical of dimension $(length(radical_basis))"

    return radical_basis
end


#------------------------------------------------------------------------------

# returns an invariant subspace of the given Algebra
# in case the latter is semisimple
function invariant_subspace_semisimple(Algebra::Subspacik)
    es = basis(Algebra)
    @debug Algebra
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
                @warn "No invariant subspaces defined over Q"
                return []
            end
            @warn "Getting a random element $M with a charpoly being a power of irreducible. May be the case impossible for Jacobian algebras"
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
            return V
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