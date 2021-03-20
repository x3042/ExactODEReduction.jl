include("basis.jl")
include("subspacik.jl")

#------------------------------------------------------------------------------

import Nemo: base_ring, terms, monomial, derivative, gens, kernel, MatrixSpace

#------------------------------------------------------------------------------

HIT = 0
Algebra = 1

function find_radical_1(Algebra::Subspacik)
    As = basis(Algebra)
    F = base_ring(first(As))
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

    @info "$n×$n-dim algebra matrix of density $(density(A))"

    # wiedemannchik.jl
    char_poly = minimal_polynomial(A, subspace_minpoly=__deterministic_simple_minpoly)
    @info "minimal poly of degree $(degree(char_poly))"
    ok = iszero(evaluate(char_poly, A))
    println("m(AAAAAAA) = $(ok)")
    global HIT
    HIT += ok

    println("f = ", char_poly)

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

    println(Image)

    transpose!(Image)
    
    basis_cols = find_basis(Image.rows)
    transpose!(Image)
    for (piv, vect) in V.echelon_form
        vectors = []
        for j in 1 : size(Image, 1)
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


