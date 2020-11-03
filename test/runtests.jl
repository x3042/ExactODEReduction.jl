
using Test
using TestSetExtensions



@info "Testing started"

@testset "All the tests" begin

    # excluding :bidim_sparsik_tests because they intersect
    # with :bidim_sparsik_lazy_tests
    @includetests [:sparsik_tests, :parsik_tests, :bidim_sparsik_lazy_tests]

end

@info "All tests OK"
