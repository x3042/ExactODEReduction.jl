

include("../src/structs/dok_sparsik.jl")
include("../src/structs/csr_sparsik.jl")


#------------------------------------------------------------------------------

import Nemo: QQ, GF, PolynomialRing, PolyElem, gfp_elem,
             degree, trail, coeff, gen, divexact, lead

import LinearAlgebra: SingularException

# hmmm
# using ADCME


#------------------------------------------------------------------------------


# returns f(x₀)
# O(d) multiplications/additions of x₀ if d = degree(f)
function evaluate(f::PolyElem, x₀)
    accum = lead(f) * one(x₀)
    d = degree(f)

    for i in 1 : d
        accum = accum * x₀ + coeff(f, d - i) * one(x₀)
    end

    return accum
end

# returns f(x₀) * b
# expands the brackets into:
#   f₀b + f₁x₀b + f₂x₀²b + ... + fₙx₀ⁿb
# and using the Horner scheme
function evaluate(f::PolyElem, x₀, b)
    E = one(x₀)
    accum = apply_vector(lead(f) * E, b)
    d = degree(f)

    for i in 1 : d
        accum = apply_vector(x₀, accum) + coeff(f, d - i) * apply_vector(E, b)
    end

    return accum
end

#------------------------------------------------------------------------------

# returns the thing named f⁻
# Gleb: How about shift_right_x ?
# Looks cool
function shift_right_x(f::PolyElem)
    x = gen(parent(f))
    divexact(f - coeff(f, 0), x)
end

#------------------------------------------------------------------------------

# Solves Ay = b
# Throws if A is singular
function square_nonsingular_randomized_wiedemann(A::AbstractSparseMatrix, b::AbstractSparseVector)
    # the function implements Algorithm 1 given on page 55
    # in https://doi.org/10.1109/TIT.1986.1057137
    # the notation and step numbering are taken from there

    field = ground(A)
    S, x = PolynomialRing(field, "x")
    n = order(A)

    # 1
    b₀ = b
    y = zero(b)
    k = 0
    d = 0

    subspace = [ b ]
    for i in 1 : 2n - 1
        push!(subspace, apply_vector(A, last(subspace)))
    end

    # 2
    while !iszero(b)
        # 3
        # Gleb: my understanding is that the randomization in the algorithm
        # affects only the runtime but the result will be always correct.
        # Therefore, we can afford different choice strategies for u.
        # One is outline in Section VI of the paper and suggests to generate a
        # random dense vector, then the average number of the iteration will be small.
        # We can start with this and then experiment what happens if we have u sparser

        # Alex: absolutely dense random vector works fine.
        # While we decrease density runtime is mostly the same
        # but it starts to degenerate crucially in some cases
        u = random_sparsik(n, field, density=1)

        # 4
        seq = elem_type(field)[]
        for i in 1 : 2 * (n - d)
            push!(seq, inner(u, subspace[i]))
        end

        # 5
        f = minimal_polynomial(S(seq), x^(2 * (n - d)))

        if coeff(f, 0) == 0
            throw(SingularException(0))
        end

        f = f * inv(coeff(f, 0))

        # 6
        f⁻ = shift_right_x(f)

        accum = zero_sparsik(n, field)
        for j in 0 : degree(f⁻)
            reduce!(accum, subspace[j + 1], coeff(f⁻, j))
        end
        reduce!(y, accum, 1)
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

function square_nonsingular_deterministic_wiedemann(A::AbstractSparseMatrix, b::AbstractSparseVector)
    # the function implements Algorithm 2 given on page 55
    # in https://doi.org/10.1109/TIT.1986.1057137
    # the notation and step numbering are taken from there

    field = ground(A)
    S, x = PolynomialRing(field, "x")
    n = order(A)

    # 1
    # O(nω) if ω is the number of nonzeroes in A
    subspace = [ b ]
    for i in 1 : 2n - 1
        push!(subspace, apply_vector(A, last(subspace)))
    end

    # 2
    k = 0
    g = one(S)


    while k < n && degree(g) < n
        # 3
        u = unit_sparsik(n, k + 1, field)

        # 4
        # O(n)
        seq = [inner(x, u) for x in subspace]

        # 5, O(nlogn)
        d = degree(g)
        h = apply_polynomial(S(seq), g)

        # 6, O(n^2)
        f = minimal_polynomial(h, x^(2n - d))

        # 7, O(nlogn)
        g *= f

        # 8
        k += 1

    end

    if iszero(coeff(g, 0))
        throw(SingularException(0))
    end

    # 9
    f = g * inv(coeff(g, 0))
    f⁻ = shift_right_x(f)

    accum = zero_sparsik(n, field)
    for j in 0 : degree(f⁻)
        reduce!(accum, subspace[j + 1], coeff(f⁻, j))
    end

    return -accum
end

#------------------------------------------------------------------------------

function wiedemann_solve(A, b; proved=true)
    if issquare(A)
        if proved
            return square_nonsingular_deterministic_wiedemann(A, b)
        else
            return square_nonsingular_randomized_wiedemann(A, b)
        end
    end

    error("nonsquare matrices are not supported")
end

#------------------------------------------------------------------------------

# hmm!
# HMMMMM
function deterministic_char_polynomial(A::AbstractSparseMatrix)
    field = ground(A)
    S, x = PolynomialRing(field, "x")
    n = order(A)

    b = random_sparsik(n, field, density=1.)

    # 1
    # O(nω) if ω is the number of nonzeroes in A
    subspace = [ b ]
    for i in 1 : 2n - 1
        push!(subspace, apply_vector(A, last(subspace)))
    end

    # 2
    k = 0
    g = one(S)


    while k < n && degree(g) < n
        # 3
        u = unit_sparsik(n, k + 1, field)

        # 4
        # O(n)
        seq = [inner(x, u) for x in subspace]

        # 5, O(nlogn)
        d = degree(g)
        h = apply_polynomial(S(seq), g)

        # 6, O(n^2)
        f = minimal_polynomial(h, x^(2n - d))

        # 7, O(nlogn)
        g *= f

        # 8
        k += 1

    end

    return g
end


# hmm!
# HMMMMM
function randomized_char_polynomial(A::AbstractSparseMatrix)
    field = ground(A)
    S, x = PolynomialRing(field, "x")
    n = order(A)

    # 1
    b = random_sparsik(n, field, density=1)

    b₀ = b
    y = zero(b)
    k = 0
    d = 0

    X = S(1)

    subspace = [ b ]
    for i in 1 : 2n - 1
        push!(subspace, apply_vector(A, last(subspace)))
    end

    # 2
    while !iszero(b)
        u = random_sparsik(n, field, density=1.)

        # 4
        seq = elem_type(field)[]
        for i in 1 : 2 * (n - d)
            push!(seq, inner(u, subspace[i]))
        end

        # 5
        f = minimal_polynomial(S(seq), x^(2 * (n - d)))

        if coeff(f, 0) == 0
            return f
        end
        X *= f

        f = f * inv(coeff(f, 0))

        # 6
        f⁻ = shift_right_x(f)

        accum = zero_sparsik(n, field)
        for j in 0 : degree(f⁻)
            reduce!(accum, subspace[j + 1], coeff(f⁻, j))
        end
        reduce!(y, accum, 1)
        b = b₀ + apply_vector(A, y)
        d += degree(f)
        k += 1

        if d == n
            break
        end
    end

    return X
end
