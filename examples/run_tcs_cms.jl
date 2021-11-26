using Logging

logger = Logging.SimpleLogger(stdout, Logging.Info)
global_logger(logger)

include("../src/ExactODEReduction.jl")
using .ExactODEReduction: load_ODEs_if, construct_jacobians,
        many_invariant_subspaces, polynormalize, invariant_subspace_1,
        load_ODEs_recursive_if, normalizepath

using .ExactODEReduction.Nemo
using .ExactODEReduction.AbstractAlgebra

if !isdefined(Main, :cache)
    cache = Dict()
end

function run_tcs_cms()

    for (i, (filename, system)) in enumerate(load_ODEs_if(from_size=1, to_size=50))

        @info "$i-th, loaded a system $filename of size $(length(system))"

        As = construct_jacobians(system)

        if !haskey(cache, system)
            Vs = invariant_subspace_1(As)
            if length(Vs) != 0
                cache[filename] = [length(gens(parent(first(keys(system))))), length(Vs), Vs]
            end
        end

        println("Found $(cache[filename][1]) => $(cache[filename][2]) reduction")

        # break
    end

end

run_tcs_cms()
