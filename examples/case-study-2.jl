#=
    Examples file:
    Case study 2 from the paper.
    Model of cell death.

    The model is described in the file
    BIOMD0000000407.ode in this directory.
=#

using DifferentialEquations
using Plots
using Nemo
include("../src/ExactODEReduction.jl")

### Finding reductions ###

# Load the ODE system from the file
fname = "/home/ademin/exactred/Exact-reduction-of-ODE-systems/examples/BIOMD0000000407.ode"
ode = ExactODEReduction.load_ODE(fname)
@info "Loaded system" ode

# Call find_reductions providing the loaded system 
# (might take some time)
reductions = ExactODEReduction.find_reductions(ode)
@info "Found reductions" reductions

# Reduction referred to in the paper
reduction = reductions[8]
@info "New system" reduction[:new_system]
@info "New variables" reduction[:new_vars]
#=
    reduction[:new_vars] = [
    y1=    k6/k1*A20 - k5/k3*FLIP,
    y2=    k6*A20_mRNA - k5*IkBa_mRNA,
    ...
    ]
    
    reduction[:new_system] = [
    y1'=   y2 + k2k6/k1 - k4k5/k3,
    y2'=   0,
    ...
    ]
=#

### Checking the consistency of numerical simulation ###

Float64(x::Nemo.fmpq) = Float64(numerator(x)) / Float64(denominator(x))
# the system to be solved
function f!(du, u, p, t)
    for i in eachindex(du)
        du[i] = Float64(evaluate(p[i], map(c -> rationalize(BigInt, c), u)))
    end
    nothing
end

# species present in the selected reduction
interesting_species = [
    ExactODEReduction.A20,
    ExactODEReduction.A20_mRNA,
    ExactODEReduction.FLIP,
    ExactODEReduction.IkBa_mRNA
]

# Solve the original system

xs = ode.x_vars; n = length(xs)
sort!(xs, by=x -> !(x in interesting_species))
eqs = [ode.x_equations[xs[i]] for i in 1:n]
var2idx = Dict((x => i for (i, x) in enumerate(xs)))

# initial conds.
# I assume initial conditions do not matter much
# for checking the consistency (?)
u0 = map(abs, [
    rand(Float64),
    rand(Float64),
    rand(Float64),
    rand(Float64),
    rand(Float64, n - length(interesting_species))...
])

start, stop = 0.0, 10.0
tspan = (start, stop)
p = eqs

prob = ODEProblem(f!, u0, tspan, p, dense=true)
sol = DifferentialEquations.solve(prob)

# sol - solution of the original system,
# For example, the solution for A20
@show sol[var2idx[ExactODEReduction.A20], :]

plt = nothing
for i in 1:length(interesting_species)
    global plt
    plt = if i == 1
        plot(sol[i, :], label=xs[i], xaxis="t", title="From the 50-dim simulation")
    else
        plot!(sol[i, :], label=xs[i])
    end
end
plt

### solve the reduced system ###

xs_r = gens(parent(first(reduction[:new_system])))
n_r = length(xs_r)
eqs_r = [reduction[:new_system][i] for i in 1:n_r]

# new initial conditions, inferred as
# u0_r[i] = evaluate new_var[i] at u0
u0_r = [
    Float64(evaluate(v, map(c -> rationalize(BigInt, c), u0)))
    for v in reduction[:new_vars]
]
p_r = eqs_r

prob_r = ODEProblem(f!, u0_r, tspan, p_r, dense=true)
sol_r = DifferentialEquations.solve(prob_r)

# y1'(t) = sol_r[1,:]
# y2'(t) = sol_r[2,:]
@show sol_r[1, :]
@show sol_r[2, :]  # this one should be constant
@assert allequal(sol_r[2, :])

plt_r = nothing
for i in 1:2
    global plt_r
    plt_r = if i == 1
        plot(sol_r[i, :], label=xs_r[i], xaxis="t", title="From the reduction")
    else
        plot!(sol_r[i, :], label=xs_r[i])
    end
end
plt_r

### check that the results coincide ?

# sol_c[i] is newvar[i] evaluated at sol

sol_c = []
for i in 1:2
    newvar = reduction[:new_vars][i]
    tseries = [
        Float64(coeff(t, 1)) .* sol[var2idx[leading_monomial(t)], :]
        for t in terms(newvar)
    ]
    push!(sol_c, sum(tseries))
end

@show sol_c[1]   # inferred y1'
@show sol_c[2]   # inferred y2'

plt_c = nothing
for i in 1:2
    global plt_c
    plt_c = if i == 1
        plot(sol_c[i, :], label=xs_r[i], xaxis="t", title="From the substitution")
    else
        plot!(sol_c[i, :], label=xs_r[i])
    end
end
plt_c
