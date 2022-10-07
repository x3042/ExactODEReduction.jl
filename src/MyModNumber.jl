
# MyModNumber definition - a number from Z/Zp
# compatible with MySparseVector and MySparseMatrix

# these are extended
import Base: zero, one, iszero, isone, convert, inv,
            length, iterate, broadcastable, abs2
import Base: +, -, *
import Nemo: parent, data
import SparseArrays: dot

# backend for modular numbers.
# global_field points to a finite field implemented in Nemo
const ModularFieldT = Nemo.GaloisFmpzField
const initial_modulo = Nemo.fmpz(2^31-1)
const global_field = Ref{ModularFieldT}(ModularFieldT(initial_modulo))

# updates the current global field used in modular computation
function set_modular_globals!(field)
    global_field[] = field
end

# MyModNumber 
struct MyModNumber <: Number
    x::Nemo.gfp_fmpz_elem
end

MyModNumber(y) = MyModNumber(global_field[](y))

Nemo.data(x::MyModNumber) = x.x

Base.zero(::Type{MyModNumber}) = MyModNumber(zero(global_field[]))
Base.one(::Type{MyModNumber}) = MyModNumber(one(global_field[]))
Base.zero(::MyModNumber) = zero(MyModNumber)
Base.one(::MyModNumber) = one(MyModNumber)

Base.inv(x::MyModNumber) = MyModNumber(inv(x.x))

Base.iszero(x::MyModNumber) = iszero(x.x)
Base.isone(x::MyModNumber) = isone(x.x)

Base.abs2(x::MyModNumber) = x*x

# magic to allow broadcasting with sparse arrays
Base.broadcastable(x::MyModNumber) = Ref{MyModNumber}(x)

Nemo.parent(x::MyModNumber) = parent(x.x)

+(x::MyModNumber, y::MyModNumber) = MyModNumber(x.x + y.x)
-(x::MyModNumber) = MyModNumber(- x.x)
-(x::MyModNumber, y::MyModNumber) = MyModNumber(x.x - y.x)
*(x::MyModNumber, y::MyModNumber) = MyModNumber(x.x * y.x)

SparseArrays.dot(x::MyModNumber, y::MyModNumber) = x*y
