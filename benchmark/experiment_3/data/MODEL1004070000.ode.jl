Original system:

[
erythrose_4_phosphate => -39//2*erythrose_4_phosphate*fructose_6_phosphate - 57//2*erythrose_4_phosphate*xylulose_5_phosphate + 11//4*fructose_6_phosphate*glyceraldehyde_3_phosphate + 41//2*glyceraldehyde_3_phosphate*sedoheptulose_7_phosphate,
CIT2C => 17//10*CIT0C*acetyl_CoA - 7//8*CIT2C,
fatty_acids => -7//62500*NADP*fatty_acids + 39//50*NADPH*acetyl_CoA,
fructose_16_diphosphate => 221//500*dihydroxyacetone_3_phosphate*glyceraldehyde_3_phosphate - 103//10*fructose_16_diphosphate + 5//2*fructose_6_phosphate,
fructose_6_phosphate => -39//2*erythrose_4_phosphate*fructose_6_phosphate + 57//2*erythrose_4_phosphate*xylulose_5_phosphate + 3//10*fructose_16_diphosphate - 11//4*fructose_6_phosphate*glyceraldehyde_3_phosphate - 251//100*fructose_6_phosphate + 9//25*glucose_6_phosphate + 41//2*glyceraldehyde_3_phosphate*sedoheptulose_7_phosphate,
CO2A => -CO2A*NADPH*ribulose_5_phosphate - 1//20*CO2A*pyruvate + 86//5*NADP*s_6_phosphogluconate,
dihydroxyacetone_3_phosphate => -221//500*dihydroxyacetone_3_phosphate*glyceraldehyde_3_phosphate - 255*dihydroxyacetone_3_phosphate + 10*fructose_16_diphosphate + 378//5*glyceraldehyde_3_phosphate + 50*glycerol,
NADPH => -CO2A*NADPH*ribulose_5_phosphate + 7//62500*NADP*fatty_acids + 35*NADP*glucose_6_phosphate + 86//5*NADP*s_6_phosphogluconate - 39//50*NADPH*acetyl_CoA - 207//100*NADPH*s_6_phosphogluconolactone - 3//200*NADPH,
glyceraldehyde_3_phosphate => -221//500*dihydroxyacetone_3_phosphate*glyceraldehyde_3_phosphate + 30*dihydroxyacetone_3_phosphate + 39//2*erythrose_4_phosphate*fructose_6_phosphate + 57//2*erythrose_4_phosphate*xylulose_5_phosphate + 10*fructose_16_diphosphate - 11//4*fructose_6_phosphate*glyceraldehyde_3_phosphate - 211//10*glyceraldehyde_3_phosphate*sedoheptulose_7_phosphate - 831//10*glyceraldehyde_3_phosphate + 18//25*ribose_5_phosphate*xylulose_5_phosphate,
CIT0C => -17//10*CIT0C*acetyl_CoA + 3//8*CIT1C + 1//2*CIT2C + 1//20*CO2A*pyruvate + 1//20*CO2B*pyruvate + 1//20*CO2C*pyruvate + 1//20*CO2D*pyruvate,
xylulose_5_phosphate => -57//2*erythrose_4_phosphate*xylulose_5_phosphate + 11//4*fructose_6_phosphate*glyceraldehyde_3_phosphate + 3//5*glyceraldehyde_3_phosphate*sedoheptulose_7_phosphate - 18//25*ribose_5_phosphate*xylulose_5_phosphate + 51//500*ribulose_5_phosphate - 69//1000*xylulose_5_phosphate,
lactose => 9//1000*glucose_inside_cell,
sedoheptulose_7_phosphate => 39//2*erythrose_4_phosphate*fructose_6_phosphate - 211//10*glyceraldehyde_3_phosphate*sedoheptulose_7_phosphate + 18//25*ribose_5_phosphate*xylulose_5_phosphate,
acetyl_CoA => -17//10*CIT0C*acetyl_CoA + 1//2*CIT2C + 7//62500*NADP*fatty_acids - 39//50*NADPH*acetyl_CoA + pyruvate,
glucose_hexokinase => -5189//5*glucose_hexokinase + 378*glucose_inside_cell*hexokinase,
hexokinase_inhibited => 1667//1000*glucose_6_phosphate*hexokinase - 1//10*hexokinase_inhibited,
hexokinase => -1667//1000*glucose_6_phosphate*hexokinase + 5189//5*glucose_hexokinase - 378*glucose_inside_cell*hexokinase + 1//10*hexokinase_inhibited,
glucose_inside_cell => 189//5*glucose_hexokinase - 378*glucose_inside_cell*hexokinase - 179//200*glucose_inside_cell + 1//20*glucose_outside_cell,
NADP => CO2A*NADPH*ribulose_5_phosphate - 7//62500*NADP*fatty_acids - 35*NADP*glucose_6_phosphate - 86//5*NADP*s_6_phosphogluconate + 39//50*NADPH*acetyl_CoA + 207//100*NADPH*s_6_phosphogluconolactone + 3//200*NADPH,
CO2B => -1//20*CO2B*pyruvate + pyruvate,
lactate => -1//2000*lactate + 3//100*pyruvate,
glycerol => 225*dihydroxyacetone_3_phosphate - 50*glycerol,
glucose_6_phosphate => -35*NADP*glucose_6_phosphate + 207//100*NADPH*s_6_phosphogluconolactone + 1//100*fructose_6_phosphate - 1667//1000*glucose_6_phosphate*hexokinase - 9//25*glucose_6_phosphate + 1000*glucose_hexokinase + 1//10*hexokinase_inhibited,
pyruvate => -1//20*CO2A*pyruvate - 1//20*CO2B*pyruvate - 1//20*CO2C*pyruvate - 1//20*CO2D*pyruvate + 15//2*glyceraldehyde_3_phosphate + 1//2000*lactate - 103//100*pyruvate,
ribulose_5_phosphate => -CO2A*NADPH*ribulose_5_phosphate + 86//5*NADP*s_6_phosphogluconate + 81//5000*ribose_5_phosphate - 19//125*ribulose_5_phosphate + 69//1000*xylulose_5_phosphate,
CO2D => 3//8*CIT1C - 1//20*CO2D*pyruvate,
CIT1C => -3//8*CIT1C + 3//8*CIT2C,
glucose_outside_cell => 443//500*glucose_inside_cell - 1//20*glucose_outside_cell,
s_6_phosphogluconolactone => 35*NADP*glucose_6_phosphate - 207//100*NADPH*s_6_phosphogluconolactone + 191//10000*s_6_phosphogluconate - 191//1000*s_6_phosphogluconolactone,
CO2C => 3//8*CIT2C - 1//20*CO2C*pyruvate,
ribose_5_phosphate => 3//5*glyceraldehyde_3_phosphate*sedoheptulose_7_phosphate - 18//25*ribose_5_phosphate*xylulose_5_phosphate - 81//5000*ribose_5_phosphate + 1//20*ribulose_5_phosphate,
s_6_phosphogluconate => CO2A*NADPH*ribulose_5_phosphate - 86//5*NADP*s_6_phosphogluconate - 191//10000*s_6_phosphogluconate + 191//1000*s_6_phosphogluconolactone
]

Reductions:

Interesting
new_vars = fmpq_mpoly[NADP + NADPH]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[NADP + NADPH, glucose_hexokinase + hexokinase + hexokinase_inhibited]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[CIT0C, CIT1C, CIT2C, CO2A, CO2B + CO2C + CO2D, NADP, NADPH, acetyl_CoA, dihydroxyacetone_3_phosphate, erythrose_4_phosphate, fatty_acids, fructose_16_diphosphate, fructose_6_phosphate, glucose_6_phosphate, glucose_hexokinase, glucose_inside_cell, glucose_outside_cell, glyceraldehyde_3_phosphate, glycerol, hexokinase, hexokinase_inhibited, lactate, pyruvate, ribose_5_phosphate, ribulose_5_phosphate, s_6_phosphogluconate, s_6_phosphogluconolactone, sedoheptulose_7_phosphate, xylulose_5_phosphate]
new_system = 
[
-17//10*y1*y8 + 3//8*y2 + 1//2*y3 + 1//20*y4*y23 + 1//20*y5*y23,
-3//8*y2 + 3//8*y3,
17//10*y1*y8 - 7//8*y3,
-y4*y7*y25 - 1//20*y4*y23 + 86//5*y6*y26,
3//8*y2 + 3//8*y3 - 1//20*y5*y23 + y23,
y4*y7*y25 - 7//62500*y6*y11 - 35*y6*y14 - 86//5*y6*y26 + 39//50*y7*y8 + 207//100*y7*y27 + 3//200*y7,
-y4*y7*y25 + 7//62500*y6*y11 + 35*y6*y14 + 86//5*y6*y26 - 39//50*y7*y8 - 207//100*y7*y27 - 3//200*y7,
-17//10*y1*y8 + 1//2*y3 + 7//62500*y6*y11 - 39//50*y7*y8 + y23,
-221//500*y9*y18 - 255*y9 + 10*y12 + 378//5*y18 + 50*y19,
-39//2*y10*y13 - 57//2*y10*y29 + 11//4*y13*y18 + 41//2*y18*y28,
-7//62500*y6*y11 + 39//50*y7*y8,
221//500*y9*y18 - 103//10*y12 + 5//2*y13,
-39//2*y10*y13 + 57//2*y10*y29 + 3//10*y12 - 11//4*y13*y18 - 251//100*y13 + 9//25*y14 + 41//2*y18*y28,
-35*y6*y14 + 207//100*y7*y27 + 1//100*y13 - 1667//1000*y14*y20 - 9//25*y14 + 1000*y15 + 1//10*y21,
-5189//5*y15 + 378*y16*y20,
189//5*y15 - 378*y16*y20 - 179//200*y16 + 1//20*y17,
443//500*y16 - 1//20*y17,
-221//500*y9*y18 + 30*y9 + 39//2*y10*y13 + 57//2*y10*y29 + 10*y12 - 11//4*y13*y18 - 211//10*y18*y28 - 831//10*y18 + 18//25*y24*y29,
225*y9 - 50*y19,
-1667//1000*y14*y20 + 5189//5*y15 - 378*y16*y20 + 1//10*y21,
1667//1000*y14*y20 - 1//10*y21,
-1//2000*y22 + 3//100*y23,
-1//20*y4*y23 - 1//20*y5*y23 + 15//2*y18 + 1//2000*y22 - 103//100*y23,
3//5*y18*y28 - 18//25*y24*y29 - 81//5000*y24 + 1//20*y25,
-y4*y7*y25 + 86//5*y6*y26 + 81//5000*y24 - 19//125*y25 + 69//1000*y29,
y4*y7*y25 - 86//5*y6*y26 - 191//10000*y26 + 191//1000*y27,
35*y6*y14 - 207//100*y7*y27 + 191//10000*y26 - 191//1000*y27,
39//2*y10*y13 - 211//10*y18*y28 + 18//25*y24*y29,
-57//2*y10*y29 + 11//4*y13*y18 + 3//5*y18*y28 - 18//25*y24*y29 + 51//500*y25 - 69//1000*y29
]

Interesting
new_vars = fmpq_mpoly[CIT0C, CIT1C, CIT2C, CO2A, CO2B + CO2D, CO2C, NADP, NADPH, acetyl_CoA, dihydroxyacetone_3_phosphate, erythrose_4_phosphate, fatty_acids, fructose_16_diphosphate, fructose_6_phosphate, glucose_6_phosphate, glucose_hexokinase, glucose_inside_cell, glucose_outside_cell, glyceraldehyde_3_phosphate, glycerol, hexokinase, hexokinase_inhibited, lactate, pyruvate, ribose_5_phosphate, ribulose_5_phosphate, s_6_phosphogluconate, s_6_phosphogluconolactone, sedoheptulose_7_phosphate, xylulose_5_phosphate]
new_system = 
[
-17//10*y1*y9 + 3//8*y2 + 1//2*y3 + 1//20*y4*y24 + 1//20*y5*y24 + 1//20*y6*y24,
-3//8*y2 + 3//8*y3,
17//10*y1*y9 - 7//8*y3,
-y4*y8*y26 - 1//20*y4*y24 + 86//5*y7*y27,
3//8*y2 - 1//20*y5*y24 + y24,
3//8*y3 - 1//20*y6*y24,
y4*y8*y26 - 7//62500*y7*y12 - 35*y7*y15 - 86//5*y7*y27 + 39//50*y8*y9 + 207//100*y8*y28 + 3//200*y8,
-y4*y8*y26 + 7//62500*y7*y12 + 35*y7*y15 + 86//5*y7*y27 - 39//50*y8*y9 - 207//100*y8*y28 - 3//200*y8,
-17//10*y1*y9 + 1//2*y3 + 7//62500*y7*y12 - 39//50*y8*y9 + y24,
-221//500*y10*y19 - 255*y10 + 10*y13 + 378//5*y19 + 50*y20,
-39//2*y11*y14 - 57//2*y11*y30 + 11//4*y14*y19 + 41//2*y19*y29,
-7//62500*y7*y12 + 39//50*y8*y9,
221//500*y10*y19 - 103//10*y13 + 5//2*y14,
-39//2*y11*y14 + 57//2*y11*y30 + 3//10*y13 - 11//4*y14*y19 - 251//100*y14 + 9//25*y15 + 41//2*y19*y29,
-35*y7*y15 + 207//100*y8*y28 + 1//100*y14 - 1667//1000*y15*y21 - 9//25*y15 + 1000*y16 + 1//10*y22,
-5189//5*y16 + 378*y17*y21,
189//5*y16 - 378*y17*y21 - 179//200*y17 + 1//20*y18,
443//500*y17 - 1//20*y18,
-221//500*y10*y19 + 30*y10 + 39//2*y11*y14 + 57//2*y11*y30 + 10*y13 - 11//4*y14*y19 - 211//10*y19*y29 - 831//10*y19 + 18//25*y25*y30,
225*y10 - 50*y20,
-1667//1000*y15*y21 + 5189//5*y16 - 378*y17*y21 + 1//10*y22,
1667//1000*y15*y21 - 1//10*y22,
-1//2000*y23 + 3//100*y24,
-1//20*y4*y24 - 1//20*y5*y24 - 1//20*y6*y24 + 15//2*y19 + 1//2000*y23 - 103//100*y24,
3//5*y19*y29 - 18//25*y25*y30 - 81//5000*y25 + 1//20*y26,
-y4*y8*y26 + 86//5*y7*y27 + 81//5000*y25 - 19//125*y26 + 69//1000*y30,
y4*y8*y26 - 86//5*y7*y27 - 191//10000*y27 + 191//1000*y28,
35*y7*y15 - 207//100*y8*y28 + 191//10000*y27 - 191//1000*y28,
39//2*y11*y14 - 211//10*y19*y29 + 18//25*y25*y30,
-57//2*y11*y30 + 11//4*y14*y19 + 3//5*y19*y29 - 18//25*y25*y30 + 51//500*y26 - 69//1000*y30
]


new_vars = fmpq_mpoly[CIT0C, CIT1C, CIT2C, CO2A, CO2B, CO2C, CO2D, NADP, NADPH, acetyl_CoA, dihydroxyacetone_3_phosphate, erythrose_4_phosphate, fatty_acids, fructose_16_diphosphate, fructose_6_phosphate, glucose_6_phosphate, glucose_hexokinase, glucose_inside_cell, glucose_outside_cell, glyceraldehyde_3_phosphate, glycerol, hexokinase, hexokinase_inhibited, lactate, pyruvate, ribose_5_phosphate, ribulose_5_phosphate, s_6_phosphogluconate, s_6_phosphogluconolactone, sedoheptulose_7_phosphate, xylulose_5_phosphate]
new_system = 
[
-17//10*y1*y10 + 3//8*y2 + 1//2*y3 + 1//20*y4*y25 + 1//20*y5*y25 + 1//20*y6*y25 + 1//20*y7*y25,
-3//8*y2 + 3//8*y3,
17//10*y1*y10 - 7//8*y3,
-y4*y9*y27 - 1//20*y4*y25 + 86//5*y8*y28,
-1//20*y5*y25 + y25,
3//8*y3 - 1//20*y6*y25,
3//8*y2 - 1//20*y7*y25,
y4*y9*y27 - 7//62500*y8*y13 - 35*y8*y16 - 86//5*y8*y28 + 39//50*y9*y10 + 207//100*y9*y29 + 3//200*y9,
-y4*y9*y27 + 7//62500*y8*y13 + 35*y8*y16 + 86//5*y8*y28 - 39//50*y9*y10 - 207//100*y9*y29 - 3//200*y9,
-17//10*y1*y10 + 1//2*y3 + 7//62500*y8*y13 - 39//50*y9*y10 + y25,
-221//500*y11*y20 - 255*y11 + 10*y14 + 378//5*y20 + 50*y21,
-39//2*y12*y15 - 57//2*y12*y31 + 11//4*y15*y20 + 41//2*y20*y30,
-7//62500*y8*y13 + 39//50*y9*y10,
221//500*y11*y20 - 103//10*y14 + 5//2*y15,
-39//2*y12*y15 + 57//2*y12*y31 + 3//10*y14 - 11//4*y15*y20 - 251//100*y15 + 9//25*y16 + 41//2*y20*y30,
-35*y8*y16 + 207//100*y9*y29 + 1//100*y15 - 1667//1000*y16*y22 - 9//25*y16 + 1000*y17 + 1//10*y23,
-5189//5*y17 + 378*y18*y22,
189//5*y17 - 378*y18*y22 - 179//200*y18 + 1//20*y19,
443//500*y18 - 1//20*y19,
-221//500*y11*y20 + 30*y11 + 39//2*y12*y15 + 57//2*y12*y31 + 10*y14 - 11//4*y15*y20 - 211//10*y20*y30 - 831//10*y20 + 18//25*y26*y31,
225*y11 - 50*y21,
-1667//1000*y16*y22 + 5189//5*y17 - 378*y18*y22 + 1//10*y23,
1667//1000*y16*y22 - 1//10*y23,
-1//2000*y24 + 3//100*y25,
-1//20*y4*y25 - 1//20*y5*y25 - 1//20*y6*y25 - 1//20*y7*y25 + 15//2*y20 + 1//2000*y24 - 103//100*y25,
3//5*y20*y30 - 18//25*y26*y31 - 81//5000*y26 + 1//20*y27,
-y4*y9*y27 + 86//5*y8*y28 + 81//5000*y26 - 19//125*y27 + 69//1000*y31,
y4*y9*y27 - 86//5*y8*y28 - 191//10000*y28 + 191//1000*y29,
35*y8*y16 - 207//100*y9*y29 + 191//10000*y28 - 191//1000*y29,
39//2*y12*y15 - 211//10*y20*y30 + 18//25*y26*y31,
-57//2*y12*y31 + 11//4*y15*y20 + 3//5*y20*y30 - 18//25*y26*y31 + 51//500*y27 - 69//1000*y31
]


