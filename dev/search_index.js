var documenterSearchIndex = {"docs":
[{"location":"documentation/functions/#Functions","page":"Functions","title":"Functions","text":"","category":"section"},{"location":"documentation/functions/","page":"Functions","title":"Functions","text":"CurrentModule = SparseAlgebra","category":"page"},{"location":"documentation/functions/","page":"Functions","title":"Functions","text":"Here the main interface of the program is listed.","category":"page"},{"location":"documentation/functions/","page":"Functions","title":"Functions","text":"invariant_subspace","category":"page"},{"location":"documentation/functions/#SparseAlgebra.invariant_subspace","page":"Functions","title":"SparseAlgebra.invariant_subspace","text":"invariant_subspace(As; backend_algorithm)\n\nFinds one common invariant subspace of the given matrices As using the provived default method backend_algorithm. By default, invariant_subspace_1 is used.\n\nEach matrix in As to be a subtype of AbstractSparseMatrix\n\n\n\n\n\n","category":"function"},{"location":"documentation/functions/","page":"Functions","title":"Functions","text":"many_invariant_subspaces","category":"page"},{"location":"documentation/functions/#SparseAlgebra.many_invariant_subspaces","page":"Functions","title":"SparseAlgebra.many_invariant_subspaces","text":"many_invariant_subspaces(As; backend_algorithm)\n\nFinds several common invariant subspaces of the given matrices As using the provived default method backend_algorithm. By default, invariant_subspace_1 is used.\n\nEach matrix in As to be a subtype of AbstractSparseMatrix\n\n\n\n\n\n","category":"function"},{"location":"documentation/functions/","page":"Functions","title":"Functions","text":"find_basis","category":"page"},{"location":"documentation/functions/#SparseAlgebra.find_basis","page":"Functions","title":"SparseAlgebra.find_basis","text":"find_basis(vectors; used_algorithm, initialprime)\n\nFinds a basis of the algebra generated with the given vectors using the provived default method used_algorithm while reducing input coefficients modulo initialprime. By default, find_basis_1_β stands for the algorithm and 2147483647 for the initial reduction modulo.\n\nEach element in vector to be a subtype of AbstractSparseObject\n\n\n\n\n\n","category":"function"},{"location":"documentation/functions/","page":"Functions","title":"Functions","text":"find_radical_sup","category":"page"},{"location":"documentation/functions/#SparseAlgebra.find_radical_sup","page":"Functions","title":"SparseAlgebra.find_radical_sup","text":"find_radical_sup(Algebra)\n\nFinds a basis of the radical of given matrix Algebra.\n\n\n\n\n\n","category":"function"},{"location":"documentation/functions/","page":"Functions","title":"Functions","text":"wiedemann_solve","category":"page"},{"location":"documentation/functions/#SparseAlgebra.wiedemann_solve","page":"Functions","title":"SparseAlgebra.wiedemann_solve","text":"wiedemann_solve(A, b; proved)\n\nReturns a solution x to linear system Ax = b under an assumtion of A being square and nonsingular using Wiedemann system-solving algorithm. By default, proved = true which calls 'squarenonsingulardeterministicwiedemann' otherwise calls 'squarenonsingularrandomizedwiedemann'.\n\n\n\n\n\n","category":"function"},{"location":"documentation/functions/","page":"Functions","title":"Functions","text":"construct_jacobians","category":"page"},{"location":"documentation/functions/#SparseAlgebra.construct_jacobians","page":"Functions","title":"SparseAlgebra.construct_jacobians","text":"construct_jacobians(system)\n\nFor the given system of polynomials in variables xi consturucts a set of matrices Aᵢ over number field such that the Jacobian J of the provided system can represented as the sum J = Aᵢxⁱ\n\n\n\n\n\n","category":"function"},{"location":"documentation/functions/","page":"Functions","title":"Functions","text":"rational_reconstruction","category":"page"},{"location":"documentation/functions/#SparseAlgebra.rational_reconstruction","page":"Functions","title":"SparseAlgebra.rational_reconstruction","text":"rational_reconstruction(a, m)\n\nRational number reconstruction implementation borrowed from CLUE and modified a bit to suit the 'Modern Computer Algebra' definitions. Returns a rational of QQ field in a canonical form that is congruent a modulo m\n\na, m are integers\n\n\n\n\n\n","category":"function"},{"location":"documentation/structures/#Structures","page":"Structures","title":"Structures","text":"","category":"section"},{"location":"documentation/structures/","page":"Structures","title":"Structures","text":"CurrentModule = SparseAlgebra","category":"page"},{"location":"documentation/structures/","page":"Structures","title":"Structures","text":"Sparsik","category":"page"},{"location":"documentation/structures/#SparseAlgebra.Sparsik","page":"Structures","title":"SparseAlgebra.Sparsik","text":"Sparsik{T<:Field}\n\nProvides basic 1-dimensional sparse vector interface. Parametrized with the type of coefficient field T.\n\nSupports these fast operations:\n\ninner, scale, reduce, iterate.\n\nOne can construct Sparsik from a dense vector with the from_dense function.\n\n\n\n\n\n","category":"type"},{"location":"documentation/structures/","page":"Structures","title":"Structures","text":"DOK_Sparsik","category":"page"},{"location":"documentation/structures/#SparseAlgebra.DOK_Sparsik","page":"Structures","title":"SparseAlgebra.DOK_Sparsik","text":"DOK_Sparsik{T<:Field}\n\nProvides basic 2-dimensional sparse vector interface, i.e Sparse Matrix. Parametrized with the type of coefficient field T.\n\nSupports these fast operations:\n\ninner, scale, reduce, iterate, matvec and matmat (Base.prod).\n\nOne can construct BidimSparsik from a dense matrix with the from_dense function.\n\n\n\n\n\n","category":"type"},{"location":"documentation/structures/","page":"Structures","title":"Structures","text":"Subspacik","category":"page"},{"location":"documentation/structures/#SparseAlgebra.Subspacik","page":"Structures","title":"SparseAlgebra.Subspacik","text":"Subspacik{T<:Field}\n\nProvides basic linear subspace interface. Parametrized with the type of coefficient field T.\n\nOne can add a vector to the spanning vectors of a Subspacik instance via eat_sparsik! function or create a subspace from scratch with linear_span!\n\n\n\n\n\n","category":"type"},{"location":"documentation/types/#Types","page":"Types","title":"Types","text":"","category":"section"},{"location":"documentation/types/","page":"Types","title":"Types","text":"CurrentModule = SparseAlgebra","category":"page"},{"location":"documentation/types/","page":"Types","title":"Types","text":"Type system in this package goes as follows.","category":"page"},{"location":"documentation/types/","page":"Types","title":"Types","text":"AbstractSparseObject","category":"page"},{"location":"documentation/types/#SparseAlgebra.AbstractSparseObject","page":"Types","title":"SparseAlgebra.AbstractSparseObject","text":"AbstractSparseObject{T}\n\nBase interface for anything Sparse implemented in this project\n\nT is the type of the ground field\n\n\n\n\n\n","category":"type"},{"location":"documentation/types/","page":"Types","title":"Types","text":"AbstractSparseVector","category":"page"},{"location":"documentation/types/#SparseAlgebra.AbstractSparseVector","page":"Types","title":"SparseAlgebra.AbstractSparseVector","text":"AbstractSparseObject{T}\n\nBase interface for 1-dimensional Sparse vector. An object which implements AbstractSparseVector can be treated as an element of Rⁿ vectorspace. Thus, some vectorspace operations and left matvec are supported for such objects.\n\nT is the type of the ground field\n\n\n\n\n\n","category":"type"},{"location":"documentation/types/","page":"Types","title":"Types","text":"AbstractSparseMatrix","category":"page"},{"location":"documentation/types/#SparseAlgebra.AbstractSparseMatrix","page":"Types","title":"SparseAlgebra.AbstractSparseMatrix","text":"AbstractSparseObject{T}\n\nBase interface for 2-dimensional Sparse vector, i.e Sparse Matrix. An object which implements AbstractSparseMatrix can be treated as an element of Rⁿ⃰ⁿ vectorspace or as an element of a matrix algebra. Thus, some vectorspace operations and matrix prodducts are supported for such objects.\n\nT is the type of the ground field\n\n\n\n\n\n","category":"type"},{"location":"examples/example_full/#ODEs-Reduction","page":"ODEs Reduction","title":"ODEs Reduction","text":"","category":"section"},{"location":"examples/example_full/","page":"ODEs Reduction","title":"ODEs Reduction","text":"CurrentModule = SparseAlgebra","category":"page"},{"location":"examples/example_full/","page":"ODEs Reduction","title":"ODEs Reduction","text":"Here is an example of the full pipeline for one ODE system.","category":"page"},{"location":"examples/example_full/#One-transformation-for-ODE-system","page":"ODEs Reduction","title":"One transformation for ODE system","text":"","category":"section"},{"location":"examples/example_full/","page":"ODEs Reduction","title":"ODEs Reduction","text":"Load & parse the system","category":"page"},{"location":"examples/example_full/","page":"ODEs Reduction","title":"ODEs Reduction","text":"model = load_ODEs(\"src/data/ODEs/simple/example1.ode\")","category":"page"},{"location":"examples/example_full/","page":"ODEs Reduction","title":"ODEs Reduction","text":"Call construct_jacobians to obtain several matrices","category":"page"},{"location":"examples/example_full/","page":"ODEs Reduction","title":"ODEs Reduction","text":"Js = construct_jacobians(model)","category":"page"},{"location":"examples/example_full/","page":"ODEs Reduction","title":"ODEs Reduction","text":"..Find an invariant subspace..","category":"page"},{"location":"examples/example_full/","page":"ODEs Reduction","title":"ODEs Reduction","text":"subspace = invariant_subspace(Js)","category":"page"},{"location":"examples/example_full/","page":"ODEs Reduction","title":"ODEs Reduction","text":"And return back to variable form","category":"page"},{"location":"examples/example_full/","page":"ODEs Reduction","title":"ODEs Reduction","text":"polynormalize(subspace, parent(first(keys(model))))","category":"page"},{"location":"examples/example_full/","page":"ODEs Reduction","title":"ODEs Reduction","text":"You will get the following result","category":"page"},{"location":"examples/example_full/","page":"ODEs Reduction","title":"ODEs Reduction","text":"6-element Array{Any,1}:\n Ap\n ApB\n -Au + AuB + B\n r2\n r3\n Au + r1 + r4","category":"page"},{"location":"#Home","page":"Home","title":"Home","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"CurrentModule = SparseAlgebra","category":"page"},{"location":"","page":"Home","title":"Home","text":"SparseAlgebra is a Julia package for researching the field of Exact Reductions of Ordinary Differential Equations.","category":"page"},{"location":"#Installation","page":"Home","title":"Installation","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The package is available and stable for Julia versions 1.4 and up.","category":"page"},{"location":"","page":"Home","title":"Home","text":"To install it, run","category":"page"},{"location":"","page":"Home","title":"Home","text":"using Pkg\nPkg.add(\"SparseAlgebra\")","category":"page"},{"location":"","page":"Home","title":"Home","text":"from the Julia REPL.","category":"page"},{"location":"#\"I-don't-want-to-read-your-manual,-just-show-me-some-cool-code\"","page":"Home","title":"\"I don't want to read your manual, just show me some cool code\"","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":">julia using SparseAlgebra, Nemo\n\n>julia R, (x₁, x₂, x₃, x₄) = QQ[\"x₁\", \"x₂\", \"x₃\", \"x₄\"]\n\n>julia system = [\n    x₁^2 + 2x₁*x₂,  # derivative of x1\n    x₂^2 + x₃ + x₄, # derivative of x2\n    x₂ + x₄,        # derivative of x3\n    x₁ + x₃         # derivative of x4\n];\n\n>julia matrices = construct_jacobians(system);\n\n>julia invariants = invariant_subspace(matrices);\n\n>julia polynormalize(invariants, R)\n[x₁ + x₂, x₃ + x₄]","category":"page"},{"location":"examples/example_subspaces/#Algebra-Subspaces","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"","category":"section"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"CurrentModule = SparseAlgebra","category":"page"},{"location":"examples/example_subspaces/#One-subspace","page":"Algebra Subspaces","title":"One subspace","text":"","category":"section"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"import the quotient field from Nemo","category":"page"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"import Nemo: QQ","category":"page"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"Introduce the variables x₁, x₂, x₃ by defining the ring of polynomials in these variables (QQ refers to the fact that the coefficients are rational numbers)","category":"page"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"R, (x₁, x₂, x₃) = QQ[\"x₁\", \"x₂\", \"x₃\"]","category":"page"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"Construct a list of right-hand sides of the ODE. The right-hand sides must be in the same order as the variables on the definition of the ring","category":"page"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"system = [\n    x₂^2 + 4x₂*x₃ + 4x₃^2,  # derivative of x1\n    4x₃ - 2x₁,              # derivative of x2\n    x₁ + x₂                 # derivative of x3\n]","category":"page"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"Call invariant_subspace providing the system","category":"page"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"subspace = invariant_subspace(system)","category":"page"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"and convert to polynomials in new variables.","category":"page"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"polynormalize(subspace, R)","category":"page"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"You will get the following result","category":"page"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"1-element Array{Any,1}:\n x₂ + 2*x₃","category":"page"},{"location":"examples/example_subspaces/#Many-subspaces","page":"Algebra Subspaces","title":"Many subspaces","text":"","category":"section"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"import the quotient field from Nemo","category":"page"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"import Nemo: QQ","category":"page"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"Introduce the variables x₁, x₂, x₃ by defining the ring of polynomials in these variables (QQ refers to the fact that the coefficients are rational numbers)","category":"page"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"R, (x₁, x₂, x₃) = QQ[\"x₁\", \"x₂\", \"x₃\"]","category":"page"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"Construct a list of right-hand sides of the ODE. The right-hand sides must be in the same order as the variables on the definition of the ring","category":"page"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"system = [\n    x₂^2 + 4x₂*x₃ + 4x₃^2,  # derivative of x1\n    4x₃ - 2x₁,              # derivative of x2\n    x₁ + x₂                 # derivative of x3\n]","category":"page"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"Call many_invariant_subspaces providing the system","category":"page"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"subspaces = many_invariant_subspaces(system)","category":"page"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"and convert each element in subspaces to polynomials in new variables.","category":"page"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"for subspace in subspaces\n    polynormalize(subspace, R)","category":"page"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"You will get the following result","category":"page"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"1-element Array{Any,1}:\n x₂ + 2*x₃","category":"page"},{"location":"examples/example_subspaces/","page":"Algebra Subspaces","title":"Algebra Subspaces","text":"2-element Array{Any,1}:\n -x₁ + 2*x₃\n x₂ + 2*x₃","category":"page"}]
}
