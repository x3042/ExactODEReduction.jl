import Catalyst: @reaction_network
import Polymake
using MomentClosure: generate_central_moment_eqs, moment_closure
using ExactODEReduction

# Reaction network (2.2) from the paper https://arxiv.org/pdf/2301.11653.pdf
rs = @reaction_network begin
  (1, 1), AUU + X <--> AXU
  (1, 1), AUU + X <--> AUX
  (1, 1), AUX + X <--> AXX
  (1, 1), AXU + X <--> AXX
end

# Use MomentClosure.jl to get the ODE system governing second moments (under normal closure)
central_eqs = generate_central_moment_eqs(rs, 2, combinatoric_ratelaws=false)
closure = moment_closure(central_eqs, "normal")
ode = MTKtoODE(closure.odes)

# Find reductions! One can see that the reductions from the usual mass action kinetic 
# system lift nicely but there are many more reductions
reds = find_reductions(ode; makepositive=true)
