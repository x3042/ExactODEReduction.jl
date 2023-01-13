
@testset "Sparse instantiation" begin
    FF = ExactODEReduction.global_field[]
    QQ = Nemo.QQ

    x = sparse(FF.([1 0; 0 1;]))
    y = sparse(QQ.([1 0; 0 3;]))
    z = sparse(QQ.([1, 4]))

    @test y*z == sparse(QQ.([1, 12]))
    @test ExactODEReduction.dim(y) == 4
    @test ExactODEReduction.dim(z) == 2
    @test ExactODEReduction.density(z) == 1.0
    @test ExactODEReduction.density(y) == 0.5

    x = ExactODEReduction.zero_sparse_vector(2, 2, QQ)
    @test iszero(x) && iszero(x*y) && iszero(y*x)
    x = ExactODEReduction.zero_sparse_vector(2, QQ)
    @test iszero(x)
    @test ExactODEReduction.dim(x) == 2
    @test ExactODEReduction.density(x) == 0.0

    ExactODEReduction.random_sparse_vector(2, QQ; density=0.5)
    ExactODEReduction.random_sparse_vector(2, 2, QQ; density=0.5)
    ExactODEReduction.random_sparse_vector((2, 2), QQ; density=0.5)
    ExactODEReduction.random_sparse_vector((1), QQ; density=0.5)
end

@testset "Sparse add-on functions" begin
    FF = ExactODEReduction.global_field[]
    QQ = Nemo.QQ
    MMN = ExactODEReduction.MyModNumber

    x = sparse(QQ.([1 0; 0 3;]))
    y = sparse(MMN.([0 1; 3 2;]))
    z = sparse(QQ.([1, 4]))
    t = sparse(MMN.([0, 2, 5]))
    u = sparse(QQ.([3, 0]))

    @test ExactODEReduction.scale(x, QQ(3)) == sparse(QQ.([3 0; 0 9;]))
    @test ExactODEReduction.scale(z, QQ(2)) == sparse(QQ.([2, 8]))
    @test_broken ExactODEReduction.scale(y, MMN(4)) == sparse(MMN.([0 4; 12 8;]))

    @test Nemo.base_ring(x) == QQ
    @test Nemo.base_ring(y) == FF

    @test ExactODEReduction.mydot(z, z) == QQ(17)
    @test ExactODEReduction.mydot(z, u) == QQ(3)
    @test_broken ExactODEReduction.mydot(t, t) == MMN(29)
end
