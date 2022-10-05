
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
        reduction = ExactODEReduction.find_some_reduction(ODE)
    
        push!(all_reductions, reduction)
    end
    
    times = ExactODEReduction.dump_times()

    cache[from_size, to_size] = (dataset, all_reductions, times)
end

#------------------------------------------------------------------------------

function write_md(sizes)
    md = "#$(now())\n\n"
    md *= "## Benchmark results for `find_some_reduction`.\n"
    md *= "Systems of sizes from $(sizes[1]) to $(sizes[2]).\n\n"
    
    md *= "**New matrices and modular.**"

    md *= "### Resulting reductions\n"

    md *= "| System | Dimension | Reduction found? |\n"
    md *= "| ------ | --------- | ---------------- |\n"

    for (system, reduction) in zip(cache[sizes][1], cache[sizes][2])
        md *= "| $(system[1]) | $(length(system[2]))"
        if isempty(reduction)
            md *= "| No.. |"
        elseif iszero(reduction[:new_system])
            md *= "| Reduced to zero |"
        else
            md *= "| New dimension: $(length(reduction[:new_system])) |"
        end
        md *= "\n"
    end

    round2 = x -> round(x, digits=2)
    times = cache[sizes][3]

    md *= "### Benchmark outline\n"

    md *= "All timing here and below are given in **seconds**.\n"

    md *= "Median timings:\n"

    md *= "\n"
    md *= "| Total time | find_basis | find_radical | general_kernel | invariant_subspace_semisimple |\n"
    md *= "| ---------- | ---------- | ------------ | -------------- | ----------------------------- |\n"
    md *= "| $(round2(median(times[5]))) "
    md *= "| $(round2(median(times[1]))) "
    md *= "| $(round2(median(times[2]))) "
    md *= "| $(round2(median(times[3]))) "
    md *= "| $(round2(median(times[4]))) "
    md *= "|\n"

    md *= "### Benchmark results\n"

    md *= "\n"
    md *= "| System | Dimension | Total time | find_basis | find_radical | general_kernel | invariant_subspace_semisimple |\n"
    md *= "| ------ | --------- | ---------- | ---------- | ------------ | -------------- | ----------------------------- |\n"

    for (i,system) in enumerate(cache[sizes][1])
        (i > length(times[4])) && break

        md *= "| $(system[1]) | $(length(system[2]))"
        
        md *= "| $(round2(times[5][i])) "
        md *= "| $(round2(times[1][i])) "
        md *= "| $(round2(times[2][i])) "
        md *= "| $(round2(times[3][i])) "
        md *= "| $(round2(times[4][i])) "
        md *= "|"

        md *= "\n"
    end

    md *= "\n$(sprint(versioninfo, context=:compact => false))\n"

    fnname = "experiment_4/experiment_4_$(sizes[1])-$(sizes[2]).md"
    f = open("/home/sumiya11/exactreduction/Exact-reduction-of-ODE-systems/benchmark/$fnname", "w")
    # f = open("$fnname", "w")
    write(f, md)
    close(f)
end

#------------------------------------------------------------------------------

for sz in [(20, 50)]
# for sz in [(110, 200)]
    uwuwu(sz...)
    write_md(sz)
end
