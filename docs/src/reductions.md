# Functions for finding reductions

### Finding reductions

```@docs
find_reductions
```

```@docs
find_smallest_constrained_reduction
```

```@docs
find_some_reduction
```

### Exploring found reductions

The functions `find_some_reduction` and `find_smallest_constrained_reduction` return a `Reduction` object.

```@docs
Reduction
```

```@docs
new_system
```

```@docs
new_vars
```

```@docs
old_system
```

```@docs
new_initialconds
```

```@docs
reduce_data
```

The function `find_reduction` returns a `ChainOfReductions` object,
which, in practice, can be treated as `Vector{Reduction}`.

```@docs
ChainOfReductions
```

```@docs
length(::ChainOfReductions)
```

```@docs
getindex(::ChainOfReductions, ::Integer)
```
