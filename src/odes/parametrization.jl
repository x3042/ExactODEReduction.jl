

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

    newdim = length(invariants)
    newvars = ["$new_vars_name$i" for i in 1:newdim]
    newring, newgens = PolynomialRing(ground, newvars)

    pivots = map(first_nonzero, invariants)
    lpivots = sort(pivots)
    lbasis = basis(linear_span!(deepcopy(invariants)))

    newsystem = zeros(oldring, newdim)

    for (i, vec) in enumerate(lbasis)
        for (idx, val) in vec
            newsystem[i] += system[idx] * val
        end
    end

    shrinked_polys = []
    for p in newsystem
        filtered = Dict()
        for (monom, coef) in zip(Nemo.monomials(p), Nemo.coeffs(p))
            newmonom = []
            skip = false
            for (varidx, expow) in zip(1:olddim, exponent_vector(monom, 1))
                if expow == 0
                    continue
                end

                if !(varidx in pivots)
                    skip = true
                    break
                else
                    pos = findfirst(==(varidx), lpivots)
                    push!(newmonom, (pos, expow))
                end
            end
            if !skip
                filtered[newmonom] = coef
            end
        end
        push!(shrinked_polys, filtered)
    end

    polynormalized = zeros(newring, length(shrinked_polys))
    for (i, polyinternals) in enumerate(shrinked_polys)
        builder = MPolyBuildCtx(newring)
        for (poses, coef) in polyinternals
            newexponent = zeros(Int, newdim)
            indices = [pos[1] for pos in poses]
            es = [pos[2] for pos in poses]
            newexponent[indices] .= es
            push_term!(builder, coef, newexponent)
        end
        polynormalized[i] = finish(builder)
    end

    polynormalized
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

    rhs == lhs
end

#=
using Nemo: QQ

R, (x1, x2, x3, x4) = QQ["x1", "x2", "x3", "x4"]

system = [
    x1^2 + 2x1*x2,
    x2^2 + x3 + x4,
    x2 + x4,
    x1 + x3
]

matrices = construct_jacobians(system)
invariants = invariant_subspace_1(matrices)
transformation = polynormalize(invariants, R)

restricted = perform_change_of_variables(system, invariants)
println( restricted )

println( check_consistency(restricted, system, transformation) )
=#
