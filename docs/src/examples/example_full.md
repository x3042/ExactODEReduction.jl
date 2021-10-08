# ODEs Reduction

```@meta
CurrentModule = ExactODEReduction
```

Here is an example of the full pipeline for one ODE system.

## One transformation for ODE system


1. Load & parse the system

```julia
model = load_ODEs("src/data/ODEs/simple/example1.ode")
```

2. Call `construct_jacobians` to obtain several matrices

```julia
Js = construct_jacobians(model)
```

3.  ..Find an invariant subspace..

```julia
subspace = invariant_subspace(Js)
```

4. And return back to variable form
```julia
polynormalize(subspace, parent(first(keys(model))))
```

You will get the following result

```julia
6-element Array{Any,1}:
 Ap
 ApB
 -Au + AuB + B
 r2
 r3
 Au + r1 + r4
```
