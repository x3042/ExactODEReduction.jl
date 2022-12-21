#=
    Examples file:
    Case study 1 from the paper.
    Inactivation of factor Va.

    The model is described in the file
    BIOMD0000000365.ode in this directory.
=#

using ExactODEReduction

fname = (@__DIR__) * "/BIOMD0000000365.ode"

# Load the ODE system from the file
ode = load_ODE_fromfile(fname)

@info "Loaded system" ode

# Call find_reductions providing the loaded system
# (might take some time)
reductions = find_reductions(ode)

@info "Found reductions" reductions

# Reduction of dimension 5 (3 variables + 2 params) 
# observed in the paper
reduction = reductions[5]

@info "New system" new_system(reduction)
@info "New variables" new_vars(reduction)
