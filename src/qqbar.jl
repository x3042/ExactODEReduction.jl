
import Base: zero, one

Base.zero(::Type{Nemo.qqbar}) = Nemo.qqbar(0)
Base.one(::Type{Nemo.qqbar}) = Nemo.qqbar(1)

Base.one(::Type{Nemo.fmpq}) = Nemo.fmpq(1)