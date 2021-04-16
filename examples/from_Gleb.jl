
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

spacik = linear_span!(gen_matrices)

for _ in 1:10
    println()
    invariant = invariant_subspaces(gen_matrices)
    println("subspace = ", invariant)

    # to sparsiks
    invariant = [from_dense(v, QQ) for v in invariant]
    if check_invariance!(invariant, spacik)
        @error "Ok"
    else
        @error "beda"
    end
end
