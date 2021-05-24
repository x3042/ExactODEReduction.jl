
#=
    Examples file
=#

include("../src/api.jl")

import Nemo: QQ

#------------------------------------------------------------------------------

# Example 1

A1 = @sparse [
    1 1 0 0;
    1 1 0 0;
    0 0 0 2;
    0 0 0 1;
]
A2 = @sparse [
    0 1 0 0;
    1 0 0 0;
    0 0 0 2;
    0 0 0 0;
]

# find an invariant subspaces of the matrices
invariants = many_invariant_subspaces([A1, A2])

println("--------------\n",
    join(map(string, invariants), "\n"),
    "\n--------------")

@assert all(V -> check_invariance!([A1, A2], V),
            invariants)


#------------------------------------------------------------------------------

# Example 2

B1 = @sparse [
    0 0 0 0 0;
    0 0 0 0 0;
    0 0 3 0 0;
    0 0 3 3 1;
    0 0 0 0 2;
]

# find an invariant subspaces of the matrices
invariants = many_invariant_subspaces([B1])

println("--------------\n",
    join(map(string, invariants), "\n"),
    "\n--------------")

@assert all(V -> check_invariance!([B1], V),
            invariants)

#------------------------------------------------------------------------------
