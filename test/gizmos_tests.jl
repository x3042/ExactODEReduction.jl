
#=
    The File contains tests for some project utils and etc..
=#

#------------------------------------------------------------------------------

#using Suppressor

#------------------------------------------------------------------------------

@testset "Gizmos -- construct_jacobians" begin

    # simple tests #

    R, (x₁, x₂, x₃, x₄) = Nemo.QQ["x₁", "x₂", "x₃", "x₄"]

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
        ], Nemo.QQ),
        from_dense([
            2 0 0 0;
            0 2 0 0;
            0 0 0 0;
            0 0 0 0;
        ], Nemo.QQ),
        from_dense([
            0 0 0 1;
            0 0 1 0;
            0 1 0 1;
            0 1 1 0;
        ], Nemo.QQ)
    ]

    js = construct_jacobians(system)

    @test all(J in true_js for J in js) && length(true_js) == length(js)


    # test #2
    R, (x₁, x₂, x₃) = Nemo.QQ["x₁", "x₂", "x₃"]

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
        ], Nemo.QQ),
        from_dense([
            0 0 0;
            4 0 0;
            8 0 0;
        ], Nemo.QQ),
        from_dense([
            0 -2 1;
            0 0 1;
            0 4 0;
        ], Nemo.QQ)
    ]

    js = construct_jacobians(system)

    @test all(J in true_js for J in js) && length(true_js) == length(js)


end

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
