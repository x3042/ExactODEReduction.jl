#=
    Examples file:
    loading a system from a file in ERODE format.
    
    example1.ode file from this directory (examples/example1.ode) 
    will be used.
=#

# 1. Import the package
using ExactODEReduction

# 2. Specify the path to a *.ode file with the ODE system
fname = (@__DIR__) * "/example1.ode"

# 3. Load the ODE system from the file
ode = load_ODE_fromfile(fname)

@info "Loaded system" ode

# 4. Call find_reductions providing the loaded system
reductions = find_reductions(ode)

@info "Found reductions" reductions
