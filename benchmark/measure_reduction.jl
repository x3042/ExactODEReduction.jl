
include("../src/ExactODEReduction.jl")

#------------------------------------------------------------------------------

using Plots
using Nemo
using Distributions

#------------------------------------------------------------------------------

function uwuwu()

    for (i, (filename, x, y, system)) in enumerate(load_COO_if(from_dim=20, to_dim=30))

        @info "$i-th, loaded a system $filename of size $(length(system))"

        matrices = [
            from_COO(system[1][1], system[1][2], ms[3:end]..., QQ)
            for ms in system
        ]

        # matrices
        reduction = ExactODEReduction.find_some_reduction(deepcopy(matrices))

    end
end

uwuwu()



#------------------------------------------------------------------------------
