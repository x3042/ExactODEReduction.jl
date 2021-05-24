
# Exact Reduction of ODE systems, interface definitions

include("../src/invariants.jl")

#------------------------------------------------------------------------------

# Main Interface of the program
#
# Other helpful functions will also be exported, but not documented here;
# One may check on them in examples
#

#------------------------------------------------------------------------------

# finds one common invariant subspace of the given matrices
# using the provived default method for finding one invaiant subspace
function invariant_subspace(
    As::AbstractArray{T};
    backend_algorithm=invariant_subspace_1)  where {T<:AbstractSparseMatrix}

    backend_algorithm(As)
end

#------------------------------------------------------------------------------

# finds several common invariant subspaces of the given matrices
# using the provided default method for finding one invaiant subspace
function many_invariant_subspaces(
    As::AbstractArray{T};
    backend_algorithm=invariant_subspace_1)  where {T<:AbstractSparseMatrix}

    __many_invariant_subspaces(As, backend_algorithm)
end

#------------------------------------------------------------------------------
