
# Exact Reduction of ODE systems, interface definitions

include("../src/radical_with_testing.jl")

#------------------------------------------------------------------------------

# Interface To be reworked later,
#
#


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

        ### invariant_subspace(As)

        @assert check_invariance!(As, basis(V1))

    end

end


function owo()

    for (i, (filename, system)) in enumerate(load_ODEs_if(from_size=1, to_size=30))

        @info "$i-th, loaded a system $filename of size $(length(system))"

        equations = [system[x] for x in sort(collect(keys(system)), by=string)]

        V = invariant_subspace(equations)

        R = parent(equations[1])

        @assert check_invariance!(construct_jacobians(equations), deepcopy(V))

        polyform = polynormalize(V, parent(first(equations)))

        println(length(polyform))
        println(join(string.(polyform), "\n"))
    end

end


Vs = []
function rororo()

    for (i, (filename, dim, size, data)) in enumerate(load_COO_if(from_dim=50, to_dim=60))

        @info "loaded $filename of dimension $dim×$dim"

        #=if filename != "BIOMD0000000072.json"
            continue
        end=#

        # matrices
        As = [from_COO(x..., QQ) for x in data]

        global Vs
        Vs = many_invariant_subspaces(As, find_invariant=invariant_subspace_2)
        println(length(Vs))

        #=for v in Vs
            println("-----------------------")
            polyform = polynormalize(v, parent(first(equations)))
            println(length(polyform))
            println(join(string.(polyform), "\n"))
            println("-----------------------")
        end=#

        break
    end

end


rororo()

# uwu()
# owo()
