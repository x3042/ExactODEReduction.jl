
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


function uwu()

    for (i, (filename, dim, size, data)) in enumerate(load_COO_if(from_dim=20, to_dim=25))

        @info "loaded $filename of dimension $dim×$dim"

        #=if filename != "BIOMD0000000072.json"
            continue
        end=#

        # matrices
        As = [from_COO(x..., QQ) for x in data]

        if length(As) > 2
            A1 = pop!(As)
            A2 = pop!(As)
            push!(As, A1 * A2)
        end

        V1 = find_basis(deepcopy(As))

        ### invariant_subspaces(As)

        @assert check_invariance!(As, basis(V1))

    end

end


function owo()

    for (i, (filename, system)) in enumerate(load_ODEs_if(from_size=1, to_size=30))

        @info "$i-th, loaded a system $filename of size $(length(system))"

        equations = [system[x] for x in sort(collect(keys(system)), by=string)]

        V = invariant_subspaces(equations)

        R = parent(equations[1])

        @assert check_invariance!(construct_jacobians(equations), deepcopy(V))

        polyform = polynormalize(V, parent(first(equations)))

        println(length(polyform))
        println(join(string.(polyform), "\n"))
    end

end

uwu()
# owo()
