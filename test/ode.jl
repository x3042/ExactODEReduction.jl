
@testset "struct ODE" begin
    test_cases = [
        Dict(
        :system => ExactODEReduction.@ODEsystem(
            x'(t) = a*x + y^3 + z,
            y'(t) = b*x + z,
            z'(t) = c*z
            ),
        :vars => ["x","y","z","a","b","c"],
        :eqs => ["x*a + y^3 + z","x*b + z", "z*c"]
        )
        Dict(
        :system => ExactODEReduction.@ODEsystem(
            x'(t) = a*(2//5)*x3 + 1,
            z'(t) = 5//4,
            x3'(t) = 0
            ),
        :vars => ["x","z","x3","a"],
        :eqs => ["2//5*x3*a + 1","5//4","0"]
        )
    ]

    for case in test_cases
        system = case[:system]
        varsstrs = map(string, ExactODEReduction.vars(system))
        eqstrs = map(string, ExactODEReduction.equations(system))
        @test eqstrs == case[:eqs]
        @test varsstrs == case[:vars]
    end

    R, (y, x, a, b) = Nemo.QQ["y","x","a","b"]
    ode = ExactODEReduction.ODE{typeof(y)}(
        Dict{typeof(x), typeof(a)}(
            x => x^2 + x + 1,
            y => R(100)*1//17,
            a => R(0),
            b => x
        )
    )
    @test ExactODEReduction.equations(ode) == [R(1)*100//17, x^2 + x + 1, R(0), x]
end

@testset "Variable order in @ODEsystem" begin
    test_cases = []

    # 2-compartiment model
    push!(test_cases, Dict(
        "ode" => ExactODEReduction.@ODEsystem(
            x0'(t) = -(a01 + a21) * x0(t) + a12 * x1(t) + u,
            x1'(t) = a21 * x0(t) - a12 * x1(t),
            y'(t) = x0(t)
        ),
        "vars" => ["x0","x1","y"],
        "params" => ["a01", "a12", "a21", "u"]
    ))

    push!(test_cases, Dict(
        "ode" => ExactODEReduction.@ODEsystem(
            x0'(t) = a * x0(t) - x1(t) * x2(t),
            x1'(t) = b * x1(t) + x0(t) * x2(t),
            x2'(t) = c * x2(t) + 1//3 * x0(t) * x1(t),
            y1'(t) = x0(t)
        ),
        "vars" => ["x0","x1","x2","y1"],
        "params" => ["a","b","c"]
    ))

    push!(test_cases, Dict(
        "ode" => ExactODEReduction.@ODEsystem(
            x1'(t) = -u * x1(t) + d * x0 * x1,
            x0'(t) = c * x0(t) - b * x0 * x1,
        ),
        "vars" => ["x1","x0"],
        "params" => ["b","c","d","u"]
    ))

    for case in test_cases
        ode = case["ode"]
        correct_str = [case["vars"]..., case["params"]...]
        str = map(string, vcat(ode.x_vars, ode.params))
        @test str == correct_str
    end
end

@testset "ODE ad-hoc stuff" begin
    # Test `set_parameter_values`
    odes = @ODEsystem(
        x'(t) = x(t) + y(t),
        y'(t) = a*x(t) - (a + b^2)*y(t) - z(t),
        z'(t) = 2 * x(t) - c*z(t)
    )
    @test ExactODEReduction.equations(odes)[1:3] == [x + y, a*x - (a + b^2)*y - z, 2x - c*z]
    @test ExactODEReduction.vars(odes)[1:3] == [x,y,z]
end

@testset "ODE to MTK and vice versa" begin
    test_cases = [
        ExactODEReduction.@ODEsystem(
            x1'(t) = x1(t) + a*x2(t),
            x3'(t) = x2(t) + x3(t),
            x2'(t) = b
        ),
        ExactODEReduction.@ODEsystem(
            x'(t) = x(t) + y(t) + 5//3,
            y'(t) = 18,
            z'(t) = 16//9
        )
    ]

    for case in test_cases
        (mtk, ic, p) = ExactODEReduction.ODEtoMTK(case)
        odeagain = ExactODEReduction.MTKtoODE(mtk)
        @test ExactODEReduction.equations(case) == ExactODEReduction.equations(odeagain)
    end

end
