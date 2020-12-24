

include("../src/structs/bidim_sparsik_lazy.jl")

#------------------------------------------------------------------------------

import Nemo: QQ, GF, PolynomialRing, PolyElem, gfp_elem,
             degree, trail, coeff, gen, divexact, lead


#------------------------------------------------------------------------------

# A thought:
#   evaluation of f at x₀ for x₀::Sparsik can probably be done faster
#   if we somehow define the "MatrixRing" consisting of Sparsiks
#   in terms of Nemo;
#   then f will represent a Polynomial over the "MatrixRing" and we can use
#   the default, assumably much faster, evaluation f(x₀)

# returns f(x₀)
# O(d) multiplications/additions of x₀ if d = degree(f)

# We understand we should avoid using unicode, but
# x₀ just looks too cute ^=^ // Gleb: ok)
#
# Gleb: my impression is that a correct implementation of W. algorithm
# should avoid multiplying a matrix by a matrix. Therefore, I think the
# function we would like to have is rather // and how on earth you type these indices?
#     evaluate(f, x_0, b)
# so that it computes f(x_0) * b by computing only matrix-vector products
# using the same Horner scheme
function evaluate(f::PolyElem, x₀)
    accum = lead(f) * one(x₀)
    d = degree(f)

    for i in 1 : d
        accum = accum * x₀ + coeff(f, d - i) * one(x₀)
    end

    return accum
end

#------------------------------------------------------------------------------

# returns the thing named f⁻
# Gleb: How about shift_right_x ?
function name_me_please(f::PolyElem)
    x = gen(parent(f))
    divexact(f - coeff(f, 0), x)
end

#------------------------------------------------------------------------------

# Solves Ay = b
# Throws if A is singular
function square_nonsingular_randomized_wiedemann(A::AbstractSparsik, b::AbstractSparsik)
    # the function implements Algorithm 1 given on page 55
    # in https://doi.org/10.1109/TIT.1986.1057137
    # the notation and step numbering are taken from there

    field = A.field
    S, x = PolynomialRing(field, "x")
    n = order(A)

    # 1
    b₀ = b
    y = zero(b)
    k = 0
    d = 0

    # Gleb: (see also lines 26-28 above)
    # W. algorithm should not compute matrix-matrix
    # products, only matrix-vector products
    # Therefore, I think this part can be eliminated
    B = one(A)
    A_pows = []
    for i in 1 : 2 * n
        push!(A_pows, B)
        B = B * A
    end

    # 2
    while !iszero(b)
        # beda s randomom

        # 3
        # Gleb: my understanding is that the randomization in the algorithm
        # affects only the runtime but the result will be always correct.
        # Therefore, we can afford different choice strategies for u.
        # One is outline in Section VI of the paper and suggests to generate a
        # random dense vector, then the average number of the iteration will be small.
        # We can start with this and then experiment what happens if we have u sparser
        u = random_sparsik(n, field)

        # 4
        seq = elem_type(field)[]
        for i in 1 : 2 * (n - d)
            # Gleb: here we should just multiply the result of the previous iteration by A
            push!(seq, inner(u, apply_vector(A_pows[i], b)))
        end

        # 5
        f = minimal_polynomial(S(seq), x^(2 * (n - d)))
        f = f * inv(coeff(f, 0))

        # 6
        f⁻ = name_me_please(f)

        y = y + apply_vector(evaluate(f⁻, A), b)
        b = b₀ + apply_vector(A, y)
        d += degree(f)
        k += 1

        if d == n
            break
        end
    end

    return -y
end

#------------------------------------------------------------------------------

# applies the polynomial `g` to the sequence `seq`
# by the definition from the 'Modern Computer Algebra'
#
# O(n^2) if n is the length of `seq`
# Actually, its O(nlogn): libflint implements FFT
function apply_polynomial(seq, g)
    S = parent(g)
    n = length(seq)
    d = degree(g)
    product = seq * reverse(g)
    S([coeff(product, i) for i in d : (2n - 1)])
end

#------------------------------------------------------------------------------

function square_nonsingular_deterministic_wiedemann(A::AbstractSparsik, b::AbstractSparsik)
    # the function implements Algorithm 2 given on page 55
    # in https://doi.org/10.1109/TIT.1986.1057137
    # the notation and step numbering are taken from there

    field = A.field
    S, x = PolynomialRing(field, "x")
    n = order(A)

    # 1
    seq = []
    B = one(A)
    for i in 1 : 2n
        push!(seq, apply_vector(B, b))
        B = B * A
    end

    # 2
    k = 0
    g = one(S)

    while k < n && degree(g) < n
        # 3
        u = unit_sparsik(n, k + 1, field)

        # 4
        subseq = [inner(x, u) for x in seq]

        # 5, O(nlogn)
        d = degree(g)
        h = apply_polynomial(S(subseq), g)

        # 6, O(n^2)
        f = minimal_polynomial(h, x^(2n - d))

        # 7, O(nlogn)
        g = f * g

        # 8
        k += 1

    end

    # 9
    if iszero(coeff(g, 0))
        throw(AlgebraException(
            "the matrix passed for Wiedemann is singular!"
        ))
    end

    f = g * inv(coeff(g, 0))
    f⁻ = name_me_please(f)

    return -apply_vector(evaluate(f⁻, A), b)
end

#------------------------------------------------------------------------------

# function rectangular_singular_amortized_gauß
