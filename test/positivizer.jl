
#=
    The File contains tests for positivize
=#

#------------------------------------------------------------------------------

function test_positivize_no_change(algorithm)
  
    cases = [
        [from_dense([1, -1], Nemo.QQ)],
	[from_dense([1, 0, -1], Nemo.QQ), from_dense([0, -1, 1], Nemo.QQ)],
	[from_dense([1, 0, 0], Nemo.QQ), from_dense([0, 1, -1], Nemo.QQ)]
    ]

    for c in cases
        @test algorithm(c) == c
    end
end

function test_positivize_change(algorithm)
    cases = [
        Dict(:in => [from_dense([2, 2], Nemo.QQ)], :out => [from_dense([1, 1], Nemo.QQ)]),
	Dict(
	    :in => [from_dense([1, -1], Nemo.QQ), from_dense([2, -3], Nemo.QQ)], 
	    :out => [from_dense([1, 0], Nemo.QQ), from_dense([0, 1], Nemo.QQ)]
	),
	Dict(
	    :in => [from_dense([1, 0, -1], Nemo.QQ), from_dense([1, 1, 0], Nemo.QQ)],
	    :out => [from_dense([1, 1, 0], Nemo.QQ), from_dense([0, 1, 1], Nemo.QQ)]
	),
	Dict(
	    :in => [from_dense([1, -1, 0, 0], Nemo.QQ), from_dense([0, 0, 1, -1], Nemo.QQ), from_dense([0, 1, 1, 0], Nemo.QQ)],
	    :out => [from_dense([1, 0, 1, 0], Nemo.QQ), from_dense([1, 0, 0, 1], Nemo.QQ), from_dense([0, 1, 0, 1], Nemo.QQ)]
	)
    ]

    for c in cases
        @test c[:out] == algorithm(c[:in])
    end
end

#------------------------------------------------------------------------------


@testset "positivize" begin

    test_positivize_no_change(positivize)
    test_positivize_change(positivize)

end
