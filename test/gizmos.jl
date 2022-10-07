
#=
    The File contains tests for some utils and etc..
=#

@testset "Construct jacobians" begin

    # simple tests #

    R, (x₁, x₂, x₃, x₄) = Nemo.QQ["x₁", "x₂", "x₃", "x₄"]

    system = [
        x₁^2 + 2*x₁*x₂,
        x₂^2 + x₃ + x₄,
        x₂ + x₄,
        x₁ + x₃
    ]
    true_js = [
        sparse(Nemo.QQ.([
            2 0 0 0;
            2 0 0 0;
            0 0 0 0;
            0 0 0 0;
        ])),
        sparse(Nemo.QQ.([
            2 0 0 0;
            0 2 0 0;
            0 0 0 0;
            0 0 0 0;
        ])),
        sparse(Nemo.QQ.([
            0 0 0 1;
            0 0 1 0;
            0 1 0 1;
            0 1 1 0;
        ]))
    ]

    js = ExactODEReduction.construct_jacobians(system)

    @test all(J in true_js for J in js) && length(true_js) == length(js)

    # test #2
    R, (x₁, x₂, x₃) = Nemo.QQ["x₁", "x₂", "x₃"]

    system = [
        x₂^2 + 4x₂*x₃ + 4x₃^2,  # derivative of x1
        4x₃ - 2x₁,              # derivative of x2
        x₁ + x₂                 # derivative of x3
    ]
    true_js = [
        sparse(Nemo.QQ.([
            0 0 0;
            2 0 0;
            4 0 0;
        ])),
        sparse(Nemo.QQ.([
            0 0 0;
            4 0 0;
            8 0 0;
        ])),
        sparse(Nemo.QQ.([
            0 -2 1;
            0 0 1;
            0 4 0;
        ]))
    ]

    js = ExactODEReduction.construct_jacobians(system)

    @test all(J in true_js for J in js) && length(true_js) == length(js)
end

@testset "Randomness" begin
    ε = 0.1
    for n in (100, )
        for d in (0.1, 0.5, 1.0)
            for 𝔽 in (Nemo.QQ, Nemo.GF(Nemo.fmpz(2^31-1)))
                vector = ExactODEReduction.random_sparse_vector(n, 𝔽, density=d)
                @test abs(ExactODEReduction.density(vector) - d) < ε

                matrix = ExactODEReduction.random_sparse_vector((n, n), 𝔽, density=d)
                @test abs(ExactODEReduction.density(matrix) - d) < 2ε
            end
        end
    end
end

@testset "Check invariance" begin

    A = sparse(Nemo.QQ.([1 0 0; 0 2 0; 0 0 3;]))

    v1 = sparse(Nemo.QQ.([1,0,0]))
    v2 = sparse(Nemo.QQ.([0,1,0]))
    v3 = sparse(Nemo.QQ.([0,0,1]))

    @test ExactODEReduction.check_invariance!([A], [v1, v2, v3])
    @test ExactODEReduction.check_invariance!([A], [v1])
    @test ExactODEReduction.check_invariance!([A], [v2])
    @test ExactODEReduction.check_invariance!([A], [v3])


    A = sparse(Nemo.QQ.([1 2 0; 0 1 0; 0 0 3;]))
    @test ExactODEReduction.check_invariance!([A], [v1, v3])
    @test ExactODEReduction.check_invariance!([A], [v1 + v2, v2])
    @test !ExactODEReduction.check_invariance!([A], [v2])

    A = sparse(Nemo.QQ.([0 4 0 1; 0 0 1 1; 0 0 0 2; 0 0 0 4]))
    v1 = sparse(Nemo.QQ.([1, 0, 0, 0]))
    v2 = sparse(Nemo.QQ.([0, 3//8, 1//2, 1]))
    @test ExactODEReduction.check_invariance!([A], [v1, v2])
    @test !ExactODEReduction.check_invariance!([A], [v1 + v2])

end

@testset "Gram matrix" begin
    A = sparse(Nemo.QQ.([1 2 0; 0 1 0; 0 0 3;]))
    @test ExactODEReduction.gram_matrix([A]) == sparse(reshape([Nemo.QQ(11);;], 1, 1))
    A1 = sparse(Nemo.QQ.([1 0; 0 1;]))
    A2 = sparse(Nemo.QQ.([0 2; 0 3;]))
    @test ExactODEReduction.gram_matrix([A1, A2]) == sparse(Nemo.QQ.([2 3; 3 9;]))
    A1 = sparse(Nemo.QQ.([0 0; 0 1;]))
    A2 = sparse(Nemo.QQ.([0 1; 0 0;]))
    A3 = sparse(Nemo.QQ.([0 1; 1 0;]))
    @test ExactODEReduction.gram_matrix([A1, A2, A3]) == sparse(Nemo.QQ.([1 0 0; 0 0 1; 0 1 2]))
end
