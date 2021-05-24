
#=
    Examples file
=#

include("../src/api.jl")

import Nemo: QQ

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

invs = invariant_subspace(gen_matrices)
println(invs)
# [e1, e2]  or  [e3, e4], differs from run to run
#
