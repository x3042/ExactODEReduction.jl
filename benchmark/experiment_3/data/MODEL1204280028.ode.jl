Original system:

[
species_11 => 4//125*species_10*species_8,
species_19 => 1//50*species_20*species_8,
species_12 => 9//200*species_13*species_2,
species_20 => 543//500*species_19 + 273//250*species_24 + 543//500*species_25,
species_16 => species_17 + 43//500*species_19,
species_1 => 43//500*species_22 + species_3,
species_8 => 16*species_11 + species_17 + species_19 + 101//100*species_9,
species_4 => 23//250*species_21 + species_22 + 1//100*species_3 + species_5,
species_2 => 15*species_11 + species_12 + species_24 + 101//100*species_3 + 16*species_5,
species_17 => 1//50*species_16*species_18,
species_25 => 1//100*species_10*species_20,
species_14 => 1//100*species_10*species_13,
species_13 => 273//250*species_12 + 543//500*species_14 + 273//250*species_21 + 543//500*species_22,
species_7 => 43//500*species_14 + 43//500*species_25 + species_9,
species_22 => 1//100*species_13*species_4,
species_9 => 1//50*species_7*species_8,
species_18 => 2*species_17,
species_5 => 4//125*species_2*species_4,
species_21 => 9//200*species_13*species_6,
species_24 => 9//200*species_2*species_20,
species_6 => species_21 + 15*species_5,
species_3 => 1//50*species_1*species_2,
species_10 => species_11 + 23//250*species_12 + species_14 + 23//250*species_24 + species_25 + 1//100*species_9
]

Reductions:

Interesting
new_vars = fmpq_mpoly[species_1, species_10, species_11, 182*species_12 + 181*species_14, species_12 + species_24, species_13, species_14 + species_25, species_16, species_17, species_18, species_19, species_2, species_20, species_21, species_22, species_3, species_4, species_5, species_6, species_7, species_8, species_9]
new_system = 
[
43//500*y15 + y16,
y3 + 23//250*y5 + y7 + 1//100*y22,
4//125*y2*y21,
181//100*y2*y6 + 819//100*y6*y12,
9//200*y6*y12 + 9//200*y12*y13,
3//500*y4 + 273//250*y14 + 543//500*y15,
1//100*y2*y6 + 1//100*y2*y13,
y9 + 43//500*y11,
1//50*y8*y10,
2*y9,
1//50*y13*y21,
15*y3 + y5 + 101//100*y16 + 16*y18,
-3//500*y4 + 273//250*y5 + 543//500*y7 + 543//500*y11,
9//200*y6*y19,
1//100*y6*y17,
1//50*y1*y12,
23//250*y14 + y15 + 1//100*y16 + y18,
4//125*y12*y17,
y14 + 15*y18,
43//500*y7 + y22,
16*y3 + y9 + y11 + 101//100*y22,
1//50*y20*y21
]


