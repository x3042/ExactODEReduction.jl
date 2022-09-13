Original system:

[
species_2 => 64223//1250000*species_11*species_28,
species_21 => 253763//10000000*species_20*species_41,
species_9 => 999991//1000000*species_10 + 201853//500000*species_12,
species_11 => 999989//1000000*species_2*species_6,
species_13 => species_14,
species_1 => 100001//1000000000*species_19,
species_5 => 127857//5000000*species_22,
species_27 => 40739//10000*species_3,
species_3 => 139901//200000*species_27*species_7 + 376421//50000*species_4,
species_19 => species_17*species_23 + 1//10000*species_17*species_7,
species_8 => 125463//20000000*species_3*species_6 + 100039//1000000000*species_4*species_6,
species_47 => 105691//20000000*species_17,
species_12 => 73093//1000000*species_2*species_9,
species_4 => 147593//25000*species_14*species_3 + 450769//100000*species_22*species_3,
species_20 => 309731//10000000*species_15,
species_10 => 119589//5000000*species_3*species_9 + 100001//1000000000*species_4*species_9,
species_23 => 0,
species_42 => 31249//312500*species_1 - species_17*species_23 - 16833//125000*species_21*species_23 + 328283//100000000*species_7,
species_17 => 71737//12500000*species_2*species_47,
species_18 => 46433//200000000*species_16 - 199997//200000*species_21*species_23,
species_16 => 199997//200000*species_21*species_23,
species_15 => 9333//62500*species_21,
species_22 => 159451//5000000*species_16*species_5,
species_28 => 0,
species_14 => 1//10*species_13*species_21,
species_41 => 0,
species_6 => 812537//100000000*species_8,
species_7 => 16833//125000*species_21*species_23
]

Reductions:

Interesting
new_vars = fmpq_mpoly[species_16 - 999985//134664*species_7]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[species_16 - 999985//134664*species_7, species_23]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[species_16 - 999985//134664*species_7, species_23, species_28]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[species_16 - 999985//134664*species_7, species_23, species_28, species_41]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[species_15, species_16 - 999985//134664*species_7, species_20, species_21, species_23, species_28, species_41]
new_system = 
[
9333//62500*y4,
0,
309731//10000000*y1,
253763//10000000*y3*y7,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[species_13, species_14, species_15, species_16 - 999985//134664*species_7, species_20, species_21, species_23, species_28, species_41]
new_system = 
[
y2,
1//10*y1*y6,
9333//62500*y6,
0,
309731//10000000*y3,
253763//10000000*y5*y9,
0,
0,
0
]


new_vars = fmpq_mpoly[species_13, species_14, species_15, species_16, species_20, species_21, species_23, species_28, species_41, species_7]
new_system = 
[
y2,
1//10*y1*y6,
9333//62500*y6,
199997//200000*y6*y7,
309731//10000000*y3,
253763//10000000*y5*y9,
0,
0,
0,
16833//125000*y6*y7
]


new_vars = fmpq_mpoly[species_13, species_14, species_15, species_16, species_20, species_21, species_22, species_23, species_28, species_41, species_5, species_7]
new_system = 
[
y2,
1//10*y1*y6,
9333//62500*y6,
199997//200000*y6*y8,
309731//10000000*y3,
253763//10000000*y5*y10,
159451//5000000*y4*y11,
0,
0,
0,
127857//5000000*y7,
16833//125000*y6*y8
]


new_vars = fmpq_mpoly[species_13, species_14, species_15, species_16, species_20, species_21, species_22, species_23, species_27, species_28, species_3, species_4, species_41, species_5, species_7]
new_system = 
[
y2,
1//10*y1*y6,
9333//62500*y6,
199997//200000*y6*y8,
309731//10000000*y3,
253763//10000000*y5*y13,
159451//5000000*y4*y14,
0,
40739//10000*y11,
0,
139901//200000*y9*y15 + 376421//50000*y12,
147593//25000*y2*y11 + 450769//100000*y7*y11,
0,
127857//5000000*y7,
16833//125000*y6*y8
]


new_vars = fmpq_mpoly[species_13, species_14, species_15, species_16, species_20, species_21, species_22, species_23, species_27, species_28, species_3, species_4, species_41, species_5, species_6, species_7, species_8]
new_system = 
[
y2,
1//10*y1*y6,
9333//62500*y6,
199997//200000*y6*y8,
309731//10000000*y3,
253763//10000000*y5*y13,
159451//5000000*y4*y14,
0,
40739//10000*y11,
0,
139901//200000*y9*y16 + 376421//50000*y12,
147593//25000*y2*y11 + 450769//100000*y7*y11,
0,
127857//5000000*y7,
812537//100000000*y17,
16833//125000*y6*y8,
125463//20000000*y11*y15 + 100039//1000000000*y12*y15
]


new_vars = fmpq_mpoly[species_11, species_13, species_14, species_15, species_16, species_2, species_20, species_21, species_22, species_23, species_27, species_28, species_3, species_4, species_41, species_5, species_6, species_7, species_8]
new_system = 
[
999989//1000000*y6*y17,
y3,
1//10*y2*y8,
9333//62500*y8,
199997//200000*y8*y10,
64223//1250000*y1*y12,
309731//10000000*y4,
253763//10000000*y7*y15,
159451//5000000*y5*y16,
0,
40739//10000*y13,
0,
139901//200000*y11*y18 + 376421//50000*y14,
147593//25000*y3*y13 + 450769//100000*y9*y13,
0,
127857//5000000*y9,
812537//100000000*y19,
16833//125000*y8*y10,
125463//20000000*y13*y17 + 100039//1000000000*y14*y17
]


new_vars = fmpq_mpoly[species_11, species_13, species_14, species_15, species_16, species_17, species_2, species_20, species_21, species_22, species_23, species_27, species_28, species_3, species_4, species_41, species_47, species_5, species_6, species_7, species_8]
new_system = 
[
999989//1000000*y7*y19,
y3,
1//10*y2*y9,
9333//62500*y9,
199997//200000*y9*y11,
71737//12500000*y7*y17,
64223//1250000*y1*y13,
309731//10000000*y4,
253763//10000000*y8*y16,
159451//5000000*y5*y18,
0,
40739//10000*y14,
0,
139901//200000*y12*y20 + 376421//50000*y15,
147593//25000*y3*y14 + 450769//100000*y10*y14,
0,
105691//20000000*y6,
127857//5000000*y10,
812537//100000000*y21,
16833//125000*y9*y11,
125463//20000000*y14*y19 + 100039//1000000000*y15*y19
]


new_vars = fmpq_mpoly[species_11, species_13, species_14, species_15, species_16, species_17, species_19, species_2, species_20, species_21, species_22, species_23, species_27, species_28, species_3, species_4, species_41, species_47, species_5, species_6, species_7, species_8]
new_system = 
[
999989//1000000*y8*y20,
y3,
1//10*y2*y10,
9333//62500*y10,
199997//200000*y10*y12,
71737//12500000*y8*y18,
y6*y12 + 1//10000*y6*y21,
64223//1250000*y1*y14,
309731//10000000*y4,
253763//10000000*y9*y17,
159451//5000000*y5*y19,
0,
40739//10000*y15,
0,
139901//200000*y13*y21 + 376421//50000*y16,
147593//25000*y3*y15 + 450769//100000*y11*y15,
0,
105691//20000000*y6,
127857//5000000*y11,
812537//100000000*y22,
16833//125000*y10*y12,
125463//20000000*y15*y20 + 100039//1000000000*y16*y20
]


new_vars = fmpq_mpoly[species_1, species_11, species_13, species_14, species_15, species_16, species_17, species_19, species_2, species_20, species_21, species_22, species_23, species_27, species_28, species_3, species_4, species_41, species_47, species_5, species_6, species_7, species_8]
new_system = 
[
100001//1000000000*y8,
999989//1000000*y9*y21,
y4,
1//10*y3*y11,
9333//62500*y11,
199997//200000*y11*y13,
71737//12500000*y9*y19,
y7*y13 + 1//10000*y7*y22,
64223//1250000*y2*y15,
309731//10000000*y5,
253763//10000000*y10*y18,
159451//5000000*y6*y20,
0,
40739//10000*y16,
0,
139901//200000*y14*y22 + 376421//50000*y17,
147593//25000*y4*y16 + 450769//100000*y12*y16,
0,
105691//20000000*y7,
127857//5000000*y12,
812537//100000000*y23,
16833//125000*y11*y13,
125463//20000000*y16*y21 + 100039//1000000000*y17*y21
]

Interesting
new_vars = fmpq_mpoly[species_1, 999991*species_10 + 403706*species_12, species_11, species_13, species_14, species_15, species_16, species_17, species_19, species_2, species_20, species_21, species_22, species_23, species_27, species_28, species_3, species_4, species_41, species_47, species_5, species_6, species_7, species_8, species_9]
new_system = 
[
100001//1000000000*y9,
14754041329//500000*y10*y25 + 119587923699//5000000*y17*y25 + 100000099991//1000000000*y18*y25,
999989//1000000*y10*y22,
y5,
1//10*y4*y12,
9333//62500*y12,
199997//200000*y12*y14,
71737//12500000*y10*y20,
y8*y14 + 1//10000*y8*y23,
64223//1250000*y3*y16,
309731//10000000*y6,
253763//10000000*y11*y19,
159451//5000000*y7*y21,
0,
40739//10000*y17,
0,
139901//200000*y15*y23 + 376421//50000*y18,
147593//25000*y5*y17 + 450769//100000*y13*y17,
0,
105691//20000000*y8,
127857//5000000*y13,
812537//100000000*y24,
16833//125000*y12*y14,
125463//20000000*y17*y22 + 100039//1000000000*y18*y22,
1//1000000*y2
]


new_vars = fmpq_mpoly[species_1, species_10, species_11, species_12, species_13, species_14, species_15, species_16, species_17, species_19, species_2, species_20, species_21, species_22, species_23, species_27, species_28, species_3, species_4, species_41, species_47, species_5, species_6, species_7, species_8, species_9]
new_system = 
[
100001//1000000000*y10,
119589//5000000*y18*y26 + 100001//1000000000*y19*y26,
999989//1000000*y11*y23,
73093//1000000*y11*y26,
y6,
1//10*y5*y13,
9333//62500*y13,
199997//200000*y13*y15,
71737//12500000*y11*y21,
y9*y15 + 1//10000*y9*y24,
64223//1250000*y3*y17,
309731//10000000*y7,
253763//10000000*y12*y20,
159451//5000000*y8*y22,
0,
40739//10000*y18,
0,
139901//200000*y16*y24 + 376421//50000*y19,
147593//25000*y6*y18 + 450769//100000*y14*y18,
0,
105691//20000000*y9,
127857//5000000*y14,
812537//100000000*y25,
16833//125000*y13*y15,
125463//20000000*y18*y23 + 100039//1000000000*y19*y23,
999991//1000000*y2 + 201853//500000*y4
]


new_vars = fmpq_mpoly[species_1, species_10, species_11, species_12, species_13, species_14, species_15, species_16, species_17, species_18, species_19, species_2, species_20, species_21, species_22, species_23, species_27, species_28, species_3, species_4, species_41, species_47, species_5, species_6, species_7, species_8, species_9]
new_system = 
[
100001//1000000000*y11,
119589//5000000*y19*y27 + 100001//1000000000*y20*y27,
999989//1000000*y12*y24,
73093//1000000*y12*y27,
y6,
1//10*y5*y14,
9333//62500*y14,
199997//200000*y14*y16,
71737//12500000*y12*y22,
46433//200000000*y8 - 199997//200000*y14*y16,
y9*y16 + 1//10000*y9*y25,
64223//1250000*y3*y18,
309731//10000000*y7,
253763//10000000*y13*y21,
159451//5000000*y8*y23,
0,
40739//10000*y19,
0,
139901//200000*y17*y25 + 376421//50000*y20,
147593//25000*y6*y19 + 450769//100000*y15*y19,
0,
105691//20000000*y9,
127857//5000000*y15,
812537//100000000*y26,
16833//125000*y14*y16,
125463//20000000*y19*y24 + 100039//1000000000*y20*y24,
999991//1000000*y2 + 201853//500000*y4
]


