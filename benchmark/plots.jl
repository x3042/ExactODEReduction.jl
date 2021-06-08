

include("../src/wiedemannchik.jl")


#------------------------------------------------------------------------------

using Plots
using Nemo

#------------------------------------------------------------------------------


sizes = 50 : 50 : 2500
ZZ = GF(2^31 - 1)

iters = 1:10

timeit(start) = (time_ns() - start) * 1e-9

function compare_det_and_rand()

    for _ in iters
        for (idx, n) in enumerate(sizes)
            println("n = ", n)
            nnz_per_row = 4
            nnz_in_b    = 1

            S = MatrixSpace(Nemo.ZZ, n, n)
            s = MatrixSpace(Nemo.ZZ, n, 1)

            while true
                dataA = zeros(Nemo.ZZ, n, n)
                dataB = zeros(Nemo.ZZ, n, 1)

                for m in 1:n
                    for z in 1:nnz_per_row
                        i, j = m, rand(1:n)
                        dataA[i, j] = rand(Nemo.ZZ, 1:2^31-1)
                    end
                    # so, we have nnz diagonal!
                    # the matrix will be nonsingular almost surely
                    dataA[m, m] = 1
                end

                for z in 1:nnz_in_b
                    i = rand(1:n)
                    dataB[i] = rand(Nemo.ZZ, 1:2^31-1)
                end

                dataB_ = reshape(dataB, (n))
                A = from_dense(dataA, ZZ)
                b = from_dense(dataB_, ZZ)
                A_ = S(dataA)
                b_ = s(dataB)

                try
                    println("W. rand")
                    start = time_ns()
                    @time y_W = wiedemann_solve(A, b, proved=false)
                    res_W_rand = timeit(start)

                    println("W. det")
                    start = time_ns()
                    @time y_W = wiedemann_solve(A, b, proved=true)
                    res_W_det = timeit(start)

                    times_W_rand[idx] += res_W_rand
                    times_W_det[idx]  += res_W_det

                    break

                catch e
                    if isa(e, InterruptException)
                        rethrow(e)
                    end
                    @info e
                end
            end
            println("-------------")
        end
    end
end


times_W_rand = zeros(length(sizes))
times_W_det  = zeros(length(sizes))

compare_det_and_rand()

for i in 1 : length(times_W_det)
    times_W_rand[i] = times_W_rand[i] / length(iters)
    times_W_det[i]  = times_W_det[i] / length(iters)
end

plot(sizes, times_W_det, label="W. det", ylabel="time, s",  xlabel="order, n", title="rand vs det, 4 nnz per row")
plot!(sizes, times_W_rand, label="W. rand")


#------------------------------------------------------------------------------


#=

magical code

using Nemo;
Base.one(gfp_elem) = RR(1)

Nemo.gfp_elem(x::gfp_elem) = RR(x)

Base.zero(gfp_elem) = RR(0)

import Base: /
/(x::gfp_elem, y::gfp_elem) = RR(x) // RR(y)

Base.abs(x::gfp_elem) = RR(x)

Base.isless(x::gfp_elem, y::gfp_elem) = x.data < y.data

RR = GF(7)

A = [
    RR(50) RR(-10);
    RR(3) RR(49);
]

b = [
    RR(5); RR(64);
]

y = A \ b
=#
