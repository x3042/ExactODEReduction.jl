Original system:

[
species_31 => -1//5*I + 1//10*species_30,
species_25 => 2*species_14*species_24,
I => 0,
species_21 => 2*species_14*species_20 + 1//10*species_33,
species_23 => 2*species_14*species_21,
species_5 => 729//5*species_1*species_3*species_6 + 40*species_14*species_15 + 289//10*species_14*species_16 + 40*species_14*species_17 + 40*species_14*species_18 + 40*species_14*species_19 + 40*species_14*species_20 + 40*species_14*species_21 + 40*species_14*species_22 + 40*species_14*species_24 + 2*species_40,
species_28 => 1//10*species_24 + 1//10*species_29,
species_10 => 1//10*species_9,
species_3 => -1//10*I,
species_9 => 1//10*species_2*species_8,
species_18 => 1//10*species_17 + 1//10*species_19 + 1//5*species_22 + 1//10*species_34 + 3//10*species_35,
species_34 => 1//10*species_28*species_7 + 1//10*species_35,
species_26 => 1//10*species_23 + 1//10*species_27,
species_12 => 1//10*species_11 + 40*species_15*species_7 + 40*species_17*species_7,
species_11 => 1//10*species_10,
species_37 => 7//10*species_15 + 1//10*species_16 + 7//5*species_17,
source => 0,
species_39 => 20*species_15*species_16 + 1//10*species_16,
species_1 => 1//10*source,
species_35 => 1//10*species_30*species_7,
species_20 => 2*species_14*species_17 + 1//10*species_21 + 1//10*species_33,
SINK => 3//5*I - 1//10*species_37 - 1//10*species_39 - 1//10*species_5,
species_2 => -1//10*I + 81//5*species_1*species_3*species_6 + 1//10*species_8,
species_7 => -1//10*I + 648//5*species_1*species_3*species_6 + 1//5*species_13 + 3//10*species_33 + 3//10*species_34 + 2//5*species_35 + 1//10*species_9,
species_33 => 1//10*species_32*species_7,
species_14 => 1//10*species_12*species_6,
species_19 => 2*species_14*species_18 + 1//10*species_20 + 1//10*species_22 + 1//10*species_34 + 1//5*species_35,
species_24 => 2*species_14*species_22 + 1//10*species_23,
species_6 => -1//10*I,
species_16 => 1//5*species_15 + 2//5*species_17,
species_4 => -1//10*I + 486//5*species_1*species_3*species_6,
species_15 => 17//10*species_14*species_16 + 2*species_17*species_7 + 1//5*species_18 + 2//5*species_19 + 2//5*species_20 + 1//2*species_21 + 1//2*species_22 + 3//5*species_33 + 3//5*species_34 + 9//10*species_35 + 1//10*species_40,
species_13 => 1//10*species_12*species_6,
species_17 => 2*species_14*species_15 + 2*species_15*species_16 + 1//10*species_20 + 1//5*species_21 + 1//10*species_33,
species_27 => -1//10*I + 1//10*species_26,
species_29 => -2//5*I + 1//10*species_28,
species_30 => 1//10*species_25 + 1//10*species_31,
species_40 => 0,
species_22 => 2*species_14*species_19 + 1//10*species_21 + 1//10*species_34 + 1//10*species_35,
species_32 => 0,
species_8 => 1//10*species_2
]

Reductions:


new_vars = fmpq_mpoly[I]
new_system = 
[
0
]


new_vars = fmpq_mpoly[I, source]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[I, source, species_13 - species_14]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[I, source, species_13 - species_14, species_3]
new_system = 
[
0,
0,
0,
-1//10*y1
]

Interesting
new_vars = fmpq_mpoly[I, source, species_13 - species_14, species_3, species_32]
new_system = 
[
0,
0,
0,
-1//10*y1,
0
]

Interesting
new_vars = fmpq_mpoly[I, source, species_13 - species_14, species_3, species_32, species_40]
new_system = 
[
0,
0,
0,
-1//10*y1,
0,
0
]

Interesting
new_vars = fmpq_mpoly[I, source, species_13 - species_14, species_3, species_32, species_40, species_6]
new_system = 
[
0,
0,
0,
-1//10*y1,
0,
0,
-1//10*y1
]

Interesting
new_vars = fmpq_mpoly[I, source, species_1, species_13 - species_14, species_3, species_32, species_40, species_6]
new_system = 
[
0,
0,
1//10*y2,
0,
-1//10*y1,
0,
0,
-1//10*y1
]

Interesting
new_vars = fmpq_mpoly[I, source, species_1, species_13 - species_14, species_2 - species_8, species_3, species_32, species_40, species_6]
new_system = 
[
0,
0,
1//10*y2,
0,
-1//10*y1 + 81//5*y3*y6*y9 - 1//10*y5,
-1//10*y1,
0,
0,
-1//10*y1
]

Interesting
new_vars = fmpq_mpoly[I, source, species_1, species_13 - species_14, species_2, species_3, species_32, species_40, species_6, species_8]
new_system = 
[
0,
0,
1//10*y2,
0,
-1//10*y1 + 81//5*y3*y6*y9 + 1//10*y10,
-1//10*y1,
0,
0,
-1//10*y1,
1//10*y5
]

Interesting
new_vars = fmpq_mpoly[I, source, species_1, species_13 - species_14, species_2, species_3, species_32, species_40, species_6, species_8, species_9]
new_system = 
[
0,
0,
1//10*y2,
0,
-1//10*y1 + 81//5*y3*y6*y9 + 1//10*y10,
-1//10*y1,
0,
0,
-1//10*y1,
1//10*y5,
1//10*y5*y10
]

Interesting
new_vars = fmpq_mpoly[I, source, species_1, species_10, species_13 - species_14, species_2, species_3, species_32, species_40, species_6, species_8, species_9]
new_system = 
[
0,
0,
1//10*y2,
1//10*y12,
0,
-1//10*y1 + 81//5*y3*y7*y10 + 1//10*y11,
-1//10*y1,
0,
0,
-1//10*y1,
1//10*y6,
1//10*y6*y11
]

Interesting
new_vars = fmpq_mpoly[I, source, species_1, species_10, species_11, species_13 - species_14, species_2, species_3, species_32, species_40, species_6, species_8, species_9]
new_system = 
[
0,
0,
1//10*y2,
1//10*y13,
1//10*y4,
0,
-1//10*y1 + 81//5*y3*y8*y11 + 1//10*y12,
-1//10*y1,
0,
0,
-1//10*y1,
1//10*y7,
1//10*y7*y12
]

Interesting
new_vars = fmpq_mpoly[I, source, species_1, species_10, species_11, species_12, species_13, species_14, species_15, species_16, species_17, species_18, species_19, species_2, species_20, species_21, species_22, species_23, species_24, species_25 + species_31, species_28, species_29, species_3, species_30, species_32, species_33, species_34, species_35, species_40, species_6, species_7, species_8, species_9]
new_system = 
[
0,
0,
1//10*y2,
1//10*y33,
1//10*y4,
1//10*y5 + 40*y9*y31 + 40*y11*y31,
1//10*y6*y30,
1//10*y6*y30,
17//10*y8*y10 + 2*y11*y31 + 1//5*y12 + 2//5*y13 + 2//5*y15 + 1//2*y16 + 1//2*y17 + 3//5*y26 + 3//5*y27 + 9//10*y28 + 1//10*y29,
1//5*y9 + 2//5*y11,
2*y8*y9 + 2*y9*y10 + 1//10*y15 + 1//5*y16 + 1//10*y26,
1//10*y11 + 1//10*y13 + 1//5*y17 + 1//10*y27 + 3//10*y28,
2*y8*y12 + 1//10*y15 + 1//10*y17 + 1//10*y27 + 1//5*y28,
-1//10*y1 + 81//5*y3*y23*y30 + 1//10*y32,
2*y8*y11 + 1//10*y16 + 1//10*y26,
2*y8*y15 + 1//10*y26,
2*y8*y13 + 1//10*y16 + 1//10*y27 + 1//10*y28,
2*y8*y16,
2*y8*y17 + 1//10*y18,
-1//5*y1 + 2*y8*y19 + 1//10*y24,
1//10*y19 + 1//10*y22,
-2//5*y1 + 1//10*y21,
-1//10*y1,
1//10*y20,
0,
1//10*y25*y31,
1//10*y21*y31 + 1//10*y28,
1//10*y24*y31,
0,
-1//10*y1,
-1//10*y1 + 648//5*y3*y23*y30 + 1//5*y7 + 3//10*y26 + 3//10*y27 + 2//5*y28 + 1//10*y33,
1//10*y14,
1//10*y14*y32
]

Interesting
new_vars = fmpq_mpoly[I, source, species_1, species_10, species_11, species_12, species_13, species_14, species_15, species_16, species_17, species_18, species_19, species_2, species_20, species_21, species_22, species_23, species_24, species_25 + species_31, species_28, species_29, species_3, species_30, species_32, species_33, species_34, species_35, species_37 + species_39 + species_5, species_40, species_6, species_7, species_8, species_9]
new_system = 
[
0,
0,
1//10*y2,
1//10*y34,
1//10*y4,
1//10*y5 + 40*y9*y32 + 40*y11*y32,
1//10*y6*y31,
1//10*y6*y31,
17//10*y8*y10 + 2*y11*y32 + 1//5*y12 + 2//5*y13 + 2//5*y15 + 1//2*y16 + 1//2*y17 + 3//5*y26 + 3//5*y27 + 9//10*y28 + 1//10*y30,
1//5*y9 + 2//5*y11,
2*y8*y9 + 2*y9*y10 + 1//10*y15 + 1//5*y16 + 1//10*y26,
1//10*y11 + 1//10*y13 + 1//5*y17 + 1//10*y27 + 3//10*y28,
2*y8*y12 + 1//10*y15 + 1//10*y17 + 1//10*y27 + 1//5*y28,
-1//10*y1 + 81//5*y3*y23*y31 + 1//10*y33,
2*y8*y11 + 1//10*y16 + 1//10*y26,
2*y8*y15 + 1//10*y26,
2*y8*y13 + 1//10*y16 + 1//10*y27 + 1//10*y28,
2*y8*y16,
2*y8*y17 + 1//10*y18,
-1//5*y1 + 2*y8*y19 + 1//10*y24,
1//10*y19 + 1//10*y22,
-2//5*y1 + 1//10*y21,
-1//10*y1,
1//10*y20,
0,
1//10*y25*y32,
1//10*y21*y32 + 1//10*y28,
1//10*y24*y32,
729//5*y3*y23*y31 + 40*y8*y9 + 289//10*y8*y10 + 40*y8*y11 + 40*y8*y12 + 40*y8*y13 + 40*y8*y15 + 40*y8*y16 + 40*y8*y17 + 40*y8*y19 + 20*y9*y10 + 7//10*y9 + 1//5*y10 + 7//5*y11 + 2*y30,
0,
-1//10*y1,
-1//10*y1 + 648//5*y3*y23*y31 + 1//5*y7 + 3//10*y26 + 3//10*y27 + 2//5*y28 + 1//10*y34,
1//10*y14,
1//10*y14*y33
]

Interesting
new_vars = fmpq_mpoly[I, SINK, source, species_1, species_10, species_11, species_12, species_13, species_14, species_15, species_16, species_17, species_18, species_19, species_2, species_20, species_21, species_22, species_23, species_24, species_25 + species_31, species_28, species_29, species_3, species_30, species_32, species_33, species_34, species_35, species_37 + species_39 + species_5, species_40, species_6, species_7, species_8, species_9]
new_system = 
[
0,
3//5*y1 - 1//10*y30,
0,
1//10*y3,
1//10*y35,
1//10*y5,
1//10*y6 + 40*y10*y33 + 40*y12*y33,
1//10*y7*y32,
1//10*y7*y32,
17//10*y9*y11 + 2*y12*y33 + 1//5*y13 + 2//5*y14 + 2//5*y16 + 1//2*y17 + 1//2*y18 + 3//5*y27 + 3//5*y28 + 9//10*y29 + 1//10*y31,
1//5*y10 + 2//5*y12,
2*y9*y10 + 2*y10*y11 + 1//10*y16 + 1//5*y17 + 1//10*y27,
1//10*y12 + 1//10*y14 + 1//5*y18 + 1//10*y28 + 3//10*y29,
2*y9*y13 + 1//10*y16 + 1//10*y18 + 1//10*y28 + 1//5*y29,
-1//10*y1 + 81//5*y4*y24*y32 + 1//10*y34,
2*y9*y12 + 1//10*y17 + 1//10*y27,
2*y9*y16 + 1//10*y27,
2*y9*y14 + 1//10*y17 + 1//10*y28 + 1//10*y29,
2*y9*y17,
2*y9*y18 + 1//10*y19,
-1//5*y1 + 2*y9*y20 + 1//10*y25,
1//10*y20 + 1//10*y23,
-2//5*y1 + 1//10*y22,
-1//10*y1,
1//10*y21,
0,
1//10*y26*y33,
1//10*y22*y33 + 1//10*y29,
1//10*y25*y33,
729//5*y4*y24*y32 + 40*y9*y10 + 289//10*y9*y11 + 40*y9*y12 + 40*y9*y13 + 40*y9*y14 + 40*y9*y16 + 40*y9*y17 + 40*y9*y18 + 40*y9*y20 + 20*y10*y11 + 7//10*y10 + 1//5*y11 + 7//5*y12 + 2*y31,
0,
-1//10*y1,
-1//10*y1 + 648//5*y4*y24*y32 + 1//5*y8 + 3//10*y27 + 3//10*y28 + 2//5*y29 + 1//10*y35,
1//10*y15,
1//10*y15*y34
]

Interesting
new_vars = fmpq_mpoly[I, SINK, source, species_1, species_10, species_11, species_12, species_13, species_14, species_15, species_16, species_17, species_18, species_19, species_2, species_20, species_21, species_22, species_23, species_24, species_25 + species_31, species_26 + species_27, species_28, species_29, species_3, species_30, species_32, species_33, species_34, species_35, species_37 + species_39 + species_5, species_40, species_6, species_7, species_8, species_9]
new_system = 
[
0,
3//5*y1 - 1//10*y31,
0,
1//10*y3,
1//10*y36,
1//10*y5,
1//10*y6 + 40*y10*y34 + 40*y12*y34,
1//10*y7*y33,
1//10*y7*y33,
17//10*y9*y11 + 2*y12*y34 + 1//5*y13 + 2//5*y14 + 2//5*y16 + 1//2*y17 + 1//2*y18 + 3//5*y28 + 3//5*y29 + 9//10*y30 + 1//10*y32,
1//5*y10 + 2//5*y12,
2*y9*y10 + 2*y10*y11 + 1//10*y16 + 1//5*y17 + 1//10*y28,
1//10*y12 + 1//10*y14 + 1//5*y18 + 1//10*y29 + 3//10*y30,
2*y9*y13 + 1//10*y16 + 1//10*y18 + 1//10*y29 + 1//5*y30,
-1//10*y1 + 81//5*y4*y25*y33 + 1//10*y35,
2*y9*y12 + 1//10*y17 + 1//10*y28,
2*y9*y16 + 1//10*y28,
2*y9*y14 + 1//10*y17 + 1//10*y29 + 1//10*y30,
2*y9*y17,
2*y9*y18 + 1//10*y19,
-1//5*y1 + 2*y9*y20 + 1//10*y26,
-1//10*y1 + 1//10*y19 + 1//10*y22,
1//10*y20 + 1//10*y24,
-2//5*y1 + 1//10*y23,
-1//10*y1,
1//10*y21,
0,
1//10*y27*y34,
1//10*y23*y34 + 1//10*y30,
1//10*y26*y34,
729//5*y4*y25*y33 + 40*y9*y10 + 289//10*y9*y11 + 40*y9*y12 + 40*y9*y13 + 40*y9*y14 + 40*y9*y16 + 40*y9*y17 + 40*y9*y18 + 40*y9*y20 + 20*y10*y11 + 7//10*y10 + 1//5*y11 + 7//5*y12 + 2*y32,
0,
-1//10*y1,
-1//10*y1 + 648//5*y4*y25*y33 + 1//5*y8 + 3//10*y28 + 3//10*y29 + 2//5*y30 + 1//10*y36,
1//10*y15,
1//10*y15*y35
]

Interesting
new_vars = fmpq_mpoly[I, SINK, source, species_1, species_10, species_11, species_12, species_13, species_14, species_15, species_16, species_17, species_18, species_19, species_2, species_20, species_21, species_22, species_23, species_24, species_25 + species_31, species_26, species_27, species_28, species_29, species_3, species_30, species_32, species_33, species_34, species_35, species_37 + species_39 + species_5, species_40, species_6, species_7, species_8, species_9]
new_system = 
[
0,
3//5*y1 - 1//10*y32,
0,
1//10*y3,
1//10*y37,
1//10*y5,
1//10*y6 + 40*y10*y35 + 40*y12*y35,
1//10*y7*y34,
1//10*y7*y34,
17//10*y9*y11 + 2*y12*y35 + 1//5*y13 + 2//5*y14 + 2//5*y16 + 1//2*y17 + 1//2*y18 + 3//5*y29 + 3//5*y30 + 9//10*y31 + 1//10*y33,
1//5*y10 + 2//5*y12,
2*y9*y10 + 2*y10*y11 + 1//10*y16 + 1//5*y17 + 1//10*y29,
1//10*y12 + 1//10*y14 + 1//5*y18 + 1//10*y30 + 3//10*y31,
2*y9*y13 + 1//10*y16 + 1//10*y18 + 1//10*y30 + 1//5*y31,
-1//10*y1 + 81//5*y4*y26*y34 + 1//10*y36,
2*y9*y12 + 1//10*y17 + 1//10*y29,
2*y9*y16 + 1//10*y29,
2*y9*y14 + 1//10*y17 + 1//10*y30 + 1//10*y31,
2*y9*y17,
2*y9*y18 + 1//10*y19,
-1//5*y1 + 2*y9*y20 + 1//10*y27,
1//10*y19 + 1//10*y23,
-1//10*y1 + 1//10*y22,
1//10*y20 + 1//10*y25,
-2//5*y1 + 1//10*y24,
-1//10*y1,
1//10*y21,
0,
1//10*y28*y35,
1//10*y24*y35 + 1//10*y31,
1//10*y27*y35,
729//5*y4*y26*y34 + 40*y9*y10 + 289//10*y9*y11 + 40*y9*y12 + 40*y9*y13 + 40*y9*y14 + 40*y9*y16 + 40*y9*y17 + 40*y9*y18 + 40*y9*y20 + 20*y10*y11 + 7//10*y10 + 1//5*y11 + 7//5*y12 + 2*y33,
0,
-1//10*y1,
-1//10*y1 + 648//5*y4*y26*y34 + 1//5*y8 + 3//10*y29 + 3//10*y30 + 2//5*y31 + 1//10*y37,
1//10*y15,
1//10*y15*y36
]

Interesting
new_vars = fmpq_mpoly[I, SINK, source, species_1, species_10, species_11, species_12, species_13, species_14, species_15, species_16, species_17, species_18, species_19, species_2, species_20, species_21, species_22, species_23, species_24, species_25, species_26, species_27, species_28, species_29, species_3, species_30, species_31, species_32, species_33, species_34, species_35, species_37 + species_39 + species_5, species_40, species_6, species_7, species_8, species_9]
new_system = 
[
0,
3//5*y1 - 1//10*y33,
0,
1//10*y3,
1//10*y38,
1//10*y5,
1//10*y6 + 40*y10*y36 + 40*y12*y36,
1//10*y7*y35,
1//10*y7*y35,
17//10*y9*y11 + 2*y12*y36 + 1//5*y13 + 2//5*y14 + 2//5*y16 + 1//2*y17 + 1//2*y18 + 3//5*y30 + 3//5*y31 + 9//10*y32 + 1//10*y34,
1//5*y10 + 2//5*y12,
2*y9*y10 + 2*y10*y11 + 1//10*y16 + 1//5*y17 + 1//10*y30,
1//10*y12 + 1//10*y14 + 1//5*y18 + 1//10*y31 + 3//10*y32,
2*y9*y13 + 1//10*y16 + 1//10*y18 + 1//10*y31 + 1//5*y32,
-1//10*y1 + 81//5*y4*y26*y35 + 1//10*y37,
2*y9*y12 + 1//10*y17 + 1//10*y30,
2*y9*y16 + 1//10*y30,
2*y9*y14 + 1//10*y17 + 1//10*y31 + 1//10*y32,
2*y9*y17,
2*y9*y18 + 1//10*y19,
2*y9*y20,
1//10*y19 + 1//10*y23,
-1//10*y1 + 1//10*y22,
1//10*y20 + 1//10*y25,
-2//5*y1 + 1//10*y24,
-1//10*y1,
1//10*y21 + 1//10*y28,
-1//5*y1 + 1//10*y27,
0,
1//10*y29*y36,
1//10*y24*y36 + 1//10*y32,
1//10*y27*y36,
729//5*y4*y26*y35 + 40*y9*y10 + 289//10*y9*y11 + 40*y9*y12 + 40*y9*y13 + 40*y9*y14 + 40*y9*y16 + 40*y9*y17 + 40*y9*y18 + 40*y9*y20 + 20*y10*y11 + 7//10*y10 + 1//5*y11 + 7//5*y12 + 2*y34,
0,
-1//10*y1,
-1//10*y1 + 648//5*y4*y26*y35 + 1//5*y8 + 3//10*y30 + 3//10*y31 + 2//5*y32 + 1//10*y38,
1//10*y15,
1//10*y15*y37
]

Interesting
new_vars = fmpq_mpoly[I, SINK, source, species_1, species_10, species_11, species_12, species_13, species_14, species_15, species_16, species_17, species_18, species_19, species_2, species_20, species_21, species_22, species_23, species_24, species_25, species_26, species_27, species_28, species_29, species_3, species_30, species_31, species_32, species_33, species_34, species_35, species_37 + species_5, species_39, species_40, species_6, species_7, species_8, species_9]
new_system = 
[
0,
3//5*y1 - 1//10*y33 - 1//10*y34,
0,
1//10*y3,
1//10*y39,
1//10*y5,
1//10*y6 + 40*y10*y37 + 40*y12*y37,
1//10*y7*y36,
1//10*y7*y36,
17//10*y9*y11 + 2*y12*y37 + 1//5*y13 + 2//5*y14 + 2//5*y16 + 1//2*y17 + 1//2*y18 + 3//5*y30 + 3//5*y31 + 9//10*y32 + 1//10*y35,
1//5*y10 + 2//5*y12,
2*y9*y10 + 2*y10*y11 + 1//10*y16 + 1//5*y17 + 1//10*y30,
1//10*y12 + 1//10*y14 + 1//5*y18 + 1//10*y31 + 3//10*y32,
2*y9*y13 + 1//10*y16 + 1//10*y18 + 1//10*y31 + 1//5*y32,
-1//10*y1 + 81//5*y4*y26*y36 + 1//10*y38,
2*y9*y12 + 1//10*y17 + 1//10*y30,
2*y9*y16 + 1//10*y30,
2*y9*y14 + 1//10*y17 + 1//10*y31 + 1//10*y32,
2*y9*y17,
2*y9*y18 + 1//10*y19,
2*y9*y20,
1//10*y19 + 1//10*y23,
-1//10*y1 + 1//10*y22,
1//10*y20 + 1//10*y25,
-2//5*y1 + 1//10*y24,
-1//10*y1,
1//10*y21 + 1//10*y28,
-1//5*y1 + 1//10*y27,
0,
1//10*y29*y37,
1//10*y24*y37 + 1//10*y32,
1//10*y27*y37,
729//5*y4*y26*y36 + 40*y9*y10 + 289//10*y9*y11 + 40*y9*y12 + 40*y9*y13 + 40*y9*y14 + 40*y9*y16 + 40*y9*y17 + 40*y9*y18 + 40*y9*y20 + 7//10*y10 + 1//10*y11 + 7//5*y12 + 2*y35,
20*y10*y11 + 1//10*y11,
0,
-1//10*y1,
-1//10*y1 + 648//5*y4*y26*y36 + 1//5*y8 + 3//10*y30 + 3//10*y31 + 2//5*y32 + 1//10*y39,
1//10*y15,
1//10*y15*y38
]

Interesting
new_vars = fmpq_mpoly[I, SINK, source, species_1, species_10, species_11, species_12, species_13, species_14, species_15, species_16, species_17, species_18, species_19, species_2, species_20, species_21, species_22, species_23, species_24, species_25, species_26, species_27, species_28, species_29, species_3, species_30, species_31, species_32, species_33, species_34, species_35, species_37 + species_5, species_39, species_4, species_40, species_6, species_7, species_8, species_9]
new_system = 
[
0,
3//5*y1 - 1//10*y33 - 1//10*y34,
0,
1//10*y3,
1//10*y40,
1//10*y5,
1//10*y6 + 40*y10*y38 + 40*y12*y38,
1//10*y7*y37,
1//10*y7*y37,
17//10*y9*y11 + 2*y12*y38 + 1//5*y13 + 2//5*y14 + 2//5*y16 + 1//2*y17 + 1//2*y18 + 3//5*y30 + 3//5*y31 + 9//10*y32 + 1//10*y36,
1//5*y10 + 2//5*y12,
2*y9*y10 + 2*y10*y11 + 1//10*y16 + 1//5*y17 + 1//10*y30,
1//10*y12 + 1//10*y14 + 1//5*y18 + 1//10*y31 + 3//10*y32,
2*y9*y13 + 1//10*y16 + 1//10*y18 + 1//10*y31 + 1//5*y32,
-1//10*y1 + 81//5*y4*y26*y37 + 1//10*y39,
2*y9*y12 + 1//10*y17 + 1//10*y30,
2*y9*y16 + 1//10*y30,
2*y9*y14 + 1//10*y17 + 1//10*y31 + 1//10*y32,
2*y9*y17,
2*y9*y18 + 1//10*y19,
2*y9*y20,
1//10*y19 + 1//10*y23,
-1//10*y1 + 1//10*y22,
1//10*y20 + 1//10*y25,
-2//5*y1 + 1//10*y24,
-1//10*y1,
1//10*y21 + 1//10*y28,
-1//5*y1 + 1//10*y27,
0,
1//10*y29*y38,
1//10*y24*y38 + 1//10*y32,
1//10*y27*y38,
729//5*y4*y26*y37 + 40*y9*y10 + 289//10*y9*y11 + 40*y9*y12 + 40*y9*y13 + 40*y9*y14 + 40*y9*y16 + 40*y9*y17 + 40*y9*y18 + 40*y9*y20 + 7//10*y10 + 1//10*y11 + 7//5*y12 + 2*y36,
20*y10*y11 + 1//10*y11,
-1//10*y1 + 486//5*y4*y26*y37,
0,
-1//10*y1,
-1//10*y1 + 648//5*y4*y26*y37 + 1//5*y8 + 3//10*y30 + 3//10*y31 + 2//5*y32 + 1//10*y40,
1//10*y15,
1//10*y15*y39
]


