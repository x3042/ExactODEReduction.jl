#------------------------------------------------------------------------------

# Returns the minimal polynomial of the sequence `h` modulo `m`,
# the sequence `h` is formed as the given polynomial coefficients
# If n is max(deg(h), deg(m))
# O(n^2)
function minimal_polynomial(h::PolyElem, m::PolyElem)
    # The function implements Algorithm 12.9 from
    #   "Modern Computer Algebra", second edition,
    #   Joachim von zur Gathen, Jürgen Gerhard

    n = div(degree(m), 2)
    FF = parent(h)

    U = (FF(1), FF(0), m)
    V = (FF(0), FF(1), h)
    while degree(V[3]) >= n
        q = div(U[3], V[3])
        T = U .- q .* V
        U = V
        V = T
    end

    s, t = V[3], V[2]

    if iszero(coeff(t, 0))
        throw(SingularException(0))
    end

    t *= inv(coeff(t, 0))
    d = max(degree(s) + 1, degree(t))

    if gcd(s, t) == 1 && degree(t) <= n
        return reverse(t, d + 1)
    end

    throw(DomainError(
        h, "minimal polynomial of $h (mod $m) does not exist"
    ))
end

#------------------------------------------------------------------------------

# Returns such vector, that it is orthogonal to the given vector set
# The given `vectors` set must be linearly independent
# and for any vect from `vectors` the following must hold
#   length(vectors) = dim(vect) - 1
#
# vectors :: dict of elems (row_idx, row)
#
# Note that vectors may be modified, CAREFUL ABOUT CONCURRENCY!
# It is guaranteed that after the function yields,
# `vectors` will be in the original state
#
# NOT GUARANTEED FOR RETURNED VECTOR TO BE ORTHOGONAL
function find_orthogonal!(vectors::AbstractDict)
    first_vector = first(values(vectors))
    field = base_ring(first_vector)
    n = dim(first_vector)

    i = 1
    found = false
    nnz_rows = Array(1 : n)
    f = zero(first_vector)

    # some complexity estimations should be done
    while ! found
        # taking the i-th unit vector
        u = unit_sparsik(n, i, field)

        # the only change of `vectors`
        vectors[n] = u

        b = unit_sparsik(n, n, field)

        B = from_rows(n, n, field, nnz_rows, vectors)

        try
            # if the selected `u` is not independent with `vectors`
            # then the wiedemann must fail and we should choose a new vector
            # Gleb: we could use probabilistic here
            # Alex: we could, so, the answer could be "almost orthogonal"
            # (only orthogonal to some of the vectors)
            f = square_nonsingular_randomized_wiedemann(B, b)
            found = true
        catch e
            if isa(e, SingularException)
                @info e
            else
                rethrow()
            end
        end

        i += 1
        i % 10 == 0 && error("something is wrong")
    end

    # undo the change
    delete!(vectors, n)

    f
end

# A slower analogue of the upper function
#
# vectors :: array of sparsiks
function find_orthogonal!(vectors::AbstractVector)
    find_orthogonal!(
        Dict(i => vect for (i, vect) in enumerate(vectors))
    )
end

#----------------------------------------------------------------

#------------------------------------------------------------------------------


# returns f(x₀)
function evaluate_2(f::PolyElem, x₀)
    accum = convert(Int, lead(f))
    d = degree(f)
    reconstruct!(x₀)

    rec_x = rational_reconstruction(x₀)
    csr_x = SparseArrays.sparse(to_dense(rec_x))

    Id = SparseArrays.sparse(to_dense(one(rec_x)))
    for i in 1 : d
        accum = accum * csr_x + convert(Int, coeff(f, d - i)) * Id
    end

    accum = from_dense(Array(accum), Nemo.QQ)

    return reconstruct!(modular_reduction(accum, base_ring(x₀)))
end

# returns f(x₀) * b
# expanding the brackets into:
#   f₀b + f₁x₀b + f₂x₀²b + ... + fₙx₀ⁿb
# and using the Horner scheme
function evaluate(f::PolyElem, x₀, b)
    E = one(x₀)
    accum = lead(f) * E * b
    d = degree(f)

    for i in 1 : d
        accum = x₀ * accum + coeff(f, d - i) * E * b
    end

    return accum
end

#------------------------------------------------------------------------------

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

    field = base_ring(A)
    S, x = PolynomialRing(field, "x")
    n = order(A)

    # 1
    b₀ = b
    y = zero(b)
    k = 0
    d = 0

    subspace = [ b ]
    for i in 1 : 2n - 1
        push!(subspace, A * last(subspace))
    end

    # 2
    while !iszero(b)
        # 3
        u = random_sparse_vector(n, field, density=1)

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

        accum = zero_sparse_vector(n, field)
        for j in 0 : degree(f⁻)
            reduce!(accum, subspace[j + 1], coeff(f⁻, j))
        end
        reduce!(y, accum, 1)
        b = b₀ + A * y
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

    field = base_ring(A)
    S, x = PolynomialRing(field, "x")
    n = order(A)

    # 1
    # O(nω) if ω is the number of nonzeroes in A
    subspace = [ b ]
    for i in 1 : 2n - 1
        push!(subspace, A * last(subspace))
    end

    # 2
    k = 0
    g = one(S)


    while k < n && degree(g) < n
        # 3
        u = unit_sparse_vector(n, k + 1, field)

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

    if iszero(coeff(g, 0)) || isone(g)
        throw(SingularException(0))
    end

    # 9
    f = g * inv(coeff(g, 0))
    f⁻ = shift_right_x(f)

    accum = zero_sparse_vector(n, field)
    for j in 0 : degree(f⁻)
        reduce!(accum, subspace[j + 1], coeff(f⁻, j))
    end

    return -accum
end

#------------------------------------------------------------------------------

# Returns a solution x to linear system Ax = b
# under an assumtion of A being square and nonsingular
# using Wiedemann system-solving algorithm as a base
# Throws if system is singular

"""
wiedemann_solve(A, b; proved)

Returns a solution x to linear system Ax = b under an assumtion of
A being square and nonsingular using Wiedemann system-solving algorithm.
By default, proved = true which calls 'square_nonsingular_deterministic_wiedemann'
otherwise calls 'square_nonsingular_randomized_wiedemann'.
"""
function wiedemann_solve(
        A::AbstractSparseMatrix,
        b::AbstractSparseVector;
        proved=true)

    if issquare(A)
        if proved
            return square_nonsingular_deterministic_wiedemann(A, b)
        else
            return square_nonsingular_randomized_wiedemann(A, b)
        end
    end

    error("nonsquare matrices are not supported")
end


# Returns the minimal annihilating polynomial of matrix A, that is,
# f ∈ F[x], such that
#   f(A)  = 0
#   f     = argmin(degree(f))
#
# The algorithm is randomized if subspace_minpoly is of W. family
# We should probably do some probabilistic analysis
# (or peek it at the W. paper)
function minimal_polynomial_wiedemann(
        A::AbstractSparseMatrix;
        subspace_minpoly=__deterministic_wiedemann_minpoly)

    S, _ = PolynomialRing(base_ring(A), "x")
    f = S(1)

    iterations = 4
    for _ in 1 : iterations
        f = lcm(f, subspace_minpoly(A, S))
    end

    return f
end

#------------------------------------------------------------------------------

# Deterministic algorithm
# for minimal annihilating polynomial of complex matrix A
#
# Sadly, the source thyself does not contain any references
# about this Algorithm complexity analysis
#
#   O(nL(n))   ( O(n^4) basically )
# where n is the order of matrix
# and L(n) is the cost of multiplying two matrices of n×n
#
# Throws if the given matrix is zero
#
# `PolySpace` - a univariate polynomial ring to put the resulting polynomial to
function __deterministic_simple_minpoly(A, PolySpace)
    # the function implements the algorithm presented in paper
    #   An algorithm for the calculation of the minimal polynomial,
    #   S. BIAŁAS and M. BIAŁAS
    # the paper is available at
    #   http://bulletin.pan.pl/(56-4)391.pdf

    if iszero(A)
        throw(DomainError(A, "It is really zero"))
    end

    field = base_ring(A)
    n = order(A)

    # Computing the linear span of the powers of A
    columns = [ one(A) ]
    for i in 1 : n
        push!(columns, A * last(columns))
    end

    columns = Dict(i => vec(x) for (i, x) in enumerate(columns))

    B = from_rows(n+1, n^2, field, Array(1:n+1), columns)
    B = transpose!(B)

    V = linear_span!(collect(values(B.rows)))

    rows = Dict(i => x for (i, x) in enumerate(basis(V)))
    C = from_rows(length(rows), n + 1, field, Array(1:length(rows)), rows)
    C = transpose!(C)

    # Computing the degree of the minimal polynomial
    V = Subspace(field)
    power = 0
    for i in 1:size(C, 1)
        eatcode = eat_sparsik!(V, deepcopy(C.rows[i]))
        if !haskey(C.rows, i) || isreduced(eatcode)
            power = i
            break
        end
    end

    # Computing the minimal polynomial
    x = gen(PolySpace)
    f = x^(power-1)
    last_row = haskey(C.rows, power) ? C.rows[power] : zero_sparse_vector(n + 1, field)
    for (piv, val) in last_row
        if haskey(V.echelon_form, piv)
            f -= val * x^(piv-1)
        end
    end

    return f
end

#------------------------------------------------------------------------------

# Single deterministic iteration of minimal_polynomial algorithm
# Returns annihilating polynomial for {Aⁱb} for some random vector b
function __deterministic_wiedemann_minpoly(A::AbstractSparseMatrix, PolySpace)
    field = base_ring(A)
    n = order(A)
    b = random_sparse_vector(n, field, density=1.0)

    subspace = [ b ]
    for i in 1 : 2n - 1
        push!(subspace, A * last(subspace))
    end

    k = 0
    g = one(PolySpace)
    while k < n && degree(g) < n
        u = unit_sparse_vector(n, k + 1, field)

        # O(n)
        seq = [inner(x, u) for x in subspace]

        # O(nlogn)
        d = degree(g)
        h = apply_polynomial(PolySpace(seq), g)

        # O(n^2)
        f = minimal_polynomial(h, gen(PolySpace)^(2n - d))

        # O(nlogn)
        g *= f
        k += 1
    end

    return g
end


# Single randomized iteration of minimal_polynomial algorithm
# Returns annihilating polynomial for {Aⁱb} for some random vector b
function __randomized_wiedemann_minpoly(A::AbstractSparseMatrix, PolySpace)
    field = base_ring(A)
    n = order(A)
    b = random_sparse_vector(n, field, density=1.0)
    g = PolySpace(1)

    subspace = [ b ]
    for i in 1 : 2n - 1
        push!(subspace, A * last(subspace))
    end

    while degree(g) < n
        u = random_sparse_vector(n, field, density=1)

        seq = elem_type(field)[]
        for i in 1 : 2 * (n - degree(g))
            push!(seq, inner(u, subspace[i]))
        end

        f = PolySpace(0)
        try
            f = minimal_polynomial(
                PolySpace(seq),
                gen(PolySpace)^(2 * (n - degree(g)))
            )
        catch SingularException
            # singular sequence is expected here, so do not throw
            return g
        end

        g *= f
    end

    return g
end

#-------------------------------------------------------------------------
