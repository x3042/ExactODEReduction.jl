# Algebra Subspaces

```@meta
CurrentModule = SparseAlgebra
```

## One subspace

1. import the quotient field from *Nemo*

```julia
import Nemo: QQ
```

2. Introduce the variables x₁, x₂, x₃ by defining the ring of polynomials in these variables (QQ refers to the fact that the coefficients are rational numbers)

```julia
R, (x₁, x₂, x₃) = QQ["x₁", "x₂", "x₃"]
```

3. Construct a list of right-hand sides of the ODE. The right-hand sides must be in the same order as the variables on the definition of the ring

```julia
system = [
    x₂^2 + 4x₂*x₃ + 4x₃^2,  # derivative of x1
    4x₃ - 2x₁,              # derivative of x2
    x₁ + x₂                 # derivative of x3
]
```

4. Call `invariant_subspace` providing the system

```julia
subspace = invariant_subspace(system)
```

and convert to polynomials in new variables.

```julia
polynormalize(subspace, R)
```

You will get the following result

```julia
1-element Array{Any,1}:
 x₂ + 2*x₃
```
## Many subspaces

1. import the quotient field from *Nemo*

```julia
import Nemo: QQ
```

2. Introduce the variables x₁, x₂, x₃ by defining the ring of polynomials in these variables (QQ refers to the fact that the coefficients are rational numbers)

```julia
R, (x₁, x₂, x₃) = QQ["x₁", "x₂", "x₃"]
```

3. Construct a list of right-hand sides of the ODE. The right-hand sides must be in the same order as the variables on the definition of the ring

```julia
system = [
    x₂^2 + 4x₂*x₃ + 4x₃^2,  # derivative of x1
    4x₃ - 2x₁,              # derivative of x2
    x₁ + x₂                 # derivative of x3
]
```

4. Call `many_invariant_subspaces` providing the system

```julia
subspaces = many_invariant_subspaces(system)
```

and convert each element in subspaces to polynomials in new variables.

```julia
for subspace in subspaces
    polynormalize(subspace, R)
```

You will get the following result

```julia
1-element Array{Any,1}:
 x₂ + 2*x₃
```

```julia
2-element Array{Any,1}:
 -x₁ + 2*x₃
 x₂ + 2*x₃
```
