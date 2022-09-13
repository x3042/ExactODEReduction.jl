
include("../../src/ExactODEReduction.jl")

#------------------------------------------------------------------------------

using Nemo
using Distributions
using Printf
using Dates
using Logging

#------------------------------------------------------------------------------

const cache = Dict()

function uwuwu(from_size, to_size)
    if (from_size, to_size) in keys(cache)
        dataset = cache[from_size, to_size][1]
    else    
        dataset = ExactODEReduction.load_ODEs_recursive_if("/data/ODEs/",from_size=from_size, to_size=to_size)
    end

    outputs = []
    all_reductions = []
    for  (i, (filename, system)) in enumerate(dataset)
        fname = "experiment_3/data/$(filename).log"

        @info "$i-th, loaded a system $filename of size $(length(system))"
        
        ODE = ExactODEReduction.ODE{fmpq_mpoly}(system)
        
        reductions = []
        
        fnamerel = "/home/sumiya11/exactreduction/Exact-reduction-of-ODE-systems/benchmark/$fname"
        redirect_stdio(stderr=fnamerel, stdout=fnamerel) do
            append!(reductions, ExactODEReduction.find_reductions(ODE, loglevel=Logging.Debug))
        end
        # end

        push!(all_reductions, reductions)
        push!(outputs, fname)
    end
    
    times = ExactODEReduction.dump_times()

    cache[from_size, to_size] = (dataset, all_reductions, times, outputs)
end

#------------------------------------------------------------------------------

function isinteresting(red)
    newvars = red[:new_vars]
    newsystem = red[:new_system]
    # if has non-basis vectors in new variables
    if any(newvar -> length(newvar) > 1, newvars)
        return (true, "Yes")
    end
    # if has coefficients != 1
    if any(newvar -> any(!isone, coefficients(newvar)), newvars)
        return (true, "Yes")
    end
    return (false, "No")
end

function hasinterestingreductions(reductions)
    for red in reductions
        flag, msg = isinteresting(red)
        if flag
            return (flag, msg)
        end
    end
    return (false, "No")
end

function write_md(sizes)
    md = "#$(now())\n\n"
    md *= "## Reductions for `find_reductions`.\n"
    md *= "Systems of sizes from $(sizes[1]) to $(sizes[2]).\n\n"

    md *= "### Resulting reductions\n"
    
    md *= "| System | Dimension | Interesting reductions? | Logs |\n"
    md *= "| ------ | --------- | ----------------------- | ---- |\n"

    for (system, reductions, logfilename) in zip(cache[sizes][1], cache[sizes][2], cache[sizes][4])
        md *= "| $(system[1]) | $(length(system[2]))"
        
        has, msg = hasinterestingreductions(reductions)
        if has
            md *= "| [$msg](https://github.com/x3042/Exact-reduction-of-ODE-systems/tree/main/benchmark/experiment_3/data/$(system[1]).jl)"
        else
            md *= "| [$msg](https://github.com/x3042/Exact-reduction-of-ODE-systems/tree/main/benchmark/experiment_3/data/$(system[1]).jl)"
        end

        link = "https://github.com/x3042/Exact-reduction-of-ODE-systems/tree/main/benchmark/$logfilename"
        md *= "| [тык]($link) "
        md *= "|"
        md *= "\n"

        fnname = "experiment_3/data/$(system[1]).jl"
        open("/home/sumiya11/exactreduction/Exact-reduction-of-ODE-systems/benchmark/$fnname", "w") do f
            println(f, "Original system:\n")
            println(f, "[\n"*join(system[2], ",\n")*"\n]")
            println(f)
            println(f, "Reductions:\n")
            println(f, join(
                ["$(isinteresting(r)[1] ? "Interesting" : "")\nnew_vars = $(string(r[:new_vars]))\n" * "new_system = \n[\n"*join(r[:new_system], ",\n")*"\n]\n"
                    for r in reductions], 
                "\n")*"\n")
        end
    end

    round2 = x -> round(x, digits=2)
    times = cache[sizes][3]

    md *= "\n$(sprint(versioninfo, context=:compact => false))\n"

    fnname = "experiment_3/experiment_3_$(sizes[1])-$(sizes[2]).md"
    f = open("/home/sumiya11/exactreduction/Exact-reduction-of-ODE-systems/benchmark/$fnname", "w")
    # f = open("$fnname", "w")
    write(f, md)
    close(f)
end

#------------------------------------------------------------------------------

# for sz in [(20, 50), (50, 80), ]#(80, 110)]
for sz in [(20, 30), (30, 40), (60, 70)] # [(5, 5), (10, 15)]
    uwuwu(sz...)
    write_md(sz)
end
