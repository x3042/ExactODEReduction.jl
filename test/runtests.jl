include("../src/ExactODEReduction.jl")
using .ExactODEReduction

using Test
using TestSetExtensions

using JSON
using LinearAlgebra: SingularException, det

using Primes
using AbstractAlgebra
using Nemo
using SparseArrays
import ModelingToolkit
import Random

# Taken from JuMP/test/solvers.jl
function try_import(name::Symbol)
    try
        @eval import $name
        return true
    catch e
        return false
    end
end

@info "Testing started"

@testset "All tests" verbose=true begin
    @includetests ["parser"]    
    
    @includetests ["modular", "sparse"]

    @includetests ["reconstruction"]

    @includetests ["indices_conversion", "gizmos", "random_elements"]

    @includetests ["find_basis", "eigenspaces", "radical", "invariants"]

    if try_import(:Polymake)
        @warn "Testing using Polymake"
        @includetests ["positivizer"]
    end

    @includetests ["ode"]

    @includetests ["reduction"]

    @includetests ["find_reductions"]

    @includetests ["find_some_reduction"]

    @includetests ["find_reductions_params"]
end
