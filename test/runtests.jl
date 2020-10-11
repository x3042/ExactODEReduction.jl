
using Test
using TestSetExtensions



@info "Testing started"

@testset "All the tests" begin
    @includetests ARGS
end

@info "All tests OK"
