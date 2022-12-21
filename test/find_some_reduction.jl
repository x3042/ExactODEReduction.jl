#=
    The File contains additional tests for main functions
=#

cases = [
    (
        system=ExactODEReduction.@ODEsystem(
            x1'(t) = x1^2 + 2x1*x2,
            x2'(t) = x2^2 + x3 + x4,
            x3'(t) = x3 + x4,
            x4'(t) = x1 + x3
      ),
      dim=0,
      ans=[[]]
    ),
    (
        system=ExactODEReduction.@ODEsystem(
            x1'(t) = x1^2 + 2x1*x2,
            x2'(t) = x2^2 + x3 + x4,
            x3'(t) = x2 + x4,
            x4'(t) = x1 + x3
      ),
      dim=3,
      ans=[[x1,x2,x3+x4]]
    ),
    (
        system=ExactODEReduction.@ODEsystem(
            x1'(t) = x1(t),
            x2'(t) = 2 * x2(t),
        ),
        dim=1,
        ans=[[x2],[x1]]
    ),
    (
        system=ExactODEReduction.@ODEsystem(
            x1'(t) = 2 + x1(t),
            x2'(t) = x1(t)^3 + x1(t) + x2(t),
            x3'(t) = x1(t) * x2(t) - 10 * x2(t)^2 + x3(t),
            x4'(t) = x1(t)^3 + x2(t)^6 - 7 * x3(t) * x1(t) - x4(t)
        ),
        dim=2,
        ans=[[x1], [x1,x2]]
    ),
    (
        system=ExactODEReduction.@ODEsystem(
                x1'(t) = 0,
                x2'(t) = 0,
                x3'(t) = 0,
        ),
        dim=1,
        ans=[[x1], [x2], [x3]]
    ),
    (
        system=ExactODEReduction.@ODEsystem(
            s1'(t) = -83//1000*s1(t) + 1//20*s2(t) + 24//25*s6(t),
            s6'(t) = 0,
            s2'(t) = 1//20*s1(t) - 3//50*s2(t),
            s3'(t) = 1//100*s2(t) - 1//100*s3(t),
            s8'(t) = 33//1000*s1(t),
            s4'(t) = 1//100*s3(t) - 1//200*s4(t),
            s5'(t) = 1//200*s4(t)
        ),
        dim=6,
        ans=[[s1,s6,s2], [s1,s2,s6], [s1,s6,s2], [s6,s1,s2], [s6,s2,s1], [s2,s1,s6], [s2,s6,s1]]
    ),
]

barcases = [
    (
        system=ExactODEReduction.@ODEsystem(
            x1'(t) = x1(t) + x3(t)^2 - x4(t)^2,
            x2'(t) = x2(t) + 2 * x3(t) * x4(t),
            x3'(t) = -x3(t) + x1(t)^2 - x2(t)^2,
            x4'(t) = -x4(t) + 2 * x1(t) * x2(t)
        ),
        dim=2,
        ans=[]
    )
]

@testset "Finding one reduction" begin
    for case in cases
        system = case.system
        reduction = ExactODEReduction.find_some_reduction(system)
                
        if case.ans == [[]]
            @test isempty(ExactODEReduction.new_vars(reduction))
            continue
        end

        nv = ExactODEReduction.vars(ExactODEReduction.new_system(reduction))
        @test [ExactODEReduction.new_vars(reduction)[v] for v in nv] in case.ans
    end
end

@testset "Finding one reduction over QQbar" begin
    for case in barcases
        system = case.system
        reduction = ExactODEReduction.find_some_reduction(system, overQ=false)

        @test length(ExactODEReduction.new_vars(reduction)) == case.dim
    end
end
