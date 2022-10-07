
@testset "Rational reconstruction" begin
    RR = ExactODEReduction.rational_reconstruction
    QQ = Nemo.QQ

    ms = BigInt[107, 199, 509, 2^31 - 1, nextprime(BigInt(2)^100), nextprime(BigInt(2)^200)]
    as = [QQ(0), QQ(1), QQ(1, 2), QQ(3, 2), QQ(4, 5), QQ(1, 7), QQ(6)]

    for m in ms
        for a in as
            ac = BigInt(numerator(a)) * invmod(BigInt(denominator(a)), m)
            x = RR(ac, m)
            @test x == a
        end
    end
end
