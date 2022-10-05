
#=
    The File contains tests for find_radical
=#

#------------------------------------------------------------------------------

cases = [
    Dict(
         :basis => [
             sparse(Nemo.QQ.([0 1; 0 0])),
             sparse(Nemo.QQ.([1 0; 0 0])),
             sparse(Nemo.QQ.([0 0; 0 1]))
         ],
         :correct => [
             sparse(Nemo.QQ.([0 1; 0 0]))
         ]
    ),
    Dict(
        :basis => [
            sparse(Nemo.QQ.([1 0; 0 1])),
            sparse(Nemo.QQ.([0 1; -1 0]))
        ],
        :correct => []
    ),
    Dict(
        :basis => [
            sparse(Nemo.QQ.([1 0 0; 0 1 0; 0 0 1]))
        ],
        :correct => []
    ),
    Dict(
        :basis => [
            sparse(Nemo.QQ.([1 0 0; 0 1 0; 0 0 0]))
        ],
        :correct => []
    ),
    Dict(
        :basis => [
            sparse(Nemo.QQ.([1 0 0; 0 1 0; 0 0 1])),
            sparse(Nemo.QQ.([0 1 0; 0 0 0; 0 0 0])),
            sparse(Nemo.QQ.([0 0 0; 0 0 1; 0 0 0]))
        ],
        :correct => [
            sparse(Nemo.QQ.([0 1 0; 0 0 0; 0 0 0])),
            sparse(Nemo.QQ.([0 0 0; 0 0 1; 0 0 0]))
        ]
    ),
    Dict(
        :basis => [
            sparse(Nemo.QQ.([0 1 0; 0 0 0; 0 0 0])),
            sparse(Nemo.QQ.([0 0 0; 0 0 1; 0 0 0])),
            sparse(Nemo.QQ.([0 0 1; 0 0 0; 0 0 0]))
        ],
        :correct => [
            sparse(Nemo.QQ.([0 0 1; 0 0 0; 0 0 0])),
            sparse(Nemo.QQ.([0 1 0; 0 0 0; 0 0 0])),
            sparse(Nemo.QQ.([0 0 0; 0 0 1; 0 0 0]))
        ]
    ),
    Dict(
        :basis => [
            sparse(Nemo.QQ.([0 0 1; 0 0 0; 0 0 0])),
            sparse(Nemo.QQ.([0 1 0; 0 0 0; 0 0 0])),
            sparse(Nemo.QQ.([0 0 0; 0 0 1; 0 0 0])),
            sparse(Nemo.QQ.([1 0 0; 0 0 0; 0 0 0])),
            sparse(Nemo.QQ.([0 0 0; 0 1 0; 0 0 0])),
            sparse(Nemo.QQ.([0 0 0; 0 0 0; 0 0 1])),
            sparse(Nemo.QQ.([0 0 0; 1 0 0; 0 0 0])),
            sparse(Nemo.QQ.([0 0 0; 0 0 0; 1 0 0])),
            sparse(Nemo.QQ.([0 0 0; 0 0 0; 0 1 0]))
        ],
        :correct => []
    ),
    Dict(
        :basis => [
            sparse(Nemo.QQ.([1 0 0; 0 0 0; 0 0 0])),
            sparse(Nemo.QQ.([0 0 0; 0 1 0; 0 0 0])),
            sparse(Nemo.QQ.([0 0 0; 0 0 0; 0 0 1])),
            sparse(Nemo.QQ.([0 0 0; 1 0 0; 0 0 0])),
            sparse(Nemo.QQ.([0 0 0; 0 0 0; 1 0 0])),
            sparse(Nemo.QQ.([0 0 0; 0 0 0; 0 1 0]))
        ],
        :correct => [
            sparse(Nemo.QQ.([0 0 0; 1 0 0; 0 0 0])),
            sparse(Nemo.QQ.([0 0 0; 0 0 0; 1 0 0])),
            sparse(Nemo.QQ.([0 0 0; 0 0 0; 0 1 0]))
        ]
    ),
    Dict(
        :basis => [
	    sparse(Nemo.QQ.([0 1; 0 0]))
	],
	:correct => [
	    sparse(Nemo.QQ.([0 1; 0 0]))	     
        ]
    )
]

function test_find_radical(algorithm)
    for c in cases
        basis = c[:basis]
        basis = ExactODEReduction.linear_span!(basis)
        V = algorithm(deepcopy(basis))
        @test (isempty(c[:correct]) && isempty(V)) || ExactODEReduction.check_inclusion!(ExactODEReduction.linear_span!(deepcopy(c[:correct])), ExactODEReduction.linear_span!(deepcopy(V))) && ExactODEReduction.check_inclusion!(ExactODEReduction.linear_span!(V), ExactODEReduction.linear_span!(c[:correct]))
    end
end

#------------------------------------------------------------------------------

@testset "radical" begin
    test_find_radical(ExactODEReduction.find_radical_sup)
end

