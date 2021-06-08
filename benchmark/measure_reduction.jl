

include("../src/api.jl")



#------------------------------------------------------------------------------

using Plots
using Nemo
using Distributions

#------------------------------------------------------------------------------

# basis_small = []
# basis_average = []
# basis_big = []

reductions = []
function uwuwu()

    for (i, (filename, x, y, system)) in enumerate(load_COO_if(from_dim=100, to_dim=130))

        @info "$i-th, loaded a system $filename of size $(length(system))"

        if i in [0]
            continue
        end

        matrices = [
            from_COO(system[1][1], system[1][2], ms[3:end]..., QQ)
            for ms in system
        ]

        sz1 = system[1][1]

        # matrices
        V1 = invariant_subspace(deepcopy(matrices))

        sz2 = length(V1)

        push!(reductions, [filename, sz1, sz2])
        if i > 30
            break
        end

    end
end

uwuwu()

# "BIOMD0000000147.json", 26, 5
# "BIOMD0000000407.json", 50, 4
# "MODEL1108260014.json", 82, 24
# "BIOMD0000000559.json", 101, 14

# plot(1:length, times_W_det, label="W. det", ylabel="time, s",  xlabel="order, n", title="rand vs det, 4 nnz per row")
#plot!(sizes, times_W_rand, label="W. rand")


#------------------------------------------------------------------------------
