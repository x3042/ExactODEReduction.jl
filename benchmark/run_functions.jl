
include("../src/api.jl")


function uwu()

    for (i, (filename, dim, size, data)) in enumerate(load_COO_if(from_dim=50, to_dim=60))

        @info "loaded $filename of dimension $dim×$dim"

        #=if filename != "BIOMD0000000072.json"
            continue
        end=#

        # matrices
        As = [from_COO(x..., QQ) for x in data]

        V1 = find_basis(deepcopy(As))

        R = find_radical_2(V1)

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

    for (i, (filename, system)) in enumerate(load_ODEs_if(from_size=60, to_size=70))

        @info "$i-th, loaded a system $filename of size $(length(system))"

        equations = [system[x] for x in sort(collect(keys(system)), by=string)]

        As = construct_jacobians(equations)

        global Vs
        Vs = many_invariant_subspaces(As, backend_algorithm=invariant_subspace_1)
        println(length(Vs))

        for v in Vs
            println("-----------------------")
            polyform = polynormalize(v, parent(first(equations)))
            println(length(polyform))
            println(join(string.(polyform), "\n"))
            println("-----------------------")
        end

        break
    end

end


# rororo()
# uwu()
# owo()

#------------------------------------------------------------------------------

#=
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

Vs = many_invariant_subspaces([B1])
println(length(Vs), "\n", Vs)
=#
