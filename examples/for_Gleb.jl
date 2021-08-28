
#=
    Examples file
=#

using Nemo

include("../src/ExactODEReduction.jl")
using .ExactODEReduction: construct_jacobians, invariant_subspace, polynormalize

# we are using __randomized_wiedemann_minpoly to speed up computations, so,
# an example may fail occasionally

#------------------------------------------------------------------------------

# Example 1

R, (x₁, x₂, x₃, x₄) = QQ["x₁", "x₂", "x₃", "x₄"]

system = [
    x₁^2 + 2x₁*x₂,  # derivative of x1
    x₂^2 + x₃ + x₄, # derivative of x2
    x₂ + x₄,        # derivative of x3
    x₁ + x₃         # derivative of x4
]

# construct jacobians of the system to obtain matrices
matrices = construct_jacobians(system)

# find an invariant subspaces of the matrices
invariants = invariant_subspace(matrices)

println(invariants)

# transform it back ti polynomial form
transformation = polynormalize(invariants, R)

@assert transformation == [x₁ + x₂, x₃ + x₄]

#------------------------------------------------------------------------------

# Example 2
R, (x₁, x₂, x₃) = QQ["x₁", "x₂", "x₃"]

system = [
    x₂^2 + 4x₂*x₃ + 4x₃^2,  # derivative of x1
    4x₃ - 2x₁,              # derivative of x2
    x₁ + x₂                 # derivative of x3
]

# construct jacobians of the system to obtain matrices
matrices = construct_jacobians(system)

# find an invariant subspaces of the matrices
invariants = invariant_subspace(matrices)

# transform it back ti polynomial form
transformation = polynormalize(invariants, R)

# maybe it will be good to normalize, say,
# by the coef of the first variable
@assert transformation == [x₂ + 2x₃]

#------------------------------------------------------------------------------
