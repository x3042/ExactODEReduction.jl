include("basis.jl")
include("structs/subspacik.jl")

#------------------------------------------------------------------------------

import Nemo: base_ring, terms, monomial, derivative, gens, kernel, MatrixSpace,
            isirreducible

import AbstractAlgebra: minpoly, factor, charpoly

#------------------------------------------------------------------------------

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
    A = modular_reduction(A, ZZ)

    # Gleb: how do you type all these cool characters? I want also...
    #'\' + "Sigma" + Tab = Σ
    # Σπαξιβo!

    # wiedemannchik.jl
    char_poly = minimal_polynomial(A, subspace_minpoly=__deterministic_simple_minpoly)

    radical_basis = []

    # hm??
    if (!iszero(coeff(char_poly, 0)))
        return radical_basis
    end

    while iszero(coeff(char_poly, 0))
        char_poly = shift_right_x(char_poly)
    end

    Image = evaluate(char_poly, A)

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
    return radical_basis
end
#------------------------------------------------------------------------------

# returns an invariant subspace of the given Algebra, randomized
function invariant_subspace_randomized(Algebra::Subspacik)
    es = basis(Algebra)
    n = size(first(es), 1)
    ground = base_ring(Algebra)

    if n == dim(Algebra)
        return []
    end

    MSpace = MatrixSpace(ground, n, n)
    S, x = ground["x"]
    i, iters = 0, 10
    M = random_element(Algebra)
    while i < iters
        chpoly = charpoly(S, MSpace(to_dense(M)))

        if isirreducible(chpoly)
            break
        end

        factors = factor(chpoly)
        # factors is of type Fac and Fac.fac is of form
        #   factor → degree
        #
        # we can mb use other factors to output more subspaces
        f = first(keys(factors.fac))

        V = last(kernel(MSpace(to_dense(evaluate(f, M)))))

        if check_invariance!(Algebra, deepcopy(V))
            return V
        end

        M = random_element(Algebra)

        i += 1
    end

    v = unit_vector(n, 1, ground)
    V = [ M*v for _ in 1:n ]
    return V

    error("invariant subspaces exist but are not defined over Q, not implemented, sorry")
end

#------------------------------------------------------------------------------

function general_kernel(radical::AbstractArray)
    stacked = vcat(radical...)
    Space = MatrixSpace(QQ, size(stacked)...)
    return Array(last(kernel(Space(stacked))))
end

#------------------------------------------------------------------------------
