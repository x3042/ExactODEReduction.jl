


#=
    The File contains parser tests
=#


if !isdefined(Main, :testset)
    using Test
    using TestSetExtensions
end

if !isdefined(Main, :load_matrix_set)
    include("..\\src/parser.jl")
end

if !isdefined(Main, :from_dense)
    include("..\\src/bidim_sparsik_lazy.jl")
end


@testset "parser - Parsing JSON to BidimSparsik" begin

    # loading the first set of matrices
    set_fn = "matrices_1.json"
    matrices = [from_dense(arr) for arr in load_matrix_set(set_fn)]

    @test length(matrices) == 1
    @test matrices[1] == from_dense([1 2; 0 0;])

    # and the second..
    set_fn = "matrices_2.json"
    matrices = [from_dense(arr) for arr in load_matrix_set(set_fn)]

    @test length(matrices) == 3
    @test matrices[1] == from_dense([1 2 3; 4 5 6; 7 8 9;])
    @test matrices[2] == from_dense([1 0 0;])
    @test iszero(matrices[3])

    @info "OK"

end
