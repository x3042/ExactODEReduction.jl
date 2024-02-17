# ExactODEReduction

<!--- [![Build](https://github.com/x3042/ExactODEReduction.jl/actions/workflows/Build.yml/badge.svg)](https://github.com/x3042/ExactODEReduction.jl/actions/workflows/Build.yml) --->
[![Runtests](https://github.com/x3042/ExactODEReduction.jl/actions/workflows/Runtests.yml/badge.svg)](https://github.com/x3042/ExactODEReduction.jl/actions/workflows/Runtests.yml) [![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://x3042.github.io/ExactODEReduction.jl/dev)


This repository contains a Julia implementation of algorithms for finding exact reductions of ODE systems via a linear change of variables.

Online documentation could be found at [https://x3042.github.io/ExactODEReduction.jl](https://x3042.github.io/ExactODEReduction.jl).

## Installation

To install `ExactODEReduction.jl`, run the following in Julia:

```julia
import Pkg
Pkg.add(url="https://github.com/x3042/ExactODEReduction.jl")
```

For the usage examples, please see examples below in this file, or in the `examples` directory.

## What is exact reduction?

Exact reduction of the system of differential equations is an exact variable substitution which preserves the invariants of the system. In this project we consider reductions obtained with **linear transformations**. We will explain it using a toy example. Consider the system

$$\begin{cases} 
\dot{x}_1 = x_1^2 + 2x_1x_2,\\ 
\dot{x}_2 =  x_2^2 + x_3 + x_4,\\ 
\dot{x}_3 = x_2 + x_4, \\
\dot{x}_4 = x_1 + x_3 
\end{cases}$$

An example of an exact reduction in this case would be the following set of new variables

$$y_1 = x_1 + x_2 \quad \text{  and  } \quad y_2 = x_3 + x_4$$

The important feature of variables $y_1, y_2$ is that their derivatives can be written in terms of $y_1$ and $y_2$ only:

$$\dot{y}_1 = \dot{x}_1 + \dot{x}_2 = y_1^2 + y_2$$

and

$$\dot{y}_2 = \dot{x}_3 + \dot{x}_4 = y_1 + y_2$$

Therefore, the original system can be **reduced exactly** to the following system:

$$\begin{cases} 
\dot{y}_1 = y_1^2 + y_2,\\ 
\dot{y}_2  = y_1 + y_2
\end{cases}$$

## What does this package do and how to use it?

We implement an algorithm that takes as **input** a system of ODEs with polynomial right-hand side and **returns** a list of possible linear transformations and corresponding systems.

We will demonstrate the usage on the example above. For more details on the package usage, including reading dynamical systems from `*.ode` files, please see the documentation.

1. Import the package

```julia
using ExactODEReduction
```

2. Construct the system (as in the example above)

```julia
odes = @ODEsystem(
  x1'(t) = x1^2 + 2x1*x2,
  x2'(t) = x2^2 + x3 + x4,
  x3'(t) = x2 + x4,
  x4'(t) = x1 + x3
)
```

3. Call `find_reductions` providing the system

```julia
reductions = find_reductions(odes)
```

which returns the list of possible reductions. You will get the following result printed

```julia
A chain of 2 reductions of dimensions 2, 3
==================================
1. Reduction of dimension 2.
New system:
y1'(t) = y1(t)^2 + y2(t)
y2'(t) = y1(t) + y2(t)
New variables:
y1 = x1 + x2
y2 = x3 + x4
==================================
2. Reduction of dimension 3.
New system:
y1'(t) = y1(t)^2 + 2*y1(t)*y2(t)
y2'(t) = y2(t)^2 + y3(t)
y3'(t) = y1(t) + y2(t) + y3(t)
New variables:
y1 = x1
y2 = x2
y3 = x3 + x4
```

Notice that the first reduction is the same as we have seen earlier. We can access it through the `reductions` object

```julia
red1 = reductions[1]
```
```julia
new_system(red1)
## Prints:
y1'(t) = y1(t)^2 + y2(t)
y2'(t) = y1(t) + y2(t)
```

```julia
new_vars(system)
## Prints:
Dict{Nemo.fmpq_mpoly, Nemo.fmpq_mpoly} with 2 entries:
  y2 => x3 + x4
  y1 => x1 + x2
```

<!---
We may also want to preserve some variables or their linear combinations in the reduced system.
It is possible to pass such linear forms in the `observables` array as a parameter using `find_smallest_constrained_reduction`

```julia
find_smallest_constrained_reduction(odes, observables=[x1])
```

For example, the above code will search for a reduction where $x_1$ is present amongst new variables, resulting into

 ```julia
Dict{Symbol, Vector{Nemo.fmpq_mpoly}} with 2 entries:
  :new_system => [y1^2 + y2, y1 + y2 + y3, 2*y1*y3 + y3^2]
  :new_vars   => [x2, x3 + x4, x1]
 ```

--->

For more examples we refer to the documentation and the `examples` directory.

## Citation

If you use this package, the right way to cite is currently:

```
@article{DDP24,
title = {Exact hierarchical reductions of dynamical models via linear transformations},
journal = {Communications in Nonlinear Science and Numerical Simulation},
volume = {131},
pages = {107816},
year = {2024},
issn = {1007-5704},
doi = {https://doi.org/10.1016/j.cnsns.2024.107816},
url = {https://www.sciencedirect.com/science/article/pii/S1007570424000029},
author = {Alexander Demin and Elizaveta Demitraki and Gleb Pogudin},
keywords = {Ordinary differential equations, Exact reduction, Lumping, Dimensionality reduction, Matrix algebras},
abstract = {Dynamical models described by ordinary differential equations (ODEs) are a fundamental tool in the sciences and engineering. Exact reduction aims at producing a lower-dimensional model in which each macro-variable can be directly related to the original variables, and it is thus a natural step towards the model’s formal analysis and mechanistic understanding. We present an algorithm which, given a polynomial ODE model, computes a longest possible chain of exact linear reductions of the model such that each reduction refines the previous one, thus giving a user control of the level of detail preserved by the reduction. This significantly generalizes over the existing approaches which compute only the reduction of the lowest dimension subject to an approach-specific constraint. The algorithm reduces finding exact linear reductions to a question about representations of finite-dimensional algebras. We provide an implementation of the algorithm, demonstrate its performance on a set of benchmarks, and illustrate the applicability via case studies. Our implementation is freely available at https://github.com/x3042/ExactODEReduction.jl.}
}
```

