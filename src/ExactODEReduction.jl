module ExactODEReduction

# These are extended
import Base: ==, !=, +, -, *, lcm, rand, zero

import Logging
import Logging: ConsoleLogger
import Random

# for conversions between our and MTK de system types
import ModelingToolkit
import ModelingToolkit: states, parameters, equations, Num
import Symbolics
import SymbolicUtils

using SparseArrays
import SparseArrays: getnzval, getcolptr, getrowval, nonzeroinds

import LinearAlgebra
import LinearAlgebra: SingularException

import MacroTools
import MacroTools: @capture

import Nemo
import Nemo: PolyElem, MPolyElem, gens, vars, derivative, monomial, coeff, characteristic,
            MatrixSpace, kernel, PolynomialRing, exponent_vector,
            push_term!, finish, degree, gen, coefficients, MPolyRing,
            FieldElem, symbols, evaluate, charpoly, lead, divexact,
            base_ring, gfp_elem, gfp_fmpz_elem, fmpq_mpoly,
            fmpq, terms, monomials, fmpz, elem_type, parent

import AbstractAlgebra

import Primes

# making Polymake dependency optional
using Requires

using NaturalSort

# for parsing
import JSON

# Measuring running times
const find_basis_times = []
const find_radical_times = []
const common_kernel_times = []
const invariant_subspace_semisimple_times = []
const total_times = []
function dump_times()
    data = (find_basis=deepcopy(ExactODEReduction.find_basis_times),
    find_radical=deepcopy(ExactODEReduction.find_radical_times),
    common_kernel=deepcopy(ExactODEReduction.common_kernel_times),
    invariant_subspace_semisimple=deepcopy(ExactODEReduction.invariant_subspace_semisimple_times),
    total_times=deepcopy(ExactODEReduction.total_times))
    
    empty!(ExactODEReduction.find_basis_times)
    empty!(ExactODEReduction.find_radical_times)
    empty!(ExactODEReduction.common_kernel_times)
    empty!(ExactODEReduction.invariant_subspace_semisimple_times)
    empty!(ExactODEReduction.total_times)
    data
end

#------------------------------------------------------------------------------

include("utils.jl")

# Some useful subroutines from linear algebra
include("linalg_utils.jl")

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

# Rational number reconstruction
include("reconstruction.jl")

# Linear subspace type definition
include("Subspace.jl")
# ODE type definition/functionality
include("ODE.jl")
# 
include("Reduction.jl")

# Computing a basis of matrix algebra
include("basis.jl")
# Algotirhms for matrix algebra
include("matrix_algebras.jl")

# ------------------------------------------------------------------------------

# By default, Polymake is not loaded, 
# and the keyword argument `makepositive` does nothing.
_ispolymakeloaded() = false
@noinline _warn_polymakenotloaded() = @warn "Run `import Polymake` to enable keyword argument `makepositive`."
function __init__()
    # Be positive!
    @require Polymake="d720cf60-89b5-51f5-aff5-213f193123e7" include("positivizor.jl")
end

# See positivizor.jl for details
function positivize_safe(subspace)
    if _ispolymakeloaded()
        return positivize(subspace)
    else
        _warn_polymakenotloaded()
    end
end

# ------------------------------------------------------------------------------

# Finding invariant subspaces
include("invariants.jl")
# Parametrizing the final system
include("parametrization.jl")

#------------------------------------------------------------------------------

"""
    find_some_reduction(system::ODE; overQ, seed, makepositive, loglevel, parameter_strategy)

Finds a nontrivial linear reduction of the system.
If there exists a reduction, it will be found.

Arguments:
 - `system` is an ODE system given as `ODE` object,
 - `overQ` tells the algorithm to search for reductions over rational numbers. Is `true` by default,
 - `seed` is a seed for the random number generator,
 - `makepositive` tells the algorithm to search for reductions with positive coefficients. `false` by default.
 To enable this argument, you should have `Polymake.jl` imported. 
 - `loglevel` is a level of logging. `Logging.Info` by default.
 - `parameter_strategy` prescribes the way the parameter in the resulting system will be recognized:
   * `:inheritance` (default) the parameters in the new system are exactly combinations of the original parameters
   * `:constants` the parameters in the new system will be the variables with zero dynamics
   * `:none` - no parameters in the result

 Example:
```julia
julia> using ExactODEReduction
julia> odes = @ODEsystem(
    x'(t) = x + y,
    y'(t) = x - y - z,
    z'(t) = 2x - z
)
julia> find_some_reduction(odes)
Reduction of dimension 1.
New system:
y1'(t) = -2*y1(t)
New variables:
y1 = x - y - z
```

"""
function find_some_reduction(
        system::ODE{P};
	    overQ=true,
        seed=nothing,
        makepositive=false,
        loglevel=Logging.Info,
        parameter_strategy=:inheritance) where {P}

    prev_logger = Logging.global_logger(ConsoleLogger(stderr, loglevel))

    isnothing(seed) && (seed = getnewrandomseed())
    Random.seed!(seed)
    @info "Global random seed: $seed"

    @debug "find_some_reduction of " system

    # Jacobian of system,
    # each subspace invariant under Jacobian corresponds to a reduction
    eqs = equations_extended(system)
    matrices = construct_jacobians(eqs)

    @debug "Matrices" matrices
    @debug "Densities" map(density, matrices) 

    if length(matrices) == 0
        matrices = [zero_sparse_vector(length(eqs), length(eqs), Nemo.QQ)]
    end
    subspaces = invariant_subspace_global(matrices; overQ=overQ)

    @debug "Subspace global" subspaces

    if isempty(subspaces)
        @warn "No reductions found"
        return _emptyreduction(system)
    end

    subspace = first(subspaces)
    subspace = basis(linear_span!(subspace))
    
    @debug "Linear span" subspace

    if makepositive
        subspace = positivize_safe(subspace)
    end

    @debug "After positivize" subspace

    # revert the global logger
    Logging.global_logger(prev_logger)

    return Reduction{Nemo.fmpq_mpoly}(system, subspace, parameter_strategy)
end

#------------------------------------------------------------------------------

"""
    find_smallest_constrained_reduction(system::ODE, observables; overQ=true, makepositive=false, loglevel=Logging.Info)

Finds the best linear reduction of the system.
If there exists a reduction, it will be found.

Arguments:
 - `system` is an ODE system given as `ODE` object,
 - `observables` is a list of linear functions of initial variables desired to be preserved by reduction,
 - `overQ` tells the algorithm to search for reductions over rational numbers. Is `true` by default,
 - `seed` is a seed for the random number generator,
 - `makepositive` tells the algorithm to search for reductions with positive coefficients. `false` by default.
 To enable this argument, you should have `Polymake.jl` imported. 
 - `loglevel` is a level of logging. `Logging.Info` by default.
 - `parameter_strategy` prescribes the way the parameter in the resulting system will be recognized:
   * `:inheritance` (default) the parameters in the new system are exactly combinations of the original parameters
   * `:constants` the parameters in the new system will be the variables with zero dynamics
   * `:none` - no parameters in the result

 Example:
```julia
julia> using ExactODEReduction
julia> odes = @ODEsystem(
    x'(t) = x + y,
    y'(t) = x - y - z,
    z'(t) = 2x - z
)
julia> find_smallest_constrained_reduction(odes, [x + (1//2)*z])
Reduction of dimension 2.
New system:
y1'(t) = 2*y1(t) + y2(t)
y2'(t) = -2*y1(t) - y2(t)
New variables:
y1 = x + 1//2*z
y2 = y - 3//2*z
```

"""
function find_smallest_constrained_reduction(
        system::ODE{P},
        observables::Vector{P};
        seed=nothing,
        makepositive=false,
        loglevel=Logging.Info,
        parameter_strategy=:inheritance) where {P}

    prev_logger = Logging.global_logger(ConsoleLogger(stderr, loglevel))

    isnothing(seed) && (seed = getnewrandomseed())
    Random.seed!(seed)
    @info "Global random seed: $seed"

    # Jacobian of system,
    # each subspace invariant under Jacobian corresponds to a reduction
    eqs = equations_extended(system)
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
        subspace = invariant_subspace_local(matrices, vector_obs)
    else
        subspace = vector_obs
    end

    if isempty(subspace)
        @warn "No reductions found"
        return _emptyreduction(system)
    end

    subspace = basis(linear_span!(subspace))
    if makepositive
        subspace = positivize_safe(subspace)
    end

    Logging.global_logger(prev_logger)

    return Reduction{Nemo.fmpq_mpoly}(system, subspace, parameter_strategy)
end

#------------------------------------------------------------------------------

"""
    find_reductions(system::ODE; overQ=true, makepositive=false, loglevel=Logging.Info)

Finds reductions of the system corresponding to a Jordan-Hoelder filtration.
This means that the reduction form a chain, and there are no extra intermediate reduction in this chain.
In particular, if there exists at least one reduction, it will be found.

Arguments:
 - `system` is an ODE system given as `ODE` object,
 - `overQ` tells the algorithm to search for reductions over rational numbers. Is `true` by default,
 - `seed` is a seed for the random number generator,
 - `makepositive` tells the algorithm to search for reductions with positive coefficients. `false` by default.
 To enable this argument, you should have `Polymake.jl` imported. 
 - `loglevel` is a level of logging. `Logging.Info` by default.
 - `parameter_strategy` prescribes the way the parameter in the resulting system will be recognized:
   * `:inheritance` (default) the parameters in the new system are exactly combinations of the original parameters
   * `:constants` the parameters in the new system will be the variables with zero dynamics
   * `:none` - no parameters in the result

Example:
```julia
julia> using ExactODEReduction
julia> odes = @ODEsystem(
    x'(t) = x + y,
    y'(t) = x - y - z,
    z'(t) = 2x - z
)
julia> find_reductions(odes)
A chain of 2 reductions of dimensions 1, 2.
==================================
1. Reduction of dimension 1.
New system:
y1'(t) = 0
New variables:
y1 = x + y - z
==================================
2. Reduction of dimension 2.
New system:
y1'(t) = -y1(t) + y2(t)
y2'(t) = y1(t) - y2(t)
New variables:
y1 = x - z
y2 = y
```

"""
function find_reductions(
        system::ODE{P};
        overQ=true,
        makepositive=false,
        seed=nothing,
        loglevel=Logging.Info,
        parameter_strategy=:inheritance) where {P}

    prev_logger = Logging.global_logger(ConsoleLogger(stderr, loglevel))

    isnothing(seed) && (seed = getnewrandomseed())
    Random.seed!(seed)
    @info "Global random seed: $seed"

    @debug "find_reductions of " system

    eqs = equations_extended(system)
    matrices = construct_jacobians(eqs)

    if length(matrices) == 0
        matrices = [zero_sparse_vector(length(eqs), length(eqs), Nemo.QQ)]
    end
    invariant_subspaces = many_invariant_subspaces(matrices, invariant_subspace_global; overQ=overQ)
    
    poly_ring = parent(system)
    if isempty(invariant_subspaces)
        @warn "No reductions found"
        return ChainOfReductions(Vector{Reduction{elem_type(poly_ring),elem_type(poly_ring),elem_type(poly_ring)}}())
    end

    # checking if we live over QQBar
    K = base_ring(first(first(invariant_subspaces)))
    if K != base_ring(poly_ring)
        poly_ring, _ = Nemo.PolynomialRing(K, ["$x" for x in gens(poly_ring)])
    end

    # results = Vector{Reduction{elem_type(poly_ring), elem_type(poly_ring), elem_type(poly_ring)}}()
    results = Vector{Any}()
    for (i, V) in enumerate(invariant_subspaces)
        V = basis(linear_span!(V))
        if makepositive
            V = positivize_safe(V)
        end
        push!(results, Reduction{Nemo.fmpq_mpoly}(system, V, parameter_strategy))
    end

    sort!(results, by=r -> length(r.new_vars))

    @debug "Found reductions" results

    Logging.global_logger(prev_logger)

    ChainOfReductions(results)
end

export ODE, @ODEsystem, equations, vars
export states, parameters, initial_conditions, parameter_values
export set_parameter_values, to_state, to_parameter

export Reduction, ChainOfReductions
export find_smallest_constrained_reduction, find_reductions, find_some_reduction
export new_system, new_vars, new_initialconds, old_system, reduce_data

export load_ODE_fromfile
export ODEtoMTK, MTKtoODE

end

# Муртазы Губайдулловича не стало. Мы склоняем головы перед великим сыном башкирского народа, который посвятил всего себя служению республике и России. Прощайте, уважаемый Муртаза Губайдуллович
