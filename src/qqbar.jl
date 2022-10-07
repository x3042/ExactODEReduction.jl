
# Define zero, one, and dot, abs2 for Nemo rationals 
# and Nemo extended rationals
import Base: zero, one, abs2
import SparseArrays: dot

Base.zero(::Type{Nemo.qqbar}) = Nemo.qqbar(0)
Base.one(::Type{Nemo.qqbar}) = Nemo.qqbar(1)

Base.one(::Type{Nemo.fmpq}) = Nemo.fmpq(1)

Base.abs2(x::Nemo.fmpq) = x*x

SparseArrays.dot(x::Nemo.fmpq, y::Nemo.fmpq) = x*y

# SparseArrays.dot(x::Nemo.qqbar, y::Nemo.qqbar) = x*y
