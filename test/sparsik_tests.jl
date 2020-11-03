

#=
    The File contains Sparsik tests
=#


if !isdefined(Main, :testset)
    using Test
    using TestSetExtensions
end

if !isdefined(Main, :Sparsik)
    include("../src/sparsik.jl")
end



@testset "Sparsik - Base functionality" begin

    # from_vector
    v = Sparsik(7, [1, 3, 5, 7], Dict(1 => 10, 3 => -2, 5 => 8, 7 => 4))
    @test v == from_vector([10, 0, -2, 0, 8, 0, 4])
    v = Sparsik(2, [], Dict())
    @test v == from_vector([0, 0])

    # scale & scale!
    v = from_vector([1, 2, 3])
    @test scale!(v, -2) == from_vector([-2, -4, -6])
    @test scale(v, 0) == from_vector([0, 0, 0])
    @test scale!(v, 2) == from_vector([-4, -8, -12])

    # iszero & first_nonzero
    @test iszero(Sparsik(3, [], Dict()))
    @test iszero(from_vector([0, 0, 0]))
    @test !iszero(from_vector([0, 1, 0]))
    v = from_vector([0, 0, 1, 10])
    @test first_nonzero(v) == 3
    v = from_vector([0, 0])
    @test first_nonzero(v) == -1

    v, u = from_vector([1, 0, 3, 0, 5]), from_vector([0, -1, -4, 3, 3])
    @test inner(v, u) == 3
    v, u = from_vector([1, 2, 3]), from_vector([-1, -2, 1])
    @test inner(v, u) == -2

    # reduce
    v, u, c = from_vector([1, 2, 3]), from_vector([2, 1, 1]), -1
    @test reduce(v, u, c) == from_vector([-1, 1, 2])
    v, u, c = from_vector([2, 0, 6]), from_vector([1, 0, 3]), -2
    @test iszero(reduce(v, u, c))
    @test iszero(reduce(v, v, -1))

    @info "OK"

end
