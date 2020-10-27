
module SparseAlgebra


    include("sparsik.jl")
    run(`julia $(Base.abspath("test/sparsik_tests.jl"))`)

    # include("bidim_sparsik.jl")
    # run(`julia $(Base.abspath("test/bidim_sparsik_tests.jl"))`)

    include("bidim_sparsik_lazy.jl")
    run(`julia $(Base.abspath("test/bidim_sparsik_lazy_tests.jl"))`)

    include("parser.jl")
    run(`julia $(Base.abspath("test/parser_tests.jl"))`)

end
