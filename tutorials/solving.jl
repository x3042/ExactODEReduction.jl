
include("../src/ExactODEReduction.jl")
using .ExactOdeReduction

using DifferentialEquations
using Nemo
using Plots

##########################

ode = ExactOdeReduction.@ODEsystem(
    x1'(t) = x1^2 + 2x1*x2,
    x2'(t) = x2^2 + x3 + x4,
    x3'(t) = x2 + x4,
    x4'(t) = x1 + x3
)

r = ExactOdeReduction.find_reduction(ode, [x1])
#=
    r[:new_system] = [y1^2 + y2
                     y1 + y2 + y3
                    2*y1*y3 + y3^2]
=#

##########################

function original_system(x, p, t)
    dx = similar(x)
    x1, x2, x3, x4 = x
    dx[1] = x1^2 + 2x1*x2
    dx[2] = x2^2 + x3 + x4
    dx[3] = x2 + x4
    dx[4] = x1 + x3
    dx
end

function reduced_system(y, p, t)
    dy = similar(y)
    y1, y2, y3 = y
    dy[1] = y1^2 + y2
    dy[2] = y1 + y2 + y3
    dy[3] = 2*y1*y3 + y3^2
    dy
end

##########################

x0    = [0.1, 0.1, 0.1, 0.1]
tspan = (0.0, 1.0)
orig  = ODEProblem(original_system, x0, tspan)
sol1  = DifferentialEquations.solve(orig)
plot(sol1, vars=(1))

y0    = [0.1, 0.2, 0.1]
tspan = (0.0, 1.0)
redu  = ODEProblem(reduced_system, y0, tspan)
sol2   = DifferentialEquations.solve(redu)
plot!(sol2, vars=(3))
