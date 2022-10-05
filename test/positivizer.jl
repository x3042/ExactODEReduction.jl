
#=
    The File contains tests for positivize
=#

#------------------------------------------------------------------------------

function test_positivize_no_change(algorithm)
    cases = [
        [sparse(Nemo.QQ.([1, -1]))],
	    [sparse(Nemo.QQ.([1, 0, -1])), sparse(Nemo.QQ.([0, -1, 1]))],
	    [sparse(Nemo.QQ.(([1, 0, 0]))), sparse(Nemo.QQ.([0, 1, -1]))]
    ]

    for c in cases
        @test algorithm(c) == c
    end
end

function test_positivize_change(algorithm)
    cases = [
        Dict(:in => [sparse(Nemo.QQ.([2, 2]))], :out => [sparse(Nemo.QQ.([1, 1]))]),
	Dict(
	    :in => [sparse(Nemo.QQ.([1, -1])), sparse(Nemo.QQ.([2, -3]))], 
	    :out => [sparse(Nemo.QQ.([1, 0])), sparse(Nemo.QQ.(([0, 1])))]
	),
	Dict(
	    :in => [sparse(Nemo.QQ.([1, 0, -1])), sparse(Nemo.QQ.([1, 1, 0]))],
	    :out => [sparse(Nemo.QQ.([1, 1, 0])), sparse(Nemo.QQ.([0, 1, 1]))]
	),
	Dict(
	    :in => [sparse(Nemo.QQ.([1, -1, 0, 0])), sparse(Nemo.QQ.([0, 0, 1, -1])), sparse(Nemo.QQ.([0, 1, 1, 0]))],
	    :out => [sparse(Nemo.QQ.([1, 0, 1, 0])), sparse(Nemo.QQ.([1, 0, 0, 1])), sparse(Nemo.QQ.([0, 1, 0, 1]))]
	)
    ]

    for c in cases
        @test c[:out] == algorithm(c[:in])
    end
end

#------------------------------------------------------------------------------


@testset "positivize" begin

    test_positivize_no_change(ExactODEReduction.positivize)
    test_positivize_change(ExactODEReduction.positivize)

end
