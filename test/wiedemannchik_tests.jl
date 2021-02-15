
#=
    The File contains Sparsik tests
=#

#------------------------------------------------------------------------------

include("../src/wiedemannchik.jl")

#------------------------------------------------------------------------------

if !isdefined(Main, :testset)
    using Test
    using TestSetExtensions
end

#------------------------------------------------------------------------------

@testset "W. square, det" begin
    # here the correctness is checked
    # Ay = b

    A = from_dense([1 0 0;
                    0 2 0;
                    0 0 3;],
                    QQ)
    b = from_dense([3, 2, 1], QQ)

    y = square_nonsingular_deterministic_wiedemann(A, b)

    @test y == from_dense([QQ(3), QQ(1), QQ(1, 3)], QQ)

    # -----

    Z13 = GF(13)
    ZZ =  GF(2^31 - 1)

    # a series of tests
    sizes = [1, 2, 2, 2, 5, 10, 10, 10, 15, 30, 50, 50, 75, 100]
    for n in sizes
        A, b = 0, 0
        while true
            A = random_sparsik((n, n), ZZ)
            b = random_sparsik((n, ), ZZ)

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

        @test apply_vector(A, y) == b
    end

    A = from_dense([1 1; 1 1;], QQ)
    b = from_dense([1, 2], QQ)
    @test_throws SingularException square_nonsingular_deterministic_wiedemann(A, b)
    @test_throws SingularException square_nonsingular_randomized_wiedemann(A, b)

end

@info "OK"
