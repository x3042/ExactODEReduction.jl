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

# 5-element Vector{Dict{Symbol, Vector{Any}}}:
#  Dict(:new_system => [0], :new_vars => [kc])
#  Dict(:new_system => [0, 0], :new_vars => [kc, kf])
#  Dict(:new_system => [0, 0, 0], :new_vars => [kc, kf, p + s + es])
#  Dict(:new_system => [0, 0, 0, 0], :new_vars => [kc, kf, p + s + es, e + es])
#  Dict(:new_system => [0, 0, 0, 0, 0], :new_vars => [kc, kf, p + s + es, e + es, kr])