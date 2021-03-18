
#=
    The File contains tests for find_basis Algorithms
=#

#------------------------------------------------------------------------------

include("../src/wiedemannchik.jl")

#------------------------------------------------------------------------------

if !isdefined(Main, :testset)
    using Test
    using TestSetExtensions
end

#------------------------------------------------------------------------------

function test_minimal_polynomial(minpoly)
    #=
        Only annihilating property is tested
        Minimality property is ommited
    =#

    S, x = QQ["x"]

    # hardcoded tests
    A = from_COO(1, 1, [(1, 1, 1)], QQ)
    f = minpoly(A, S)
    @test !iszero(f) && iszero(evaluate(f, A))

    A = from_dense([1 2; 3 4;], QQ)
    f = minpoly(A, S)
    @test !iszero(f) && iszero(evaluate(f, A))

    A = from_dense([1 0 0; 0 1 0; 0 0 0], QQ)
    f = minpoly(A, S)
    @test !iszero(f) && iszero(evaluate(f, A))

    A = from_dense([3 -3 2; -1 5 -2; -1 3 0], QQ)
    f = minpoly(A, S)
    @test !iszero(f) && iszero(evaluate(f, A))

    A = from_dense([0 0; 0 0;], QQ)
    @test_throws DomainError minpoly(A, S)

    # some random tests
    # - dense case
    sizes = [3, 5, 10]
    densities = [0.2, 0.5, 1.0]
    ZZ = GF(2^31 - 1)
    S, _ = ZZ["x"]
    for n in sizes
        for λ in densities
            A = random_sparsik((n, n), ZZ, density=λ)
            try
                f = minpoly(A, S)
                @test !iszero(f) && iszero(evaluate(f, A))
            catch DomainError
                !iszero(A) && rethrow()
            end
        end
    end

    # - highly singular case
    n = 5
    S, _ = QQ["x"]
    for _ in 1 : n^2
        i, j, k, r = rand(1:n^2, 4)
        # sum of four random unit matrices
        A = sum(unit_sparsik((n, n), pos, QQ) for pos in (i, j, k, r))
        f = minpoly(A, S)
        @test !iszero(f) && iszero(evaluate(f, A))
    end

end

#------------------------------------------------------------------------------

@testset "minpolynomial, basic deterministic" begin

    test_minimal_polynomial(__deterministic_simple_minpoly)

end

@info "OK"
