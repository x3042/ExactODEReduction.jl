# [TBD*] Exact-reduction-of-ODE-systems

[![Build](https://github.com/x3042/Exact-reduction-of-ODE-systems/actions/workflows/Build.yml/badge.svg)](https://github.com/x3042/Exact-reduction-of-ODE-systems/actions/workflows/Build.yml) [![Runtests](https://github.com/x3042/Exact-reduction-of-ODE-systems/actions/workflows/Runtests.yml/badge.svg)](https://github.com/x3042/Exact-reduction-of-ODE-systems/actions/workflows/Runtests.yml)

**any thoughts on a possible acronym?..*

This repository contains a Julia implementation of the algorithms for researching the structure of ODEs of system biology models. The core interface allows to compute invariant subspaces for an exact reduction to be performed.

Online documentation could be found at https://x3042.github.io/Exact-reduction-of-ODE-systems/dev/

## What is exact reduction?

Exact reduction of the system of differential equations is an exact variable substitution which preserves the invariants of the system. In this project we mainly consider reductions obtained with **linear transformations**. We will explain it using a toy example. Consider the system

<img src="https://render.githubusercontent.com/render/math?math=\begin{cases} \dot{x}_1 = x_1^2 %2b 2x_1x_2,\\ \dot{x}_2  =  x_2^2 %2b x_3 %2b x_4,\\ \dot{x}_3  = x_2 %2b x_4, \\\dot{x}_4 = x_1 %2b x_3 \end{cases}\\">

An example of an exact reduction in this case would be the following set of new variables

<img src="https://render.githubusercontent.com/render/math?math=y_1 = x_1 %2b x_2 \quad \text{ and } \quad y_2 = x_3 %2b x_4\\">

The crucial feature of these variables is their derivatives can be written in terms of ![$y_1$](https://render.githubusercontent.com/render/math?math=%24y_1%24) and ![$y_2$](https://render.githubusercontent.com/render/math?math=%24y_2%24) only:

<img src="https://render.githubusercontent.com/render/math?math=\dot{y_1} = \dot{x_1} %2b \dot{x_2} = x_1^2 %2b 2x_1x_2 %2b x_2^2 %2b x_3 %2b x_4 = y_1^2 %2b y_2\\">

and

<img src="https://render.githubusercontent.com/render/math?math=\dot{y_2} = \dot{x_3} %2b \dot{x_4} = x_1 %2b x_2 %2b x_3 %2b x_4 = y_1 %2b y_2">

Therefore, the original system can be **reduced exactly** to the following system while keeping the variable of interest:

<img src="https://render.githubusercontent.com/render/math?math=\begin{cases} \dot{y}_1 = y_1^2 %2b y_2,\\ \dot{y}_2  =   y_1 %2b y_2\end{cases}\\">

## What does [TBD] do and how to use it?

We implement an algorithm that takes as **input** a system of ODEs with polynomial right-hand side and **returns** the set of possible linear transformations.

We will demonstrate the usage on the example above. For more details on usage including reading models from \*.ode files, see the documentation.

1. import the quotient field from *Nemo*

```julia
import Nemo: QQ
```

2. Introduce the variables <img src="https://render.githubusercontent.com/render/math?math=x_1, x_2, x_3, x_4"> by defining the ring of polynomials in these variables (QQ refers to the fact that the coefficients are rational numbers)

```julia
R, (x₁, x₂, x₃, x₄) = QQ["x₁", "x₂", "x₃", "x₄"]
```

3. Construct a list of right-hand sides of the ODE. The right-hand sides must be in the same order as the variables on the definition of the ring

```julia
system = [
    x₁^2 + 2x₁*x₂,  # derivative of x1
    x₂^2 + x₃ + x₄, # derivative of x2
    x₂ + x₄,        # derivative of x3
    x₁ + x₃         # derivative of x4
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
2-element Array{Any,1}:
 x₁ + x₂
 x₃ + x₄
```

which is the same as we have seen earlier. For more examples we address the `examples` folder.
