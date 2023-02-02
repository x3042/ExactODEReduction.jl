function perform_change_of_variables(system, invariants; new_vars_name="y")
    ground = base_ring(first(invariants))
    olddim = length(gens(base_ring(parent(first(system)))))
    oldring = base_ring(parent(first(system)))

    newdim = length(invariants)
    newvars = ["$new_vars_name$i" for i in 1:newdim]
    newring, newgens = PolynomialRing(ground, newvars)

    transform = [sum([a * b for (a, b) in zip(collect(v), gens(oldring))]) for v in invariants]

    S = MatrixSpace(ground, newdim, olddim)
    transform_matrix = zero(S)
 
    for i in 1:newdim
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

    newsystem = zeros(FractionField(oldring), newdim)

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
