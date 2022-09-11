
include("../../src/ExactODEReduction.jl")

#------------------------------------------------------------------------------

using Nemo
using Distributions
using Printf
using Dates

#------------------------------------------------------------------------------

const cache = Dict()

function uwuwu(from_size, to_size)
    if (from_size, to_size) in keys(cache)
        dataset = cache[from_size, to_size][1]
    else    
        dataset = ExactODEReduction.load_ODEs_recursive_if("/data/ODEs/",from_size=from_size, to_size=to_size)
    end

    all_reductions = []
    for  (i, (filename, system)) in enumerate(dataset)
        @info "$i-th, loaded a system $filename of size $(length(system))"
        
        ODE = ExactODEReduction.ODE{fmpq_mpoly}(system)
        reductions = ExactODEReduction.find_reductions(ODE)
    
        push!(all_reductions, reductions)
    end
    
    times = ExactODEReduction.dump_times()

    cache[from_size, to_size] = (dataset, all_reductions, times)
end

#------------------------------------------------------------------------------

function write_md(sizes)
    md = "#$(now())\n\n"
    md *= "## Reductions for `find_reductions`.\n"
    md *= "Systems of sizes from $(sizes[1]) to $(sizes[2]).\n\n"

    md *= "### Resulting reductions\n"
    md *= "*Click at the last column to see reductions*\n"
    
    md *= "| System | Dimension | Found reductions | Dimensions of reduced |\n"
    md *= "| ------ | --------- | ---------------- | --------------------- |\n"

    for (system, reductions) in zip(cache[sizes][1], cache[sizes][2])
        md *= "| $(system[1]) | $(length(system[2]))"
        
        md *= "| $(length(reductions)) "

        reduced_dims = Tuple([length(r[:new_system]) for r in reductions])
        link = "https://github.com/x3042/Exact-reduction-of-ODE-systems/tree/main/benchmark/experiment_2/data/$(system[1])"
        md *= "| [$reduced_dims]($link) "
        
        md *= "|"

        md *= "\n"

        fnname = "experiment_2/data/$(system[1])"
        open("/home/sumiya11/exactreduction/Exact-reduction-of-ODE-systems/benchmark/$fnname", "w") do f
            println(f, "Original system:\n")
            println(f, "[\n"*join(system[2], ",\n")*"\n]")
            println(f)
            println(f, "Reductions:\n")
            println(f, join(
                ["new_vars = $(string(r[:new_vars]))\n" * "new_system = \n[\n"*join(r[:new_system], ",\n")*"\n]\n"
                    for r in reductions], 
                "\n")*"\n")
        end

    end

    round2 = x -> round(x, digits=2)
    times = cache[sizes][3]

    md *= "\n$(sprint(versioninfo, context=:compact => false))\n"

    fnname = "experiment_2/experiment_2_$(sizes[1])-$(sizes[2]).md"
    f = open("/home/sumiya11/exactreduction/Exact-reduction-of-ODE-systems/benchmark/$fnname", "w")
    # f = open("$fnname", "w")
    write(f, md)
    close(f)
end

#------------------------------------------------------------------------------

# for sz in [(20, 50), (50, 80), ]#(80, 110)]
for sz in [(5, 5)]
    uwuwu(sz...)
    write_md(sz)
end
