# Guide

The algorithms in this package take as **input** a system of ODEs with polynomial right-hand side and **return** the new variable expressions and the corresponding system(s).

### Creating an ODE and finding reductions

As an example, consider the folliwing system of differential equations

$$\begin{cases} 
\dot{x}_1 = x_1^2 + 2x_1x_2,\\ 
\dot{x}_2 =  x_2^2 + x_3 + x_4,\\ 
\dot{x}_3 = x_2 + x_4, \\
\dot{x}_4 = x_1 + x_3 
\end{cases}$$

To create a system as above in `ExactODEReduction.jl`, use the `ODEsystem` macro. This is the easiest way to do so.

```@example a
using ExactODEReduction

odes = @ODEsystem(   
    x1'(t) = x1^2 + 2x1*x2,     
    x2'(t) = x2^2 + x3 + x4,    
    x3'(t) = x2 + x4,
    x4'(t) = x1 + x3
)
```

After using the macro, we can call `find_reductions` function. This function accepts the ODE model and outputs possible linear reductions.

```@example a
reductions = find_reductions(odes)
```

Note that because of the randomization the result may be different between several runs. If you need to fix the result, use the `seed` keyword argument (see [Finding reductions](@ref)).

The `reductions` object can be treated as an array of reductions. For example, to access the second reduction from the list, type

```@example a
reduction2 = reductions[2]
```

Further, we can use `new_system` and `new_vars` functions to explore this reduction.

```@example a
new_ode = new_system(reduction2)
```

Note that `new_ode` from above is again an `ODE` object. In particular, this means that all functions from (Section [Functions for manipulating ODEs](@ref)) will also work for it.

```@example a
new_var = new_vars(reduction2)
```

The function `find_reductions` additionaly provides several useful keyword arguments, which are described in [Finding reductions](@ref).
