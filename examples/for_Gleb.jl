
include("../src/radical_without_testing.jl")


A1 = from_dense([1 0 0 0; 1 0 0 0; 0 0 0 0; 0 0 0 0], QQ)
A2 = from_dense([1 0 0 0; 0 1 0 0; 0 0 0 0; 0 0 0 0], QQ)
A3 = from_dense([0 0 0 1; 0 0 1 0; 0 1 0 1; 0 1 1 0], QQ)

Alg = find_basis([A1, A2, A3])

rad_basis = find_radical_1(Alg)

ker = general_kernel(rad_basis)

@assert ker == [QQ(1) QQ(0); QQ(1) QQ(0); QQ(0) QQ(1); QQ(0) QQ(1)]

# we want get y1 = x1 + x2, y2 = x3 + x4
# what means that general kernel = {[1,1,0,0], [0,0,1,1]}
