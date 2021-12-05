module ExactODEReduction

import DataStructures
import Distributions
import JSON
import OffsetArrays: OffsetVector
import Primes
import SparseArrays

using Base.Threads

import Nemo
import Nemo: FlintIntegerRing,
                FlintRationalField, FracElem, PolyElem, MPolyElem

import AbstractAlgebra

# These are extended
import Base: ==, !=, +, -, *, lcm, rand, zero
import Base.Iterators: Stateful
import LinearAlgebra: SingularException
import Nemo: base_ring, gfp_elem, gfp_fmpz_elem, fmpq_mpoly,
            fmpq, terms, monomials, fmpz


import CustomUnitRanges: filename_for_zerorange
include(filename_for_zerorange)

# Utilities
include("utils.jl")
include("typics.jl")
include("gizmos.jl")

# Reading input
include("myeval.jl")
include("parsik.jl")

# Structures for sparse linear algebra
include("structs/sparsik.jl")
include("structs/dok_sparsik.jl")
include("structs/csr_sparsik.jl")
include("structs/densik.jl")
include("structs/subspacik.jl")

# Main functionality
include("wiedemannchik.jl")
include("basis.jl")
include("radical.jl")
include("invariants.jl")
include("parametrization.jl")


#------------------------------------------------------------------------------

# finds one common invariant subspace of the given matrices
# using the provived default method for finding one invaiant subspace
"""
    invariant_subspace(As; backend_algorithm)

Finds *one* common invariant subspace of the given matrices `As`
using the provived default method `backend_algorithm`. By default, `invariant_subspace_1`
is used.

Each matrix in `As` to be a subtype of `AbstractSparseMatrix`
"""
function invariant_subspace(
    As;
    backend_algorithm=invariant_subspace_1)

    backend_algorithm(As)
end

#------------------------------------------------------------------------------

# finds several common invariant subspaces of the given matrices
# using the provided default method for finding one invaiant subspace
"""
    many_invariant_subspaces(As; backend_algorithm)

Finds *several* common invariant subspaces of the given matrices `As`
using the provived default method `backend_algorithm`. By default, `invariant_subspace_1`
is used.

Each matrix in `As` to be a subtype of `AbstractSparseMatrix`
"""
function many_invariant_subspaces(
    As;
    backend_algorithm=invariant_subspace_1)

    __many_invariant_subspaces(As, backend_algorithm)
end

#------------------------------------------------------------------------------

"""
    find_reductions(system; backend_algorithm)

Finds reductions of the system corresponding to a Jordan-Hoelder filtration.
This means that the reduction form a chain, and there are no extra intermediate reduction in this chain.
In particular, if there exists at least one reduction, it will be found.
Arguments:
 - `system` is a list of the right-hand sides of the system, the i-th element is the derivative of the i-th
   variable in the corresponding polynomial ring
 - `backend_algorithm` is the linear algebra algorithm used. By default, `invariant_subspace_1`.
"""
function find_reductions(
    system;
    backend_algorithm=invariant_subspace_1)

    matrices = construct_jacobians(system)
    invariant_subspaces = many_invariant_subspaces(matrices; backend_algorithm=backend_algorithm)
    result = []
    for V in invariant_subspaces
        transformation = polynormalize(V, parent(first(system)))
        new_system = perform_change_of_variables(system, V)
        push!(result, Dict(:new_vars => transformation, :new_system => new_system))
    end

    return result
end

export find_reductions, invariant_subspace, many_invariant_subspaces

end
