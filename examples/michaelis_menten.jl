#=
    Example file:
    Michaelis Menten kinetics
=#

# 1. Import the package
using ExactODEReduction

# Michaelis Menten kinetics (with parameters kf, kc, and kr)
system = @ODEsystem(
    e'(t)  = -kf*e*s + kr*es+kc*es,
    s'(t)  = -kf*e*s + kr*es,
    es'(t) = kf*e*s - kr*es - kc*es,
    p'(t)  = kc*es
)

# Note that de = -des, so the system is linearly dependent.
# Thus, we expect at least one reduction for enzyme which is a catalyst,
# for the total concentration of e + es is constant

# 4. Call find_reductions providing the system
reductions = find_reductions(system)

# The smallest reduction
@show reductions[1];
## Prints
#
# reductions[1] = Reduction of dimension 1.
# New system:
# y1'(t) = 0
# New variables:
# y1 = e + es
