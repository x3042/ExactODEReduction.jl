using ExactODEReduction
using Catalyst, ModelingToolkit

# Define a chemical reaction network with the help of Catalyst.
#
# This reaction network is described in Eq. (19.20) in
#   M. Feinberg, Foundations of Chemical Reaction Network Theory,
#   https://doi.org/10.1007/978-3-030-03858-8
rs = @reaction_network begin
    (1, 1), E + S <--> ES
    (1, 1), ES <--> E + P
    (1), ES --> E⁺ + S
    (1, 1), E <--> E⁺
  end

# Convert the reaction network to a ModelingToolkit.ODEsystem object
mtkode = convert(ODESystem, rs)
# Convert the ModelingToolkit.ODEsystem to our ODE system format
ode = MTKtoODE(mtkode)

# Call find_reductions providing the system
reductions = find_reductions(ode, seed=42)
