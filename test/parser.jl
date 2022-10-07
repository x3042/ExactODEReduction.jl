
#=
    The File contains parser tests
=#

@testset "parser - JSON to DOK_Sparsik" begin

    set_fn = "matrices/matrices_1.json"
    matrices = [sparse(ExactODEReduction.coo_to_arrays(arr[3])..., arr[1], arr[2])
                for arr in ExactODEReduction.load_COO_set(set_fn)]

    @test length(matrices) == 1
    @test matrices[1] == sparse(Nemo.QQ.([2 0; -1 0;]))

    # and the second..
    set_fn = "matrices/matrices_2.json"
    matrices = [sparse(ExactODEReduction.coo_to_arrays(arr[3])..., arr[1], arr[2]) 
                for arr in ExactODEReduction.load_COO_set(set_fn)]

    @test length(matrices) == 3
    @test matrices[1] == sparse(Rational.([3 2 0; 0 1 0; 0 0 0;]))
    @test matrices[2] == sparse(Rational.([1 0 0; 0 0 0; 0 0 0;]))
    @test iszero(matrices[3])

end

@testset "parser - MTX to DOK_Sparsik" begin

    set_group = "test"
    set_name  = "test_set.mtx"

    fn, dim, sz, matrix = ExactODEReduction.load_MTX(set_group, set_name)

    # hmmm
    matrix = matrix[2:end]

    @test fn == set_group*'/'*set_name && dim == 3 && sz == 1
    @test sparse(ExactODEReduction.coo_to_arrays(matrix)..., dim, dim) == sparse(Rational.([1 3 0; 3//2 2 0; 0 0 0;]))

end
