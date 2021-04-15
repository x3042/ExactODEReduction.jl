
#=
    The File contains tests for find_radical_1 Algorithms
=#

#------------------------------------------------------------------------------

include("../src/radical_with_testing.jl")

#------------------------------------------------------------------------------

if !isdefined(Main, :testset)
    using Test
    using TestSetExtensions
end

#------------------------------------------------------------------------------

function test_find_radical(algorithm)

    # nilpotent space
    set0 = [
        from_dense([0 1; 0 0;], QQ),
        from_dense([1 0; 0 0;], QQ),
        from_dense([0 0; 0 1;], QQ),
    ]
    ans0 = [
        from_dense([0 1; 0 0;], QQ)
    ]

    # almost nilpotent space
    set1 = [
        from_dense([1 0; 0 1;], QQ),
        from_dense([0 1; -1 0;], QQ),
    ]
    ans1 = []

    # some space
    set2 = [
        from_dense([1 0 0; 0 1 0; 0 0 1;], QQ),
    ]
    ans2 = []

    set3 = [
        from_dense([1 0 0; 0 1 0; 0 0 0;], QQ),
    ]
    ans3 = []

    set4 = [
        from_dense([1 0 0; 0 1 0; 0 0 1;], QQ)
        from_dense([0 1 0; 0 0 0; 0 0 0;], QQ)
        from_dense([0 0 0; 0 0 1; 0 0 0;], QQ)
    ]
    ans4 = [
        from_dense([0 1 0; 0 0 0; 0 0 0;], QQ)
        from_dense([0 0 0; 0 0 1; 0 0 0;], QQ)
    ]

    set5 = [
        from_dense([0 1 0; 0 0 0; 0 0 0;], QQ)
        from_dense([0 0 0; 0 0 1; 0 0 0;], QQ)
        from_dense([0 0 1; 0 0 0; 0 0 0;], QQ)
    ]
    ans5 = [
        from_dense([0 0 1; 0 0 0; 0 0 0;], QQ)
        from_dense([0 1 0; 0 0 0; 0 0 0;], QQ)
        from_dense([0 0 0; 0 0 1; 0 0 0;], QQ)
    ]

    set6 = [
        from_dense([0 0 1; 0 0 0; 0 0 0;], QQ)
        from_dense([0 1 0; 0 0 0; 0 0 0;], QQ)
        from_dense([0 0 0; 0 0 1; 0 0 0;], QQ)
        from_dense([1 0 0; 0 0 0; 0 0 0;], QQ)
        from_dense([0 0 0; 0 1 0; 0 0 0;], QQ)
        from_dense([0 0 0; 0 0 0; 0 0 1;], QQ)
        from_dense([0 0 0; 1 0 0; 0 0 0;], QQ)
        from_dense([0 0 0; 0 0 0; 1 0 0;], QQ)
        from_dense([0 0 0; 0 0 0; 0 1 0;], QQ)
    ]
    ans6 = [
    ]

    set7 = [
        from_dense([1 0 0; 0 0 0; 0 0 0;], QQ)
        from_dense([0 0 0; 0 1 0; 0 0 0;], QQ)
        from_dense([0 0 0; 0 0 0; 0 0 1;], QQ)
        from_dense([0 0 0; 1 0 0; 0 0 0;], QQ)
        from_dense([0 0 0; 0 0 0; 1 0 0;], QQ)
        from_dense([0 0 0; 0 0 0; 0 1 0;], QQ)
    ]
    ans7 = [
        from_dense([0 0 0; 1 0 0; 0 0 0;], QQ)
        from_dense([0 0 0; 0 0 0; 1 0 0;], QQ)
        from_dense([0 0 0; 0 0 0; 0 1 0;], QQ)
    ]

    for (set, ans) in zip([set0, set1, set2, set3, set4, set5, set6, set7],
        [ans0, ans1, ans2, ans3, ans4, ans5, ans6, ans7])
        set = linear_span!(set)
        V = algorithm(deepcopy(set))
        @test (isempty(ans) && isempty(V)) || check_inclusion!(linear_span!(deepcopy(ans)), linear_span!(deepcopy(V))) && check_inclusion!(linear_span!(V), linear_span!(ans))
    end

    # --------


end


#------------------------------------------------------------------------------


@testset "radical" begin

    test_find_radical(find_radical)

end


@info "OK"
