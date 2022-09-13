Original system:

[
species_19 => 1//50*species_20*species_8,
species_17 => 1//50*species_16*species_18,
species_21 => 9//200*species_13*species_6,
species_5 => 4//125*species_2*species_4,
species_6 => species_21 + 15*species_5,
species_12 => 9//200*species_13*species_2,
species_20 => 543//500*species_19,
species_3 => 1//50*species_1*species_2,
species_7 => 43//500*species_14 + species_9,
species_22 => 1//100*species_13*species_4,
species_1 => 43//500*species_22 + species_3,
species_11 => 4//125*species_10*species_8,
species_2 => 15*species_11 + species_12 + 101//100*species_3 + 16*species_5,
species_10 => species_11 + 23//250*species_12 + species_14 + 1//100*species_9,
species_4 => 23//250*species_21 + species_22 + 1//100*species_3 + species_5,
species_13 => 273//250*species_12 + 543//500*species_14 + 273//250*species_21 + 543//500*species_22,
species_16 => species_17 + 43//500*species_19,
species_14 => 1//100*species_10*species_13,
species_18 => 2*species_17,
species_8 => 16*species_11 + species_17 + species_19 + 101//100*species_9,
species_9 => 1//50*species_7*species_8
]

Reductions:

Interesting
new_vars = fmpq_mpoly[species_16 - 1//2*species_18 - 43//543*species_20]
new_system = 
[
0
]


