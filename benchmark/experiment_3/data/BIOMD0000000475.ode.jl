Original system:

[
species_11 => 1//100*species_10,
species_18 => 1//20*species_16 + 1//200*species_20,
species_12 => species_11 + 1//200*species_14,
species_2 => 0,
species_15 => 1//10000000000*species_16 + 100000*species_18*species_8 + 1//10000000000*species_20,
species_1 => 0,
species_8 => 3//100000000*species_12 + 1//625*species_19 + 3//200*species_22,
species_4 => species_11 + 1//50*species_5 + 1000*species_9,
species_19 => 3//400000*species_17,
species_16 => 39//500*species_14*species_15,
species_23 => 3//100000000*species_12 + 1//1250*species_19 + 1//200*species_22,
species_14 => 1//200000*species_12*species_13 + 1//10000000000*species_16,
species_13 => 1//200*species_14 + 3//400000*species_17 + 1//200*species_21,
species_7 => 1//100*species_10 + 1//4000000*species_6*species_8,
species_21 => 1//200*species_20,
species_9 => 1//100*species_10 + 100000*species_3*species_4,
species_17 => 1//200000*species_13*species_19 + 1//20*species_16 + 1//10000000000*species_20,
species_5 => 2000*species_4,
species_20 => 39//500*species_15*species_17,
species_22 => 1//200*species_21,
species_6 => 1//100*species_10,
species_3 => 3//200000000*species_1*species_2 + 1000*species_9,
species_10 => 351//10000*species_7*species_9
]

Reductions:


new_vars = fmpq_mpoly[species_1]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[species_1, species_11 - species_6]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[species_1, species_11 - species_6, species_2]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[species_1, species_10, species_11, species_12, species_13, species_14, species_15, species_16, species_17, species_18, species_19, species_2, species_20, species_21, species_22, species_3, species_4, species_5, species_6, species_7, species_8, species_9]
new_system = 
[
0,
351//10000*y20*y22,
1//100*y2,
y3 + 1//200*y6,
1//200*y6 + 3//400000*y9 + 1//200*y14,
1//200000*y4*y5 + 1//10000000000*y8,
1//10000000000*y8 + 100000*y10*y21 + 1//10000000000*y13,
39//500*y6*y7,
1//200000*y5*y11 + 1//20*y8 + 1//10000000000*y13,
1//20*y8 + 1//200*y13,
3//400000*y9,
0,
39//500*y7*y9,
1//200*y13,
1//200*y14,
3//200000000*y1*y12 + 1000*y22,
y3 + 1//50*y18 + 1000*y22,
2000*y17,
1//100*y2,
1//100*y2 + 1//4000000*y19*y21,
3//100000000*y4 + 1//625*y11 + 3//200*y15,
1//100*y2 + 100000*y16*y17
]


