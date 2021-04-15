include("basis.jl")
include("structs/subspacik.jl")

#------------------------------------------------------------------------------

import Nemo: base_ring, terms, monomial, derivative, gens, kernel, MatrixSpace

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
    A = modular_reduction(A, ZZ)

    # Gleb: how do you type all these cool characters? I want also...
    #'\' + "Sigma" + Tab = Σ
    # Σπαξιβo!
    @info "$n×$n-dim algebra matrix of density $(density(A))"

    # wiedemannchik.jl
    char_poly = minimal_polynomial(A, subspace_minpoly=__deterministic_simple_minpoly)
    @info "minimal poly of degree $(degree(char_poly))"


    radical_basis = []

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

    for (piv, vect) in basis_cols.echelon_form
        vectors = []
        for j in 1 : size(Image, 2)
            if !iszero(vect[j])
                push!(vectors, scale(As[j], vect[j]))
            end
        end
        summator(x, y) = reduce(x, y, 1)
        push!(radical_basis, reduce(summator, vectors))
    end

    return radical_basis

end

#------------------------------------------------------------------------------

function general_kernel(rad_basis)
    stacked = vcat(rad_basis...)
    println(size(stacked))
    Space = MatrixSpace(QQ, size(stacked)...)
    return Array(kernel(Space(stacked))[2])
end

#=
function construct_jacobians(system)
    nnz = [
        (i, var_index(v), derivative(f, v))
        for (i, f) in enumerate(system)
            for v in vars(f)
    ]
    m, n = length(system), length(degrees(first(system)))
    ring = parent(first(system))
    return from_COO(m, n, nnz, ring)
end
=#

function construct_jacobians(system)
    domain = base_ring(first(system))
    poly_ring = parent(first(system))

    jacobians = Dict()

    for (p_idx, poly) in enumerate(system)
        for (v_idx, var) in enumerate(vars(poly))
            # term is of form α*monomial
            for term in terms(derivative(poly, var))
                monom = monomial(term, 1)
                cf = coeff(term, 1)

                # how can we do it in a normal way..
                !haskey(jacobians, monom) && (jacobians[monom] = Dict())
                if !haskey(jacobians[monom], (p_idx, v_idx))
                    jacobians[monom][(p_idx, v_idx)] = zero(domain)
                end
                jacobians[monom][(p_idx, v_idx)] += cf
            end
        end
    end

    m, n = length(system), length(gens(poly_ring))
    factors = [
        from_COO(m, n, jac, domain)
        for jac in values(jacobians)
    ]

    @info "constructed a set of $(length(factors)) matrices $m×$n from the system Jacobian"

    return factors
end

#------------------------------------------------------------------------------

#=
S, (x, y) = QQ["x", "y"]
f1 = x*y + 1
f2 = 2x
s = [f1, f2]

Js = construct_jacobians(s)
=#

#  2-th model : BIOMD0000000050.json of dim : 14 !
#  29-th model : MODEL1112150000.json of
