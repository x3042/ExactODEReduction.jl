
# Making SparseArrays friends with modular numbers

import Base: zero, one, iszero, isone, convert
import Base: +, -, *

using Nemo

const T = UInt
const modulo = T(2^31-1)
const FieldT = Nemo.GaloisField
const global_field = Ref{FieldT}(FieldT(modulo))

struct MyModNumber
    x::Nemo.gfp_elem
end

MyModNumber(y) = MyModNumber(global_field[](y))

Base.zero(::Type{MyModNumber}) = MyModNumber(zero(global_field[]))
Base.one(::Type{MyModNumber}) = MyModNumber(one(global_field[]))
Base.zero(::MyModNumber) = zero(MyModNumber)
Base.one(::MyModNumber) = one(MyModNumber)

Base.iszero(x::MyModNumber) = iszero(x.x)
Base.isone(x::MyModNumber) = isone(x.x)

+(x::MyModNumber, y::MyModNumber) = MyModNumber(x.x + y.x)
-(x::MyModNumber) = MyModNumber(- x.x)
-(x::MyModNumber, y::MyModNumber) = MyModNumber(x.x - y.x)
*(x::MyModNumber, y::MyModNumber) = MyModNumber(x.x * y.x)

####
####

using SparseArrays

# Make two matrices of size n with k fraction of nonzeros
# with numbers ranging from 1 to UB

UB = 2^8
n, k = 10, 0.02
a = rand(1:T(UB), n, n); b = rand(1:T(UB), n, n);
while count(!iszero, a) / (n^2) >= k
    a[rand(1:n^2)] = zero(a[rand(1:n^2)])
end
while count(!iszero, b) / (n^2) >= k
    b[rand(1:n^2)] = zero(b[rand(1:n^2)])
end

@assert k-0.01 <= count(!iszero, a) / (n^2) <= k+0.01
@assert k-0.01 <= count(!iszero, b) / (n^2) <= k+0.01

# my
amy = sparse(MyModNumber.(a))
bmy = sparse(MyModNumber.(b))

# default
aa = sparse(a)
bb = sparse(b)

@assert aa*bb == map(x -> x.x, amy*bmy)

####
####

# for reference, our Sparsiks spend 1ms in this multiplication

using BenchmarkTools

@benchmark $aa*$bb
# BenchmarkTools.Trial: 10000 samples with 7 evaluations.
#  Range (min … max):  4.571 μs … 649.757 μs  ┊ GC (min … max): 0.00% … 94.91%
#  Time  (median):     5.143 μs               ┊ GC (median):    0.00%
#  Time  (mean ± σ):   6.717 μs ±  16.878 μs  ┊ GC (mean ± σ):  9.04% ±  3.69%

#   ▆█▇▆▅▅▄▄▃▃▃▃▂▂▂▁▂▂▂▂▁▁▁▁▁  ▁                                ▂
#   ██████████████████████████████▇███▇▇▇▇▇█▇▇▇▆▆▆▆▆▆▅▅▅▆▆▅▆▄▄▅ █
#   4.57 μs      Histogram: log(frequency) by time      15.7 μs <

#  Memory estimate: 9.53 KiB, allocs estimate: 4.

@benchmark $amy*$bmy
# BenchmarkTools.Trial: 10000 samples with 1 evaluation.
#  Range (min … max):  10.000 μs …  2.597 ms  ┊ GC (min … max): 0.00% … 98.99%
#  Time  (median):     10.600 μs              ┊ GC (median):    0.00%
#  Time  (mean ± σ):   12.586 μs ± 44.513 μs  ┊ GC (mean ± σ):  6.04% ±  1.71%

#   ▅█▆▄▃▄▃▂▂▂▁                                                 ▂
#   ████████████▇██▇▆▆▅▆▅▆▅▅▁▄▅▅▄▅▅▇▇█▆▆▆▅▆▆▅▅▅▅▄▆▅▆▆▅▅▅▅▅▅▆▅▅▅ █
#   10 μs        Histogram: log(frequency) by time        33 μs <

#  Memory estimate: 13.66 KiB, allocs estimate: 4.
