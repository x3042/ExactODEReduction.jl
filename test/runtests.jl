using Test
using TestSetExtensions

using JSON
using LinearAlgebra: SingularException, det

using Primes
using AbstractAlgebra
using Nemo
using SparseArrays

include("../src/ExactODEReduction.jl")
using .ExactODEReduction

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
    # @includetests ["parser"]    
    
    @includetests ["modular", "sparse"]

    @includetests ["reconstruction"]

    @includetests ["indices_conversion", "gizmos", "random_elements"]

    @includetests ["find_basis", "eigenspaces", "radical", "invariants"]

    if try_import(:Polymake)
        @includetests ["positivizer"]
    end

    @includetests ["find_some_reduction", "find_reductions"]
end
