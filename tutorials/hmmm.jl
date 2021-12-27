
include("../src/ExactODEReduction.jl")
using .ExactOdeReduction

using DifferentialEquations

using Nemo
using Logging

##########################

ode = ExactOdeReduction.@ODEsystem(
       x'(t) = lm - d * x(t) - beta * x(t) * v(t),
       y'(t) = beta * x(t) * v(t) - a * y(t),
       v'(t) = k * y(t) - u * v(t),
       w'(t) = c * x(t) * y(t) * w(t) - c * q * y(t) * w(t) - b * w(t),
       z'(t) = c * q * y(t) * w(t) - h * z(t),
)

r = ExactOdeReduction.find_reduction(ode, [x, y])
println(r)
