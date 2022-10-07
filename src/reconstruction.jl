
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

    # TODO: !!!
    U = (I(1), I(0), I(m))
    V = (I(0), I(1), I(a))
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

function modular_reduction(x::Nemo.gfp_fmpz_elem, field)
    field(convert(BigInt, x))
end

function modular_reduction(x::Nemo.gfp_elem, field)
    field(x)
end
