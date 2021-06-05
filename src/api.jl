
# Exact Reduction of ODE systems, interface definitions

include("../src/invariants.jl")

#------------------------------------------------------------------------------

# Main Interface of the program
#
# Other helpful functions will also be exported, but not documented here;
# One may check on them in examples
#

#------------------------------------------------------------------------------


"""
    func_2(x)

Indentity function. Returns `x`.
"""
function func_2(x)
    return x
end


"""
    func(x)

Indentity function. Returns `x`.
"""
function func(x)
    return x
end

# finds one common invariant subspace of the given matrices
# using the provived default method for finding one invaiant subspace
"""
    invariant_subspace(As; backend_algorithm)

Finds one common invariant subspace of the given matrices `As`
using the provived default method for finding one invaiant subspace `backend_algorithm`.
"""
function invariant_subspace(As; backend_algorithm=invariant_subspace_1)

    backend_algorithm(As)
end

#------------------------------------------------------------------------------

# finds several common invariant subspaces of the given matrices
# using the provided default method for finding one invaiant subspace
function many_invariant_subspaces(
    As;
    backend_algorithm=invariant_subspace_1)

    __many_invariant_subspaces(As, backend_algorithm)
end

#------------------------------------------------------------------------------
