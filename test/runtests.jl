
using Test
using TestSetExtensions

using JSON
using LinearAlgebra: SingularException, det

using AbstractAlgebra
using Nemo
using SparseArrays

include("../src/ExactODEReduction.jl")
using .ExactODEReduction

@info "Testing started"

@testset "All tests" begin

    @includetests ["parser_tests"]    

    @includetests ["indices_conversion", "gizmos_tests"]

    @includetests ["find_basis_tests", "eigenspaces",
                "radical_tests", "positivizer"]

    @includetests ["find_some_reduction", "find_reductions"]

end
