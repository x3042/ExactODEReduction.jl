
include("typics.jl")

#------------------------------------------------------------------------------

import Nemo: QQ, GF, PolynomialRing, PolyElem, gfp_elem,
            degree, trail, gfp_fmpz_elem, FracElem

#------------------------------------------------------------------------------

# rational number reconstruction implementation borrowed from CLUE
# and modified a bit to suit the 'Modern Computer Algebra' definitions
# returns a rational r // h in a canonical form such that
# r // h ≡ a (mod m)
#
# let n = max( λ(a), λ(m) ) , where λ(x) is a number of bits for x
# O(n^2)
function rational_reconstruction(a::I, m::I) where {I<:Union{Int, BigInt}}
    a = mod(a, m)
    if a == 0 || m == 0
        return QQ(0, 1)
    end
    if m < 0
        m = -m
    end
    if a < 0
        a = m - a
    end
    if a == 1
        return QQ(1, 1)
    end
    bnd = sqrt(float(m) / 2)

    U = (1, 0, m)
    V = (0, 1, a)
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
        return QQ(r, t)
    end

    throw(AlgebraException(
        "rational reconstruction of $a (mod $m) does not exist"
    ))
end

#------------------------------------------------------------------------------

function modular_reduction(x::R, field) where {R<:FracElem}
    n, d = field(numerator(x)), field(denominator(x))
    if iszero(d)
        throw(AlgebraException(
            "the denominator $(denominator(x)) vanishes under the $(field)!"
        ))
    end
    n // d
end

#------------------------------------------------------------------------------

# if n is max(deg(h), deg(m))
# O(n^2)
function minimal_polynomial(h::PolyElem, m::PolyElem)
    # trying to find mₕ - minimal(annihilating) polynomial of h
    #
    # 'Modern Computer Algebra':
    # s = ht + ml (mod m)
    # s = ht  ⇒  h ≡ s//t (mod m) (†)
    #
    # if  . gcd(s, t) = 1  ⇔  gcd(t, m) = 1
    #     . deg(s) < n
    #     . deg(t) ≤ n
    #     . !(x ⎸t)  ⇔  t(0) = const
    # then such s, t solve (†)
    #
    # let d = max(1 + deg(s), deg(t))
    # normalize t so that t(0) = 1
    # then the reversal of t modulo d is mₕ
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
        throw(AlgebraException(
            "the trailing coef of the Euclid row $t (mod $m) vanishes"
        ))
    end

    t *= inv(coeff(t, 0))
    d = max(degree(s) + 1, degree(t))

    if gcd(s, t) == 1 && degree(t) <= n
        return reverse(t, d + 1)
    end

    throw(AlgebraException(
        "minimal polynomial of $h (mod $m) does not exist"
    ))
end

#------------------------------------------------------------------------------

# Returns such vector, that it is orthogonal to the given vector set
# The given `vectors` set must be linearly independent
# and for any vect from `vectors` the following must hold
# length(vectors) = dim(vect) - 1
#
# vectors :: dict of elems (row_idx, row)
#
# note that vectors may be modified;
# it is guaranteed that after the function yields,
# `vectors` will be in the original state
function find_orthogonal!(vectors::AbstractDict)
    first_vector = first(values(vectors))
    field = ground(first_vector)
    n = dim(first_vector)

    i = 0
    found = false
    nnz_rows = Array(1 : n)
    f = zero(first_vector)

    # some complexity estimations should be done
    while ! found
        # We need a strategy for choosing a random vector
        # probably, parameters like density or components distribution
        # of the vector could be adjusted
        u = random_sparsik(n, field)
        # the only change of `vectors`
        vectors[n] = u

        b = unit_sparsik(n, n, field)

        B = from_rows(n, n, field, nnz_rows, vectors)

        try
            # if the selected `u` is not independent with `vectors`
            # then the wiedemann must fail and we should choose a new vector
            f = square_nonsingular_deterministic_wiedemann(B, b)
            found = true
        catch e
            if isa(e, AlgebraException)
                @info e
            else
                rethrow()
            end
        end

        i += 1
        i % 100 == 0 && error("something is wrong")
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
