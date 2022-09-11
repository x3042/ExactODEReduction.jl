
using BenchmarkTools

using Nemo
using SparseArrays

include("../src/ExactODEReduction.jl")

n = 100
total = 100

for nnz in [1, 5, 15]
    Adense = QQ.(div.(rand(1:total, n, n), total-nnz))
    # Adense contains ~nnz% nonzeros

    Acsr = sparse(Adense)
    Asparsik = ExactODEReduction.from_dense(Adense, QQ)

    @btime *($Acsr, $Acsr);
    # nnz = 1
    # 27.500 μs (441 allocations: 23.94 KiB)
    # nnz = 5
    # 189.400 μs (3401 allocations: 153.72 KiB)
    # nnz = 15
    # 1.614 ms (38674 allocations: 1.33 MiB)

    (@btime prod($Asparsik, $Asparsik); true)
    # nnz = 1
    # 1.671 ms (13169 allocations: 471.30 KiB)
    # nnz = 5
    # 6.133 ms (26853 allocations: 1.16 MiB)
    # nnz = 15
    # 17.515 ms (85495 allocations: 3.38 MiB)
end