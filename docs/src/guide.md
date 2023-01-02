# Guide

The algorithms in this package take as **input** a system of ODEs with polynomial right-hand side and **return** the new variable expressions and the corresponding system(s).

Consider the folliwing system of differential equations

$$\begin{cases} 
\dot{x}_1 = x_1^2 + 2x_1x_2,\\ 
\dot{x}_2 =  x_2^2 + x_3 + x_4,\\ 
\dot{x}_3 = x_2 + x_4, \\
\dot{x}_4 = x_1 + x_3 
\end{cases}$$

To create a system as above in `ExactODEReduction`, one can use the `ODEsystem` macro. This is the easiest way to do so.

```@example a
using ExactODEReduction

odes = @ODEsystem(
    x1'(t) = x_1^2 + 2x_1x_2,
    x2'(t) = x_2^2 + x_3 + x_4,
    x3'(t) = x_2 + x_4,
    x4'(t) = x_1 + x_3
)
```

After using the macro, we can use `find_reductions` function. This function accepts the ODE model and outputs possible linear reductions.

```@example a
reds = find_reductions(odes)
```

The `reds` object can be treated as an array. For example, to access the second reduction from the list, type

```@example a
red = reds[2]
```

Further, we can use `new_system` and `new_vars` functions to explore this reduction.

```@example a
new_ode = new_system(red)
```

```@example a
new_vars = new_vars(red)
```

Note that `new_ode` from above is again an `ODE` object. In particular, this means that all functions from Section [Functions for manipulating ODEs](@ref) will also work for it.
