
using Test
using TestSetExtensions

using JSON
using LinearAlgebra: SingularException

using Nemo

include("../src/ExactODEReduction.jl")
using .ExactODEReduction: from_dense, to_dense, from_COO, zero_sparsik, random_sparsik,
                          construct_jacobians, check_invariance!, @sparse, linear_span!,
                          check_inclusion!, density, is_thorough, transpose!, tr, dim, scale,
                          to_cartesian, to_plain, load_COO_set, load_MTX, find_radical,
                          rational_reconstruction, modular_reduction, Sparsik, inner,
                          scale!, reduce!, first_nonzero, find_basis_1_β, find_basis_1,
                          minimal_polynomial_wiedemann, unit_sparsik, evaluate, reconstruct!,
                          square_nonsingular_deterministic_wiedemann, square_nonsingular_randomized_wiedemann


@info "Testing started"

@testset "All the tests" begin

    @includetests ARGS

end

@info "All tests OK"
