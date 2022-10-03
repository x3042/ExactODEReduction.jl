# Exact reduction of ODE systems*

[![Build](https://github.com/x3042/Exact-reduction-of-ODE-systems/actions/workflows/Build.yml/badge.svg)](https://github.com/x3042/Exact-reduction-of-ODE-systems/actions/workflows/Build.yml) [![Runtests](https://github.com/x3042/Exact-reduction-of-ODE-systems/actions/workflows/Runtests.yml/badge.svg)](https://github.com/x3042/Exact-reduction-of-ODE-systems/actions/workflows/Runtests.yml)

**any thoughts on a possible acronym?..*

This repository contains a Julia implementation of algorithms for finding exact reductions of ODE systems via a linear change of variables.

<!--- 
researching the structure of ODEs of system biology models. The core interface allows to compute invariant subspaces for an exact reduction to be performed. 
--->

Online documentation could be found at https://x3042.github.io/Exact-reduction-of-ODE-systems/dev/

## What is exact reduction?

Exact reduction of the system of differential equations is an exact variable substitution which preserves the invariants of the system. In this project we mainly consider reductions obtained with **linear transformations**. We will explain it using a toy example. Consider the system

<img src="https://render.githubusercontent.com/render/math?math=\begin{cases} \dot{x}_1 = x_1^2 %2b 2x_1x_2,\\ \dot{x}_2  =  x_2^2 %2b x_3 %2b x_4,\\ \dot{x}_3  = x_2 %2b x_4, \\\dot{x}_4 = x_1 %2b x_3 \end{cases}\\">

An example of an exact reduction in this case would be the following set of new variables

<img src="https://render.githubusercontent.com/render/math?math=y_1 = x_1 %2b x_2 \quad \text{ and } \quad y_2 = x_3 %2b x_4\\">

The important feature of these variables is that their derivatives can be written in terms of ![$y_1$](https://render.githubusercontent.com/render/math?math=%24y_1%24) and ![$y_2$](https://render.githubusercontent.com/render/math?math=%24y_2%24) only:

<img src="https://render.githubusercontent.com/render/math?math=\dot{y_1} = \dot{x_1} %2b \dot{x_2} = x_1^2 %2b 2x_1x_2 %2b x_2^2 %2b x_3 %2b x_4 = y_1^2 %2b y_2\\">

and

<img src="https://render.githubusercontent.com/render/math?math=\dot{y_2} = \dot{x_3} %2b \dot{x_4} = x_1 %2b x_2 %2b x_3 %2b x_4 = y_1 %2b y_2">

Therefore, the original system can be **reduced exactly** to the following system:

<img src="https://render.githubusercontent.com/render/math?math=\begin{cases} \dot{y}_1 = y_1^2 %2b y_2,\\ \dot{y}_2  =   y_1 %2b y_2\end{cases}\\">

## What does this package do and how to use it?

We implement an algorithm that takes as **input** a system of ODEs with polynomial right-hand side and **returns** the list of possible linear transformations.

We will demonstrate the usage on the example above. For more details on package usage, including reading dynamical systems from \*.ode files, please see the documentation.

1. Import the package

```julia
using ExactODEReduction
```

2. Construct a system

```julia
odes = @ODEsystem(
  x1'(t) = x1^2 + 2x1*x2,
  x2'(t) = x2^2 + x3 + x4,
  x3'(t) = x2 + x4,
  x4'(t) = x1 + x3
)
```

4. Call `find_reductions` providing the system

```julia
reductions = find_reduction(odes)
```

which returns the list of possible reductions. You will get the following result

```julia
2-element Vector{Dict{Symbol, Vector{Any}}}:
 Dict(:new_system => [y1^2 + y2, y1 + y2], :new_vars => [x2 + x1, x3 + x4])
 Dict(:new_system => [y1^2 + y2, y1 + y2 + y3, 2*y1*y3 + y3^2], :new_vars => [x2, x3 + x4, x1])
```

Notice that the first reduction is the same as we have seen earlier.

We may also want to preserve some variables or their linear combinations in the reduced system.
It is possible to pass such linear forms in the `observables` array as a parameter using `find_smallest_constrained_reduction`

```julia
find_smallest_constrained_reduction(odes, observables=[x1])
```

For example, the above code will search for a reduction where `x₁` is present amongst new variables, resulting into

 ```julia
Dict{Symbol, Vector{Nemo.fmpq_mpoly}} with 2 entries:
  :new_system => [y1^2 + y2, y1 + y2 + y3, 2*y1*y3 + y3^2]
  :new_vars   => [x2, x3 + x4, x1]
 ```




For more examples we refer to the `examples` folder.
