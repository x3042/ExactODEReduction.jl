

# TODO: write tests

"""
    Restrict a system of ODEs with the rhs given by
    system (multivariate polynomials) to the subspace
    new_vars_name (optional) - the name for variables in the lumped polynomials
"""
function perform_change_of_variables(system, invariants; new_vars_name="y")
    ground = base_ring(first(invariants))
    olddim = length(gens(parent(first(system))))
    oldring = parent(first(system))

    if ground != base_ring(oldring)
        oldring, vars = Nemo.PolynomialRing(ground, ["$x" for x in gens(oldring)])
	    newsys = []
        for p in system
            res = zero(oldring)
            for (c, exp) in zip(Nemo.coefficients(p), Nemo.exponent_vectors(p))
                res += Nemo.QQBar(c) * prod(vars .^ exp)
            end
	        push!(newsys, res)
	    end
	    system = newsys
    end

    newdim = length(invariants)
    newvars = ["$new_vars_name$i" for i in 1:newdim]
    newring, newgens = PolynomialRing(ground, newvars)

    transform = [sum([a * b for (a, b) in zip(collect(v), gens(oldring))]) for v in invariants]

    S = MatrixSpace(ground, newdim, olddim)
    transform_matrix = zero(S)

    for i in 1:newdim
        # TODO: !!! `vec`
        transform_matrix[i, :] = vec(collect(invariants[i]))
    end

    (rank, echelon) = Nemo.rref(transform_matrix)
    pivots = [findfirst(x -> x != 0, [echelon[i, j] for j in 1:olddim]) for i in 1:newdim]
    transform_cut = transform_matrix[:, pivots]
    inv_trans = transform_cut^(-1)

    substitutions = [zero(newring) for i in 1:olddim]
    for (i, pind) in enumerate(pivots)
        substitutions[pind] = sum([newgens[j] * inv_trans[i, j] for j in 1:newdim])
    end

    newsystem = zeros(oldring, newdim)

    for (i, vv) in enumerate(invariants)
        # for (idx, val) in vec
        #     newsystem[i] += system[idx] * val
        # end
        for (idx, val) in enumerate(vec(vv))
            newsystem[i] += system[idx] * val
        end
    end

    newsystem = [Nemo.evaluate(p, substitutions) for p in newsystem]

    return (transform, newsystem)
end

"""
    Method that checks the consistency of the differential systems

    this method checks if `restricted` is obtained from the system `original`
    after the change of variables provided by `varmapping`.
"""
function check_consistency(restricted, original, varmapping)
    # what is the probability of this miracle?..

    oldring = parent(first(original))
    newring = parent(first(restricted))
    ground = base_ring(oldring)

    xs = gens(oldring)
    ys = gens(newring)

    x0 = map(_ -> rand(ground), xs)

    original0 = Dict(x => Nemo.evaluate(f, x0) for (x, f) in zip(xs, original))
    y0 = map(f -> Nemo.evaluate(f, x0), varmapping)

    rhs = map(f -> Nemo.evaluate(f, y0), restricted)

    lhs = [
        sum([
            coef * original0[monom]
            for (coef, monom) in zip(Nemo.coeffs(f), monomials(f))
        ])
        for f in varmapping
    ]

    return rhs == lhs
end

function is_first_integral_reduction(new_system)
    all(iszero, new_system)
end