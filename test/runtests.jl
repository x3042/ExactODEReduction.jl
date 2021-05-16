
using Test
using TestSetExtensions

include("../src/api.jl")

@info "Testing started"

@testset "All the tests" begin

    @includetests [:sparsik_tests, :gizmos_tests, :minimal_polynomial_tests,
                    :dok_sparsik_tests, :parsik_tests,
                    :find_basis_tests, :radical_tests]

end

@info "All tests OK"
