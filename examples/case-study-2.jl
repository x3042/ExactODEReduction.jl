#=
    Examples file:
    Case study 2 from the paper.
    Model of cell death.

    The model is described in the file
    BIOMD0000000407.ode in this directory.
=#

using ExactODEReduction

fname = abspath("BIOMD0000000407.ode")

# Load the ODE system from the file
ode = load_ODE(fname)

@info "Loaded system" ode

# Call find_reductions providing the loaded system
# (might take some time)
reductions = find_reductions(ode)

@info "Found reductions" reductions

# Reduction referred to in the paper
reduction = reductions[8]

@info "New system" reduction[:new_system]
@info "New variables" reduction[:new_vars]
