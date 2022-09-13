Original system:

[
species_18 => 1//100*species_10*species_17,
species_16 => 1//50*species_17*species_8,
species_21 => 9//200*species_12*species_6,
species_5 => 4//125*species_2*species_4,
species_6 => species_21 + 15*species_5,
species_12 => 273//250*species_21 + 543//500*species_22,
species_2 => 15*species_11 + species_19 + 101//100*species_3 + 16*species_5,
species_3 => 1//50*species_1*species_2,
species_7 => 43//500*species_18 + species_9,
species_22 => 1//100*species_12*species_4,
species_1 => 43//500*species_22 + species_3,
species_11 => 4//125*species_10*species_8,
species_19 => 9//200*species_17*species_2,
species_10 => species_11 + species_18 + 23//250*species_19 + 1//100*species_9,
species_4 => 23//250*species_21 + species_22 + 1//100*species_3 + species_5,
species_13 => species_14 + 43//500*species_16,
species_15 => 2*species_14,
species_14 => 1//50*species_13*species_15,
species_17 => 543//500*species_16 + 543//500*species_18 + 273//250*species_19,
species_8 => 16*species_11 + species_14 + species_16 + 101//100*species_9,
species_9 => 1//50*species_7*species_8
]

Reductions:

Interesting
new_vars = fmpq_mpoly[species_1 - species_10 - species_12 - 1043//43*species_13 + 500//43*species_15 + species_17 - species_2 + species_4 + species_6 - species_7 + species_8]
new_system = 
[
0
]


