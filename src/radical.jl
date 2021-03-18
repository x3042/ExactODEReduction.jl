
#=
    The file contains radicals related code
    We use the algorithm provided by basis.jl
=#

#------------------------------------------------------------------------------

include("basis.jl")

#------------------------------------------------------------------------------

import Nemo: base_ring, terms, monomial, derivative, gens, kernel, MatrixSpace

#------------------------------------------------------------------------------

HIT = 0
Algebra = 1

function find_radical_1(vectors)
    global Algebra
    Algebra = find_basis(deepcopy(vectors))

    As = basis(Algebra)
    F = base_ring(first(As))
    n = dim(Algebra)

    # println("algebra = \n", algebra)

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

    @info "$n×$n-dim algebra matrix of densitu $(density(A))"
    # println(AAAAAAA)

    # wiedemannchik.jl
    char_poly = minimal_polynomial(A, subspace_minpoly=__deterministic_min_poly)
    @info "minimal poly of degree $(degree(char_poly))"
    ok = iszero(evaluate(char_poly, A))
    println("m(AAAAAAA) = $(ok)")
    global HIT
    HIT += ok

    println("f = ", char_poly)

    while iszero(coeff(char_poly, 0))
        char_poly = shift_right_x(char_poly)
    end

    println("shifted f = ", char_poly)

    Image = evaluate(char_poly, A)

    Image = rational_reconstruction(Image)

    println(Image)
    radical_basis = []
    for i in [1, 3, 6, 7, 10]
        vectors = []
        for j in 1 : size(Image, 1)
            if !iszero(Image[i, j])
                push!(vectors, scale(As[j], Image[i, j]))
            end
        end
        summator(x, y) = reduce(x, y, 1)
        push!(radical_basis, to_dense(reduce(summator, vectors)))
    end

    stacked = vcat(radical_basis...)
    println(stacked)
    println(size(stacked))
    Space = MatrixSpace(QQ, size(stacked)...)
    mutual_kernel = kernel(Space(stacked))

    println("kernel =",)
    println(mutual_kernel)


end


# find_radical_1([A1, A2, A3])
#------------------------------------------------------------------------------


function uwu()
    for (i, (mfn, mdim, msz, mdata)) in enumerate(load_COO_if(from_dim=8, to_dim=15))

        @info "$i-th model : $mfn of dim : $mdim"

        if i in [2, 29, 30]
            continue
        end

        As = map(matr -> from_COO(matr..., QQ), mdata)

        @time Rad = find_radical_1(As)


        println("-------------------------")

        #break
    end
end

function OWO()
    As = [
        from_dense([
            1 0 0;
            0 2 0;
            0 0 3;
        ], QQ)
    ]

    find_radical_1(As)
end

# uwu()
# OWO()


#------------------------------------------------------------------------------

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
