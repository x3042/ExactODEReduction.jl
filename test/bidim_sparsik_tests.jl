

#=
    The File contains BidimSparsik tests
=#


if !isdefined(Main, :testset)
    using Test
    using TestSetExtensions
end

if !isdefined(Main, :BidimSparsik)
    include("..\\src/bidim_sparsik.jl")
end


@testset "Base functionality" begin

    A = from_dense([0 2 0;
                    0 0 0;
                    0 8 -3;])
    B = from_COO(3, 3, [1, 3], [2, 3],
                Dict((1=>2) => 2, (3=>2) => 8, (3=>3) => -3))
    @test A == B
    @test length(A) == 3
    @test length(get_nnz_cols(A)) == 2
    @test length(get_nnz_rows(A)) == 2


    A = from_dense([0 0 0
                    0 1 0])
    B = from_COO(2, 3, [2], [2], Dict((2=>2) => 1))
    @test A == B
    @test length(A) == 1
    @test length(get_nnz_cols(A)) == 1
    @test length(get_nnz_rows(A)) == 1

    @test transposed(A) == from_dense([0 0;
                                       0 1;
                                       0 0;])
    @test empty!(A) == zero(A)
    @test length(A) == 0
    @test size(transposed(A)) == (3 => 2)
    @test size(A) == (2 => 3)

end


@testset "Arithmetic operations" begin

    A = from_dense([2 5 -2;
                    -3 -4 7;])

    B = from_dense([-5 4 -1;
                    6 2 7;])

    C = from_dense([1 -1;
                    2 -5;])

    D = from_dense([2 -1;
                    1 6;])


    X1 = from_dense([-219 342;
                     -798 1350])

    X2 = from_dense([-1179 -3537
                      655 -1965])

    X3 = from_dense([-4 16
                    -32 92])

    X4 = from_dense([-8 56
                      8 256])

    X5 = from_dense([12 -32
                    32 140])

    X6 = from_dense([-1398 -3155
                    -135   -127])

    T = transposed

    @test D - D == zero(D)
    @test 2 * A - A == A
    @test A + A + A == 3 * A

    @test -3 * C * A * T(A) == X1
    @test trace(T(B) * B) * (A + B) * (T(A) - T(B)) == X2
    @test 4 * C * C == X3
    @test 8 * (-C) * D == X4
    @test 4 * D * D == X5

    @test X1 + X2 + X3 + X4 + X5 == X6

end
