using ExactODEReduction
using Catalyst, ModelingToolkit
using Random

#######

rs = @reaction_network begin
    c1, S + E --> SE
    c2, SE --> S + E
    c3, SE --> P + E
  end c1 c2 c3

odesys = convert(ODESystem, rs)
sys = MTKtoODE(odesys)
reductions = find_reductions(sys)

#######

rs = @reaction_network begin
    (1, 1), L + 2R + P <--> 3R + Q
    (1, 1), R + 2L + P <--> 3L + Q
    (1, 1), P <--> 0
    (1, 1), Q <--> 0
  end

odesys = convert(ODESystem, rs)
sys = MTKtoODE(odesys)
reductions = find_reductions(sys)

#######

rs = @reaction_network begin
    (kon, koff), L + R <--> LR
    (kplus), ATP + LR --> cAMP + LR
    (kminus), cAMP --> AMP
  end

odesys = convert(ODESystem, rs)
sys = MTKtoODE(odesys)
reductions = find_reductions(sys)

#######

rs = @reaction_network begin
    (k1, k2), S1 + E <--> ES1
    (k3, k4), S2 + ES1 <--> ES1S2
    (k5, k6), ES1S2 <--> S1 + ES2
    (k7), ES1S2 --> P + E
  end

odesys = convert(ODESystem, rs)
sys = MTKtoODE(odesys)
reductions = find_reductions(sys)


#######

rs = @reaction_network begin
    (k1, k2), E + S <--> ES
    (k3), ES --> E + P
    (K4, k5), E + I <--> EI
    (k6, k7), EI + S <--> EIS
    (k8, k9), EIS <--> ES + I
  end

odesys = convert(ODESystem, rs)
sys = MTKtoODE(odesys)
reductions = find_reductions(sys)

#######

rs = @reaction_network begin
    (k1, k2), CO + S <--> COS
    (k3, k4), O2 + S <--> O2S
    (K5), 2COS + O2S --> 2CO2 + 3S
  end

odesys = convert(ODESystem, rs)
sys = MTKtoODE(odesys)
reductions = find_reductions(sys)

#######
# !!!!! (1)

rs = @reaction_network begin
    (1, 1), A + D <--> B
    (1, 1), B <--> A + E
    (1), B --> C + F
    (1, 1), C <--> A
  end

odesys = convert(ODESystem, rs)
sys = MTKtoODE(odesys)
reductions = find_reductions(sys)

####### 
# Equivalent to the one above.
# !!!!! (2)
# This is something.

#=
Equation (4.1) from 
https://etd.ohiolink.edu/apexprod/rws_etd/send_file/send?accession=osu1438274630&disposition=inline
See also related Figure 4.1.

System in 5 species: 
Enzyme(E), Substrate(S), Enzyme-Substrate(ES), Product(P), Inactivated Enzyme(E⁺)

1. We find several reductions. One of them:

    Reduction of dimension 1.
    New system:
    y1'(t) = -2*y1(t)
    New variables:
    y1 = E + ES - E⁺

The species in this reduction correspond to 
"the simple core" of network (see Figure 4.1 (d)).
Interesting, if is this is a coincidence.

2. From the third reduction

    Reduction of dimension 3.    
    New system:
    y1'(t) = -y1(t) + y3(t)
    y2'(t) = 0
    y3'(t) = y1(t) - y3(t)
    New variables:
    y1 = E + ES
    y2 = S + ES + P
    y3 = E⁺

We see that (trivial observation?).
    const == Enzyme(E) + Enzyme-Substrate(ES) + Product(P)

Moreover, we establish relation between the total concentration of enzyme 
and its inactivated form (again, trivial one?).
=#

SEED = 42

rs = @reaction_network begin
    (1, 1), E + S <--> ES
    (1, 1), ES <--> E + P
    (1), ES --> E⁺ + S
    (1, 1), E <--> E⁺
  end

# rs = @reaction_network begin
# (c1, c2), E + S <--> ES
# (c3, c4), ES <--> E + P
# (c5), ES --> E⁺ + S
# (c6, c7), E <--> E⁺
# end

odesys = convert(ODESystem, rs)
sys = MTKtoODE(odesys)
reductions = find_reductions(sys, seed=1)

#######

rs = @reaction_network begin
    (1, 1), A <--> B
    (1), B + L --> M
    (1), M --> B + D
    (1, 1), C + 4D <--> E
    (1), B + E --> F
    (1, 1), F <--> A + E
    (1), D --> K
  end

odesys = convert(ODESystem, rs)
sys = MTKtoODE(odesys)
reductions = find_reductions(sys)

#######
# Same as above but without species L and K

rs = @reaction_network begin
    (1, 1), A <--> B
    (1, 1), C + 4D <--> E
    (1), B + E --> F
    (1, 1), F <--> A + E
    (1), D --> 0
    (1), B --> D + B
  end

odesys = convert(ODESystem, rs)
sys = MTKtoODE(odesys)
reductions = find_reductions(sys)

#######

rs = @reaction_network begin
    (1, 1), A <--> B
    (1), B --> C
    (1, 1), C + D <--> E
    (1), E --> A + F
    (1, 1), B + F <--> G
    (1), G --> B + D
  end

odesys = convert(ODESystem, rs)
sys = MTKtoODE(odesys)
reductions = find_reductions(sys)

#######

rs = @reaction_network begin
    (1, 1), A + B <--> E
    (1, 1), C + D <--> F
    (1, 1), C <--> 2A
    (1, 1), 2A <--> D
    (1, 1), D <--> B
  end

odesys = convert(ODESystem, rs)
sys = MTKtoODE(odesys)
reductions = find_reductions(sys)

#######

rs = @reaction_network begin
    (1), A --> 2B
    (1,1), A + C <--> D
    (1), B + E --> A + C
    (1), D --> B + E
  end

odesys = convert(ODESystem, rs)
sys = MTKtoODE(odesys)
reductions = find_reductions(sys)

#######

rs = @reaction_network begin
    (ε), 3A --> A + 2B
    (1), A + 2B --> 3B
    (ε), 3B --> 2A + B
    (1), 2A + B --> 3A
  end

odesys = convert(ODESystem, rs)
sys = MTKtoODE(odesys)
reductions = find_reductions(sys)

#######

rs = @reaction_network begin
    (1, 1), F <--> C + D
    (1), 2A --> B
    (1, 1), B <--> C + D
    (1, 1), C + D <--> E
    (1, 1), C <--> D
    (1), D --> A
    (1), D --> B + E
    (1), B + E --> C
  end

odesys = convert(ODESystem, rs)
sys = MTKtoODE(odesys)
reductions = find_reductions(sys)

#######

# this has only one conservation law
rs = @reaction_network begin
    (α), B <-- A
    (1), A --> C
    (1), C + B --> 2A
  end

odesys = convert(ODESystem, rs)
sys = MTKtoODE(odesys)
reductions = find_reductions(sys)

#######

rs = @reaction_network begin
    (α), B --> C
    (γ), C --> A
    (ρ, τ), B <--> D
    (ε), C --> D
    (β), A + B --> 2B
  end

odesys = convert(ODESystem, rs)
sys = MTKtoODE(odesys)
reductions = find_reductions(sys)

#######

rs = @reaction_network begin
    (1,1), A + B <--> P
    (1,1), B <--> 2A
  end

odesys = convert(ODESystem, rs)
sys = MTKtoODE(odesys)
reductions = find_reductions(sys)

#######

rs = @reaction_network begin
    (1,1), A + B <--> P
    (1,1), B + C <--> Q
    (1,1), C <--> 2A
  end

odesys = convert(ODESystem, rs)
sys = MTKtoODE(odesys)
reductions = find_reductions(sys)


#######

rs = @reaction_network begin
    (1), A10 --> 0
    (1, 1), 0 <--> A11
    (1, 1), A12 <--> 0
    (1, 1), A1 <--> A2
    (1), A2 + A4 --> A16
    (1), A16 --> A2 + A6
    (1, 1), A3 <--> A4
    (1, 1), A4 <--> A6
    (1, 1), A6 <--> A7 + A12
    (1, 1), A3 + A11 <--> A8
    (1), A8 --> A9
    (1), A9 --> A3 + A10
    (1, 1), A11 + A13 <--> A14
  end

odesys = convert(ODESystem, rs)
sys = MTKtoODE(odesys)
reductions = find_reductions(sys)

#######

rs = @reaction_network begin
    (1), A --> B
    (1), B --> A + C
    (1), D --> E
    (1), E --> D + F
    (1), C + F --> 0
  end

odesys = convert(ODESystem, rs)
sys = MTKtoODE(odesys)
reductions = find_reductions(sys)

#######

# 1
rs = @reaction_network begin
    (1, 1), S1 + E <--> ES1
    (1, 1), S2 + ES1 <--> ES1S2
    (1, 1), ES1S2 <--> S1 + ES2
    (1), ES1S2 --> P + E
    (1, 1), S2 + E <--> ES2
    (1, 1), S1 <--> 0
    (1, 1), S2 <--> 0
    (1), P --> 0
  end

odesys = convert(ODESystem, rs)
sys = MTKtoODE(odesys)
reductions = find_reductions(sys)

# 2
rs = @reaction_network begin
    (1, 1), S1 + E <--> ES1
    (1, 1), S2 + ES1 <--> ES1S2
    (1, 1), ES1S2 <--> S1 + ES2
    (1), ES1S2 --> P + E
    (1, 1), S2 + E <--> ES2
  end

odesys = convert(ODESystem, rs)
sys = MTKtoODE(odesys)
reductions = find_reductions(sys)

# 3
rs = @reaction_network begin
    (1, 1), E <--> ES1
    (1, 1), E <--> ES2
    (1, 1), ES1S2 <--> ES2
    (1, 1), ES1S2 <--> ES1
    (1), ES1S2 --> E
  end

odesys = convert(ODESystem, rs)
sys = MTKtoODE(odesys)
reductions = find_reductions(sys)

