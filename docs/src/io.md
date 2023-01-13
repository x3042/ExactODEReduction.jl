# Functions for manipulating ODEs

### Creating ODE systems

```@docs
@ODEsystem
```

```@docs
ODE{P}
```

### Accessing ODE data

```@docs
equations(ode::ODE)
```

```@docs
states(ode::ODE)
```

```@docs
parameters(ode::ODE)
```

```@docs
initial_conditions(ode::ODE)
```

```@docs
parameter_values(ode::ODE)
```

```@docs
vars(ode::ODE)
```

```@docs
to_state
```

```@docs
to_parameter
```

### Converting ODE to `MTK.jl` and back

```@docs
ODEtoMTK
```

```@docs
MTKtoODE
```
