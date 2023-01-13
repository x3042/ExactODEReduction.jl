# ExactODEReduction.jl documentation

`ExactODEReduction.jl` is a Julia package that provides an algorithm for computing exact reductions of ODE systems. It finds a longest possible chain of linear reductions corresponding to Jordan-Hoelder filtration.

This documentation contains information about the functionality of the package as well as examples of use cases. See the [Guide](@ref) section for a quick introduction.

## Installation

To install `ExactODEReduction.jl`, run the following command in Julia:

```julia
import Pkg
Pkg.add(url="https://github.com/x3042/ExactODEReduction.jl")
```

The package dependency on `polymake` is optional; it is loaded lazily only if necessary, and most of the package functionality works without it.

## Features

Given an ODE system with polynomial right-hand side, `ExactODEReduction.jl` computes a smaller, *reduced* system, with macro-parameters expressed as *linear combinations* of the original ones. 

**The main feature** of the package is the algorithm for computing a *longest chain* of such reductions.

### Feature list

 - Computed reductions are always *exact transformations*,
 - Allows coefficients from rational numbers, as well as *its extension*,
 - Expresses new macro-variables as *conic combinations* of the original ones.

## Citation

/\
