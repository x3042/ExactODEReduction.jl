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
    @info "reduction"
    @time A = modular_reduction(A, ZZ)

    # Gleb: how do you type all these cool characters? I want also...
    #'\' + "Sigma" + Tab = Σ
    # Σπαξιβo!

    # wiedemannchik.jl
    PolySpace, _ = ZZ["x"]
    MSpace = MatrixSpace(ZZ, n, n)
    @info "char poly"
    @time char_poly = minimal_polynomial(A)
    # char_poly = charpoly(PolySpace, MSpace(to_dense(A)))

    radical_basis = []

    # hm??
    if (!iszero(coeff(char_poly, 0)))
        return radical_basis
    end

    while iszero(coeff(char_poly, 0))
        char_poly = shift_right_x(char_poly)
    end

    @info "evaluate"
    @time Image = evaluate(char_poly, A)

    @info "reconstruct"
    @time Image = rational_reconstruction(Image)

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

    @info "computed the radical of the Algebra of dimension $(length(radical_basis))"

    return radical_basis
end
#------------------------------------------------------------------------------

# returns an invariant subspace of the given Algebra
# in case the latter is semisimple
function invariant_subspace_semisimple(Algebra::Subspacik)
    es = basis(Algebra)
    n = size(first(es), 1)
    ground = base_ring(Algebra)

    if n == dim(Algebra)
        return []
    end

    MSpace = MatrixSpace(ground, n, n)
    PSpace, x = ground["x"]
    i, iters = 0, 10
    M = random_element(Algebra, count = 5)
    while i < iters
        chpoly = charpoly(PSpace, MSpace(to_dense(M)))

        if isirreducible(chpoly)
            break
        end

        factors = factor(chpoly)
        # factors is of type Fac, and Fac.fac is of form
        #   factor → degree  ,  (x-a)(x-b)..
        #
        # mb we can use other factors to output more subspaces
        f = first(keys(factors.fac))

        # computing the kernel of f(M), guaranteed to be proper
        V = last(kernel(MSpace(to_dense(evaluate(f, M)))))

        isempty(V) && continue; # and how did it end up being empty..
        println("V = \n", V)

        Vsparse = [from_dense(v, QQ) for v in [[V[:, j]...] for j in 1:size(V, 2)]]
        if check_invariance!(deepcopy(Vsparse), Algebra)
            println("!!!")
            println(V)
            return V
        end

        M = random_element(Algebra, count = 5)
        i += 1
    end

    v = unit_sparsik(n, 1, ground)
    V = [ apply_vector(M, v) for _ in 1:n ]

    # check V != Algebra && V != 0
    return V

    # unreachable
    error("invariant subspaces exist but are not defined over Q, not implemented, sorry")
end

#------------------------------------------------------------------------------

function general_kernel(radical::AbstractArray)
    stacked = vcat(radical...)
    Space = MatrixSpace(QQ, size(stacked)...)
    return Array(last(kernel(Space(stacked))))
end

#------------------------------------------------------------------------------
