
#=
    The File contains parser tests
=#

#------------------------------------------------------------------------------

include("../src/parsik.jl")
include("../src/bidim_sparsik_lazy.jl")

#------------------------------------------------------------------------------

if !isdefined(Main, :testset)
    using Test
    using TestSetExtensions
end

#------------------------------------------------------------------------------

@testset "parser - JSON to BidimSparsikLazy" begin

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

@info "OK"
