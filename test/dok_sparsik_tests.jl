#------------------------------------------------------------------------------

@testset "DOK_Sparsik - Base functionality" begin

    R3 = Nemo.GF(3)

    A = from_dense([1 0 0; 0 0 0; 0 8 -3;], Nemo.QQ)
    B = from_COO(3, 3, [(1, 1, 1), (3, 2, 8), (3, 3, -3)], Nemo.QQ)
    @test A == B
    @test length(A) == length(B) == 3
    @test A.nnz_rows == [1, 3]
    @test A.nnz_cols == [1, 2, 3]
    @test is_thorough(A) && is_thorough(B)

    A = from_dense([0 0 0; 3 1 0; 3 6 -3], R3)
    @test A.nnz_rows == [2]
    @test A == from_COO(3, 3, [(2, 1, 3), (2, 2, 1)], R3)
    @test empty!(A) == zero(A)
    @test length(A) == 0
    @test is_thorough(A)
    @test is_thorough(zero_sparsik(2, 4, R3))

    A = from_dense([0 3 4; 1 2 3; -1 1 1;], R3)
    @test [to_plain(A, to_cartesian(A, i)...) for i in 1:dim(A)] == 1:dim(A)
    cartesian = [A[i, j] for i in 1:size(A, 1) for j in 1:size(A, 2)]
    plain = [A[i] for i in 1:dim(A)]
    @test cartesian == plain

    iters = [(i, x) for (i, x) in A]
    @test iters == [(3, 1), (4, 1), (5, 2), (7, 2), (8, 1), (9, 1)]

end

@testset "DOK_Sparsik - Arithmetic operations" begin

    R3 = Nemo.GF(3)

    A = zero_sparsik(3, 2, R3)
    @test A - A == A + A == A * 5 == A == zero_sparsik(3, 2, R3)

    A = from_dense([3 6 9; -0 0 0; 0 0 0], R3)
    @test iszero(A)

    A = from_dense([1 2 3; 0 0 0; 0 1 -1;], Nemo.QQ)
    B = from_dense([2 4 6; 0 0 0; 0 2 -2;], Nemo.QQ)

    E = from_dense([1 0 0; 0 1 0; 0 0 1;], Nemo.QQ)
    @test E * A == A * E == A

    @test A * B == from_dense([1 5 0; 0 0 0; 0 -1 1;], Nemo.QQ)
    @test A * 0 + A * (-111) + B * B * B * A == from_dense([-110 -217 -333;
                                                            0 0 0;
                                                            0 -112 112;], Nemo.QQ)
    A = from_dense([1 3 0 5;
                    10 0 1 0;
                    3 2 4 0;
                    0 0 3 4;], Nemo.QQ)

    B = from_dense([0 0 3 0;
                    1 2 0 5;
                    0 0 0 0;
                    3 0 0 8;], Nemo.QQ)

    C = from_dense([18 6 3 55;
                    0 0 30 0;
                    2 4 9 10;
                    12 0 0 32;], Nemo.QQ)
    @test scale(A, 3) - scale(B, 4) + A * B == C

    v = from_dense([1, 2, 3], Nemo.QQ)
    @test E * v == v

    v = from_dense([1, 2, 3, 4, 5], Nemo.QQ)
    @test zero_sparsik(3, 5, Nemo.QQ) * v == zero_sparsik(3, Nemo.QQ)

    @test A * zero_sparsik(4, Nemo.QQ) == zero_sparsik(4, Nemo.QQ)

    v = from_dense([1, 0, 0, 4], Nemo.QQ)
    @test A * v == from_dense([21, 10, 3, 16], Nemo.QQ)

    A = from_dense([1 2 3; 4 5 6; 7 8 9;], Nemo.QQ)
    v = from_dense([1, 2, 3], Nemo.QQ)
    @test A * v == from_dense([14, 32, 50], Nemo.QQ)

end

@testset "DOK_Sparsik - Advanced functionality" begin

    sz = [1, 2, 5, 10]
    densities = [0.2, 0.5, 1.0]
    ZZ = Nemo.GF(2^31 - 1)

    # to_dense tests
    for n in sz
        for λ in densities
            A = random_sparsik((n, n), ZZ, density=λ)
            @test A == from_dense(to_dense(A), ZZ)
        end
    end

    # trace tests
    for n in sz
        for λ in densities
            A = random_sparsik((n, n), ZZ, density=λ)
            B = to_dense(A)
            @test tr(A) == sum(B[i, i] for i in 1:n)
        end
    end

    # transpose tests
    for n in sz
        for λ in densities
            A = random_sparsik((n, n), ZZ, density=λ)
            empty!(A.cols); empty!(A.nnz_cols)
            B = transpose!(deepcopy(A))
            empty!(B.cols); empty!(B.nnz_cols)
            @test A == transpose!(B)
        end
    end

    # vec tests
    for n in sz
        for λ in densities
            A = random_sparsik((n, n), ZZ, density=λ)
            v = vec(A)
            @test v == from_dense(reshape(to_dense(transpose!(A)), n^2), ZZ)
        end
    end

end

@info "OK"
