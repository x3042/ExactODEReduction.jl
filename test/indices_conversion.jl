
@testset "Matrix linear indexing" begin
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

@testset "Lazy matrix indexing" begin
    A = sparse([1 0 0; 0 0 1; 0 0 0; 2 1 0;])
    set_ = [(1, 1), (4, 1), (4, 2), (2, 3)]
    notset_ = [(1, 2), (1, 3), (2, 1), (2, 2), (3, 1), (3, 2), (3, 3), (4, 3)]
    for I in set_
        @test ExactODEReduction.issetindex(A, I...)
    end
    for I in notset_
        @test !ExactODEReduction.issetindex(A, I...)
    end
    set_ = [1, 4, 8, 10]
    notset_ = [2, 3, 5, 6, 7, 9, 11, 12]
end
