@testset "Base functionality" begin

    include("../src/sparsik.jl")


    v1 = Sparsik(7, [1, 3, 5, 7],
            Dict(1 => 10, 3 => -2, 5 => 8, 7 => 4))
    v2 = Sparsik(7, [2, 3, 5, 6],
                Dict(2 => 2, 3 => 1, 5 => -8, 6 => 11))

    @test v1 == from_vector([10, 0, -2, 0, 8, 0, 4])

    @test (v1 + v2) == from_vector([10, 2, -1, 0, 0, 11, 4])

    @test (v1 * 2) == from_vector([20, 0, -4, 0, 16, 0, 8])

    @test is_zero(Sparsik(3, [], Dict()))
    @test is_zero(from_vector([0, 0, 0]))

    @test first_nonzero(v2) == 2

    @test inner(v1, v2) == -132
    @test inner_2(v1, v2) == -132
    @test inner_2(from_vector([1, 0, 1]),
        from_vector([0, 1, 0])) == 0

    @test reduce(from_vector([1, 2, 3]),
        from_vector([0, 2, -1]), -1) == from_vector([1, 0, 4])

end
