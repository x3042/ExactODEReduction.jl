import Base: zero, one, iszero, isone, convert, inv,
            length, iterate
import Base: +, -, *
import Nemo: parent, data

const modulo = Nemo.fmpz(2^31-1)
const FieldT = Nemo.GaloisFmpzField
const global_field = Ref{FieldT}(FieldT(modulo))

function set_globals!(prime, field)
    global_field[] = field
end

struct MyModNumber
    x::Nemo.gfp_fmpz_elem
end

const QQField = typeof(Nemo.QQ)
const QQCoeff = Nemo.fmpq

const QQBarCoeff = Nemo.qqbar

const FFCoeff = MyModNumber
const FFField = Nemo.GaloisFmpzField

MyModNumber(y) = MyModNumber(global_field[](y))

Nemo.data(x::MyModNumber) = x.x

Base.zero(::Type{MyModNumber}) = MyModNumber(zero(global_field[]))
Base.one(::Type{MyModNumber}) = MyModNumber(one(global_field[]))
Base.zero(::MyModNumber) = zero(MyModNumber)
Base.one(::MyModNumber) = one(MyModNumber)

Base.inv(x::MyModNumber) = MyModNumber(inv(x.x))

Base.iszero(x::MyModNumber) = iszero(x.x)
Base.isone(x::MyModNumber) = isone(x.x)

Base.length(x::MyModNumber) = 1
Base.iterate(x::MyModNumber) = (x, nothing)
Base.iterate(x::MyModNumber, y) = (x, x)

Nemo.parent(x::MyModNumber) = parent(x.x)

+(x::MyModNumber, y::MyModNumber) = MyModNumber(x.x + y.x)
-(x::MyModNumber) = MyModNumber(- x.x)
-(x::MyModNumber, y::MyModNumber) = MyModNumber(x.x - y.x)
*(x::MyModNumber, y::MyModNumber) = MyModNumber(x.x * y.x)
