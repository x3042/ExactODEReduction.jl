
include("../src/ExactODEReduction.jl")
using .ExactODEReduction

using Catalyst
using DifferentialEquations

using Nemo
using Logging

##########################

R, (e, s, es, p, kr, kf, kc) = PolynomialRing(QQ, ["e", "s", "es", "p", "kr", "kf", "kc"])

# Michaelis Menten kinetics
parametric = true
if parametric
    de  = -kf*e*s + kr*es+kc*es
    ds  = -kf*e*s + kr*es
    des = kf*e*s - kr*es - kc*es
    dp  = kc*es
    dkr = R(0)
    dkf = R(0)
    dkc = R(0)
else
    de  = -1*e*s + 1*es + 1*es
    ds  = -1*e*s + 1*es
    des = 1*e*s - 1*es - 1*es
    dp  = 1*es
    dkr = R(0)
    dkf = R(0)
    dkc = R(0)
end

# note that de = -des, so that system is linearly dependent

system = [
    de, ds, des, dp, dkr, dkf, dkc
]

#=
    We expect at least one reduction for enzyme which is a catalyst,
    meaning its total concentration e + es is constant
=#

rs = ExactODEReduction.find_reduction(system, loglevel=Logging.Info)

#=
    We obtain :new_vars = [e + es, s + es + p, kr, kf, kc]
    These are constant, so reduced system is just zero
=#
