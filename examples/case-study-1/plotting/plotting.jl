# This file was used to produce the data for the plots in the paper

import Pkg; Pkg.activate(temp=true);
Pkg.develop(path=(@__DIR__)*"/../../../")
Pkg.add("DifferentialEquations"); Pkg.add("ModelingToolkit")

using DifferentialEquations, ModelingToolkit
using ExactODEReduction

############
############

# Loading the model from file into our ODE datastructure
modelname = (@__DIR__) * "/../BIOMD0000000365.ode"
ode = load_ODE_fromfile(modelname)

############
############

solver = Rosenbrock23()

# Converting ODE datastructure into an MTK problem and integrating it
(mtksystem, initialconds, params) = ODEtoMTK(ode)
# Timespan from the paper
#   https://pubs.acs.org/doi/10.1021/bi981966e
timespan = (0.0, 1200.0)
problem = ODEProblem(mtksystem, initialconds, timespan, params)
solution = solve(problem, solver)
@assert SciMLBase.successful_retcode(solution.retcode)

############
############
# Searching for reductions

reductions = find_reductions(ode)
# The fifth reduction is interesting
reduced = reductions[5]

@show new_vars(reduced)
# New states are y1, y2, y3
# y1 => APC
# y2 => LC + Va + Va3 + Va36 + Va5 + Va53 + Va536 + Va56 + VaLCA1
# y3 => LC_APC + Va36_APC + Va3_APC + Va536_APC + Va53_APC + Va56_APC + Va5_APC + VaLCA1_APC + Va_APC

ode_reduced = new_system(reduced)
(mtkproblem_reduced, initialconds_reduced, params_reduced) = ODEtoMTK(ode_reduced)
timespan_reduced = (0.0, 1.0) # NOTE the new timespan
problem_reduced = ODEProblem(mtkproblem_reduced, initialconds_reduced, timespan_reduced, params_reduced)
solution_reduced = solve(problem_reduced, solver)
@assert SciMLBase.successful_retcode(solution_reduced.retcode)

############
############
# Write the solutions to ODEs to files

N = length(states(mtksystem))
@show states(mtksystem)

state_to_index = Dict(states(mtksystem) .=> 1:N)
string_to_state = str -> states(mtksystem)[findfirst(==(str*"(t)"), map(string, states(mtksystem)))]
@assert state_to_index[string_to_state("APC")] == 1

y1_states = map(string_to_state, ["APC"])
y2_states = map(string_to_state, ["LC", "Va", "Va3", "Va36", "Va5", "Va53", "Va536", "Va56", "VaLCA1"])
y3_states = map(string_to_state, ["LC_APC", "Va36_APC", "Va3_APC", "Va536_APC", "Va53_APC", "Va56_APC", "Va5_APC", "VaLCA1_APC", "Va_APC"])

plot_ntimestamps = 30

datadir = (@__DIR__)*"/plot_data"
mkpath(datadir)

begin
    plot_timespan = range(first(timespan), stop=last(timespan), length=plot_ntimestamps)
    for state in y2_states
        index = state_to_index[state]
        filename = "y2_$(string(state)[1:end-3]).dat" # erase "(t)"
        out = open(datadir*"/"*filename, "w")
        println(out, "t\ty")
        for (t, y) in zip(plot_timespan, solution(plot_timespan, idxs=index))
            println(out, "$t\t$y")
        end
        close(out)
    end
end

begin
    plot_timespan = range(first(timespan), stop=last(timespan), length=plot_ntimestamps)
    for state in y3_states
        index = state_to_index[state]
        filename = "y3_$(string(state)[1:end-3]).dat" # erase "(t)"
        out = open(datadir*"/"*filename, "w")
        println(out, "t\ty")
        for (t, y) in zip(plot_timespan, solution(plot_timespan, idxs=index))
            println(out, "$t\t$y")
        end
        close(out)
    end
end

begin
    plot_timespan = range(first(timespan_reduced), stop=last(timespan_reduced), length=plot_ntimestamps)
    for index in 1:3
        filename = "y$index.dat" 
        out = open(datadir*"/"*filename, "w")
        println(out, "t\ty")
        for (t, y) in zip(plot_timespan, solution_reduced(plot_timespan, idxs=index))
            println(out, "$t\t$y")
        end
        close(out)
    end
end
