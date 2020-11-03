


#=
    The File contains parser tests
=#


if !isdefined(Main, :testset)
    using Test
    using TestSetExtensions
end

if !isdefined(Main, :load_matrix_set)
    include("../src/parsik.jl")
end

if !isdefined(Main, :from_dense)
    include("../src/bidim_sparsik_lazy.jl")
end


@testset "parser - Parsing JSON to BidimSparsik" begin

    # loading the first set of matrices
    set_fn = "matrices_1.json"
    matrices = [from_COO(arr...) for arr in load_matrix_set(set_fn)]

    @test length(matrices) == 1
    @test matrices[1] == from_dense([2 0; -1 0;])

    # and the second..
    set_fn = "matrices_2.json"
    matrices = [from_COO(arr...) for arr in load_matrix_set(set_fn)]

    @test length(matrices) == 3
    @test matrices[1] == from_dense([3 2 0; 0 1 0; 0 0 0;])
    @test matrices[2] == from_dense([1 0 0;])
    @test iszero(matrices[3])

    @info "OK"

end
