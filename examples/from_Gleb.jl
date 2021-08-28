
#=
    Examples file
=#

using Nemo

include("../src/ExactODEReduction.jl")
using .ExactODEReduction: from_dense, invariant_subspace, fullspace

#------------------------------------------------------------------------------

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

invariants = invariant_subspace(gen_matrices)

e1, e2, e3, e4 = fullspace(4, QQ)

# may fail due to randomness of the used algorithm
@assert invariants in [ [e1, e2], [e3, e4] ]
