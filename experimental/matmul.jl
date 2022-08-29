
using BenchmarkTools

using Nemo
using SparseArrays

include("../src/ExactODEReduction.jl")

nnz, total = 5, 100
n = 100
Adense = QQ.(div.(rand(1:total, n, n), total-nnz))
# Adense contains ~5% nonzeros

Acsr = sparse(Adense)
Asparsik = ExactODEReduction.from_dense(Adense, QQ)

@btime *($Acsr, $Acsr);
# 189.400 μs (3401 allocations: 153.72 KiB)

(@btime prod($Asparsik, $Asparsik); true)
# 6.133 ms (26853 allocations: 1.16 MiB)