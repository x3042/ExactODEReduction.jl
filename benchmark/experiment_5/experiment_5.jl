
include("../../src/ExactODEReduction.jl")

#------------------------------------------------------------------------------

using Nemo
using Distributions
using Printf
using Dates
using Statistics

#------------------------------------------------------------------------------

const cache = Dict()

function uwuwu(from_size, to_size)
    if (from_size, to_size) in keys(cache)
        dataset = cache[from_size, to_size][1]
    else    
        dataset = ExactODEReduction.load_ODEs_recursive_if("/data/ODEs/",from_size=from_size, to_size=to_size)
        cache[from_size, to_size] = [dataset, []]
    end

    all_times = []
    all_reductions = []
    for  (i, (filename, system)) in enumerate(dataset)
        @info "$i-th, loaded a system $filename of size $(length(system))"
        
        ODE = ExactODEReduction.ODE{fmpq_mpoly}(system)
        
        x = @timed ExactODEReduction.find_reductions(ODE)
        
        push!(all_reductions, x.value)
        push!(all_times, x.time)
    end
    
    cache[from_size, to_size][2] = [all_reductions, all_times]
end

#------------------------------------------------------------------------------

function write_md(sizes)
    md = "#$(now())\n\n"
    md *= "## Benchmark results for `find_reductions`.\n"
    md *= "Systems of sizes from $(sizes[1]) to $(sizes[2]).\n\n"

    round2 = x -> round(x, digits=3)
    times = cache[sizes][2][2]

    md *= "### Benchmark outline\n"

    md *= "All timing here and below are given in **seconds**.\n"

    md *= "Computed **$(length(times))** models of sizes from $(sizes[1]) to $(sizes[2]).\n"

    md *= "\n"
    md *= "| Total time median | Total time average |Total time std |\n"
    md *= "| ---------- | ---------- | ------------ |\n"
    md *= "| $(round2(median(times)))"
    md *= "| $(round2(mean(times)))"
    md *= "| $(round2(std(times)))"

    md *= "|\n"

    md *= "### Benchmark results\n"

    md *= "\n"
    md *= "| System | Dimension | Total time |\n"
    md *= "| ------ | --------- | ---------- |\n"

    for (i, system) in enumerate(cache[sizes][1])
        md *= "| $(system[1]) | $(length(system[2]))"
        
        md *= "| $(round2(times[i])) |"

        md *= "\n"
    end

    md *= "\n$(sprint(versioninfo, context=:compact => false))\n"

    fnname = "experiment_5/experiment_5_$(sizes[1])-$(sizes[2]).md"
    f = open("/home/sumiya11/exactreduction/Exact-reduction-of-ODE-systems/benchmark/$fnname", "w")
    # f = open("$fnname", "w")
    write(f, md)
    close(f)
end

#------------------------------------------------------------------------------

# for sz in [(20, 50), (50, 80), ]#(80, 110)]
# [(50, 60), (60, 70), (90, 110)]
for sz in [(90, 110)]
    uwuwu(sz...)
    write_md(sz)
end
