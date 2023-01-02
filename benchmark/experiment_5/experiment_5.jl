using ExactODEReduction

using Nemo
using Distributions
using Printf
using Dates
using Statistics

const _seed = 888  # use this random seed

const _postfix = ""  # filenames postfix
const _date = Dates.format(now(), "yyyy-mm-dd-HH-MM-SS")  # filename signature
const _result_dirname = "result_data$(_postfix)"  # directory to write results
const _skip_models = ["e3.ode"]   # skip these models

const load_cache = Dict()
const computed_cache = Dict()

#------------------------------------------------------------------------------

# run benchmarks on sizes [from_size, to to_size]
function run_benchmarks(sz...)
    from_size, to_size = sz
    if sz in keys(load_cache)
        dataset = load_cache[sz]
    else
        @info "" (@__DIR__)*"/../data/ODEs/" 
        dataset = ExactODEReduction.load_ODEs_recursive_if("/data/ODEs/",from_size=from_size, to_size=to_size)
        load_cache[sz] = dataset
    end
    for  (i, (filename, system)) in enumerate(dataset)
        @info "$i-th, loaded a system $filename of size $(length(system))" 
        if filename in keys(computed_cache)
            @info "skipping $filename -- already computed"
            continue
        end
        if filename in _skip_models
            @warn "skipping $filename -- just skipping"
            continue
        end
        ODE = ExactODEReduction.ODE{fmpq_mpoly}(system)
        x = @timed ExactODEReduction.find_reductions(ODE, seed=_seed)
        computed_cache[filename] = [length(system), x.time, x.value]
    end
end

#------------------------------------------------------------------------------

function count_nontrivial_reductions(reductions)
    is_first_integral_reduction = ExactODEReduction.is_first_integral_reduction
    length(reductions) - count(
        red -> is_first_integral_reduction(ExactODEReduction.equations(ExactODEReduction.new_system(red))),
        reductions
    )
end

function count_nontrivial_reductions_honest(reductions)
    is_first_integral_reduction = ExactODEReduction.is_first_integral_reduction
    correction = 0
    # for each pair of consecutive reductions..
    for i in 1:length(reductions) - 1            
        r1, r2 = reductions[i], reductions[i+1]
        # if r2 is constant, mark r2 as *not interesting* and continue to the next pair
        if is_first_integral_reduction(ExactODEReduction.equations(ExactODEReduction.new_system(r2)))
            correction += 1
            continue
        end
        # if delta(r1, r2) is constant, mark r2 as *not interesting*.
        # We find delta by searching for a perfect match between new variables of r1 and r2.
        newode1, newode2 = ExactODEReduction.new_system(r1), ExactODEReduction.new_system(r2)
        newvardict1, newvardict2 = ExactODEReduction.new_vars(r1), ExactODEReduction.new_vars(r2)
        visited = Dict()
        for (_, newexpr1) in newvardict1
            k = findfirst(newexpr2 -> newexpr1 == newexpr2, newvardict2)
            k === nothing && continue
            visited[k] = true
        end
        # check if each of the new variables of r1 is matched to one var from r2
        length(visited) != length(newvardict1) && continue
        delta = [
            newode2[var] for var in keys(newvardict2)
            if !(haskey(visited, var))
        ]
        if all(iszero, delta)
            correction += 1
        end
    end
    if !isempty(reductions) && is_first_integral_reduction(ExactODEReduction.equations(ExactODEReduction.new_system(reductions[1])))
        correction += 1
    end
    length(reductions) - correction
end

function dumpdata()
    for (modelname, modeldata) in computed_cache
        dimension, runtime, reductions = modeldata

        open((@__DIR__)*"/$_result_dirname/$modelname", "w") do f
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
    for fname in readdir((@__DIR__)*"/$_result_dirname", join=false)
        f = open((@__DIR__)*"/$_result_dirname/$fname", "r")
        dimension = parse(Int, readline(f))
        runtime = parse(Float64, readline(f))
        reductions = parse(Int, readline(f))
        nnzreductions = parse(Int, readline(f))
        nnzreductions_honest = parse(Int, readline(f))
        close(f)
        push!(alldata, [fname, dimension, runtime, reductions, nnzreductions, nnzreductions_honest])
    end
    alldata
end

#------------------------------------------------------------------------------

function write_md_all()
    md = "#$(now())\n\n"
    md *= "## Benchmark results for `find_reductions`.\n"
    md *= "All systems.\n\n"

    md *= "\n"
    md *= "| System | Dimension | # Reductions | # *nonzero* Reductions | # *nonzero* Reductions (honest) | Total time |\n"
    md *= "| ------ | --------- | ------------ | ---------------------- | ------------------------------- |----------- |\n"

    alldata = readdata()
    sort!(alldata, by=x->x[2])

    for (fname, dimension, runtime, reductions, nnzreductions, nnzreductions_honest) in alldata
        md *= "| $fname "
        md *= "| $dimension"
        md *= "| $reductions"
        md *= "| $nnzreductions"
        md *= "| $nnzreductions_honest"
        md *= "| $runtime"
        md *= "|"
        md *= "\n"
    end

    md *= "\n$(sprint(versioninfo, context=:compact => false))\n"

    fnname = "experiment_5_all$(_postfix)_$(_date).md"
    f = open((@__DIR__)*"/$fnname", "w")
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
    md *= "| Dimension | # Systems | # Reductions | # *nonzero* Reductions | # *nonzero* Reductions (honest) | Min runtime | Rutime | Max runtime |\n"
    md *= "| --------- | --------- | ------------ | ---------------------- | ------------------------------- | ----------- | ------ | ----------- |\n"

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
        md *= "| $(round4(mean([x[6] for x in gooddata])))"
        md *= "| $(round4(minimum([x[3] for x in gooddata]))) s"
        md *= "| $(round4(mean([x[3] for x in gooddata]))) s"
        md *= "| $(round4(maximum([x[3] for x in gooddata]))) s"
        md *= "|"
        md *= "\n"
    end

    md *= "\n$(sprint(versioninfo, context=:compact => false))\n"

    fnname = "experiment_5$(_postfix)_$(_date).md"
    f = open((@__DIR__)*"/$fnname", "w")
    write(f, md)
    close(f)
end

function clear_all_data()
    for d in readdir((@__DIR__)*"/$_result_dirname", join=true)
        rm(d)
    end
end

#------------------------------------------------------------------------------

# clear_all_data()

for sz in [(2, 10)]
    run_benchmarks(sz...)
end

dumpdata()

write_md_all()

write_md_aggregate([(2, 9), (10, 19), (20, 29),
                    (30, 39),
                    (40, 59), (60, 79), (80, 99),
                    (100, 150)])
