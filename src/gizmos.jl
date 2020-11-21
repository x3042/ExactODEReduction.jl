

import Nemo: QQ, gfp_elem

#------------------------------------------------------------------------------

function Base.convert(::Type{Int}, x::gfp_elem)
    return Int(x.data)
end

#------------------------------------------------------------------------------

# rational number reconstruction implementation borrowed from CLUE
# returns a rational r // h in a canonical form such that
# r // h ≡ a (mod m)
#
# let n = max( λ(a), λ(m) ) , where λ(x) is a number of bits for x
# O(n^2)
function rational_reconstruction(a::Int, m::Int)
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
    # changed from `<= bnd` to <= m / bnd
    if t <= m / bnd && gcd(r, t) == 1
        return QQ(r, t)
    end

    error("rational reconstruction of $a (mod $m) does not exist")
end

#------------------------------------------------------------------------------

function rev(t, d)
    tmp = t % x^d
    return reverse(tmp)
end

#------------------------------------------------------------------------------

function minimal_polynomial(h, m)
    U = (1, 0, m)
    V = (0, 1, h)

    while V[3] != 0
        q = div(U[3], V[3])
        T = U .- q .* V
        U = V
        V = T
        # !!!
        break
    end

    t = V[2]
    t = t * inv(t(0))

    # !!!
    return rev(t, max(degree(V[1]) + 1, degree(V[2])))
end

#------------------------------------------------------------------------------

#=
    Так я, в сей бездне углублен,
    Теряюсь, мысльми утомлен!
=#
function Wiedemannchik(A, b)

end
