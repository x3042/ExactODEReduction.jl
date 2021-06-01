var documenterSearchIndex = {"docs":
[{"location":"#Home","page":"Home","title":"Home","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"CurrentModule = SparseAlgebra","category":"page"},{"location":"","page":"Home","title":"Home","text":"SparseAlgebra is a Julia package for researching the field of Exact Reductions of Ordinary Differential Equations.","category":"page"},{"location":"#Installation","page":"Home","title":"Installation","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The package is available and stable for Julia versions 1.4 and up.","category":"page"},{"location":"","page":"Home","title":"Home","text":"To install it, run","category":"page"},{"location":"","page":"Home","title":"Home","text":"using Pkg\nPkg.add(\"Symbolics\")","category":"page"},{"location":"","page":"Home","title":"Home","text":"from the Julia REPL.","category":"page"},{"location":"#\"I-don't-want-to-read-your-manual,-just-show-me-some-cool-code\"","page":"Home","title":"\"I don't want to read your manual, just show me some cool code\"","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":">julia using SparseAlgebra, Nemo\n\n>julia R, (x₁, x₂, x₃, x₄) = QQ[\"x₁\", \"x₂\", \"x₃\", \"x₄\"]\n\n>julia system = [\n    x₁^2 + 2x₁*x₂,  # derivative of x1\n    x₂^2 + x₃ + x₄, # derivative of x2\n    x₂ + x₄,        # derivative of x3\n    x₁ + x₃         # derivative of x4\n];\n\n>julia matrices = construct_jacobians(system);\n\n>julia invariants = invariant_subspace(matrices);\n\n>julia polynormalize(invariants, R)\n[x₁ + x₂, x₃ + x₄]","category":"page"},{"location":"","page":"Home","title":"Home","text":"invariant_subspace(As)","category":"page"},{"location":"#SparseAlgebra.invariant_subspace-Tuple{Any}","page":"Home","title":"SparseAlgebra.invariant_subspace","text":"invariant_subspace(As; backend_algorithm)\n\nFinds one common invariant subspace of the given matrices As using the provived default method for finding one invaiant subspace backend_algorithm.\n\n\n\n\n\n","category":"method"},{"location":"","page":"Home","title":"Home","text":"SparseAlgebra.@sparse(ex)","category":"page"},{"location":"#SparseAlgebra.@sparse-Tuple{Any}","page":"Home","title":"SparseAlgebra.@sparse","text":"@sparse(ex)\n\nConverts an Array in ex to sparse representation\n\n\n\n\n\n","category":"macro"},{"location":"","page":"Home","title":"Home","text":"func(x)","category":"page"},{"location":"#SparseAlgebra.func-Tuple{Any}","page":"Home","title":"SparseAlgebra.func","text":"func(x)\n\nIndentity function. Returns x.\n\n\n\n\n\n","category":"method"},{"location":"types/#Types-in-SparseAlgebra","page":"Types in SparseAlgebra","title":"Types in SparseAlgebra","text":"","category":"section"},{"location":"types/","page":"Types in SparseAlgebra","title":"Types in SparseAlgebra","text":"CurrentModule = SparseAlgebra","category":"page"},{"location":"types/#Structures","page":"Types in SparseAlgebra","title":"Structures","text":"","category":"section"},{"location":"types/","page":"Types in SparseAlgebra","title":"Types in SparseAlgebra","text":"Sparsik","category":"page"},{"location":"types/#SparseAlgebra.Sparsik","page":"Types in SparseAlgebra","title":"SparseAlgebra.Sparsik","text":"Sparsik\n\n\n\n\n\n","category":"type"}]
}
