module ExactODEReduction


import DataStructures
import Distributions
import JSON
import Logging
import OffsetArrays: OffsetVector
import Primes
import SparseArrays

using Base.Threads

import Nemo
import Nemo: FlintIntegerRing, FlintRationalField, FracElem, PolyElem,
            MPolyElem, gens, vars, derivative, monomial, coeff, characteristic,
            MatrixSpace, kernel, PolynomialRing, exponent_vector, MPolyBuildCtx,
            push_term!, finish, degree, gen, coefficients


import AbstractAlgebra

# These are extended
import Base: ==, !=, +, -, *, lcm, rand, zero
import Base.Iterators: Stateful
import LinearAlgebra: SingularException
import Nemo: base_ring, gfp_elem, gfp_fmpz_elem, fmpq_mpoly,
            fmpq, terms, monomials, fmpz, elem_type


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
# include("structs/csr_sparsik.jl")
include("structs/densik.jl")
include("structs/subspacik.jl")

# Main functionality
include("wiedemannchik.jl")
include("basis.jl")
include("radical.jl")
include("invariants.jl")
include("parametrization.jl")


#------------------------------------------------------------------------------

"""
    find_reduction(system; backend_algorithm)

Finds the best linear reduction of the system.
If there exists a reduction, it will be found.
Arguments:
 - `system` is a list of the right-hand sides of the system, the i-th element is the derivative of the i-th
   variable in the corresponding polynomial ring
 - `observabels` is a list of linear functions of initial variables
   desired to be preserved by reduction.
   Defaults to an empty list to find the most general reduction.
"""
function find_reduction(
        system;
        observables=[],
        loglevel=Logging.Warn)

    # hmm
    package_logger = Logging.ConsoleLogger(stderr, loglevel)
    Logging.global_logger(package_logger)

    # Jacobian of system,
    # each subspace invariant under Jacobian corresponds to a reduction
    matrices = construct_jacobians(system)

    # if there are no variables to preserve the state of
    if isempty(observables)
        subspace = invariant_subspace_global(matrices)
    else # if there are
        subspace = invariant_subspace_local(matrices, observables)
    end

    subspace = basis(linear_span!(subspace))
    transformation = polynormalize(subspace, parent(first(system)))
    new_system = perform_change_of_variables(system, subspace)

    return Dict(:new_vars => transformation, :new_system => new_system)
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
        loglevel=Logging.Warn)

    package_logger = Logging.ConsoleLogger(stderr, loglevel)
    Logging.global_logger(package_logger)

    matrices = construct_jacobians(system)
    invariant_subspaces = many_invariant_subspaces(matrices, invariant_subspace_global)
    result = []
    for V in invariant_subspaces
        V = basis(linear_span!(V))
        transformation = polynormalize(V, parent(first(system)))
        new_system = perform_change_of_variables(system, V)
        push!(result, Dict(:new_vars => transformation, :new_system => new_system))
    end

    sort!(result, by=r -> length(r[:new_vars]))
    result
end

export find_reduction, find_reductions
export check_consistency

end
