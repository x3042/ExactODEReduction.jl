
@testset "Random algebra element" begin
    A = sparse(Nemo.QQ.([1 0; 0 1;]))
    B = sparse(Nemo.QQ.([0 1; 0 1;]))
    V = ExactODEReduction.linear_span!([A, B])
    println(V)
    r = ExactODEReduction.random_element(V, count=1)
    @test r == A || r == B
    r = ExactODEReduction.random_element(V, count=2)
    @test all(x -> x <= 2*2, r)
    r = ExactODEReduction.random_element(V, count=3)
    @test all(x -> x <= 2*3, r)
    r = ExactODEReduction.random_element(V, count=6)
    @test all(x -> x <= 2*6, r)
    for i in 1:100
        r = ExactODEReduction.random_element(V, count=i)
        @test all(x -> x <= 2*i, r)
    end
end
