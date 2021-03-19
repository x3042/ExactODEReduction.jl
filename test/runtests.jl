
using Test
using TestSetExtensions

using SparseAlgebra

@info "Testing started"

@testset "All the tests" begin

    @includetests [:sparsik_tests, :minimal_polynomial_tests,
                    :dok_sparsik_tests, :wiedemannchik_tests,
                    :find_basis_tests]

end

@info "All (the) tests OK"
