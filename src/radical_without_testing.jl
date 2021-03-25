include("basis.jl")
include("structs/subspacik.jl")

#------------------------------------------------------------------------------

import Nemo: base_ring, terms, monomial, derivative, gens, kernel, MatrixSpace

#------------------------------------------------------------------------------

function find_radical_1(Algebra::Subspacik)
    As = basis(Algebra)
    # Gleb: wouldn't just the `field` attribut of the Subspacik work for this?
    #Liza: fixed
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

    ZZ = GF(2^31 - 1)
    A = from_COO(n, n, nnz_coords, F)
    A = modular_reduction(A, ZZ)

    # Gleb: how do you type all these cool characters? I want also...
    #'\' + "Sigma" + Tab = Σ
    @info "$n×$n-dim algebra matrix of density $(density(A))"

    # wiedemannchik.jl
    char_poly = minimal_polynomial(A, subspace_minpoly=__deterministic_simple_minpoly)
    @info "minimal poly of degree $(degree(char_poly))"

    radical_basis = []

    if (!iszero(coeff(char_poly, 0)))
        return radical_basis
    end

    while iszero(coeff(char_poly, 0)) #?
        char_poly = shift_right_x(char_poly)
    end

    println("shifted f = ", char_poly)

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
        push!(radical_basis, to_dense(reduce(summator, vectors)))
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
