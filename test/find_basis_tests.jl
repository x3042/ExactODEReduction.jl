
#=
    The File contains tests for find_basis Algorithms
=#

#------------------------------------------------------------------------------

# Tests the given algorithm for correctness by comparing
# it with the output of standard find_basis_1 on random samples
# The latter is assumed to be correct
#
# Yet some tests are hardcoded just in case
function test_find_basis(algorithm)

    # nilpotent space
    set0 = [
        sparse(Nemo.QQ.([0 1; 0 0;])),
    ]
    ans0 = linear_span!([
        sparse(Nemo.QQ.([0 1; 0 0;]))
    ])

    # almost nilpotent space
    set1 = [
        sparse(Nemo.QQ.([0 1; 0 0;])),
        sparse(Nemo.QQ.([0 0; 0 1;])),
    ]
    ans1 = linear_span!([
        sparse(Nemo.QQ.([0 1; 0 0;])),
        sparse(Nemo.QQ.([0 0; 0 1;])),
    ])

    # some space
    set2 = [
        sparse(Nemo.QQ.([1 2 3; 0 1 0; 0 0 0;])),
        sparse(Nemo.QQ.([1 0 0; 0 0 0; 0 2 1;]))
    ]
    ans2 = linear_span!([
        sparse(Nemo.QQ.([1 0 0; 0 0 0; 0 0 1;])),
        sparse(Nemo.QQ.([0 1 0; 0 0 0; 0 0 0;])),
        sparse(Nemo.QQ.([0 0 1; 0 0 0; 0 0 -1//3;])),
        sparse(Nemo.QQ.([0 0 0; 0 1 0; 0 0 0;])),
        sparse(Nemo.QQ.([0 0 0; 0 0 0; 0 1 0;]))
    ])

    # complete space
    set3 = [
        sparse(Nemo.QQ.([1 0 0; 2 1 3; 1 0 0;])),
        sparse(Nemo.QQ.([0 1 0; 1 0 0; 0 0 1;]))
    ]
    ans3 = linear_span!([
        sparse(Nemo.QQ.([1 0 0; 0 0 0; 0 0 0;])),
        sparse(Nemo.QQ.([0 1 0; 0 0 0; 0 0 0;])),
        sparse(Nemo.QQ.([0 0 1; 0 0 0; 0 0 0;])),
        sparse(Nemo.QQ.([0 0 0; 1 0 0; 0 0 0;])),
        sparse(Nemo.QQ.([0 0 0; 0 1 0; 0 0 0;])),
        sparse(Nemo.QQ.([0 0 0; 0 0 1; 0 0 0;])),
        sparse(Nemo.QQ.([0 0 0; 0 0 0; 1 0 0;])),
        sparse(Nemo.QQ.([0 0 0; 0 0 0; 0 1 0;])),
        sparse(Nemo.QQ.([0 0 0; 0 0 0; 0 0 1;])),
    ])

    for (set, ans) in zip([set0, set1, set2, set3], [ans0, ans1, ans2, ans3])
        V = algorithm(deepcopy(set))
        @test check_inclusion!(deepcopy(ans), deepcopy(V)) && check_inclusion!(V, deepcopy(ans))
    end

    # --------
    # a series of random tests

    ZZ  = Nemo.GF(Nemo.fmpz(2^31 - 1))

    dims      = [3, 3, 4, 4, 5, 5, 5, 5, 8, 8, 8, 8, 10, 10, 10]
    sizes     = [1, 3, 10]
    densities = [0.05, 0.1, 0.2, 0.5]

    for n in dims
        for sz in sizes
            for d in densities
                As = [
                    random_sparsik((n, n), ZZ, density=d)
                    for _ in 1:sz
                ]
                if all(iszero, As)
                    continue
                end
                ans = find_basis_1(deepcopy(As))
                V   = algorithm(deepcopy(As))
                @test check_inclusion!(ans, deepcopy(V)) && check_inclusion!(V, deepcopy(ans))
            end
        end
    end

end


#------------------------------------------------------------------------------

@testset "basis, just in case" begin
    # This must always pass
    test_find_basis(find_basis_1)

end

@testset "basis, β algorithm" begin

    test_find_basis(find_basis_1_β)

end

@info "OK"
