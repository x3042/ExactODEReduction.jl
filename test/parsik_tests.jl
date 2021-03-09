
#=
    The File contains parser tests
=#

#------------------------------------------------------------------------------

using Suppressor

include("../src/parsik.jl")
include("../src/structs/dok_sparsik.jl")

#------------------------------------------------------------------------------

if !isdefined(Main, :testset)
    using Test
    using TestSetExtensions
end

#------------------------------------------------------------------------------

@testset "parser - JSON to DOK_Sparsik" begin

    set_fn = "matrices_1.json"
    matrices = [from_COO(arr..., QQ) for arr in load_COO_set(set_fn)]

    @test length(matrices) == 1
    @test matrices[1] == from_dense([2 0; -1 0;], QQ)

    # and the second..
    set_fn = "matrices_2.json"
    matrices = [from_COO(arr..., QQ) for arr in load_COO_set(set_fn)]

    @test length(matrices) == 3
    @test matrices[1] == from_dense([3 2 0; 0 1 0; 0 0 0;], QQ)
    @test matrices[2] == from_dense([1 0 0;], QQ)
    @test iszero(matrices[3])

end

@testset "parser - MTX to DOK_Sparsik" begin

    set_group = "test"
    set_name  = "test_set.mtx"

    fn, dim, sz, matrix = load_MTX(set_group, set_name)

    # hmmm
    matrix = matrix[2:end]

    @test fn == set_group*'/'*set_name && dim == 3 && sz == 1
    @test from_COO(dim, dim, matrix, QQ) == from_dense([1 3 0; 3//2 1 0; 0 0 0;], QQ)

end


@testset "parser - *.ode to polynomials" begin

    # path to CLUE parser
    true_parser_path = "python_parser/true_parser.py"
    # path to testsets *.ode files
    testsets_path = "python_parser/testsets"

    true_parser_path, testsets_path = map(
        name -> replace("$(normpath(joinpath(@__FILE__, "..", "..")))test/$name",
                        "\\" => "/"),
        (true_parser_path, testsets_path)
    )

    for test_filename in readdir(testsets_path)
        test_path = testsets_path * "/" * test_filename
        true_parser_cmd = `python $true_parser_path $test_path`

        # Now that we have output polys from CLUE parser..
        true_output = @capture_out run(true_parser_cmd)
        # ..we beautify them a bit and then compare with ours

        true_output = collect(
            filter(!isempty, map(
                        strip ∘ String,
                        split(replace(true_output, "+ -" => "- "), r"\r?\n")
            )
        ))

        test_output = collect(sort(map(
                        strip ∘ repr,
                        values(load_ODEs(test_path, pathabs=true))
        )))

        # Browse all equations and find similar ones in true_output <--> test_output
        # with greedy matching
        # If there is a bijection established, we consider outputs equal
        test_to_true = Dict{Int, Int}()
        for (i, true_eq) in enumerate(true_output)
            for (j, test_eq) in enumerate(test_output)
                ### Controversial, but ok for now
                if Set(true_eq) == Set(test_eq) && !haskey(test_to_true, j)
                    test_to_true[j] = i
                    break
                end
            end
        end

        @test length(test_to_true) == length(test_output) == length(true_output)

    end

end


@info "OK"
