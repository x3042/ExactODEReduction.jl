#=
    Examples file:
    Michaelis Menten kinetics
=#

using ExactODEReduction

# Michaelis Menten kinetics (with parameters kf, kc, and kr)
system = @ODEsystem(
    e'(t)  = -kf*e*s + kr*es+kc*es,
    s'(t)  = -kf*e*s + kr*es,
    es'(t) = kf*e*s - kr*es - kc*es,
    p'(t)  = kc*es
)

# Note that de = -des, so that the system is linearly dependent.
# Thus, we expect at least one reduction for enzyme which is a catalyst,
# meaning its total concentration e + es is constant

reductions = find_reductions(system)

@info "Found reductions" reductions
@info "The smallest reduction" reductions[1]
