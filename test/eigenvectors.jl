@testset "Eigenvectors" begin

    S = MatrixSpace(Nemo.QQ, 10, 10)
    SBar = MatrixSpace(Nemo.QQBar, 10, 10) 

    for i in 1:20
    
        while true
            M = S([rand(-10:10) for i in 1:10 for j in 1:10])
            chpoly = Nemo.charpoly(Nemo.PolynomialRing(Nemo.QQ, "x")[1], M)
            factors = collect(AbstractAlgebra.factor(chpoly))
            if length(factors) > 1
                println("rerunning")
                continue
            end
            vect = eigenvectors(M)
            @test length(vect) == 10
            MBar = SBar([M[i, j] for i in 1:10 for j in 1:10])
            for v in vect
                Mv = MBar * v
                @test iszero(Mv[1, 1] * v - v[1, 1] * Mv)
            end
        end

    end

end
