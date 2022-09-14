#------------------------------------------------------------------------------

# computes an invariant subspaces of the given matrices
#
# returns a pair of
#   - a boolean value corresponding to the existence of the common invariant subspace
#   - a common invariant subspace represented by basis vectors if it could be computed
function invariant_subspace_global(matrices::AbstractArray{T}) where {T<:AbstractSparseMatrix}
    isempty(matrices) && error("empty system invariants are ill-defined")

    @info "Called invariant_subspace_global on $(length(matrices)) matrices of shape $(size(matrices[1]))"

    unit_vect = unit_sparsik(size(first(matrices), 1), 1, Nemo.QQ)
    constrained = invariant_subspace_local(matrices, [unit_vect])
    if length(constrained) < size(first(matrices), 1)
        @debug "Found an invariant subspace by saturating the first unit vector"
        return (true, constrained)
    end

    # generate a basis for the Algebra
    @savetime algebra = find_basis(deepcopy(matrices)) find_basis_times 

    @debug "Dimension of the algebra is $(dim(algebra))"
    if dim(algebra) == size(first(matrices), 1)^2
        return (false, [])
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
        invariant = [
            from_dense([invariant[:, i]...], Nemo.QQ)
            for i in 1:size(invariant, 2)
        ]
        if !check_invariance!(deepcopy(matrices), deepcopy(invariant))
            error("Kernel of the radical turned out not to be invariant, math is wrong"
        end
    else
        @info "Radical is trivial, using randomized algorithm"
        if dim(algebra) != 0
            @savetime invariant = invariant_subspace_semisimple(algebra) invariant_subspace_semisimple_times
            push!(general_kernel_times, 0.0)
        else
            invariant = fullspace(size(first(matrices), 1), base_ring(first(matrices)))
        end
    end

    if isempty(invariant)
        @warn "There is invariant subspace but it is either not defined over Q"
        return (true, [])
    end
    
    invariant = basis(linear_span!(invariant))
    @info "$(length(invariant)) dimensional subspace found"

    for v in invariant
        scale!(v, lcm(v))
    end

    return (true, invariant)
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
    (exists, V) = find_invariant(As)

    # no subspaces found
    if length(V) == 0
        return []
    end

    toreturn = [ V ]

    @info "found $(length(V))-dim subspace in ambient $(size(first(As), 1))-dim"

    # restrict
    if length(V) > 1 && length(V) < n
        As_V = restrict(As, V)
        As_V_sparse = map(x-> from_dense(x, ground), map(Array, As_V))
        
        @info "Calling myself recursively in restricted subspace"

        subspaces = many_invariant_subspaces(As_V_sparse, find_invariant)
        append!(toreturn, map(vs -> lift(vs, V), subspaces))
    end

    # factorize
    if length(V) < n - 1
        As_V = factorize(As, V)
        if !isempty(As_V)
            As_V_sparse = map(x-> from_dense(x, ground), map(Array, As_V))
            
            @info "Calling myself recursively in complemented subspace"
            
            subspaces = many_invariant_subspaces(As_V_sparse, find_invariant)
            lifted = map(
                vs -> lift(vs, complement_subspace(linear_span!(V))),
                subspaces)
            lifted = map(
                vs -> append!(vs, deepcopy(V)),
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
    # Gleb: TODO for the future: the restriction is implicitly computed by check_invariance, so
    # it could be done there (and in the sparse way!)
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
    ground = base_ring(first(Vs))

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
