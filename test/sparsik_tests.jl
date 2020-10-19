

#=
    The File contains Sparsik tests
=#


if !isdefined(Main, :testset)
    using Test
    using TestSetExtensions
end

if !isdefined(Main, :Sparsik)
    include("..\\src/sparsik.jl")
end



@testset "Base functionality" begin

    # from_dense
    v = Sparsik(7, [1, 3, 5, 7], Dict(1 => 10, 3 => -2, 5 => 8, 7 => 4))
    @test v == from_dense([10, 0, -2, 0, 8, 0, 4])
    v = Sparsik(2, [], Dict())
    @test v == from_dense([0, 0])

    # scale & scale!
    v = from_dense([1, 2, 3])
    @test scale!(v, -2) == from_dense([-2, -4, -6])
    @test scale(v, 0) == from_dense([0, 0, 0])
    @test scale!(v, 2) == from_dense([-4, -8, -12])

    # iszero & first_nonzero
    @test iszero(Sparsik(3, [], Dict()))
    @test iszero(from_dense([0, 0, 0]))
    @test !iszero(from_dense([0, 1, 0]))
    v = from_dense([0, 0, 1, 10])
    @test first_nonzero(v) == 3
    v = from_dense([0, 0])
    @test_throws BoundsError first_nonzero(v)

    # inner & inner_2
    v, u = from_dense([1, 0, 3, 0, 5]), from_dense([0, -1, -4, 3, 3])
    @test inner(v, u) == 3
    @test inner_2(v, u) == 3
    v, u = from_dense([1, 2, 3]), from_dense([-1, -2, 1])
    @test inner_2(v, u) == -2

    # reduce
    v, u, c = from_dense([1, 2, 3]), from_dense([2, 1, 1]), -1
    @test reduce(v, u, c) == from_dense([-1, 1, 2])
    v, u, c = from_dense([2, 0, 6]), from_dense([1, 0, 3]), -2
    @test iszero(reduce(v, u, c))
    @test iszero(reduce(v, v, -1))

end
