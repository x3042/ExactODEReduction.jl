
#=
    Examples file
=#

using Nemo

include("../src/ExactODEReduction.jl")
using .ExactODEReduction: construct_jacobians, invariant_subspace, polynormalize

#------------------------------------------------------------------------------

R, (x₁, x₂, x₃) = QQ["x₁", "x₂", "x₃"]

system = [
    x₂^2 + 4x₂*x₃ + 4x₃^2,  # derivative of x1
    4x₃ - 2x₁,              # derivative of x2
    x₁ + x₂                 # derivative of x3
]

# construct jacobians of the system to obtain matrices
matrices = construct_jacobians(system)

for x in matrices
    println(x)
    println()
end

println("###########")

# find an invariant subspaces of the matrices
invariants = invariant_subspace(matrices)

println(invariants)

# transform it back ti polynomial form
transformation = polynormalize(invariants, R)

@assert transformation == [x₂ + 2x₃]

#------------------------------------------------------------------------------
