
using ExactODEReduction

using Nemo
using Distributions
using Printf
using Dates
using Statistics

_seed = 888  # use this random seed

_postfix = "_server"  # files postfix
_result_dirname = "result_data$(postfix)"  # directory to write results
_skip_models = ["e3.ode"]   # skip these models

const load_cache = Dict()
const computed_cache = Dict()

#------------------------------------------------------------------------------

# run benchmarks on sizes [from_size, to to_size]
function run_benchmarks(sz...)
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
        x = @timed find_reductions(ODE)
        computed_cache[filename] = [length(system), x.time, x.value]
    end
end

#------------------------------------------------------------------------------

function count_nontrivial_reductions(reductions)
    is_first_integral_reduction = ExactODEReduction.is_first_integral_reduction
    length(reductions) - count(
        red -> is_first_integral_reduction(new_system(red)),
        reductions
    )
end

function count_nontrivial_reductions_honest(reductions)
    n_intereting = count_nontrivial_reductions(reductions)
    correction = 0
    for i in 1:length(reductions) - 1
        r1, r2 = reductions[i], reductions[i+1]
        nv1, nv2 = new_vars(r1), new_vars(r2)
        ne1, ne2 = new_system(r1), new_system(r2)
        v1, v2 = vars(ne1), vars(ne2)
        e1, e2 = equations(ne1), equations(ne2)
        part_1a = [evaluate(e, v2[1:length(v1)]) for e in e1]
        part_2a = e2[1:length(e1)]
        if part_1 == part_2
            part_2b = e2[length(e1)+1:end]
            if all(part_2b, iszero(delta))
                correction += 1
            end
        end
    end
    n_interesting - correction
end

function dumpdata()
    for (modelname, modeldata) in computed_cache
        dimension, runtime, reductions = modeldata

        open("$Experiment_dir/$Result_dirname/$modelname", "w") do f
            println(f, dimension)
            println(f, runtime)
            println(f, length(reductions))
            println(f, count_nontrivial_reductions(reductions))
            println(f, count_nontrivial_reductions_honest(reductions))
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

function write_md_aggregate(thresholds)
    md = "#$(now())\n\n"
    md *= "## (Aggregated) Benchmark results for `find_reductions`.\n"
    md *= "All systems.\n\n"

    round4 = x -> round(x, digits=2)

    alldata = readdata()

    md *= "\n"
    md *= "| Dimension | # Systems | # Reductions | # *nonzero* Reductions | Min runtime | Rutime | Max runtime |\n"
    md *= "| --------- | --------- | ------------ | ---------------------- |------------ | ------ | ----------- |\n"

    for (from_size, to_size) in thresholds
        gooddata = filter(model -> (from_size <= model[2] <= to_size), alldata)

        if isempty(gooddata)
            md *= "| $(from_size) - $(to_size) | . | . | . | . |\n"
            continue
        end
        md *= "| $(from_size) - $(to_size) "
        md *= "| $(length(gooddata))"
        md *= "| $(round4(mean([x[4] for x in gooddata])))"
        md *= "| $(round4(mean([x[5] for x in gooddata])))"
        md *= "| $(round4(minimum([x[3] for x in gooddata]))) s"
        md *= "| $(round4(mean([x[3] for x in gooddata]))) s"
        md *= "| $(round4(maximum([x[3] for x in gooddata]))) s"

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
    run_benchmarks(sz...)
end

dumpdata()

write_md_all()

write_md_aggregate([(2, 9), (10, 19), (20, 29),
                    (30, 39),
                    (40, 59), (60, 79), (80, 99),
                    (100, 150)])