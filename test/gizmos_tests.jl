
#=
    The File contains tests for some project utils and etc..
=#

#------------------------------------------------------------------------------

include("../src/gizmos.jl")
include("../src/utils.jl")

using Suppressor

#------------------------------------------------------------------------------

if !isdefined(Main, :testset)
    using Test
    using TestSetExtensions
end
import Nemo: QQ, GF, ZZ, FlintRationalField, characteristic
import JSON

#------------------------------------------------------------------------------

@testset "Gizmos -- construct_jacobians" begin

    # simple tests #

    R, (x₁, x₂, x₃, x₄) = QQ["x₁", "x₂", "x₃", "x₄"]

    system = [
        x₁^2 + 2*x₁*x₂,
        x₂^2 + x₃ + x₄,
        x₂ + x₄,
        x₁ + x₃
    ]
    true_js = [
        from_dense([
            2 0 0 0;
            2 0 0 0;
            0 0 0 0;
            0 0 0 0;
        ], QQ),
        from_dense([
            2 0 0 0;
            0 2 0 0;
            0 0 0 0;
            0 0 0 0;
        ], QQ),
        from_dense([
            0 0 0 1;
            0 0 1 0;
            0 1 0 1;
            0 1 1 0;
        ], QQ)
    ]

    js = construct_jacobians(system)

    @test all(J in true_js for J in js) && length(true_js) == length(js)


    # test #2
    R, (x₁, x₂, x₃) = QQ["x₁", "x₂", "x₃"]

    system = [
        x₂^2 + 4x₂*x₃ + 4x₃^2,  # derivative of x1
        4x₃ - 2x₁,              # derivative of x2
        x₁ + x₂                 # derivative of x3
    ]
    true_js = [
        from_dense([
            0 0 0;
            2 0 0;
            4 0 0;
        ], QQ),
        from_dense([
            0 0 0;
            4 0 0;
            8 0 0;
        ], QQ),
        from_dense([
            0 -2 1;
            0 0 1;
            0 4 0;
        ], QQ)
    ]

    js = construct_jacobians(system)

    @test all(J in true_js for J in js) && length(true_js) == length(js)


    # compare with CLUE version #

    # path to CLUE parser
    true_matrices_path = normalizepath("test/python_parser/clue.py")
    # path to testsets *.ode files

    for test_name in ["e2.ode", "simple.ode", "test1.ode", "test2.ode"]
        testset_path = "python_parser/testsets/$test_name"

        testset_path = normalizepath("test/$testset_path")
        
        true_matrices_cmd = `python $true_matrices_path $testset_path`

        true_output = @capture_out run(true_matrices_cmd)
        true_output = JSON.Parser.parse(true_output)

        my_output = construct_jacobians(collect(values(load_ODEs(testset_path))))
        my_output = [
            [
                [to_cartesian(size(matrix), coord)..., val]
                for (coord, val) in matrix
            ]
            for matrix in my_output
        ]

        my_to_true = Dict{Int, Int}()

        unify = X -> collect(sort(X))
        for (i, true_matrix) in enumerate(unify.(sort(true_output, by=length)))
            for (j, my_matrix) in enumerate(unify.(sort(my_output, by=length)))

                if length(my_matrix) == length(true_matrix)
                    if !haskey(my_to_true, j)
                        my_to_true[j] = i
                        break
                    end
                end
            end
        end
        @test length(my_to_true) == length(my_output) == length(true_output)

    end

end

# TODO
@testset "General -- randomness" begin

    ε = 0.01
    for n in (100, )
        for d in (0.1, 0.5, 1)
            for 𝔽 in (QQ, GF(2^31-1))
                vector = random_sparsik(n, 𝔽, density=d)
                @test abs(density(vector) - d) < ε

                matrix = random_sparsik((n, n), 𝔽, density=d)
                @test abs(density(matrix) - d) < 2ε
            end
        end
    end

end

@testset "Subspaces -- check invariance" begin

    A = @sparse [1 0 0; 0 2 0; 0 0 3;]

    @test check_invariance!([], [A])

    v1 = @sparse [1,0,0]
    v2 = @sparse [0,1,0]
    v3 = @sparse [0,0,1]

    @test check_invariance!([A], [v1, v2, v3])
    @test check_invariance!([A], [v1])
    @test check_invariance!([A], [v2])
    @test check_invariance!([A], [v3])


    A = @sparse [1 2 0; 0 1 0; 0 0 3;]
    @test check_invariance!([A], [v1, v3])
    @test check_invariance!([A], [v1 + v2, v2])
    @test !check_invariance!([A], [v2])

    A = @sparse [0 4 0 1; 0 0 1 1; 0 0 0 2; 0 0 0 4]
    v1 = @sparse [1, 0, 0, 0]
    v2 = @sparse [0, 3//8, 1//2, 1]
    @test check_invariance!([A], [v1, v2])
    @test !check_invariance!([A], [v1 + v2])

end

@info "OK"
