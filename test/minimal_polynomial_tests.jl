
#=
    The File contains tests for find_basis Algorithms
=#

#------------------------------------------------------------------------------

function test_minimal_polynomial(minpoly)
    #=
        Only annihilating property is tested
        Minimality property is ommited
    =#

    S, x = Nemo.QQ["x"]

    # hardcoded tests
    A = from_COO(1, 1, [(1, 1, 1)], Nemo.QQ)
    f = minpoly(A)
    @test !iszero(f) && iszero(evaluate(f, A))

    A = from_dense([1 2; 3 4;], Nemo.QQ)
    f = minpoly(A)
    @test !iszero(f) && iszero(evaluate(f, A))

    A = from_dense([1 0 0; 0 1 0; 0 0 0], Nemo.QQ)
    f = minpoly(A)
    @test !iszero(f) && iszero(evaluate(f, A))

    A = from_dense([3 -3 2; -1 5 -2; -1 3 0], Nemo.QQ)
    f = minpoly(A)
    @test !iszero(f) && iszero(evaluate(f, A))

    A = from_dense([0 0; 0 0;], Nemo.QQ)
    @test minpoly(A) == gen(parent(minpoly(A)))

    # some random tests
    # - dense case
    sizes = [3, 5, 10]
    densities = [0.2, 0.5, 1.0]
    ZZ = Nemo.GF(2^31 - 1)
    S, _ = ZZ["x"]
    for n in sizes
        for λ in densities
            A = random_sparsik((n, n), ZZ, density=λ)
            try
                f = minpoly(A)
                @test iszero(evaluate(f, A))
            catch DomainError
                !iszero(A) && rethrow()
            end
        end
    end

    # - highly singular case
    n = 5
    S, _ = Nemo.QQ["x"]
    for _ in 1 : n^2
        i, j, k, r = rand(1:n^2, 4)
        # sum of four random unit matrices
        A = sum(unit_sparsik((n, n), pos, Nemo.QQ) for pos in (i, j, k, r))
        reconstruct!(A)
        f = minpoly(A)
        @test !iszero(f) && iszero(evaluate(f, A))
    end

end

#------------------------------------------------------------------------------

@testset "minpolynomial, basic deterministic" begin

    # test_minimal_polynomial(minimal_polynomial_wiedemann)

end

@info "OK"
