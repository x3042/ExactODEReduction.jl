@testset "Eigenspaces" begin

    N = 5
    S = MatrixSpace(Nemo.QQ, N, N)
    SBar = MatrixSpace(Nemo.QQBar, N, N) 

    for i in 1:8
        while true
            M = S([rand(-2:2) for i in 1:N for j in 1:N])
            chpoly = Nemo.charpoly(Nemo.PolynomialRing(Nemo.QQ, "x")[1], M)
            factors = collect(AbstractAlgebra.factor(chpoly))
            if any([f[2] != 1 for f in factors])
                println("rerunning")
                continue
            end
            vect = eigenspaces(M)
            @test length(vect) == N
            MBar = SBar([M[i, j] for i in 1:N for j in 1:N])
            for v in vect
                Mv = MBar * v[1]
                @test iszero(Mv[1, 1] * v[1] - v[1][1, 1] * Mv)
            end
            break
        end
    end
end
