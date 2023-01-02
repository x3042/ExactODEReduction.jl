
@testset "struct Reduction" begin
    ode = ExactODEReduction.@ODEsystem(
           x'(t) = x + y,
           y'(t) = x - y - z,
           z'(t) = 2x - z
    )
    a = [2, 5, 7]
    b = [fmpq(11323), fmpq(43423), fmpq(-12312323)]
    ics1 = Dict([x,y,z] .=> a)
    ics2 = Dict([x,y,z] .=> b)
    
    # Test `new_initialconds`
    reds = ExactODEReduction.find_reductions(ode)
    red = reds[2]
    new_v = ExactODEReduction.new_vars(red)
    new_ode = ExactODEReduction.new_system(red)

    new_ics = ExactODEReduction.new_initialconds(red, ics1)
    @test new_ics == Dict(k => evaluate(new_v[k], map(fmpq,a)) for (k, v) in new_v)
    new_ics = ExactODEReduction.new_initialconds(red, ics2)
    @test new_ics == Dict(k => evaluate(new_v[k], b) for (k, v) in new_v)
end
