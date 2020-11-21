
#=
    The File contains Sparsik tests
=#

#------------------------------------------------------------------------------

include("../src/sparsik.jl")

#------------------------------------------------------------------------------

if !isdefined(Main, :testset)
    using Test
    using TestSetExtensions
end
import Nemo: QQ, GF, FlintRationalField, characteristic

#------------------------------------------------------------------------------

@testset "Sparsik - Base functionality" begin

    RR = GF(7)
    BIT = GF(2)

    v = Sparsik(7, RR, [1, 3, 5, 7],
        Dict(1 => RR(10), 3 => RR(-2), 5 => RR(8), 7 => RR(4)))
    @test v == from_dense([3, 0, 5, 0, 1, 0, 4], RR)
    v = Sparsik(2, QQ, Int[], Dict{Int, elem_type(QQ)}())
    @test v == from_dense([0, 0], QQ)

    v = from_dense([1, 2, 3], QQ)
    @test scale!(v, -2) == from_dense([-2, -4, -6], QQ)
    @test scale(v, 0) == from_dense([0, 0, 0], QQ)
    @test scale!(v, 2) == from_dense([-4, -8, -12], QQ)
    v = from_dense([1, 2, 3, 4], RR)
    @test iszero(scale(v, 14))

    @test iszero(from_dense([3, 6, 9, -3, 0], GF(3)))
    @test iszero(from_dense([0, 0, 0], RR))
    @test !iszero(from_dense([0, 1, 0], RR))
    v = from_dense([0, 0, 1, 10], RR)
    @test first_nonzero(v) == 3
    v = from_dense([3, 0, 0, 1, 1], GF(3))
    @test first_nonzero(v) == 4
    v = from_dense([0, 0], QQ)
    @test first_nonzero(v) == -1

    v, u = from_dense([1, 0, 3, 0, 5], QQ), from_dense([0, -1, -4, 3, 3], QQ)
    @test inner(v, u) == 3
    v, u = from_dense([1, 2, 3], QQ), from_dense([-1, -2, 1], QQ)
    @test inner(v, u) == -2
    v, u = from_dense([1, 2, 3], BIT), from_dense([1, 2, 3], BIT)
    @test inner(v, u) == 0

    v, u, c = from_dense([1, 2, 3], QQ), from_dense([2, 1, 1], QQ), -1
    @test reduce(v, u, c) == from_dense([-1, 1, 2], QQ)
    v, u, c = from_dense([2, 0, 6], QQ), from_dense([1, 0, 3], QQ), -2
    @test iszero(reduce(v, u, c))
    @test iszero(reduce(v, v, -1))
    v = from_dense([2, 0, 7, 14, 0, 5], RR)
    u = from_dense([-2, 1, 1, 7, 1, -5], RR)
    c = 1
    @test length(reduce!(v, u, c)) == 3
    @test scale!(v, -1) == from_dense([0, -1, -1, 0, 6, 0], RR)
    @test scale!(v, 7) == zero_sparsik(size(v)..., RR)
    @test v + zero_sparsik(size(v)..., RR) == zero_sparsik(size(v)..., RR)

    v = from_dense([1, 0, 0, 0, 0, 7, -7, 3, 1, 1, 0, 4, 5, 11], RR)
    u = from_dense([0, 0, 3, 7, 1, -1, 7, 4, 0, 6, 0, 0, 2, 3], RR)
    r = from_dense([1, 0, 3, 0, 1, 6, 0, 0, 1, 0, 0, 4, 0, 0], RR)
    @test reduce(v, u, 1) == r
    @test length(r.data) == length(r.nonzero) == 6

    items = [(i, x) for (i, x) in r]
    @test items == [(1, RR(1)), (3, RR(3)), (5, RR(1)), (6, RR(6)),
                    (9, RR(1)), (12, RR(4))]

end


# it is important for Sparik's elements denominators not to
# vanish under the given reduction Field
#
# hence, in basis computations we can probably multiply the whole vector
# by something huge to make denominators smaller
@testset "Sparsik - modular" begin

    R7 = GF(7)
    R37 = GF(37)
    BIT = GF(2)

    diff_rationals(x, y) = numerator(x)*denominator(y) - numerator(y)*denominator(x)

    v = from_dense([1, 0, 0, 4, 14, 13], QQ)
    u = from_dense([1, 0, 0, 4, 0, 6], R7)
    @test modular_reduction(v, R7) == u
    r = rational_reconstruction(u)
    @test all(i -> iszero(R7(diff_rationals(r[i], v[i]))), 1:dim(v))

    v = from_dense([11//27, 4//13, 1//1, 0, 22//113, 7//2, 4//3], QQ)

    u = modular_reduction(v, R7)
    r = rational_reconstruction(u)
    @test all(i -> iszero(R7(diff_rationals(r[i], v[i]))), 1:dim(v))

    u = modular_reduction(v, R37)
    r = rational_reconstruction(u)
    @test all(i -> iszero(R37(diff_rationals(r[i], v[i]))), 1:dim(v))

end

@info "OK"
