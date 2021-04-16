
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

    invariant = invariant_subspaces(matrices)

    # return the polyform to perform the substitution
    polynormalize(invariant, parent(first(system)))
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
    else
        @info "radical is trivial, using randomized algorithm"
        invariant = invariant_subspace_randomized(algebra)
    end

    # looks horrible
    invariant = [[invariant[:, i]...] for i in 1:size(invariant, 2)]

    isempty(invariant) && @warn "no invariant subspaces"

    invariant
end

#------------------------------------------------------------------------------


function uwu()

    for (filename, dim, size, data) in load_COO_if(from_dim=20, to_dim=30)

        println()
        @info "loaded $filename of dimension $dim×$dim"

        # matrices
        As = [from_COO(x..., QQ) for x in data]

        V = invariant_subspaces(As)

        println(length(V))

    end

end

# uwu()
