include("basis.jl")
include("structs/subspacik.jl")

#------------------------------------------------------------------------------

import Nemo: base_ring, terms, monomial, derivative, gens, kernel, MatrixSpace,
            isirreducible

import AbstractAlgebra: minpoly, factor, charpoly

#------------------------------------------------------------------------------

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

    ZZ = GF(2^31 - 1)
    A = from_COO(n, n, nnz_coords, F)

    # todo: do we really need it?
    # yes
    A = modular_reduction(A, ZZ)

    # Σπαξιβo!

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
    if (!iszero(coeff(char_poly, 0)))
        return radical_basis
    end

    while iszero(coeff(char_poly, 0))
        char_poly = shift_right_x(char_poly)
    end

    Image = evaluate_2(char_poly, A)

    Image = rational_reconstruction(Image)

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
# computing the center of the Algebra *directly*
function find_radical_sad(Algebra::Subspacik)
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

    ZZ = GF(2^31 - 1)
    A = from_COO(n, n, nnz_coords, F)

    #@info "reduction"
    #@time A = modular_reduction(A, ZZ)

    # wiedemannchik.jl
    pivs = zeros(Int64, n)
    V = Subspacik(F)
    for (piv, vec) in A.rows
        eat_sparsik!(V, vec)
    end

    orig_pivs = collect(keys(V.echelon_form))

    if length(orig_pivs) == n
        return []
    end

    b = Sparsik(n, F, Int[], Dict{Int, elem_type(F)}())

    for i in orig_pivs
        pivs[i] = 1
    end

    for i in range(1, length=n)
        if pivs[i] == 0
            reduce!(b, i, rand(F))
        end
    end

    radical_basis = Subspacik(F)
    i = 0
    while true
        W = V
        rows = W.echelon_form
        rows = Dict{ Int64, Sparsik{typeof(F)} }(rows)
        nnz_rows = [i for i in 1:n]

        for i in range(1, length=n)
            if pivs[i] == 0
                rows[i] = Sparsik(n, F, [i], Dict(i => rand(F)))
            end
        end

        i += 1
        print("\n", i, "\n")
        G = from_rows(n, n, F, nnz_rows, rows)

        @info "wiedemann"
        @time y = wiedemann_solve(G, b)

        if eat_sparsik!(radical_basis, y) == reduced
            break
        end

    end

    rad = []

    summator(x, y) = reduce(x, y, 1)
    for (piv, vect) in radical_basis.echelon_form
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

    ZZ = GF(2^31 - 1)
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
    n = size(first(es), 1)
    F = base_ring(Algebra)

    if n == dim(Algebra)
        return []
    end

    # we want to do dense LA here
    MSpace = MatrixSpace(F, n, n)
    PSpace, x = F["x"]

    i, iters = 0, 100
    while i < iters
        M = random_element(Algebra, count = dim(Algebra))
        reconstruct!(M)

        chpoly = charpoly(PSpace, MSpace(to_dense(M)))

        factors = factor(chpoly).fac
        # factors is of type Fac
        # Fac.fac of form
        #   factor → degree  ,  (x-a)(x-b)..

        # mb we can use other factors to output more subspaces
        f = first(keys(factors))
        # f = irreducible^k
        f = f^factors[f]

        # computing the kernel of f(M)
        factored = evaluate(f, M)
        V = last(kernel(MSpace(to_dense(factored))))

        # convert to sparse repr
        V = [
            from_dense(v, QQ)
            for v in [[V[:, j]...]
                for j in 1:size(V, 2)]
        ]

        # if is proper and invaiant
        if 0 < length(V) < n && check_invariance!(es, deepcopy(V))
            return V
        end

        i += 1
    end

    @warn "invariant subspaces exist but are not defined over Q, not implemented, sorry"
    # should we return hmm..
    return []
end

#------------------------------------------------------------------------------

# finds the general kernel of the given matrices
function general_kernel(matrices::AbstractArray)
    stacked = vcat(matrices...)
    Space = MatrixSpace(QQ, size(stacked)...)
    return Array(last(kernel(Space(stacked))))
end

#------------------------------------------------------------------------------
