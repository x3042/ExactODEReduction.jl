# Home

```@meta
CurrentModule = SparseAlgebra
```

SparseAlgebra is a Julia package for researching the field of Exact Reductions of Ordinary Differential Equations.

## Installation

The package is available and stable for Julia versions 1.4 and up.

To install it, run

```
using Pkg
Pkg.add("Symbolics")
```

from the Julia REPL.

## "I don't want to read your manual, just show me some cool code"

```julia
>julia using SparseAlgebra, Nemo

>julia R, (x₁, x₂, x₃, x₄) = QQ["x₁", "x₂", "x₃", "x₄"]

>julia system = [
    x₁^2 + 2x₁*x₂,  # derivative of x1
    x₂^2 + x₃ + x₄, # derivative of x2
    x₂ + x₄,        # derivative of x3
    x₁ + x₃         # derivative of x4
];

>julia matrices = construct_jacobians(system);

>julia invariants = invariant_subspace(matrices);

>julia polynormalize(invariants, R)
[x₁ + x₂, x₃ + x₄]
```
