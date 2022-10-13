# XXX (name removed)

This repository contains a Julia implementation of algorithms for finding exact reductions of ODE systems via a linear change of variables.

Online documentation could be found at XXX (link removed).

## Installation guide

0. For installation, Julia language of version 1.6+ is required. We refer to an official step-by-step Julia installaton guide:

https://julialang.org/downloads/platform/

1. Download the `archive.tar` file from this directory and unpack it. You can either select the file in the file-tree and press `Download file` in the top-right corner, or get it directly from `https://anonymous.4open.science/r/056E/archive.tar`. For example,

```

```

2. In your favorite terminal, run julia and install the package:

```
home$ julia
julia> import Pkg
julia> Pkg.add("")
```

If the package is installed correctly, you should be able to execute

```
julia> using ExactODEReduction
```

without errors.

3. We can try to reduce a simple model:

```
julia> using 
```

*Note: the package cannot be installed on Windows OS.* 

## What is exact reduction?

Exact reduction of the system of differential equations is an exact variable substitution which preserves the invariants of the system. In this project we mainly consider reductions obtained with **linear transformations**. We will explain it using a toy example. Consider the system

$$\begin{cases} 
\dot{x}_1 = x_1^2 + 2x_1x_2,\\ 
\dot{x}_2 =  x_2^2 + x_3 + x_4,\\ 
\dot{x}_3 = x_2 + x_4, \\
\dot{x}_4 = x_1 + x_3 
\end{cases}$$

An example of an exact reduction in this case would be the following set of new variables

$$y_1 = x_1 + x_2 \quad \text{  and  } \quad y_2 = x_3 + x_4$$

The important feature of these variables is that their derivatives can be written in terms of $y_1$ and $y_2$ only:

$$\dot{y_1} = \dot{x_1} + \dot{x_2} = y_1^2 + y_2$$

and

$$\dot{y_2} = \dot{x_3} + \dot{x_4} = y_1 + y_2$$

Therefore, the original system can be **reduced exactly** to the following system:

$$\begin{cases} 
\dot{y}_1 = y_1^2 + y_2,\\ 
\dot{y}_2  = y_1 + y_2
\end{cases}$$

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

3. Call `find_reductions` providing the system

```julia
reductions = find_reductions(odes)
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

For example, the above code will search for a reduction where $x_1$ is present amongst new variables, resulting into

 ```julia
Dict{Symbol, Vector{Nemo.fmpq_mpoly}} with 2 entries:
  :new_system => [y1^2 + y2, y1 + y2 + y3, 2*y1*y3 + y3^2]
  :new_vars   => [x2, x3 + x4, x1]
 ```


For more examples we refer to the `examples` folder.
