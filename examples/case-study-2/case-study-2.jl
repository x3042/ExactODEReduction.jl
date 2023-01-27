# Case study 2 from the paper.
# Model of cell death.

# The model is described in the file
# BIOMD0000000407.ode in this directory.

# Load the package
using ExactODEReduction

# Specify the path to a *.ode file with the ODE system
fname = (@__DIR__) * "/BIOMD0000000407.ode"

# Load the ODE system from the file
ode = load_ODE_fromfile(fname)

# Call find_reductions providing the loaded system 
# (might take some time)
reductions = ExactODEReduction.find_reductions(ode)

# Reduction referred to in the paper.
# New variables of interest are y1 and y2
reduction = reductions[8]
@info "New system" new_system(reduction)
@info "New variables" new_vars(reduction)
