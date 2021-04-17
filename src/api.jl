
# Exact Reduction of ODE systems, interface definitions

include("../src/radical_with_testing.jl")

#------------------------------------------------------------------------------

# Interface To be reworked later,
#
#

# Key part of the interface,
# computes the invariant subspaces of the given system
#
# returns a common invariant subspace represented by basis equations
function invariant_subspaces(system::AbstractArray{T}) where {T<:MPolyElem}
    isempty(system) && error("empty system invariants are ill-defined")

    # construct jacobians for each variable
    matrices = construct_jacobians(system)

    invariant_subspaces(matrices)
end

function invariant_subspaces(matrices::AbstractArray{T}) where {T<:AbstractSparseMatrix}
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
        invariant = invariant_subspace_semisimple(algebra)
    end

    isempty(invariant) && @warn "no invariant subspaces"

    invariant
end

#------------------------------------------------------------------------------

#=
extreme = []
small = []
average = []
big = []
standard = []
=#

function uwu()

    for (filename, dim, size, data) in load_COO_if(from_dim=2, to_dim=10)

        println()
        @info "loaded $filename of dimension $dim×$dim"

        # matrices
        As = [from_COO(x..., QQ) for x in data]


        V = invariant_subspaces(As)

        @assert check_invariance!(As, V)

        println(length(V))

    end

end

function owo()

    for (filename, system) in load_ODEs_if(from_size=1, to_size=70)

        println()
        @info "loaded a system $filename of size $(length(system))"

        equations = collect(values(system))

        V = invariant_subspaces(equations)

        @assert check_invariance!(construct_jacobians(equations), deepcopy(V))

        polyform = polynormalize(V, parent(first(equations)))

        println(length(polyform))
        println(polyform)
    end

end

# uwu()
owo()
