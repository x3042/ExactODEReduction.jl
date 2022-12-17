# Declarations of domains and their coefficient types

# Rational numbers
const QQFieldT = typeof(Nemo.QQ)
const QQCoeffT = Nemo.fmpq

# Rational numbers closure
const QQBarFieldT = typeof(Nemo.QQBar)
const QQBarCoeffT = Nemo.qqbar

# Finite field
const FFFieldT = ModularFieldT
const FFCoeffT = MyModNumber

# field type --> coeff type
spec_elem_type(::Type{QQFieldT}) = QQCoeffT
spec_elem_type(::Type{QQBarFieldT}) = QQBarCoeffT
spec_elem_type(::Type{FFFieldT}) = FFCoeffT

spec_elem_type(x) = spec_elem_type(typeof(x))
