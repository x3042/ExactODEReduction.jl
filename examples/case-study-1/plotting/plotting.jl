# This file was used to produce the plots in the paper

using DifferentialEquations, ModelingToolkit
using ExactODEReduction
using Plots

############
############

# Loading the model from file into our main ODE datastructure
fname = (@__DIR__) * "/../BIOMD0000000365.ode"
ode = load_ODE_fromfile(fname)

############
############

# Converting ODE datastructure into an MTK problem and integrating
(mtkprob, ic, p) = ODEtoMTK(ode)
tspan = (0.0, 1200.0) # timespan from the paper
prob = ODEProblem(mtkprob, ic, tspan, p)
sol = solve(prob, Rosenbrock23())

############
############

begin
    gr()

    linestyles = repeat([:solid, :dash, :dot, :dashdot, :dashdotdot], 3)
    indices = [9, 11, 12, 13, 16, 17, 18, 21, 28]
    colors = distinguishable_colors(
        length(indices), 
        [RGB(0.1,0.9,0.1)]
    );

    n = 10001 # number of timepoints
    ts = range(first(tspan), stop=last(tspan), length=n)

    begin 
        a = plot(
            #size=(800, 600), 
            dpi=400, 
            legendfontsize=9,
            xtickfontsize=8,ytickfontsize=8,
            xguidefontsize=10,
            legend=:right)
        for reli in 1:length(indices)
            idx = indices[reli]
            var = ode.x_vars[idx]
            plot!(
                a,
                sol(ts,idxs=idx), 
                linewidth=3, 
                label=" $var", 
                #color=colors[reli], 
                linestyle=linestyles[reli],
                thickness_scaling = 1
            )
        end
        xaxis!("Time (s)")
        savefig((@__DIR__)*"/figure-1.png")
        plot(a)
    end
end

############
############

reds = find_reductions(ode);
r = reds[5];

############
############

ode_red = new_system(r)
(mtkprob_red, ic_red, p_red) = ODEtoMTK(ode_red)
tspan = (0.0, 1.0) # NOTE the new timespan
prob_red = ODEProblem(mtkprob_red, ic_red, tspan, p_red)
sol_red = solve(prob_red, Rosenbrock23())

############
############

begin
    indices = [1, 3]
    colors = distinguishable_colors(
        length(indices), 
        [RGB(0.1,0.7,0.1)]
    );

    n = 101 # number of timepoints
    ts = range(first(tspan), stop=last(tspan), length=n)

    begin 
        a = plot(
            #size=(800, 600), 
            dpi=400, 
            legendfontsize=9,
            xtickfontsize=8,ytickfontsize=8,
            xguidefontsize=10,
            legend=:right)
        for reli in 1:length(indices)
            idx = indices[reli]
            var = ode_red.x_vars[idx]
            plot!(
                a,
                sol_red(ts,idxs=idx), 
                linewidth=3, 
                label=" $var", 
                color=colors[reli], 
                linestyle=linestyles[reli],
                thickness_scaling = 1
            )
        end
        xaxis!("Time (s)")
        savefig((@__DIR__)*"/figure-2.png")
        plot(a)
    end
end

############
############

begin
    indices = [2]
    colors = distinguishable_colors(
        length(indices), 
        [RGB(0.1,0.9,0.1)]
    );

    n = 101 # number of timepoints
    ts = range(first(tspan), stop=last(tspan), length=n)

    begin 
        a = plot(
            #size=(800, 600), 
            dpi=400, 
            legendfontsize=9,
            xtickfontsize=8,ytickfontsize=8,
            xguidefontsize=10,
            legend=:right)
        for reli in 1:length(indices)
            idx = indices[reli]
            var = ode_red.x_vars[idx]
            plot!(
                a,
                sol_red(ts,idxs=idx), 
                linewidth=3, 
                label=" $var", 
                #color=colors[reli], 
                linestyle=linestyles[reli],
                thickness_scaling = 1
            )
        end
        xaxis!("Time (s)")
        savefig((@__DIR__)*"/figure-3.png")
        plot(a)
    end
end
