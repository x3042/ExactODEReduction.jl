module ExactODEReduction


using DataStructures
using Distributions
using JSON
using OffsetArrays
using Primes
using SparseArrays
using Base.Threads

# Alex: Why uuuusing ??
using AbstractAlgebra
using Nemo

import Nemo
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

end
