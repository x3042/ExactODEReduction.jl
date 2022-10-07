
@testset "Modular numbers" begin
    MMN = ExactODEReduction.MyModNumber

    x = MMN(8)
    z = MMN(0)
    o = MMN(1)
    @test iszero(z)
    @test iszero(z + z) && iszero(z*z) && iszero(z*o) && iszero(z*x)
    @test isone(o)
    @test isone(o * o)
    
    ff = ExactODEReduction.global_field[]
    m = Nemo.characteristic(ff)
    @test iszero(MMN(m))
    @test isone(MMN(m + 1))

    @test (data(z) == 0) && (data(o) == 1) && (data(x) == 8)

    @test isone(x*inv(x))
    @test data(inv(x)) == inv(ff(8))

    @test Nemo.parent(x) == ff
end