
using Test
using TestSetExtensions

using JSON
using LinearAlgebra: SingularException, det

using AbstractAlgebra
using Nemo

using ExactODEReduction
using ExactODEReduction: from_dense, to_dense, from_COO, zero_sparsik, random_sparsik,
                          construct_jacobians, check_invariance!, @sparse, linear_span!,
                          check_inclusion!, density, is_thorough, transpose!, tr, dim, scale,
                          to_cartesian, to_plain, load_COO_set, load_MTX, eigenvectors,
                          rational_reconstruction, modular_reduction, Sparsik, inner,
                          scale!, reduce!, first_nonzero, find_basis_1_β, find_basis_1,
                          minimal_polynomial_wiedemann, unit_sparsik, evaluate, reconstruct!,
                          square_nonsingular_deterministic_wiedemann, square_nonsingular_randomized_wiedemann,
                          positivize, find_radical_sup


@info "Testing started"

@testset "All the tests" begin

    @includetests ARGS

end

@info "All tests OK"
