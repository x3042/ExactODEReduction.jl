
#=
    The File contains tests for W. algorithm
=#

#------------------------------------------------------------------------------

@testset "W. square, det" begin
    # here the correctness is checked
    # Ay = b

    A = from_dense([1 0 0;
                    0 2 0;
                    0 0 3;],
                    Nemo.QQ)
    b = from_dense([3, 2, 1], Nemo.QQ)

    y = square_nonsingular_deterministic_wiedemann(A, b)

    @test y == from_dense([Nemo.QQ(3), Nemo.QQ(1), Nemo.QQ(1, 3)], Nemo.QQ)

    # -----

    Z13 = Nemo.GF(13)
    ZZ =  Nemo.GF(2^31 - 1)

    # a series of tests
    sizes = [10, 10, 10, 15, 30, 50, 50, 75, 100]
    for n in sizes
        A, b = 0, 0
        while true
            A = random_sparse_vector((n, n), ZZ, density=0.3)
            b = random_sparse_vector((n, ), ZZ)
            try
                y = square_nonsingular_deterministic_wiedemann(A, b)
            catch e
                if isa(e, SingularException)
                    continue
                else
                    rethrow(e)
                end
            end

            break
        end

        X = [convert(Int, x) for x in to_dense(A)]
        #if iszero(det(X))
            #error("W. did't notice singularity")
        #end

        @test A * y == b
    end

    A = from_dense([1 1; 1 1;], Nemo.QQ)
    b = from_dense([1, 2], Nemo.QQ)
    @test_throws SingularException square_nonsingular_deterministic_wiedemann(A, b)
    @test_throws SingularException square_nonsingular_randomized_wiedemann(A, b)

end
