#=
    Examples file:
    code from project README.md
=#

# 1. Import the package
using ExactODEReduction

# 2. Construct the system
odes = @ODEsystem(
  x1'(t) = x1^2 + 2x1*x2,
  x2'(t) = x2^2 + x3 + x4,
  x3'(t) = x2 + x4,
  x4'(t) = x1 + x3
)

# 3. Call find_reductions providing the system
reductions = find_reductions(odes)

# which returns the list of possible reductions. You will get the following result
# 2-element Vector{Dict{Symbol, Vector{Any}}}:
#  Dict(:new_system => [y1^2 + y2, y1 + y2], :new_vars => [x2 + x1, x3 + x4])
#  Dict(:new_system => [y1^2 + y2, y1 + y2 + y3, 2*y1*y3 + y3^2], :new_vars => [x2, x3 + x4, x1])

# Notice that the first reduction is the same as we have seen earlier.

# We may also want to preserve some variables or their linear combinations in the reduced system. 
# It is possible to pass such linear forms in the observables array as a parameter using find_smallest_constrained_reduction
find_smallest_constrained_reduction(odes, observables=[x1])

# For example, the above code will search for a reduction where x1 is present amongst new variables, resulting into
# Dict{Symbol, Vector{Nemo.fmpq_mpoly}} with 2 entries:
#  :new_system => [y1^2 + y2, y1 + y2 + y3, 2*y1*y3 + y3^2]
#  :new_vars   => [x2, x3 + x4, x1]
