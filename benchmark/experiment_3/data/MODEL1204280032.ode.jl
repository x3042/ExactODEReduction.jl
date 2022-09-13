Original system:

[
species_10 => species_11 + 23//250*species_12 + species_14 + 23//250*species_24 + species_25 + 1//100*species_9,
species_26 => 1//200*species_20*species_7 + 1//2*species_25,
species_13 => 273//250*species_12 + species_14 + 43//500*species_15 + 273//250*species_21 + species_22 + 43//500*species_23,
species_17 => 1//50*species_16*species_18,
species_18 => 2*species_17,
species_23 => 1//200*species_1*species_13 + 1//2*species_22,
species_14 => 1//100*species_10*species_13,
species_7 => 43//500*species_15 + 43//500*species_26 + species_9,
species_1 => 43//500*species_23 + species_3,
species_12 => 9//200*species_13*species_2,
species_20 => species_19 + 273//250*species_24 + species_25 + 43//500*species_26 + 43//500*species_27,
species_3 => 1//50*species_1*species_2,
species_27 => 1//200*species_16*species_20 + 1//2*species_19,
species_2 => 15*species_11 + species_12 + species_24 + 101//100*species_3 + 16*species_5,
species_8 => 16*species_11 + species_17 + species_19 + 101//100*species_9,
species_25 => 1//100*species_10*species_20,
species_24 => 9//200*species_2*species_20,
species_9 => 1//50*species_7*species_8,
species_15 => 1//200*species_13*species_7 + 1//2*species_14,
species_16 => species_17 + 43//500*species_27,
species_21 => 9//200*species_13*species_6,
species_22 => 1//100*species_13*species_4,
species_4 => 23//250*species_21 + species_22 + 1//100*species_3 + species_5,
species_6 => species_21 + 15*species_5,
species_11 => 4//125*species_10*species_8,
species_5 => 4//125*species_2*species_4,
species_19 => 1//50*species_20*species_8
]

Reductions:

Interesting
new_vars = fmpq_mpoly[species_1, species_10, species_11, 546*species_12 + 43*species_15, species_12 + species_24, species_13, species_14, species_15 + species_26, species_16, species_17, species_18, species_19, species_2, species_20, species_21, species_22, species_23, species_25, species_27, species_3, species_4, species_5, species_6, species_7, species_8, species_9]
new_system = 
[
43//500*y17 + y20,
y3 + 23//250*y5 + y7 + y18 + 1//100*y26,
4//125*y2*y25,
2457//100*y6*y13 + 43//200*y6*y24 + 43//2*y7,
9//200*y6*y13 + 9//200*y13*y14,
1//500*y4 + y7 + 273//250*y15 + y16 + 43//500*y17,
1//100*y2*y6,
1//200*y6*y24 + 1//2*y7 + 1//200*y14*y24 + 1//2*y18,
y10 + 43//500*y19,
1//50*y9*y11,
2*y10,
1//50*y14*y25,
15*y3 + y5 + 101//100*y20 + 16*y22,
-1//500*y4 + 273//250*y5 + 43//500*y8 + y12 + y18 + 43//500*y19,
9//200*y6*y23,
1//100*y6*y21,
1//200*y1*y6 + 1//2*y16,
1//100*y2*y14,
1//200*y9*y14 + 1//2*y12,
1//50*y1*y13,
23//250*y15 + y16 + 1//100*y20 + y22,
4//125*y13*y21,
y15 + 15*y22,
43//500*y8 + y26,
16*y3 + y10 + y12 + 101//100*y26,
1//50*y24*y25
]


