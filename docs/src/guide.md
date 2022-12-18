# Guide

The algorithms in this package take as **input** a system of ODEs with polynomial right-hand side and **return** the new variable substitution(s) and the corresponding system(s).

Consider the folliwing system of differential equations

$$\begin{cases} 
\dot{x}_1 = x_1^2 + 2x_1x_2,\\ 
\dot{x}_2 =  x_2^2 + x_3 + x_4,\\ 
\dot{x}_3 = x_2 + x_4, \\
\dot{x}_4 = x_1 + x_3 
\end{cases}$$

To create a system as above, one can use the `ODEsystem` macro. This is the easiest way to do so.

```@example a
using ExactODEReduction

odes = @ODEsystem(
    x1'(t) = x1^2 + a*x1*x2,
    x2'(t) = x2^2 + x3,
    x3'(t) = x2 - x3
)
```

After using the macro, we use `find_reductions` function. This function accepts the ODE model and outputs a list of possible linear reductions.

```@example a
find_reductions(odes)
```
