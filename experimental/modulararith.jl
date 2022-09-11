# Comparing modular arithmetic from
#   AA.jl
#   Nemo.jl
#   Mods.jl
#   GaloisFields.jl
#   "My"

using BenchmarkTools

import AbstractAlgebra
import Nemo
import Mods
import GaloisFields

function dotgeneric(x, y)
    s = zero(first(x))
    @inbounds for i in eachindex(x, y) 
        s += x[i]*y[i]
    end
    s
end

function dotmy(x, y, magic)
    s = zero(first(x))
    @inbounds for i in eachindex(x, y) 
        s = (s + x[i]*y[i]) % magic
    end
    s
end

#=
    Modular operations are hard to vectorize.
    In a loop

        s = 0
        for i in eachindex(x, y)
            s = (s + x[i]*y[i]) % modulus
        end
    
    the "%" sign has no SIMD version :(
    the loop is not vectorized by the Julia compiler.

    Power reduction + unrolling:
        
        s = 0
        for i in div(length(x), 2)
            s1 = x[i]*y[i]
            s2 = x[i+1]*y[i+1]
            s = (s + s1 + s2) % modulus
        end
    
    _Assuming modulus < 2^31_
=#
@generated function unroll(x, y, magic, ::Val{1})
    body = :(s1 = x[i]*y[i];
            s = (s + s1) % magic)
    return :(
        s = zero(first(x));
        @inbounds for i in 1:1:length(x) 
            $body
        end;
        s)
end
@generated function unroll(x, y, magic, ::Val{2})
    body = :(s1 = x[i]*y[i];
            s2 = x[i+1]*y[i+1];
            s = (s + s1 + s2) % magic)
    return :(
        s = zero(first(x));
        @inbounds for i in 1:2:length(x) 
            $body
        end;
        s)
end
@generated function unroll(x, y, magic, ::Val{4})
    body = :(s1 = x[i]*y[i];
            s2 = x[i+1]*y[i+1];
            s3 = x[i+2]*y[i+2];
            s4 = x[i+3]*y[i+3];
            s = (s + s1 + s2 + s3 + s4) % magic)
    return :(
        s = zero(first(x));
        @inbounds for i in 1:4:length(x) 
            $body
        end;
        s)
end
function dotmy2(x, y, magic; unrollfactor=4)
    eachindex(x, y)
    @assert iszero(length(x) % unrollfactor)
    unroll(x, y, magic, Val(unrollfactor))
end

# Set modulus, ground fields, and arrays

p = UInt64(2^31 - 1)

ffnemo = Nemo.GF(p)
ffaa = AbstractAlgebra.GF(p)
ModT = Mods.Mod{p}
ffgalois = GaloisFields.@GaloisField 2147483647
magic = Base.MultiplicativeInverses.UnsignedMultiplicativeInverse(p)

n = 1000
mkvect = (p, n) -> rand(UInt64, n) .% p
x, y = mkvect(p, n), mkvect(p, n)
xnemo = ffnemo.(x)
ynemo = ffnemo.(y)

xaa = ffaa.(x)
yaa = ffaa.(y)

xmods = ModT.(x)
ymods = ModT.(x)

xgalois = ffgalois.(x)
ygalois = ffgalois.(x)

xmy = x
ymy = y

# Check that results coincide
@assert dotgeneric(xnemo, ynemo) == dotmy(xmy, ymy, magic)
@assert dotgeneric(xaa, yaa) == dotmy(xmy, ymy, magic)
# Mods.jl gives wrong answer
# @assert dotgeneric(xmods, ymods) == dotmy(xmy, ymy, magic)
# GaloisFields.jl gives wrong answer
# @assert dotgeneric(xgalois, ygalois) == dotmy(xmy, ymy, magic)
@assert dotmy(xmy, ymy, magic) == dotmy2(xmy, ymy, magic)

# Benchmark

# AA.jl
@btime dotgeneric($xaa, $yaa)
# 12.900 μs (0 allocations: 0 bytes)

# GaloisField.jl
@btime dotgeneric($xgalois, $ygalois)
# 9.900 μs (0 allocations: 0 bytes)

# Nemo.jl
@btime dotgeneric($xnemo, $ynemo)
# 8.400 μs (0 allocations: 0 bytes)

# Mods.jl
@btime dotgeneric($xmods, $ymods)
# 3.812 μs (0 allocations: 0 bytes)

# "My"
@btime dotmy($xmy, $ymy, $magic)
# 3.950 μs (0 allocations: 0 bytes)

# "My" + unroll 4
@btime dotmy2($xmy, $ymy, $magic, unrollfactor=4)
# 1.280 μs (0 allocations: 0 bytes)