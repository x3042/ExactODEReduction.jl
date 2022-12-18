@testset "Variable order in @ODEsystem" begin
    test_cases = []

    # 2-compartiment model
    push!(test_cases, Dict(
        "ode" => ExactODEReduction.@ODEsystem(
            x0'(t) = -(a01 + a21) * x0(t) + a12 * x1(t) + u(t),
            x1'(t) = a21 * x0(t) - a12 * x1(t),
            y'(t) = x0(t)
        ),
        "vars" => ["x0","x1","y"],
        "params" => ["a01", "a12", "a12", "u"]
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
        str = map(string, ode.x_vars)
        @test str == correct_str
    end
end
