
include("../src/ExactODEReduction.jl")
using .ExactOdeReduction

using DifferentialEquations

using Nemo
using Logging

##########################

ode = ExactOdeReduction.@ODEsystem(
       x'(t) = -4//100*x + 10^4*y*z,
       y'(t) = 4//100*x - 10^4*y*z - 3*10^7*y^2,
       z'(t) = 3*10^7*y^2
)

r1 = ExactOdeReduction.find_reduction(ode, [z])

##########################
