module ExactODEReduction

# These are extended
import Base: ==, !=, +, -, *, lcm, rand, zero

import Logging

# for conversions between our and MTK de system types
import ModelingToolkit

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

# Computing a basis of matrix algebra
include("basis.jl")
# Algotirhms for matrix algebra
include("matrix_algebras.jl")

# By default, Polymake is not loaded
_ispolymakeloaded() = false
@noinline _warn_polymakenotloaded() = @warn "Run `import Polymake` to enable parameter `makepositive`."
function __init__()
    # Be positive!
    @require Polymake="d720cf60-89b5-51f5-aff5-213f193123e7" include("positivizor.jl")
end

# Finding invariant subspaces
include("invariants.jl")
# Parametrizing the final system
include("parametrization.jl")

#------------------------------------------------------------------------------

"""
    find_some_reduction(system::ODE, observables; overQ=true, makepositive=false, loglevel=Logging.Info)

Finds a nontrivial linear reduction of the system.
If there exists a reduction, it will be found.

Arguments:
 - `system` is an ODE system given as `ODE` object,
 - `overQ` tells the algorithm to search for reductions over rational numbers,
 - `makepositive` tells the algorithm to search for reductions with positive coefficients;
 To enable this argument, you should have `Polymake.jl` imported. 

 Example:
```julia
julia> using ExactODEReduction
julia> odes = @ODEsystem(
    x'(t) = x + y,
    y'(t) = x - y - z,
    z'(t) = 2x - z
)
julia> find_some_reduction(odes)
Dict{Symbol, Any} with 2 entries:
  :new_system => y2'(t) = -y1(t) - y2(t)…
  :new_vars   => Nemo.fmpq_mpoly[y, z - x]
```

"""
function find_some_reduction(
        system::ODE{P};
	    overQ=true,
        loglevel=Logging.Info,
        makepositive=false) where {P}

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

    if length(matrices) == 0
        matrices = [zero_sparse_vector(length(eqs), length(eqs), Nemo.QQ)]
    end
    subspaces = invariant_subspace_global(matrices; overQ=overQ)

    @debug "Subspace global" subspaces

    isempty(subspaces) && return Dict{Symbol, Vector{fmpq_mpoly}}()
    subspace = first(subspaces)

    subspace = basis(linear_span!(subspace))
    
    @debug "Linear span" subspace

    if makepositive
        if _ispolymakeloaded()
            subspace = positivize(subspace)
        else
            _warn_polymakenotloaded()
        end
    end

    @debug "After positivize" subspace

    (transformation, new_equations) = perform_change_of_variables(eqs, subspace)
    
    # (!) assumes the correct order in new_equations, i.e.,
    # ∂y[1] ~ new_equations[1],
    # ∂y[2] ~ new_equations[2],
    # ...
    new_ode = polys_to_ODE_assume_order(new_equations)

    return Dict(:new_vars => transformation, :new_system => new_ode)
end

#------------------------------------------------------------------------------

"""
    find_smallest_constrained_reduction(system::ODE, observables; overQ=true, makepositive=false, loglevel=Logging.Info)

Finds the best linear reduction of the system.
If there exists a reduction, it will be found.
Arguments:
 - `system` is an ODE system given as `ODE` object,
 - `observables` is a list of linear functions of initial variables 
   desired to be preserved by reduction,
 - `overQ` tells the algorithm to search for reductions over rational numbers,
 - `makepositive` tells the algorithm to search for reductions with positive coefficients;
 To enable this argument, you should have `Polymake.jl` imported. 

 Example:
```julia
julia> using ExactODEReduction
julia> odes = @ODEsystem(
    x'(t) = x + y,
    y'(t) = x - y - z,
    z'(t) = 2x - z
)
julia> find_smallest_constrained_reduction(odes, [2x + z])
Dict{Symbol, Any} with 2 entries:
  :new_system => y2'(t) = 2*y1(t) - y2(t)…
  :new_vars   => Nemo.fmpq_mpoly[y + 3*x, z + 2*x]
```

"""
function find_smallest_constrained_reduction(
        system::ODE{P},
        observables::Vector{P};
        loglevel=Logging.Info,
        makepositive=false) where {P}

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
    if makepositive
        if _ispolymakeloaded()
            subspace = positivize(subspace)
        else
            _warn_polymakenotloaded()
        end
    end

    (transformation, new_equations) = perform_change_of_variables(eqs, subspace)

    new_ode = polys_to_ODE_assume_order(new_equations)

    return Dict(:new_vars => transformation, :new_system => new_ode)
end

#------------------------------------------------------------------------------

"""
    find_reductions(system::ODE; overQ=true, makepositive=false, loglevel=Logging.Info)

Finds reductions of the system corresponding to a Jordan-Hoelder filtration.
This means that the reduction form a chain, and there are no extra intermediate reduction in this chain.
In particular, if there exists at least one reduction, it will be found.

Arguments:
 - `system` is an ODE system given as `ODE` object,
 - `overQ` tells the algorithm to search for reductions over rational numbers,
 - `makepositive` tells the algorithm to search for reductions with positive coefficients. 
 To enable this argument, you should have `Polymake.jl` imported. 

Example:
```julia
julia> using ExactODEReduction
julia> odes = @ODEsystem(
    x'(t) = x + y,
    y'(t) = x - y - z,
    z'(t) = 2x - z
)
julia> find_reductions(odes)
2-element Vector{Dict{Symbol, Any}}:
 Dict(:new_system => y1'(t) = 0
, :new_vars => Nemo.fmpq_mpoly[y - z + x])
 Dict(:new_system => y2'(t) = -y1(t) - y2(t)
y1'(t) = -y1(t) - y2(t)
, :new_vars => Nemo.fmpq_mpoly[y, z - x])
```

"""
function find_reductions(
        system::ODE{P};
        overQ=true,
        makepositive=false,
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
    result = Vector{Dict{Symbol, Any}}()
    for V in invariant_subspaces
        V = basis(linear_span!(V))
        if makepositive
            if _ispolymakeloaded()
                V = positivize(V)
            else
                _warn_polymakenotloaded()
            end
        end
        poly_ring = parent(system)

        # checking if we live over QQBar
        if base_ring(first(V)) != base_ring(poly_ring)
            poly_ring, _ = Nemo.PolynomialRing(base_ring(first(V)), ["$x" for x in gens(poly_ring)])
        end
        (transformation, new_equations) = perform_change_of_variables(eqs, V)
        new_ode = polys_to_ODE_assume_order(new_equations)
        push!(result, Dict(:new_vars => transformation, :new_system => new_ode))
    end

    sort!(result, by=r -> length(r[:new_vars]))

    @debug "Found reductions" result

    return result
end

export find_smallest_constrained_reduction, find_reductions, find_some_reduction
export check_consistency
export ODE, @ODEsystem, equations, vars

export load_ODE

export ODEtoMTK, MTKtoODE

end
