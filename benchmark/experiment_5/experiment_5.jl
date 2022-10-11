
include("../../src/ExactODEReduction.jl")

#------------------------------------------------------------------------------

using Nemo
using Distributions
using Printf
using Dates
using Statistics

#------------------------------------------------------------------------------

# TODO: !!! 70-79 !!!

postfix = "_server"
Experiment_dir = "/home/ademin/exactreducton/Exact-reduction-of-ODE-systems/benchmark/experiment_5"
Result_dirname = "result_data$(postfix)"

skip_models = ["e3.ode"]

const load_cache = Dict()
const computed_cache = Dict()

function uwuwu(sz...)
    from_size, to_size = sz
    if sz in keys(load_cache)
        dataset = load_cache[sz]
    else    
        dataset = ExactODEReduction.load_ODEs_recursive_if("/data/ODEs/",from_size=from_size, to_size=to_size)
        load_cache[sz] = dataset
    end
    for  (i, (filename, system)) in enumerate(dataset)
        @info "$i-th, loaded a system $filename of size $(length(system))" 
        if filename in keys(computed_cache)
            @info "skipping $filename -- already computed"
            continue
        end
        if filename in skip_models
            @warn "skipping $filename -- just skipping"
            continue
        end
        ODE = ExactODEReduction.ODE{fmpq_mpoly}(system)
        x = @timed ExactODEReduction.find_reductions(ODE)
        computed_cache[filename] = [length(system), x.time, x.value]
    end
end

#------------------------------------------------------------------------------

function dumpdata()
    is_first_integral_reduction = ExactODEReduction.is_first_integral_reduction
    for (modelname, modeldata) in computed_cache
        dimension, runtime, reductions = modeldata
        open("$Experiment_dir/$Result_dirname/$modelname", "w") do f
            println(f, dimension)
            println(f, runtime)
            println(f, length(reductions))
            println(f,
                length(reductions) - count(
                    red -> is_first_integral_reduction(red[:new_system]),
                    reductions)
            )
        end
    end
end

function readdata()
    alldata = Any[]
    for fname in readdir("$Experiment_dir/$Result_dirname", join=false)
        f = open("$Experiment_dir/$Result_dirname/$fname", "r")
        dimension = parse(Int, readline(f))
        runtime = parse(Float64, readline(f))
        reductions = parse(Int, readline(f))
        nnzreductions = parse(Int, readline(f))
        close(f)

        push!(alldata, [fname, dimension, runtime, reductions, nnzreductions])
    end
    alldata
end

#------------------------------------------------------------------------------

function write_md_all()
    md = "#$(now())\n\n"
    md *= "## Benchmark results for `find_reductions`.\n"
    md *= "All systems.\n\n"

    round3 = x -> round(x, digits=3)

    md *= "\n"
    md *= "| System | Dimension | # Reductions | # *nonzero* Reductions | Total time |\n"
    md *= "| ------ | --------- | ------------ | ---------------------- |----------- |\n"

    alldata = readdata()
    sort!(alldata, by=x->x[2])

    for (fname, dimension, runtime, reductions, nnzreductions) in alldata
        md *= "| $fname "
        md *= "| $dimension"
        md *= "| $reductions"
        md *= "| $nnzreductions"
        md *= "| $runtime"
        md *= "|"

        md *= "\n"
    end

    md *= "\n$(sprint(versioninfo, context=:compact => false))\n"

    fnname = "experiment_5_all$(postfix).md"
    f = open("$Experiment_dir/$fnname", "w")
    write(f, md)
    close(f)
end

function write_md_segregate(thresholds)
    md = "#$(now())\n\n"
    md *= "## (Segregated) Benchmark results for `find_reductions`.\n"
    md *= "All systems.\n\n"

    round4 = x -> round(x, digits=4)

    alldata = readdata()

    md *= "\n"
    md *= "| Dimension | # Systems | # Reductions, on average | # *nonzero* Reductions, on average | Rutime, on average |\n"
    md *= "| --------- | --------- | ------------------------ | ---------------------------------- |------------------- |\n"

    for (from_size, to_size) in thresholds
        gooddata = filter(model -> (from_size <= model[2] <= to_size), alldata)

        if isempty(gooddata)
            md *= "| $(from_size) - $(to_size) | . | . | . | . |\n"
            continue
        end
        md *= "| $(from_size) - $(to_size) "
        md *= "| $(length(gooddata))"
        md *= "| $(round4(median([x[4] for x in gooddata])))"
        md *= "| $(round4(median([x[5] for x in gooddata])))"
        md *= "| $(round4(median([x[3] for x in gooddata]))) s"
        md *= "|"
    
        md *= "\n"
    end

    md *= "\n$(sprint(versioninfo, context=:compact => false))\n"

    fnname = "experiment_5_$(abs(rand(Int32)))$(postfix).md"
    f = open("$Experiment_dir/$fnname", "w")
    write(f, md)
    close(f)
end

#------------------------------------------------------------------------------

function clear_all_data()
    for d in readdir("$Experiment_dir/$Result_dirname", join=true)
        rm(d)
    end
end

#------------------------------------------------------------------------------

# clear_all_data()

for sz in [(150, 300)]
    uwuwu(sz...)
end

dumpdata()

write_md_all()

write_md_segregate([(2, 9), (10, 19), (20, 39),
                    (40, 59), (60, 79), (80, 99),
                    (100, 150)])