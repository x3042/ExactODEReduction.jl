using Logging

logger = Logging.SimpleLogger(stdout, Logging.Info)
global_logger(logger)

include("../src/ExactODEReduction.jl")
using .ExactODEReduction: load_ODEs, construct_jacobians, many_invariant_subspaces, polynormalize, invariant_subspace_1

# e2.ode
fname = "./data/ODEs/testing/fceri_ji/fceri_ji.ode"

equations = load_ODEs(fname)
As = construct_jacobians(equations)

@info "Loaded system of dimension: " size(As[1])

Vs = many_invariant_subspaces(As, backend_algorithm=invariant_subspace_1)
@info "The number of reductions is $(length(Vs))"

println(equations)

for v in Vs
    @info "-----------------------"
    polyform = polynormalize(v, parent(first(keys(equations))))
    @info "Dimenson $(length(polyform))"
    for p in polyform
        @info p
    end
end
