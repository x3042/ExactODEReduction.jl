
include("../src/radical_with_testing.jl")

using AbstractAlgebra

#------------------------------------------------------------------------------

# computes the invariant subspaces of the given system
#
# returns a common invariant subspace represented by basis equations
function invariant_subspace(system::AbstractArray{T}) where {T<:MPolyElem}
    isempty(system) && error("empty system invariants are ill-defined")

    # construct jacobians for each variable
    matrices = construct_jacobians(system)

    invariant_subspace(matrices)
end

function invariant_subspace(matrices::AbstractArray{T}) where {T<:AbstractSparseMatrix}
    isempty(matrices) && error("empty system invariants are ill-defined")

    # generate a basis for the Algebra
    algebra = find_basis(deepcopy(matrices))

    # find the radical of the Algebra
    @info "computing the radical.."
    @time radical = find_radical(algebra)

    # find an invariant subspace
    if length(radical) != 0
        @info "radical is nontrivial, computing the general kernel"
        invariant = general_kernel(map(to_dense, radical))
        invariant = [
            from_dense([invariant[:, i]...], QQ)
            for i in 1:size(invariant, 2)
        ]
    else
        @info "radical is trivial, using randomized algorithm"
        if dim(algebra) != 0
            invariant = invariant_subspace_semisimple(algebra)
        else
            invariant = fullspace(size(first(matrices), 1), base_ring(first(matrices)))
        end
    end

    if isempty(invariant)
        @warn "no invariant subspaces"
    else
        @info "$(length(invariant)) dimensional subspace found"
    end

    for v in invariant
        scale!(v, lcm(v))
    end

    invariant
end

#------------------------------------------------------------------------------

function __invariant_subspace_2(matrices::AbstractArray{T}, hint) where {T<:AbstractSparseMatrix}
    isempty(matrices) && error("empty system invariants are ill-defined")

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
                # i % 500 == 0 && print(".")

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

function invariant_subspace_2(matrices::AbstractArray{T}) where {T<:AbstractSparseMatrix}
    n = size(first(matrices), 1)
    ground = base_ring(first(matrices))

    is = rand(1:n, 2)

    vs = [ unit_sparsik(n, i, ground) for i in is ]

    @info "hint" vs
    return __invariant_subspace_2(matrices, vs)
end

#------------------------------------------------------------------------------

function __many_invariant_subspaces(
        As::AbstractArray{T},
        find_invariant)   where {T<:AbstractSparseMatrix}

    n = size(first(As), 1)
    ground = base_ring(first(As))

    # search for a subspace
    V = find_invariant(As)

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
        subspaces = __many_invariant_subspaces(As_V_sparse, find_invariant)
        append!(toreturn, map(vs -> lift(vs, V), subspaces))
    end

    if length(V) + 1 < n # < n
        As_V = factorize(As, V)
        if !isempty(As_V)
            As_V_sparse = map(x-> from_dense(x, ground), map(Array, As_V))
            subspaces = __many_invariant_subspaces(As_V_sparse, find_invariant)
            lifted = map(
                vs -> [
                    lift(vs, augment_subspace(linear_span!(V)))...,
                    V...
                ],
                subspaces)
            append!(toreturn, lifted)
        end
    end

    #=
    @info "" toreturn
    for (i, U) in enumerate(collect(toreturn))
        for (j, W) in enumerate(collect(toreturn))
            if j <= i
                continue
            end
            UW  = basis(linear_span!([U..., W...]))
            @info "U + W" U W
            @info "merging.." UW

            if length(UW) > 1
                @info "restricting.."
                As_V = restrict(As, UW)
                As_V_sparse = map(x-> from_dense(x, ground), map(Array, As_V))
                subspaces = __many_invariant_subspaces(As_V_sparse, find_invariant)
                append!(toreturn, map(vs -> lift(vs, UW), subspaces))
                @info "lifted to " toreturn[end]
            end

            if length(UW) + 1 < n
                @info "factoring.."
                As_V = factorize(As, UW)
                if !isempty(As_V)
                    As_V_sparse = map(x-> from_dense(x, ground), map(Array, As_V))
                    subspaces = __many_invariant_subspaces(As_V_sparse, find_invariant)
                    append!(toreturn, map(vs -> lift(vs, augment_subspace(linear_span!(UW))), subspaces))
                    @info "lifted to " toreturn[end]
                end
            end
        end
    end
    =#

    for vs in toreturn
        if !check_invariance!(deepcopy(As), deepcopy(vs))
            @assert false
        end
    end

    return toreturn
end

# finds some common invariant subspaces of the given matrices
# using the given default method for finding invaiant subspaces
function many_invariant_subspaces(
    As::AbstractArray{T};
    find_invariant=invariant_subspace)  where {T<:AbstractSparseMatrix}

    n = dim(first(As))
    ground = field(first(As))

    __many_invariant_subspaces(As, find_invariant)
end

#------------------------------------------------------------------------------

function restrict(As::AbstractArray, vs)
    n = size(first(As), 1)
    ground = base_ring(first(As))

    MSpace = AbstractAlgebra.Generic.MatrixSpace(ground, n, length(vs))

    Asvs = [
        MSpace(hcat([ to_dense(A * v) for v in vs ]...))
        for A in As
    ]
    matrix = MSpace(hcat([ to_dense(v) for v in vs ]...))

    [
        AbstractAlgebra.Generic.solve(matrix, Avs)
        for Avs in Asvs
    ]
end

function factorize(As::AbstractArray, vs)
    n = size(first(As), 1)
    ground = base_ring(first(As))

    MSpace = AbstractAlgebra.Generic.MatrixSpace(ground, n, n - length(vs))
    MSpaceplus = AbstractAlgebra.Generic.MatrixSpace(ground, n, n)

    complement = augment_subspace(linear_span!(vs))

    Asvs = [
        MSpace(hcat([to_dense(A * v) for v in complement ]...))
        for A in As
    ]

    #!
    matrix = MSpaceplus(hcat(
        map(to_dense, complement)...,
        map(to_dense, vs)...)
    )


    ans = [
        AbstractAlgebra.Generic.solve(matrix, Avs)[1:end-length(vs), :]
        for Avs in Asvs
    ]
    return ans
end


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

    lifted
end


#------------------------------------------------------------------------------

C2 = @sparse [
    2 1 0;
    2 -1 3;
    0 0 1;
]

C1 = @sparse [
    1 0 0;
    0 2 2;
    0 2 2;
]

A1 = @sparse [
    1 1 0 0;
    1 1 0 0;
    0 0 1 2;
    0 0 0 1;
]
A2 = @sparse [
    0 1 0 0;
    1 0 0 0;
    0 0 0 2;
    0 0 2 0;
]


B1 = @sparse [
    0 0 0 0 0;
    0 0 0 0 0;
    0 0 3 0 0;
    0 0 3 3 1;
    0 0 0 0 2;
]
