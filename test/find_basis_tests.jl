
#=
    The File contains tests for find_basis Algorithms
=#

#------------------------------------------------------------------------------

include("../src/basis.jl")

#------------------------------------------------------------------------------

if !isdefined(Main, :testset)
    using Test
    using TestSetExtensions
end

#------------------------------------------------------------------------------

# Tests the given algorithm for correctness by comparing
# it with the output of standard find_basis_1 on random samples
# The latter is assumed to be correct
#
# Yet some tests are hardcoded just in case
function test_find_basis(algorithm)

    # nilpotent space
    set0 = [
        from_dense([0 1; 0 0;], QQ),
    ]
    ans0 = linear_span!([
        from_dense([0 1; 0 0;], QQ)
    ])

    # almost nilpotent space
    set1 = [
        from_dense([0 1; 0 0;], QQ),
        from_dense([0 0; 0 1;], QQ),
    ]
    ans1 = linear_span!([
        from_dense([0 1; 0 0;], QQ),
        from_dense([0 0; 0 1;], QQ),
    ])

    # some space
    set2 = [
        from_dense([1 2 3; 0 1 0; 0 0 0;], QQ),
        from_dense([1 0 0; 0 0 0; 0 2 1;], QQ)
    ]
    ans2 = linear_span!([
        from_dense([1 0 0; 0 0 0; 0 0 1;], QQ),
        from_dense([0 1 0; 0 0 0; 0 0 0;], QQ),
        from_dense([0 0 1; 0 0 0; 0 0 -1//3;], QQ),
        from_dense([0 0 0; 0 1 0; 0 0 0;], QQ),
        from_dense([0 0 0; 0 0 0; 0 1 0;], QQ)
    ])

    # complete space
    set3 = [
        from_dense([1 0 0; 2 1 3; 1 0 0;], QQ),
        from_dense([0 1 0; 1 0 0; 0 0 1;], QQ)
    ]
    ans3 = linear_span!([
        from_dense([1 0 0; 0 0 0; 0 0 0;], QQ),
        from_dense([0 1 0; 0 0 0; 0 0 0;], QQ),
        from_dense([0 0 1; 0 0 0; 0 0 0;], QQ),
        from_dense([0 0 0; 1 0 0; 0 0 0;], QQ),
        from_dense([0 0 0; 0 1 0; 0 0 0;], QQ),
        from_dense([0 0 0; 0 0 1; 0 0 0;], QQ),
        from_dense([0 0 0; 0 0 0; 1 0 0;], QQ),
        from_dense([0 0 0; 0 0 0; 0 1 0;], QQ),
        from_dense([0 0 0; 0 0 0; 0 0 1;], QQ),
    ])

    for (set, ans) in zip([set0, set1, set2, set3], [ans0, ans1, ans2, ans3])
        V = algorithm(deepcopy(set))
        @test check_inclusion!(deepcopy(ans), deepcopy(V)) && check_inclusion!(V, deepcopy(ans))
    end

    # --------
    # a series of random tests

    ZZ  = GF(2^31 - 1)

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

@testset "basis, Wied. algorithm" begin

    # the algorithm is probabilistic, we should probably apply_vectors once again
    # at the end to obtain the answer, just as in find_basis_1_beta

    # test_find_basis(find_basis_2)

end

@testset "basis, Beta algorithm" begin

    test_find_basis(find_basis_1_beta)

end

@testset "basis, Gamma-Beta algorithm" begin

    # test_find_basis(find_basis_1_γβ)

end

@info "OK"
