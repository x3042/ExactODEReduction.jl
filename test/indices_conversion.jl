
@testset "Sparse Arrays linear indexing" begin
    xxx = sparse([0 0 0; 0 0 0; 1 1 1;])
    @test ExactODEReduction.first_nonzero(xxx) == 3
    @test xxx[3] == 1
    xxx = sparse([0 0 0; 0 0 0; 0 8 1;])
    @test ExactODEReduction.first_nonzero(xxx) == 6
    xxx = sparse([1 0 0; 0 0 0; 0 0 1;])
    @test ExactODEReduction.first_nonzero(xxx) == 1
    xxx = sparse([0 0 0; 1 0 0; 0 0 1;])
    @test ExactODEReduction.first_nonzero(xxx) == 2
    xxx = sparse([0 0 0; 0 0 0; 0 0 1;])
    @test ExactODEReduction.first_nonzero(xxx) == 9
    xxx = sparse([0 0 0; 0 1 0; 0 0 1;])
    @test ExactODEReduction.first_nonzero(xxx) == 5
    xxx = sparse([0 0 0; 0 0 6; 0 0 1;])
    @test ExactODEReduction.first_nonzero(xxx) == 8
    @test xxx[8] == 6

    x = sparse([1, 0, 0])
    @test ExactODEReduction.first_nonzero(x) == 1
    x = sparse([0, 8, 0])
    @test ExactODEReduction.first_nonzero(x) == 2
    @test x[2] == 8
    x = sparse([0, 0, 1])
    @test ExactODEReduction.first_nonzero(x) == 3

    x = sparse([2, 3, 2, 3, 2, 4], [1, 1, 2, 2, 3, 3], Int[1, 1, 1, 1, 1, 1], 4, 4)
    @test ExactODEReduction.first_nonzero(x) == 2
    @test x[2] == 1

end

@testset "Unit sparse vectors" begin
    @test ExactODEReduction.unit_sparse_vector(3, 1, Nemo.QQ) == sparse([Nemo.QQ(1), 0, 0])
    @test ExactODEReduction.unit_sparse_vector(3, 2, Nemo.QQ) == sparse([0, Nemo.QQ(1), 0])
    @test ExactODEReduction.unit_sparse_vector(3, 3, Nemo.QQ) == sparse([0, 0, Nemo.QQ(1)])

    # @test ExactODEReduction.unit_sparse_vector((2, 4), 1, Nemo.QQ) == sparse([Nemo.QQ(1) 0; 0 0; 0 0; 0 0;])

end
