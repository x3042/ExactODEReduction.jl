
# Making SparseArrays friends with modular numbers

import Base: zero, one, iszero, isone
import Base: +, -, *

# internal type of modular number
const T = UInt64
# internal type of modular number inverse
const InverseT = Base.MultiplicativeInverses.UnsignedMultiplicativeInverse{T}

# Add modulo 2^31-1 as an example
modulo = 2^31-1
const global_modulo = Ref{InverseT}(InverseT(T(modulo)))

struct MyModNumber2{T, InverseT}
    x::T
    m::InverseT
end

Base.zero(::Type{MyModNumber2{X, Y}}) where {X, Y} = MyModNumber2{X, Y}(0, global_modulo[])
Base.one(::Type{MyModNumber2{X, Y}}) where {X, Y} = MyModNumber2{X, Y}(1, global_modulo[])
Base.zero(x::MyModNumber2) = MyModNumber22(0, x.m)
Base.one(x::MyModNumber2) = MyModNumber2(1, x.m)

Base.iszero(x::MyModNumber2) = iszero(x.x)
Base.isone(x::MyModNumber2) = isone(x.x)

+(x::MyModNumber2, y::MyModNumber2) = MyModNumber2((x.x + y.x) % x.m, x.m)
-(x::MyModNumber2) = MyModNumber2(x.m.divisor - x.x, x.m)
-(x::MyModNumber2, y::MyModNumber2) = MyModNumber2((x.x + (x.m.divisor - y.x)) % x.m, x.m)
*(x::MyModNumber2, y::MyModNumber2) = MyModNumber2((x.x * y.x) % x.m, x.m)

####
####

using SparseArrays

# Make two matrices of size n with k fraction of nonzeros
# with numbers ranging from 1 to UB

UB = 2^3
n, k = 50, 0.1
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
amy = sparse(map(x -> MyModNumber2(x, global_modulo[]), a))
bmy = sparse(map(x -> MyModNumber2(x, global_modulo[]), b))

# default
aa = sparse(a)
bb = sparse(b)

@assert aa*bb == map(x -> x.x, amy*bmy)

####
####

using BenchmarkTools

@benchmark $aa*$bb
# BenchmarkTools.Trial: 10000 samples with 3 evaluations.
#  Range (min … max):  7.833 μs … 829.733 μs  ┊ GC (min … max): 0.00% … 97.11%
#  Time  (median):     8.733 μs               ┊ GC (median):    0.00%
#  Time  (mean ± σ):   9.964 μs ±  23.585 μs  ┊ GC (mean ± σ):  7.94% ±  3.34%

#   ▃▅▆▇█▇▆▄▃▁ ▁▁                                               ▂
#   ██████████████████▆▇██▇▆▆▇▇█▆▆▅▆▄▆▆▆▅▆▆▆▅▆▄▆▅▄▄▅▅▄▅▄▂▄▃▃▄▄▄ █
#   7.83 μs      Histogram: log(frequency) by time        19 μs <

#  Memory estimate: 18.59 KiB, allocs estimate: 4.

@benchmark $amy*$bmy
# BenchmarkTools.Trial: 10000 samples with 1 evaluation.
#  Range (min … max):  12.200 μs …  2.691 ms  ┊ GC (min … max): 0.00% … 96.18%
#  Time  (median):     12.900 μs              ┊ GC (median):    0.00%
#  Time  (mean ± σ):   14.714 μs ± 47.883 μs  ┊ GC (mean ± σ):  6.29% ±  1.93%

#   ▇█▇▆▅▄▂ ▂▂▂▃▂▂▂ ▁  ▁                                        ▂
#   ████████████████████▇▇█▇▆▆▄▆▆▆▆▃▆▆▄▄▆▃▁▅▁▄▅▁▃▃▄▃▄▅▄▄▄▅▆▁▄▁▄ █
#   12.2 μs      Histogram: log(frequency) by time        32 μs <

#  Memory estimate: 18.59 KiB, allocs estimate: 4.