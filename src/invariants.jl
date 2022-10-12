#------------------------------------------------------------------------------

"""
    invariant_subspace_global(matrices)

Takes as input a nonempty list of matrices. Returns a list [V1, ..., Vs] of 
common invariant nonzero proper subspace such that
 - if there exists at least one such subspace, then s > 0
 - V1 subsetneq V2 subsetneq ... subsetneq Vs
 - for every i, there is no invariant subspace Vi and V(i + 1)
"""
function invariant_subspace_global(matrices::AbstractArray{T}; overQ=true) where {T}
    @info "Called invariant_subspace_global on $(length(matrices)) matrices of shape $(size(matrices[1]))"

    n = size(first(matrices), 1)

    if all(iszero, matrices)
        return [
            [unit_sparse_vector(n, j, Nemo.QQ) for j in 1:i]
            for i in 1:(n - 1)
        ]
    end

    unit_vect = unit_sparse_vector(n, 1, Nemo.QQ)
    constrained = invariant_subspace_local(matrices, [unit_vect])
    if length(constrained) < n
        @debug "Found an invariant subspace by saturating the first unit vector"
        return [constrained]
    end

    # generate a basis for the Algebra
    algebra = find_basis(deepcopy(matrices)) 

    @debug "Dimension of the algebra is $(dim(algebra))"
    if dim(algebra) == size(first(matrices), 1)^2
        return []
    end

    # find the radical of the Algebra
    @info "Computing the radical.."
    radical = find_radical_sup(algebra)

    # @debug "Algebra radical:" radical 
    @info "Found radical of size $(length(radical))"

    # find an invariant subspace
    if length(radical) != 0
        @info "Radical is nontrivial, computing the general kernel of radical"
        invariant = general_kernel(map(collect, radical))
        invariants = [[
            sparse([invariant[:, i]...])
            for i in 1:size(invariant, 2)
        ]]
        if !check_invariance!(deepcopy(matrices), deepcopy(first(invariants)))
            error("Kernel of the radical turned out not to be invariant, math is wrong")
        end
    else
        @info "Radical is trivial, going to semisimple case"
        invariants = invariant_subspace_semisimple(algebra; overQ=overQ)
    end

    invariants = [basis(linear_span!(inv)) for inv in invariants]
    @info "$([length(inv) for inv in invariants])-dimensional subspaces found"

    return invariants
end

#------------------------------------------------------------------------------


# computes invariant subspaces using the given hint,
# , i.e, an array of vectors generating a subspace
function invariant_subspace_local(matrices::AbstractArray{T}, hint) where {T}
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
                    if !isreduced(new_pivot)
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
        find_invariant;
        overQ=true)   where {T}
    # filter!(!iszero, As)

    n = size(first(As), 1)
    ground = base_ring(first(As))

    # search for a subspace
    Vs = find_invariant(As; overQ=overQ)

    # no subspaces found
    if length(Vs) == 0
        return []
    end

    toreturn = Array{Any, 1}(Vs)

    @info "found $([length(V) for V in Vs])-dim subspaces in ambient $(size(first(As), 1))-dim"

    # restrict
    if length(first(Vs)) > 1 && base_ring(first(first(Vs))) != Nemo.QQBar        
        As_V = restrict(As, first(Vs))
        
        @info "Calling myself recursively in restricted subspace"

        subspaces = many_invariant_subspaces(As_V, find_invariant; overQ=overQ)
        toreturn = Vector{Any}([map(vs -> lift(vs, first(Vs)), subspaces)..., toreturn...])
    end

    # factorize
    if length(last(Vs)) < n - 1 && base_ring(first(last(Vs))) != Nemo.QQBar
        As_V = factorize(As, last(Vs))
        if !isempty(As_V)
            
            @info "Calling myself recursively in complemented subspace"
            
            subspaces = many_invariant_subspaces(As_V, find_invariant; overQ=overQ)
            if length(subspaces) > 0
                lifted = map(
                    vs -> lift(vs, complement_subspace(linear_span!(last(Vs)))),
                    subspaces)
                for l in lifted
                    tail = deepcopy(last(Vs))
                    if base_ring(first(l)) == Nemo.QQBar
                        tail = [extend_field(v, Nemo.QQBar) for v in tail]
                    end
                    append!(l, tail)
                    push!(toreturn, l)
                end
            end
        end
    end

    for vs in toreturn
        if !check_invariance!(deepcopy(As), deepcopy(vs))
            # nice
            @assert false
        end
    end

    toreturn
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

    MSpace = Nemo.MatrixSpace(ground, n, length(vs))

    # TODO: !!! do not use ...

    # Asvs = [A*f1 A*f2 .. Afd]
    # for fi in vs
    Asvs = [
        MSpace(hcat([ collect(A * v) for v in vs ]...))
        for A in As
    ]

    # matrix = [v1 v2 .. vn]
    # for vi in vs
    matrix = MSpace(hcat([ collect(v) for v in vs ]...))
    
    # minv = Nemo.inv(matrix)
    
    # N, P, L, U = Nemo.lu(matrix)
    # Linv = Nemo.inv(L)
    # solve_triu = AbstractAlgebra.Generic.solve_triu

    # solve for each A from As
    #   A*fi = a1*f1 + a2*f2 + ... + ad*fd
    restricted = [
        # solve_triu(U, Linv*Avs)
        Nemo.solve(matrix, Avs)
        # minv * Avs
        for Avs in Asvs
    ]

    map(sparse ∘ collect, restricted)
end

# factorized the given matrices `As` by the subspace
# generated by vectors from `vs`
# Returns new, factorized representations of the matrices
function factorize(As::AbstractArray, vs)
    n = size(first(As), 1)
    ground = base_ring(first(As))

    MSpace = Nemo.MatrixSpace(ground, n, n - length(vs))
    MSpaceplus = Nemo.MatrixSpace(ground, n, n)

    # complement ⊕ vs = Rn
    complement = complement_subspace(linear_span!(vs))

    # Asvs = [A*f1 A*f2 .. A*fd]
    # for fi in complement
    Asvs = [
        MSpace(hcat([collect(A * v) for v in complement ]...))
        for A in As
    ]

    # matrix = [f1 f2 .. fd e1 .. en]
    # for fi in complement
    # for ei in vs
    matrix = MSpaceplus(hcat(
        map(collect, complement)...,
        map(collect, vs)...)
    )

    # minv = Nemo.inv(matrix)

    # solve for each A from As
    #   A*fi = a1*f1 + a2*f2 + ... + ad*fd + e
    #   where e ∈ vs
    quotient = [
        Nemo.solve(matrix, Avs)[1:end-length(vs), :]
        # (minv * Avs)[1:end-length(vs), :]
        for Avs in Asvs
    ]

    map(sparse ∘ collect, quotient)
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
        lifted_vector = zero_sparse_vector(n, ground)
        
        # for (i, t) in v
        #     lifted_vector = lifted_vector + Vs[i]*t
        # end
        for (i, t) in enumerate(vec(v))
            iszero(t) && continue
            lifted_vector = lifted_vector + scale(Vs[i], t)
        end

        push!(lifted, lifted_vector)
    end

    lifted
end
