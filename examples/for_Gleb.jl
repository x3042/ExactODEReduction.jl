
#=
    Examples file
=#

include("../src/api.jl")

import Nemo: QQ

#------------------------------------------------------------------------------

# Example 1

R, (x₁, x₂, x₃, x₄) = QQ["x₁", "x₂", "x₃", "x₄"]

system = [
    x₁^2 + 2x₁*x₂,  # derivative of x1
    x₂^2 + x₃ + x₄, # derivative of x2
    x₂ + x₄,        # derivative of x3
    x₁ + x₃         # derivative of x4
]

invariants = invariant_subspaces(system)
@assert invariants == [x₁ + x₂, x₃ + x₄]

#------------------------------------------------------------------------------

# Example 2
R, (x₁, x₂, x₃) = QQ["x₁", "x₂", "x₃"]

system = [
    x₂^2 + 4x₂*x₃ + 4x₃^2,  # derivative of x1
    4x₃ - 2x₁,              # derivative of x2
    x₁ + x₂                 # derivative of x3
]

invariants = invariant_subspaces(system)
# maybe it will be good to normalize, say,
# by the coef of the first variable
@assert invariants == [1//2*x₂ + x₃]

#------------------------------------------------------------------------------
