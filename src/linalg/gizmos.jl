#------------------------------------------------------------------------------

# rational number reconstruction implementation borrowed from CLUE
# and modified a bit to suit the 'Modern Computer Algebra' definitions
# returns a rational r // h of QQ field in a canonical form such that
#   r // h ≡ a (mod m)
#
# let n = max( λ(a), λ(m) ) , where λ(x) is a number of bits for x
# O(n^2)
"""
    rational_reconstruction(a, m)

Rational number reconstruction implementation borrowed from CLUE
and modified a bit to suit the 'Modern Computer Algebra' definitions.
Returns a rational of QQ field in a canonical form that
is congruent a modulo m

a, m are integers
"""
function rational_reconstruction(a::I, m::I) where {I<:Union{Int, BigInt}}
    a = mod(a, m)
    if a == 0 || m == 0
        return Nemo.QQ(0, 1)
    end
    if m < 0
        m = -m
    end
    if a < 0
        a = m - a
    end
    if a == 1
        return Nemo.QQ(1, 1)
    end
    bnd = sqrt(float(m) / 2)

    U = I[1, 0, m]
    V = I[0, 1, a]
    while abs(V[3]) >= bnd
        q = div(U[3], V[3])
        T = U .- q .* V
        U = V
        V = T
    end

    t = abs(V[2])
    r = V[3] * sign(V[2])
    # changed from `<= bnd` to `<= m / bnd`
    if t <= m / bnd && gcd(r, t) == 1
        return Nemo.QQ(r, t)
    end

    throw(DomainError(
        :($a//$m), "rational reconstruction of $a (mod $m) does not exist"
    ))
end

#------------------------------------------------------------------------------

function modular_reduction(x::FracElem, field)
    n, d = field(numerator(x)), field(denominator(x))
    if iszero(d)
        throw(DomainError(
            :($x), "modular reduction of $x (to $field) does not exist"
        ))
    end
    n // d
end

function modular_reduction(x::gfp_fmpz_elem, field)
    return field(convert(BigInt, x))
end

function modular_reduction(x::gfp_elem, field)
    return field(x)
end

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

    return f
end

# A slower analogue of the upper function
#
# vectors :: array of sparsiks
function find_orthogonal!(vectors::AbstractVector)
    return find_orthogonal!(
        Dict(i => vect for (i, vect) in enumerate(vectors))
    )
end

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

# for the given system of polynomials in variables xi
# consturucts a set of matrices Ai over number field
# such that the Jacobian J of the provided system can represented as the sum
# J = Aᵢxⁱ
"""
    construct_jacobians(system)

For the given system of polynomials in variables xi
consturucts a set of matrices Aᵢ over number field
such that the Jacobian J of the provided system can represented as the sum
J = Aᵢxⁱ
"""
function construct_jacobians(system::AbstractArray{T}) where {T<:MPolyElem}
    domain = base_ring(first(system))
    poly_ring = parent(first(system))
    gen2idx = Dict(x=>i for (i, x) in enumerate(gens(poly_ring)))

    jacobians = Dict()

    for (p_idx, poly) in enumerate(system)
        for var in vars(poly)
            v_idx = gen2idx[var]
            # term is of form α*monomial
            for term in terms(derivative(poly, var))
                monom = monomial(term, 1)
                cf = coeff(term, 1)

                # how can we do it in a normal way..
                !haskey(jacobians, monom) && (jacobians[monom] = Dict())
                idx = (v_idx, p_idx)
                if !haskey(jacobians[monom], idx)
                    jacobians[monom][idx] = zero(domain)
                end
                jacobians[monom][idx] += cf
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

function construct_jacobians(system)
    ring = parent(first(keys(system)))
    construct_jacobians([system[x] for x in gens(ring)])
end


#------------------------------------------------------------------------------

# vectors - an array of 1D iterables
# domain - an MPoly domain
#
# converts the given vectors into the polynomial form
# with respect to the generators of the given domain
function polynormalize(vectors, domain) where {T}
    polynômes = zeros(domain, 0)
    vars = Nemo.gens(domain)

    for v in vectors
        push!(
            polynômes,
            sum(map(prod, zip(vars, to_dense(v))))
        )
    end

    polynômes
end

#------------------------------------------------------------------------------

# for As[i] in array As compute dok_sparsik Tr: Tr_ij = trace(A_i, A_j)
function gram_matrix(As::Array{AbstractSparseObject{FlintRationalField},1})
    F = base_ring(As[1])
    n = length(As)

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

    return from_COO(n, n, nnz_coords, F)
end

#-------------------------------------------------------------------------------

"""
    eigenvectors(M)

For a matrix M over QQ or QQBar with only simple eigenvalues, returns a list of 
eigenvectors with entries in QQBar
"""
function eigenvectors(M)
    n = size(M, 1)
    SBar = Nemo.MatrixSpace(Nemo.QQBar, n, n)
    MBar = SBar([M[i, j] for i in 1:n for j in 1:n])
    eigenvals = Nemo.eigenvalues(M, Nemo.QQBar)
    result = []
    id = one(MatrixSpace(Nemo.QQBar, size(M)...))
    for l in eigenvals
        push!(result, AbstractAlgebra.nullspace(MBar - l * id)[2])
    end
    return result
end
