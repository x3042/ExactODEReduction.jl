include("../src/radical_without_testing.jl")

gen_matrices = [
    from_dense([
        1  0 0 0;
        0 -1 0 0;
        0  0 0 0;
        0  0 0 0
    ], QQ),
    from_dense([
        0 -1 0 0;
        1  0 0 0;
        0  0 0 0;
        0  0 0 0
    ], QQ),
    from_dense([
        0 0 0  0;
        0 0 0  0;
        0 0 1  0;
        0 0 0 -1
    ], QQ),
    from_dense([
        0 0  0 0;
        0 0  0 0;
        0 0  0 1;
        0 0 -1 0
    ], QQ)
]

alg = find_basis(gen_matrices)

rad_basis = find_radical_1(alg)

println(length(rad_basis))

ker = general_kernel(rad_basis)

# we want get y1 = x1 + x2, y2 = x3 + x4
# what means that general kernel = {[1,1,0,0], [0,0,1,1]}
