# ExactODEReduction.jl

The package provides an algorithm for computing exact linear reductions of ODE systems. It allows computing a longest possible chain of reductions corresponding to a Jordan-Hoelder filtration over rational numbers or its extension.

See the [Guide](@ref) section for a quick introduction and an example.

## Installation

The package works with Julia version 1.6+. To install `Exact-reduction-of-ODE-systems`, run the following command in Julia:

```
import Pkg
Pkg.add(url="https://github.com/x3042/Exact-reduction-of-ODE-systems")
```

The dependency on `polymake` is optional; it is loaded lazily if necessary, and most of the package functionality works without it.
