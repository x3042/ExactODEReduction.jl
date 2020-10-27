

#=
    The File contains BidimSparsikLazy tests

=#


if !isdefined(Main, :testset)
    using Test
    using TestSetExtensions
end

if !isdefined(Main, :BidimSparsikLazy)
    include("..\\src/bidim_sparsik_lazy.jl")
end


@testset "BidimSparsikLazy - Base functionality" begin

    A = from_dense([1 0 0;
                    0 0 0;
                    0 8 -3;])
    B = from_COO(3, 3,
                Dict((1=>1) => 1, (3=>2) => 8, (3=>3) => -3))
    @test A == B
    @test length(A) == length(B) == 3
    @test length(get_nnz_cols(A)) == 3
    @test length(get_nnz_rows(A)) == 2
    @test is_thorough(A) && is_thorough(B)


    A = from_dense([0 0 0
                    0 1 0])
    B = from_COO(2, 3, Dict((2=>2) => 1))
    @test A == B
    @test length(A) == 1
    @test length(get_nnz_cols(A)) == length(get_nnz_rows(A)) ==  1

    @test empty!(A) == zero(A)
    @test length(A) == 0
    @test is_thorough(A)

    @test is_thorough(zero_matrix(2, 4))


    @info "OK"


end


@testset "BidimSparsikLazy - Arithmetic operations" begin

    A = zero_matrix(3, 2)
    @test A - A == A + A == A * 5 == A == zero_matrix(3, 2)
    @test zero_matrix(3, 3) * zero_matrix(3, 3) == zero_matrix(3, 3)

    A = from_dense([1 2 3; 0 0 0; 0 1 -1;])
    B = from_dense([2 4 6; 0 0 0; 0 2 -2;])
    @test iszero(-2 * A + B) && -2 * A + B == zero_matrix(3, 3)

    E = from_dense([1 0 0; 0 1 0; 0 0 1;])
    @test E * A == A * E == A

    @test A * B == from_dense([1 5 0; 0 0 0; 0 -1 1;])
    @test 0 * A + A * (-111) + B * B * B * A == from_dense([-110 -217 -333;
                                                            0 0 0;
                                                            0 -112 112;])

    @test from_dense([0 1 0;]) * from_dense([1; 0; 0;]) == zero_matrix(1, 1)
    @test from_dense([1; 0; 0;]) * from_dense([0 1 0;]) == from_dense([0 1 0;
                                                                       0 0 0;
                                                                       0 0 0;])

    A = from_dense([1 3 0 5;
                    10 0 1 0;
                    3 2 4 0;
                    0 0 3 4;])

    B = from_dense([0 0 3 0;
                    1 2 0 5;
                    0 0 0 0;
                    3 0 0 8;])

    C = from_dense([18 6 3 55;
                    0 0 30 0;
                    2 4 9 10;
                    12 0 0 32;])
    @test 3 * A - 4 * B + A * B == C



    v = from_vector([1, 2, 3])
    @test apply_vector(E, v) == v

    v = from_vector([1, 2, 3, 4, 5])
    @test apply_vector(zero_matrix(3, 5), v) == zero_sparsik(3)

    @test apply_vector(A, zero_sparsik(4)) == zero_sparsik(4)

    v = from_vector([1, 0, 0, 4])
    @test apply_vector(A, v) == from_vector([21, 10, 3, 16])

    A = from_dense([1 2 3; 4 5 6; 7 8 9;])
    v = from_vector([1, 2, 3])
    @test apply_vector(A, v) == from_vector([14, 32, 50])

    @info "OK"

end
