
using Test
using TestSetExtensions



@info "Testing started"

@testset "All the tests" begin

    @includetests [:sparsik_tests, :parsik_tests, :bidim_sparsik_lazy_tests]

end

@info "All tests OK"
