
module ExactODEReduction

import DataStructures
import Distributions
import JSON
import Logging
import OffsetArrays: OffsetVector
import Primes
import SparseArrays
import LinearAlgebra

using Base.Threads

import MacroTools
import MacroTools: @capture

import Nemo
import Nemo: FlintIntegerRing, FlintRationalField, FracElem, PolyElem,
            MPolyElem, gens, vars, derivative, monomial, coeff, characteristic,
            MatrixSpace, kernel, PolynomialRing, exponent_vector, MPolyBuildCtx,
            push_term!, finish, degree, gen, coefficients, MPolyElem, MPolyRing,
            FieldElem, symbols, evaluate, charpoly, lead, divexact

import Polymake: polytope

import AbstractAlgebra

# These are extended
import Base: ==, !=, +, -, *, lcm, rand, zero
import Base.Iterators: Stateful
import LinearAlgebra: SingularException
import Nemo: base_ring, gfp_elem, gfp_fmpz_elem, fmpq_mpoly,
            fmpq, terms, monomials, fmpz, elem_type, parent


import CustomUnitRanges: filename_for_zerorange
include(filename_for_zerorange)

#------------------------------------------------------------------------------

# Utilities
include("utils.jl")
# type declarations
include("structs/types.jl")
# some useful but hardly categorizable things
include("linalg/gizmos.jl")

# Reading input
include("parser/myeval.jl")
include("parser/parser.jl")

# Structures for sparse linear algebra
include("structs/sparse.jl")
include("structs/dok_sparse.jl")
# include("structs/csr_sparsik.jl")
include("structs/dense.jl")
include("structs/subspace.jl")

# Main functionality
include("linalg/wiedemann.jl")
include("linalg/basis.jl")
include("linalg/radical.jl")
include("positivizor.jl")
include("linalg/invariants.jl")
include("odes/parametrization.jl")
include("odes/ODE.jl")


#------------------------------------------------------------------------------

"""
    find_smallest_reduction(system; backend_algorithm)

Finds the best linear reduction of the system.
If there exists a reduction, it will be found.
Arguments:
 - `system` is a list of the right-hand sides of the system, the i-th element is the derivative of the i-th
   variable in the corresponding polynomial ring
"""
function find_smallest_reduction(
        system::ODE{P};
        loglevel=Logging.Info) where {P}

    # hmm
    package_logger = Logging.ConsoleLogger(stderr, loglevel)
    Logging.global_logger(package_logger)

    # Jacobian of system,
    # each subspace invariant under Jacobian corresponds to a reduction
    eqs = equations(system)
    matrices = construct_jacobians(eqs)

    subspace = invariant_subspace_global(matrices)
    isempty(subspace) && return Dict{Symbol, Vector{fmpq_mpoly}}()

    subspace = basis(linear_span!(subspace))
    subspace = positivize(subspace)
    transformation = polynormalize(subspace, parent(system))
    new_system = perform_change_of_variables(eqs, subspace)

    return Dict(:new_vars => transformation, :new_system => new_system)
end

#------------------------------------------------------------------------------

"""
    find_smallest_reduction(system, observables; backend_algorithm)

Finds the best linear reduction of the system.
If there exists a reduction, it will be found.
Arguments:
 - `system` is a list of the right-hand sides of the system, the i-th element is the derivative of the i-th
   variable in the corresponding polynomial ring
 - `observables` is a list of linear functions of initial variables
   desired to be preserved by reduction.
   Defaults to an empty list to find the most general reduction.
"""
function find_smallest_reduction(
        system::ODE{P},
        observables::Vector{P};
        loglevel=Logging.Info) where {P}

    # hmm
    package_logger = Logging.ConsoleLogger(stderr, loglevel)
    Logging.global_logger(package_logger)

    # Jacobian of system,
    # each subspace invariant under Jacobian corresponds to a reduction
    eqs = equations(system)
    matrices = construct_jacobians(eqs)

    subspace = invariant_subspace_local(matrices, observables)
    isempty(subspace) && return Dict{Symbol, Vector{fmpq_mpoly}}()

    subspace = basis(linear_span!(subspace))
    subspave = positivize(subspace)
    transformation = polynormalize(subspace, parent(system))
    new_system = perform_change_of_variables(eqs, subspace)

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
        system::ODE{P};
        loglevel=Logging.Info) where {P}

    package_logger = Logging.ConsoleLogger(stderr, loglevel)
    Logging.global_logger(package_logger)

    eqs = equations(system)
    matrices = construct_jacobians(eqs)

    invariant_subspaces = many_invariant_subspaces(matrices, invariant_subspace_global)
    result = Vector{Dict{Symbol, Vector{fmpq_mpoly}}}()
    for V in invariant_subspaces
        V = basis(linear_span!(V))
	V = positivize(V)
        transformation = polynormalize(V, parent(system))
        new_system = perform_change_of_variables(eqs, V)
        push!(result, Dict(:new_vars => transformation, :new_system => new_system))
    end

    sort!(result, by=r -> length(r[:new_vars]))
end

#------------------------------------------------------------------------------

export find_smallest_reduction, find_reductions
export check_consistency
export ODE, @ODEsystem, equations

end
