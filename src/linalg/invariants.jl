#------------------------------------------------------------------------------

"""
    invariant_subspace_global(matrices)

Takes as input a nonempty list of matrices. Returns a list [V1, ..., Vs] of 
common invariant nonzero proper subspace such that
 - if there exists at least one such subspace, then s > 0
 - V1 subsetneq V2 subsetneq ... subsetneq Vs
 - for every i, there is no invariant subspace Vi and V(i + 1)
"""
function invariant_subspace_global(matrices::AbstractArray{T}) where {T<:AbstractSparseMatrix}
    @info "Called invariant_subspace_global on $(length(matrices)) matrices of shape $(size(matrices[1]))"

    n = size(first(matrices), 1)

    if all(iszero, matrices)
        return [
            [unit_sparsik(n, j, Nemo.QQ) for j in 1:i]
            for i in 1:(n - 1)
        ]
    end

    unit_vect = unit_sparsik(n, 1, Nemo.QQ)
    constrained = invariant_subspace_local(matrices, [unit_vect])
    if length(constrained) < n
        @debug "Found an invariant subspace by saturating the first unit vector"
        return [constrained]
    end

    # generate a basis for the Algebra
    @savetime algebra = find_basis(deepcopy(matrices)) find_basis_times 

    @debug "Dimension of the algebra is $(dim(algebra))"
    if dim(algebra) == size(first(matrices), 1)^2
        return []
    end

    # find the radical of the Algebra
    @info "Computing the radical.."
    @savetime radical = find_radical_sup(algebra) find_radical_sup_times

    # @debug "Algebra radical:" radical 
    @info "Found radical of size $(length(radical))"

    # find an invariant subspace
    if length(radical) != 0
        @info "Radical is nontrivial, computing the general kernel of radical"
        @savetime invariant = general_kernel(map(to_dense, radical)) general_kernel_times
        push!(invariant_subspace_semisimple_times, 0.0)
        invariants = [[
            from_dense([invariant[:, i]...], Nemo.QQ)
            for i in 1:size(invariant, 2)
        ]]
        if !check_invariance!(deepcopy(matrices), deepcopy(first(invariants)))
            error("Kernel of the radical turned out not to be invariant, math is wrong")
        end
    else
        @info "Radical is trivial, going to semisimple case"
        @savetime invariants = invariant_subspace_semisimple(algebra) invariant_subspace_semisimple_times
        push!(general_kernel_times, 0.0)
    end

    invariants = [basis(linear_span!(inv)) for inv in invariants]
    @info "$([length(inv) for inv in invariants])-dimensional subspaces found"

    return invariants
end

#------------------------------------------------------------------------------


# computes invariant subspaces using the given hint,
# , i.e, an array of vectors generating a subspace
function invariant_subspace_local(matrices::AbstractArray{T}, hint) where {T<:AbstractSparseMatrix}
    isempty(matrices) && error("empty system invariants are ill-defined")
    isempty(hint) && error("empty hint is given")

    V = linear_span!(hint)

    new_pivots = collect(keys(V.echelon_form))
    i = 0

    while !isempty(new_pivots)
        pivots_to_process = sort(deepcopy(new_pivots))
        empty!(new_pivots)

        for pivot in pivots_to_process
            for (vectidx, vect) in enumerate(matrices)

                product = vect * V.echelon_form[pivot]

                i += 1

                if !iszero(product)
                    new_pivot = eat_sparsik!(V, product)
                    if new_pivot != reduced
                        push!(new_pivots, new_pivot)
                    end
                end

            end
        end

    end

    return basis(V)
end

#------------------------------------------------------------------------------

function many_invariant_subspaces(
        As::AbstractArray{T},
        find_invariant)   where {T<:AbstractSparseMatrix}

    n = size(first(As), 1)
    ground = base_ring(first(As))

    # search for a subspace
    Vs = find_invariant(As)

    # no subspaces found
    if length(Vs) == 0
        return []
    end

    toreturn = Vs

    @info "found $([length(V) for V in Vs])-dim subspaces in ambient $(size(first(As), 1))-dim"

    # restrict
    if length(first(Vs)) > 1
        As_V = restrict(As, first(Vs))
        As_V_sparse = map(x-> from_dense(x, ground), map(Array, As_V))
        
        @info "Calling myself recursively in restricted subspace"

        subspaces = many_invariant_subspaces(As_V_sparse, find_invariant)
        toreturn = [map(vs -> lift(vs, first(Vs)), subspaces)..., toreturn...]
    end

    # factorize
    if length(last(Vs)) < n - 1
        As_V = factorize(As, last(Vs))
        if !isempty(As_V)
            As_V_sparse = map(x-> from_dense(x, ground), map(Array, As_V))
            
            @info "Calling myself recursively in complemented subspace"
            
            subspaces = many_invariant_subspaces(As_V_sparse, find_invariant)
            lifted = map(
                vs -> lift(vs, complement_subspace(linear_span!(last(Vs)))),
                subspaces)
            tail = deepcopy(last(Vs))
            if base_ring(first(first(subspaces))) == Nemo.QQBar
                tail = [extend_field(v, Nemo.QQBar) for v in tail]
            end
            lifted = map(
                vs -> append!(vs, tail),
                lifted)
            append!(toreturn, lifted)
        end
    end

    for vs in toreturn
        if !check_invariance!(deepcopy(As), deepcopy(vs))
            @assert false
        end
    end

    return toreturn
end

#------------------------------------------------------------------------------

# Because matrices arising here are small,
# we mostly use dense Nemo algebra

# restricts the given matrices `As` to the subspace
# generated by vectors from `vs`
# Returns new, restriced representations of the matrices
function restrict(As::AbstractArray, vs)
    n = size(first(As), 1)
    ground = base_ring(first(As))

    MSpace = AbstractAlgebra.Generic.MatrixSpace(ground, n, length(vs))

    # Asvs = [A*f1 A*f2 .. Afd]
    # for fi in vs
    Asvs = [
        MSpace(hcat([ to_dense(A * v) for v in vs ]...))
        for A in As
    ]

    # matrix = [v1 v2 .. vn]
    # for vi in vs
    matrix = MSpace(hcat([ to_dense(v) for v in vs ]...))

    # solve for each A from As
    #   A*fi = a1*f1 + a2*f2 + ... + ad*fd
    return [
        AbstractAlgebra.Generic.solve(matrix, Avs)
        for Avs in Asvs
    ]
end

# factorized the given matrices `As` by the subspace
# generated by vectors from `vs`
# Returns new, factorized representations of the matrices
function factorize(As::AbstractArray, vs)
    n = size(first(As), 1)
    ground = base_ring(first(As))

    MSpace = AbstractAlgebra.Generic.MatrixSpace(ground, n, n - length(vs))
    MSpaceplus = AbstractAlgebra.Generic.MatrixSpace(ground, n, n)

    # complement ⊕ vs = Rn
    complement = complement_subspace(linear_span!(vs))

    # Asvs = [A*f1 A*f2 .. A*fd]
    # for fi in complement
    Asvs = [
        MSpace(hcat([to_dense(A * v) for v in complement ]...))
        for A in As
    ]

    # matrix = [f1 f2 .. fd e1 .. en]
    # for fi in complement
    # for ei in vs
    matrix = MSpaceplus(hcat(
        map(to_dense, complement)...,
        map(to_dense, vs)...)
    )

    # solve for each A from As
    #   A*fi = a1*f1 + a2*f2 + ... + ad*fd + e
    #   where e ∈ vs
    ans = [
        AbstractAlgebra.Generic.solve(matrix, Avs)[1:end-length(vs), :]
        for Avs in Asvs
    ]
    return ans
end

# lifts vectors `vs` to the subspace generated by vectors `Vs`
# Returns new, lifted representations of the vectors
function lift(vs, Vs)
    n = dim(first(Vs))
    ground = base_ring(first(vs))

    # lift to QQBar if necessary
    if ground != base_ring(first(Vs))
        Vs = [extend_field(v, ground) for v in Vs]
    end

    lifted = []

    for v in vs
        lifted_vector = zero_sparsik(n, ground)
        for (i, t) in v
            lifted_vector = lifted_vector + scale(Vs[i], t)
        end
        push!(lifted, lifted_vector)
    end

    return lifted
end


#------------------------------------------------------------------------------
