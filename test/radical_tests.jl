
#=
    The File contains tests for find_radical
=#

#------------------------------------------------------------------------------


cases = [
    Dict(
         :basis => [
             from_dense([0 1; 0 0], Nemo.QQ),
             from_dense([1 0; 0 0], Nemo.QQ),
             from_dense([0 0; 0 1], Nemo.QQ)
         ],
         :correct => [
             from_dense([0 1; 0 0], Nemo.QQ)
         ]
    ),
    Dict(
        :basis => [
            from_dense([1 0; 0 1], Nemo.QQ),
            from_dense([0 1; -1 0], Nemo.QQ)
        ],
        :correct => []
    ),
    Dict(
        :basis => [
            from_dense([1 0 0; 0 1 0; 0 0 1], Nemo.QQ)
        ],
        :correct => []
    ),
    Dict(
        :basis => [
            from_dense([1 0 0; 0 1 0; 0 0 0], Nemo.QQ)
        ],
        :correct => []
    ),
    Dict(
        :basis => [
            from_dense([1 0 0; 0 1 0; 0 0 1], Nemo.QQ),
            from_dense([0 1 0; 0 0 0; 0 0 0], Nemo.QQ),
            from_dense([0 0 0; 0 0 1; 0 0 0], Nemo.QQ)
        ],
        :correct => [
            from_dense([0 1 0; 0 0 0; 0 0 0], Nemo.QQ),
            from_dense([0 0 0; 0 0 1; 0 0 0], Nemo.QQ)
        ]
    ),
    Dict(
        :basis => [
            from_dense([0 1 0; 0 0 0; 0 0 0], Nemo.QQ),
            from_dense([0 0 0; 0 0 1; 0 0 0], Nemo.QQ),
            from_dense([0 0 1; 0 0 0; 0 0 0], Nemo.QQ)
        ],
        :correct => [
            from_dense([0 0 1; 0 0 0; 0 0 0], Nemo.QQ),
            from_dense([0 1 0; 0 0 0; 0 0 0], Nemo.QQ),
            from_dense([0 0 0; 0 0 1; 0 0 0], Nemo.QQ)
        ]
    ),
    Dict(
        :basis => [
            from_dense([0 0 1; 0 0 0; 0 0 0], Nemo.QQ),
            from_dense([0 1 0; 0 0 0; 0 0 0], Nemo.QQ),
            from_dense([0 0 0; 0 0 1; 0 0 0], Nemo.QQ),
            from_dense([1 0 0; 0 0 0; 0 0 0], Nemo.QQ),
            from_dense([0 0 0; 0 1 0; 0 0 0], Nemo.QQ),
            from_dense([0 0 0; 0 0 0; 0 0 1], Nemo.QQ),
            from_dense([0 0 0; 1 0 0; 0 0 0], Nemo.QQ),
            from_dense([0 0 0; 0 0 0; 1 0 0], Nemo.QQ),
            from_dense([0 0 0; 0 0 0; 0 1 0], Nemo.QQ)
        ],
        :correct => []
    ),
    Dict(
        :basis => [
            from_dense([1 0 0; 0 0 0; 0 0 0], Nemo.QQ),
            from_dense([0 0 0; 0 1 0; 0 0 0], Nemo.QQ),
            from_dense([0 0 0; 0 0 0; 0 0 1], Nemo.QQ),
            from_dense([0 0 0; 1 0 0; 0 0 0], Nemo.QQ),
            from_dense([0 0 0; 0 0 0; 1 0 0], Nemo.QQ),
            from_dense([0 0 0; 0 0 0; 0 1 0], Nemo.QQ)
        ],
        :correct => [
            from_dense([0 0 0; 1 0 0; 0 0 0], Nemo.QQ),
            from_dense([0 0 0; 0 0 0; 1 0 0], Nemo.QQ),
            from_dense([0 0 0; 0 0 0; 0 1 0], Nemo.QQ)
        ]
    ),
    Dict(
        :basis => [
	    from_dense([0 1; 0 0], Nemo.QQ)
	],
	:correct => [
	    from_dense([0 1; 0 0], Nemo.QQ)	     
        ]
    )
]

function test_find_radical(algorithm)

    for c in cases
        basis = c[:basis]
        basis = linear_span!(basis)
        V = algorithm(deepcopy(basis))
        @test (isempty(c[:correct]) && isempty(V)) || check_inclusion!(linear_span!(deepcopy(c[:correct])), linear_span!(deepcopy(V))) && check_inclusion!(linear_span!(V), linear_span!(c[:correct]))
    end

end


#------------------------------------------------------------------------------


@testset "radical" begin

    test_find_radical(find_radical_sup)

end


@info "OK"
