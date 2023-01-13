#=
    The File contains tests for main functions
=#

cases = [
    Dict(
        :sys => ExactODEReduction.@ODEsystem(
	    x1'(t) = a * x1(t)
	),
    :dims => Dict(
        :inheritance => [Set([(0, 1)])],
        :constants => [Set([(0, 1)])],
        :none => [Set([(1, 0)])]
    )
    ),
    Dict(
        :sys => ExactODEReduction.@ODEsystem(
	    x1'(t) = a * x1(t),
        x2'(t) = 0
	),
    :dims => Dict(
        :inheritance => [Set([(0, 1), (1, 1)]), Set([(1, 0), (1, 1)])],
        :constants => [Set([(0, 1), (0, 2)]), Set([(0, 1), (1, 1)])],
        :none => [Set([(1, 0), (2, 0)])]
    )
    ),
    Dict(
        :sys => ExactODEReduction.@ODEsystem(
	    x1'(t) = 0,
        x2'(t) = 0
	),
    :dims => Dict(
        :inheritance => [Set([(1, 0)])],
        :constants => [Set([(0, 1)])],
        :none => [Set([(1, 0)])]
    )
    )
]

#------------------------------------------------------------------------------

@testset "Finding reductions with parameters" begin

    for c in cases
        sys = c[:sys]
        @info "Testing the system $sys"
        for strategy in [:inheritance, :constants, :none]
            @info "Strategy $strategy"
            reds = ExactODEReduction.find_reductions(sys; overQ=false, parameter_strategy=strategy)
            dims = Set([(length(ExactODEReduction.states(ExactODEReduction.new_system(r))), length(ExactODEReduction.parameters(ExactODEReduction.new_system(r)))) for r in reds])
            @info dims
            @test dims in c[:dims][strategy]
        end
    end
end
