
# Some useful but hardly categorizable things

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

#------------------------------------------------------------------------------

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
        sparse(coo_to_arrays(jac)..., m, n)
        for jac in values(jacobians)
    ]

    @info "constructed a set of $(length(factors)) matrices $m×$n from the system Jacobian"

    factors
end

function construct_jacobians(system)
    ring = parent(first(keys(system)))
    construct_jacobians([system[x] for x in gens(ring)])
end

#------------------------------------------------------------------------------

function gram_matrix(As::AbstractArray)
    F = base_ring(As[1])
    n = length(As)

    # allocate buffers
    xs = Vector{Int}(undef, n^2)
    ys = Vector{Int}(undef, n^2)
    vs = Vector{spec_elem_type(F)}(undef, n^2)

    as = map(sparse ∘ vec, As)
    ast = map(sparse ∘ vec ∘ transpose, As)

    # multiply everything with everything
    k = 0
    for i in 1:n
        for j in i:n
            z = mydot(as[i], ast[j])
            if !iszero(z)
                k += 1
                xs[k] = i
                ys[k] = j
                vs[k] = z
                if j > i
                    k += 1
                    xs[k] = j
                    ys[k] = i
                    vs[k] = z
                end
            end
        end
    end
    # trim buffers
    resize!(xs, k)
    resize!(ys, k)
    resize!(vs, k)

    sparse(xs, ys, vs, n, n)
end

#-------------------------------------------------------------------------------

"""
    eigenspaces(M)

For a diagonalizable matrix M over QQ or QQBar, returns a list of 
bases of eigenspaces with entries in QQBar
"""
function eigenspaces(M)
    n = size(M, 1)
    SBar = Nemo.MatrixSpace(Nemo.QQBar, n, n)
    MBar = SBar([M[i, j] for i in 1:n for j in 1:n])
    eigenvals = Set(Nemo.eigenvalues(M, Nemo.QQBar))
    result = []
    id = one(MatrixSpace(Nemo.QQBar, size(M)...))
    for l in eigenvals
        as_matrix = AbstractAlgebra.nullspace(MBar - l * id)[2]
        push!(result, [as_matrix[:, i] for i in 1:size(as_matrix, 2)])
    end
    result
end
