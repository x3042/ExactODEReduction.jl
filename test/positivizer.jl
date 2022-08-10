
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

#------------------------------------------------------------------------------


@testset "positivize" begin

    test_positivize_no_change(positivize)

end
