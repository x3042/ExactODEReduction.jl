Original system:

[
species_21 => 1//50*species_20*species_22,
species_18 => 1//100*species_10*species_13,
species_13 => 273//250*species_12 + species_18 + 43//500*species_19,
species_14 => 9//200*species_15*species_6,
species_20 => species_21 + 43//500*species_25,
species_22 => 2*species_21,
species_25 => 1//200*species_20*species_24 + 1//2*species_23,
species_5 => 4//125*species_2*species_4,
species_11 => 4//125*species_10*species_8,
species_16 => 1//100*species_15*species_4,
species_12 => 9//200*species_13*species_2,
species_1 => 43//500*species_17 + species_3,
species_2 => 15*species_11 + species_12 + 101//100*species_3 + 16*species_5,
species_23 => 1//50*species_24*species_8,
species_8 => 16*species_11 + species_21 + species_23 + 101//100*species_9,
species_19 => 1//200*species_13*species_7 + 1//2*species_18,
species_6 => species_14 + 15*species_5,
species_3 => 1//50*species_1*species_2,
species_9 => 1//50*species_7*species_8,
species_15 => 273//250*species_14 + species_16 + 43//500*species_17,
species_24 => species_23 + 43//500*species_25,
species_10 => species_11 + 23//250*species_12 + species_18 + 1//100*species_9,
species_4 => 23//250*species_14 + species_16 + 1//100*species_3 + species_5,
species_7 => 43//500*species_19 + species_9,
species_17 => 1//200*species_1*species_15 + 1//2*species_16
]

Reductions:

Interesting
new_vars = fmpq_mpoly[species_1 - species_10 + species_13 - species_15 - species_2 + species_20 - species_22 - species_24 + species_4 + species_6 - species_7 + species_8]
new_system = 
[
0
]


