var documenterSearchIndex = {"docs":
[{"location":"documentation/functions/#Functions","page":"Functions","title":"Functions","text":"","category":"section"},{"location":"documentation/functions/","page":"Functions","title":"Functions","text":"CurrentModule = SparseAlgebra","category":"page"},{"location":"documentation/functions/","page":"Functions","title":"Functions","text":"We export some functions..","category":"page"},{"location":"documentation/functions/","page":"Functions","title":"Functions","text":"func(x)","category":"page"},{"location":"documentation/functions/#SparseAlgebra.func-Tuple{Any}","page":"Functions","title":"SparseAlgebra.func","text":"func(x)\n\nIndentity function. Returns x.\n\n\n\n\n\n","category":"method"},{"location":"documentation/functions/","page":"Functions","title":"Functions","text":"..and..","category":"page"},{"location":"documentation/functions/","page":"Functions","title":"Functions","text":"func_2(x)","category":"page"},{"location":"documentation/functions/#SparseAlgebra.func_2-Tuple{Any}","page":"Functions","title":"SparseAlgebra.func_2","text":"func_2(x)\n\nIndentity function. Returns x.\n\n\n\n\n\n","category":"method"},{"location":"documentation/structures/#Structures","page":"Structures","title":"Structures","text":"","category":"section"},{"location":"documentation/structures/","page":"Structures","title":"Structures","text":"CurrentModule = SparseAlgebra","category":"page"},{"location":"documentation/structures/","page":"Structures","title":"Structures","text":"We operate with..","category":"page"},{"location":"documentation/structures/","page":"Structures","title":"Structures","text":"Sparsik","category":"page"},{"location":"documentation/structures/#SparseAlgebra.Sparsik","page":"Structures","title":"SparseAlgebra.Sparsik","text":"Sparsik\n\n\n\n\n\n","category":"type"},{"location":"documentation/types/#Types","page":"Types","title":"Types","text":"","category":"section"},{"location":"documentation/types/","page":"Types","title":"Types","text":"CurrentModule = SparseAlgebra","category":"page"},{"location":"documentation/types/","page":"Types","title":"Types","text":"Type system in this package goes as follows..","category":"page"},{"location":"documentation/types/","page":"Types","title":"Types","text":"AbstractSparseObject","category":"page"},{"location":"documentation/types/#SparseAlgebra.AbstractSparseObject","page":"Types","title":"SparseAlgebra.AbstractSparseObject","text":"AbstractSparseObject{T}\n\nBase interface for anything Sparse implemented in this project\n\nT is the type of the ground field\n\n\n\n\n\n","category":"type"},{"location":"examples/example_full/#ODEs-Reduction","page":"ODEs Reduction","title":"ODEs Reduction","text":"","category":"section"},{"location":"examples/example_full/","page":"ODEs Reduction","title":"ODEs Reduction","text":"CurrentModule = SparseAlgebra","category":"page"},{"location":"examples/example_full/","page":"ODEs Reduction","title":"ODEs Reduction","text":"lalala","category":"page"},{"location":"examples/example_full/#lololo","page":"ODEs Reduction","title":"lololo","text":"","category":"section"},{"location":"examples/example_full/","page":"ODEs Reduction","title":"ODEs Reduction","text":"parse + Jacob + find + poly","category":"page"},{"location":"#Home","page":"Home","title":"Home","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"CurrentModule = SparseAlgebra","category":"page"},{"location":"","page":"Home","title":"Home","text":"SparseAlgebra is a Julia package for researching the field of Exact Reductions of Ordinary Differential Equations.","category":"page"},{"location":"#Installation","page":"Home","title":"Installation","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The package is available and stable for Julia versions 1.4 and up.","category":"page"},{"location":"","page":"Home","title":"Home","text":"To install it, run","category":"page"},{"location":"","page":"Home","title":"Home","text":"using Pkg\nPkg.add(\"SparseAlgebra\")","category":"page"},{"location":"","page":"Home","title":"Home","text":"from the Julia REPL.","category":"page"},{"location":"#\"I-don't-want-to-read-your-manual,-just-show-me-some-cool-code\"","page":"Home","title":"\"I don't want to read your manual, just show me some cool code\"","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":">julia using SparseAlgebra, Nemo\n\n>julia R, (x₁, x₂, x₃, x₄) = QQ[\"x₁\", \"x₂\", \"x₃\", \"x₄\"]\n\n>julia system = [\n    x₁^2 + 2x₁*x₂,  # derivative of x1\n    x₂^2 + x₃ + x₄, # derivative of x2\n    x₂ + x₄,        # derivative of x3\n    x₁ + x₃         # derivative of x4\n];\n\n>julia matrices = construct_jacobians(system);\n\n>julia invariants = invariant_subspace(matrices);\n\n>julia polynormalize(invariants, R)\n[x₁ + x₂, x₃ + x₄]","category":"page"},{"location":"examples/example_subspaces/#Algebra-Subspaces","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"","category":"section"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"CurrentModule = SparseAlgebra","category":"page"},{"location":"examples/example_subspaces/#One-subspace","page":"Algebra Subspaces","title":"One subspace","text":"","category":"section"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"1","category":"page"},{"location":"examples/example_subspaces/#Many-subspaces","page":"Algebra Subspaces","title":"Many subspaces","text":"","category":"section"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"8","category":"page"}]
}
