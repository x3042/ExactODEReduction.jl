
module ExactODEReduction

import DataStructures
import Distributions
import JSON
import Logging
import Primes

using SparseArrays
import SparseArrays: getnzval, getcolptr, getrowval,
                    nonzeroinds

import LinearAlgebra

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

const find_basis_times = []
const find_radical_sup_times = []
const general_kernel_times = []
const invariant_subspace_semisimple_times = []
const total_times = []

function dump_times()
    data = (find_basis=deepcopy(ExactODEReduction.find_basis_times),
    find_radical_sup=deepcopy(ExactODEReduction.find_radical_sup_times),
    general_kernel=deepcopy(ExactODEReduction.general_kernel_times),
    invariant_subspace_semisimple=deepcopy(ExactODEReduction.invariant_subspace_semisimple_times),
    total_times=deepcopy(ExactODEReduction.total_times))
    
    empty!(ExactODEReduction.find_basis_times)
    empty!(ExactODEReduction.find_radical_sup_times)
    empty!(ExactODEReduction.general_kernel_times)
    empty!(ExactODEReduction.invariant_subspace_semisimple_times)
    empty!(ExactODEReduction.total_times)
    return data
end

#------------------------------------------------------------------------------

include("utils.jl")

# Some useful but hardly categorizable things
include("gizmos.jl")

# Reading input from files
include("parser/myeval.jl")
include("parser/parser.jl")

# Extending methods for Nemo.QQBar
include("qqbar.jl")
# Modular number type definition
include("MyModNumber.jl")
# Describes coefficient domains
include("coefficients.jl")
# Sparse data structures definitions
include("sparse.jl")

# Wiedemann-style sparse system solving
include("wiedemann.jl")

# Linear subspace type definition
include("Subspace.jl")
# ODE type definition
include("ODE.jl")

# Algebra basis algorithms
include("basis.jl")
# Algebra radical algorithms
include("radical.jl")
# Be positive!
include("positivizor.jl")
# Finding invariant subspaces
include("invariants.jl")
# Parametrizing the final system
include("parametrization.jl")

#------------------------------------------------------------------------------

"""
    find_some_reduction(system; backend_algorithm)

Finds a nontrivial linear reduction of the system.
If there exists a reduction, it will be found.
Arguments:
 - `system` is a list of the right-hand sides of the system, the i-th element is the derivative of the i-th
   variable in the corresponding polynomial ring
"""
function find_some_reduction(
        system::ODE{P};
	    overQ=true,
        loglevel=Logging.Info) where {P}

    # hmm
    package_logger = Logging.ConsoleLogger(stderr, loglevel)
    Logging.global_logger(package_logger)

    @debug "find_some_reduction of " system

    # Jacobian of system,
    # each subspace invariant under Jacobian corresponds to a reduction
    eqs = equations(system)
    matrices = construct_jacobians(eqs)

    @debug "Matrices" matrices
    @debug "Densities" map(density, matrices) 

    # @debug "Matrices:" matrices

    if length(matrices) == 0
        # TODO: !!! actually, what is this case even??
        matrices = [zero_sparse_vector(length(eqs), length(eqs), Nemo.QQ)]
    end
    @savetime subspaces = invariant_subspace_global(matrices; overQ=overQ) total_times

    @debug "Subspace global" subspaces

    isempty(subspaces) && return Dict{Symbol, Vector{fmpq_mpoly}}()
    subspace = first(subspaces)

    subspace = basis(linear_span!(subspace))
    
    @debug "Linear span" subspace

    subspace = positivize(subspace)

    @debug "After positivize" subspace

    (transformation, new_system) = perform_change_of_variables(eqs, subspace)

    return Dict(:new_vars => transformation, :new_system => new_system)
end

#------------------------------------------------------------------------------

"""
    find_smallest_constrained_reduction(system, observables; backend_algorithm)

Finds the best linear reduction of the system.
If there exists a reduction, it will be found.
Arguments:
 - `system` is a list of the right-hand sides of the system, the i-th element is the derivative of the i-th
   variable in the corresponding polynomial ring
 - `observables` is a list of linear functions of initial variables
   desired to be preserved by reduction.
   Defaults to an empty list to find the most general reduction.
"""
function find_smallest_constrained_reduction(
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

    # constructing vectors from the observables
    ground = base_ring(first(observables))
    variables = gens(parent(first(observables)))
    vector_obs = [
        sparse([coeff(f, v) for v in variables])
        for f in observables
    ]

    subspace = nothing
    if length(matrices) > 0
        subspace =  invariant_subspace_local(matrices, vector_obs)
    else
        subspace = vector_obs
    end

    isempty(subspace) && return Dict{Symbol, Vector{fmpq_mpoly}}()

    subspace = basis(linear_span!(subspace))
    subspace = positivize(subspace)

    (transformation, new_system) = perform_change_of_variables(eqs, subspace)
    
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
	overQ=true,
        loglevel=Logging.Info) where {P}

    package_logger = Logging.ConsoleLogger(stderr, loglevel)
    Logging.global_logger(package_logger)

    @debug "find_reductions of " system

    eqs = equations(system)
    matrices = construct_jacobians(eqs)

    if length(matrices) == 0
        matrices = [zero_sparse_vector(length(eqs), length(eqs), Nemo.QQ)]
    end
    invariant_subspaces = many_invariant_subspaces(matrices, invariant_subspace_global; overQ=overQ)
    result = Vector{Dict{Symbol, Vector{Any}}}()
    for V in invariant_subspaces
        V = basis(linear_span!(V))
	    V = positivize(V)
        poly_ring = parent(system)

        # checking if we live over QQBar
        if base_ring(first(V)) != base_ring(poly_ring)
            poly_ring, _ = Nemo.PolynomialRing(base_ring(first(V)), ["$x" for x in gens(poly_ring)])
        end
        (transformation, new_system) = perform_change_of_variables(eqs, V)
        push!(result, Dict(:new_vars => transformation, :new_system => new_system))
    end

    sort!(result, by=r -> length(r[:new_vars]))

    @debug "Found reductions" result

    return result
end

#------------------------------------------------------------------------------

export find_smallest_constrained_reduction, find_reductions, find_some_reduction
export check_consistency
export ODE, @ODEsystem, equations

end
