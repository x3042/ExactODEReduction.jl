
include("../src/api.jl")
using Suppressor



function run_clue()
    times = []

    clue_path = normalizepath("test/python_parser/run_clue_reduction.py")
    # path to testsets *.ode files

    # for test_name in ["simple.ode", "test1.ode", "test2.ode", "e2.ode"]
    for test_name in ["e2.ode", "BIOMD0000000504.ode"]
        @info "processing" test_name

        testset_path = "python_parser/testsets/clue_examples/$test_name"

        testset_path = normalizepath("test/$testset_path")

        true_matrices_cmd = `python $clue_path $testset_path`

        start = time_ns()
        true_output = @capture_out run(true_matrices_cmd)
        push!(times, normtime(time_ns() - start))
    end

    times
end

#------------------------------------------------------------------------------

obss = Dict(
    "BIOMD0000000504.ode" =>  [
        ["cFos_P", "cJun_P"],
        ["MMP1_mRNA", "MMP13_mRNA", "TIMP1_mRNA"],
        ["MMP1", "MMP13", "ColFrag"],
        ["JAK1_P", "JNK_P", "cJun_P", "cJun_dimer", "STAT3_P_nuc", "STAT3_P_cyt"]
    ],
    "fceri_ji.ode" => [
        ["S0"],
        ["S2", "S178", "S267", "S77"],
        ["S2 + S178 + S267 + S77"],
        ["S7"],
        ["S1"]
    ],
    "e2.ode" => [
        ["S0"],
        ["S1"]
    ],
    "Barua.ode" => [
        ["aS000"],
        ["aS027"]
    ]
}

function run_ours()
    body
end


clue_times = run_clue()
