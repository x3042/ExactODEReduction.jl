using Logging

logger = Logging.SimpleLogger(stdout, Logging.Info)
global_logger(logger)

include("../src/ExactODEReduction.jl")
using .ExactODEReduction: load_ODEs, construct_jacobians,
        many_invariant_subspaces, polynormalize, invariant_subspace_1,
        load_ODEs_recursive_if, normalizepath

using .ExactODEReduction.Nemo
using .ExactODEReduction.AbstractAlgebra

if !isdefined(Main, :cache)
    cache = Dict()
end

function run_tcs_cms()

    for (i, (filename, system)) in enumerate(load_ODEs_recursive_if("data/TCS_CMSB"))

        @info "$i-th, loaded a system $filename of size $(length(system))"

        As = construct_jacobians(system)

        if !haskey(cache, system)
            Vs = many_invariant_subspaces(As, backend_algorithm=invariant_subspace_1)
            cache[system] = Vs
        end

        println("System $system")
        println("Found $(length(cache[system])) invariant subspaces")

        for v in cache[system]
            println("-----------------------")
            polyform = polynormalize(v, parent(first(first(system))))
            println(length(polyform))
            println(join(string.(polyform), "\n"))
            println("-----------------------")
        end

        # break
    end

end

run_tcs_cms()
