
#=
    The File contains parser tests
=#

#------------------------------------------------------------------------------

include("../src/parsik.jl")
include("../src/structs/dok_sparsik.jl")

#------------------------------------------------------------------------------

if !isdefined(Main, :testset)
    using Test
    using TestSetExtensions
end

#------------------------------------------------------------------------------

@testset "parser - JSON to DOK_Sparsik" begin

    set_fn = "matrices_1.json"
    matrices = [from_COO(arr..., QQ) for arr in load_COO_set(set_fn)]

    @test length(matrices) == 1
    @test matrices[1] == from_dense([2 0; -1 0;], QQ)

    # and the second..
    set_fn = "matrices_2.json"
    matrices = [from_COO(arr..., QQ) for arr in load_COO_set(set_fn)]

    @test length(matrices) == 3
    @test matrices[1] == from_dense([3 2 0; 0 1 0; 0 0 0;], QQ)
    @test matrices[2] == from_dense([1 0 0;], QQ)
    @test iszero(matrices[3])

end

@testset "parser - MTX to DOK_Sparsik" begin

    set_group = "test"
    set_name  = "test_set.mtx"

    fn, dim, sz, matrix = load_MTX(set_group, set_name)

    # hmmm
    matrix = matrix[2:end]

    @test fn == set_group*'/'*set_name && dim == 3 && sz == 1
    @test from_COO(dim, dim, matrix, QQ) == from_dense([1 3 0; 3//2 1 0; 0 0 0;], QQ)

end


@info "OK"
