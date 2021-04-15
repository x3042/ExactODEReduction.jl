
import Nemo: gfp_elem, gfp_fmpz_elem, QQ, FlintRationalField

import Base: rand

#------------------------------------------------------------------------------

function Base.convert(::Type{Int}, x::gfp_elem)
    return Int(x.data)
end

function Base.convert(::Type{BigInt}, x::gfp_fmpz_elem)
    return BigInt(x.data)
end

#------------------------------------------------------------------------------

Base.rand(::FlintRationalField) = QQ(rand(-2^31:2^30))
Base.rand(::FlintRationalField, n::Int) = [rand(QQ) for _ in 1:n]
