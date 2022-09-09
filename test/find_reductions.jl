
#=
    The File contains tests for the main functions
=#

#------------------------------------------------------------------------------

cases = [
    Dict(
        :sys => @ODEsystem(
	    x1'(t) = x1(t),
	    x2'(t) = 2 * x2(t),
	    x3'(t) = 3 * x3(t)
	),
	:dims => Set([1, 2]),
	:constrained => [([x1], 1), ([x1 + x2], 2)]
    ),
    Dict(
        :sys => @ODEsystem(
	    x1'(t) = 2 + x1(t),
	    x2'(t) = x1(t)^3 + x1(t) + x2(t),
	    x3'(t) = x1(t) * x2(t) - 10 * x2(t)^2 + x3(t),
	    x4'(t) = x1(t)^3 + x2(t)^6 - 7 * x3(t) * x1(t) - x4(t)
	),
	:dims => Set([1, 2, 3]),
	:constrained => [([x1], 1), ([x2], 2), ([x2, x3], 3)]
    ),
    Dict(
        :sys => @ODEsystem(
	    x1'(t) = 2,
	    x2'(t) = x1(t)^3 + x1(t),
	    x3'(t) = x1(t) * x2(t) - 10 * x2(t)^2,
	    x4'(t) = x1(t)^3 + x2(t)^6 - 7 * x3(t) * x1(t)
	),
	:dims => Set([1, 2, 3]),
	:constrained => [([x1], 1), ([x2], 2), ([x2, x3], 3)]
    ),
    Dict(
        :sys => @ODEsystem(
	    x1'(t) = x1(t),
	    x2'(t) = x2(t),
	    x3'(t) = x3(t)
	),
	:dims => Set([1, 2]),
	:constrained => [([x1 + x2], 1), ([x1 + x3, x2 + x3], 2)]
    ),
    Dict(
        :sys => @ODEsystem(
	    x1'(t) = 0,
	    x2'(t) = 0,
	    x3'(t) = 0
	),
	:dims => Set([1, 2]),
	:constrained => [([x1 + x2], 1), ([x1 + x3, x2 + x3], 2)]
    )
]

#------------------------------------------------------------------------------

function check_reduction(sys, new_vars, new_eqs)
    eval_point = [Nemo.QQ(rand(1:100)) for _ in sys.x_vars]
    vect_field = [evaluate(sys.x_equations[x], eval_point) for x in sys.x_vars]
    
    new_eval_point = [evaluate(v, eval_point) for v in new_vars]
    new_vect_field_1 = [evaluate(eq, new_eval_point) for eq in new_eqs]
    new_vect_field_2 = [evaluate(v, vect_field) for v in new_vars]

    return new_vect_field_1 == new_vect_field_2
end

#------------------------------------------------------------------------------

@testset "finding_reductions" begin

    for c in cases
        sys = c[:sys]
        @info "Testing the system $sys"
        red = find_some_reduction(sys)
        @test check_reduction(sys, red[:new_vars], red[:new_system])

        reds = find_reductions(sys)
        for r in reds
            @test check_reduction(sys, r[:new_vars], r[:new_system])
        end
        @test c[:dims] == Set([length(r[:new_vars]) for r in reds])

        for (obs, dim) in c[:constrained]
            red = find_smallest_constrained_reduction(sys, obs)
            @test length(red[:new_vars]) == dim
            @test check_reduction(sys, red[:new_vars], red[:new_system])
        end
    end

end
