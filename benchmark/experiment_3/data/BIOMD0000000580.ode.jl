Original system:

[
p70S6K_pT389 => mTORC1_pS2448*p70S6K*p70S6K_T389_phosphorylation_by_mTORC1_pS2448,
PI3K_variant_phosphorylation_by_IR_beta_pY1146 => 0,
p70S6K_pT389_dephosphorylation => 0,
IR_beta_phosphorylation_by_Insulin => 0,
PRAS40_S183 => PRAS40_pS183*PRAS40_pS183_dephosphorylation,
AMPK_pT172 => AMPK*AMPK_T172_phosphorylation*IRS1_p,
IRS1_p => IRS1*IRS1_phosphorylation_by_IR_beta_pY1146*IR_beta_pY1146,
Insulin => 0,
Akt_T308_phosphorylation_by_IRS1_p => 0,
Akt_pS473_dephosphorylation => 0,
PRAS40_pS183 => PRAS40_S183*PRAS40_S183_phosphorylation_by_mTORC1_pS2448*mTORC1_pS2448,
IR_beta_ready => 0,
TSC1_TSC2_T1462_phosphorylation_by_Akt_pT308 => 0,
Akt_S473_phosphorylation_by_mTORC2_pS2481_n_IRS1_p => 0,
AMPK => AMPK_pT172*AMPK_pT172_dephosphorylation,
mTORC1 => TSC1_TSC2_pS1387*mTORC1_pS2448*mTORC1_pS2448_dephosphorylation_by_TSC1_TSC2_pS1387,
IRS1_pS636_dephosphorylation => 0,
IRS1_p_phosphorylation_by_p70S6K_pT389 => 0,
mTORC1_pS2448_dephosphorylation_by_TSC1_TSC2_pS1387 => 0,
mTORC2 => mTORC2_pS2481*mTORC2_pS2481_dephosphorylation,
TSC1_TSC2_S1387_phosphorylation_by_AMPK_pT172 => 0,
TSC1_TSC2_pS1387 => AMPK_pT172*TSC1_TSC2_S1387_phosphorylation_by_AMPK_pT172*TSC1_TSC2_pT1462,
mTORC2_pS2481 => PI3K_variant_p*mTORC2*mTORC2_S2481_phosphorylation_by_PI3K_variant_p,
mTORC2_S2481_phosphorylation_by_PI3K_variant_p => 0,
IRS1_phosphorylation_by_IR_beta_pY1146 => 0,
PRAS40_T246 => PRAS40_pT246*PRAS40_pT246_dephosphorylation,
PRAS40_T246_phosphorylation_by_Akt_pT308 => 0,
PRAS40_pS183_dephosphorylation => 0,
PI3K_variant_p => IR_beta_pY1146*PI3K_variant*PI3K_variant_phosphorylation_by_IR_beta_pY1146,
mTORC2_pS2481_dephosphorylation => 0,
Akt_T308 => Akt_pT308*Akt_pT308_dephosphorylation,
IRS1 => IRS1_pS636*IRS1_pS636_dephosphorylation,
AMPK_pT172_dephosphorylation => 0,
Amino_Acids => 0,
mTORC1_pS2448 => Amino_Acids*mTORC1*mTORC1_S2448_activation_by_Amino_Acids,
PRAS40_pT246 => Akt_pT308*PRAS40_T246*PRAS40_T246_phosphorylation_by_Akt_pT308,
AMPK_T172_phosphorylation => 0,
PI3K_variant => PI3K_variant_p*PI3K_variant_p_dephosphorylation,
PRAS40_pT246_dephosphorylation => 0,
Akt_S473 => Akt_pS473*Akt_pS473_dephosphorylation,
IR_beta_refractory => IR_beta_pY1146*IR_beta_pY1146_dephosphorylation,
IR_beta => IR_beta_ready*IR_beta_refractory,
mTORC1_S2448_activation_by_Amino_Acids => 0,
PI3K_variant_p_dephosphorylation => 0,
PRAS40_S183_phosphorylation_by_mTORC1_pS2448 => 0,
IR_beta_pY1146_dephosphorylation => 0,
p70S6K => p70S6K_pT389*p70S6K_pT389_dephosphorylation,
p70S6K_T389_phosphorylation_by_mTORC1_pS2448 => 0,
Akt_pS473 => Akt_S473*Akt_S473_phosphorylation_by_mTORC2_pS2481_n_IRS1_p*IRS1_p*mTORC2_pS2481,
IRS1_pS636 => IRS1_p*IRS1_p_phosphorylation_by_p70S6K_pT389*p70S6K_pT389,
IR_beta_pY1146 => IR_beta*IR_beta_phosphorylation_by_Insulin*Insulin,
Akt_pT308 => Akt_T308*Akt_T308_phosphorylation_by_IRS1_p*IRS1_p,
Akt_pT308_dephosphorylation => 0,
TSC1_TSC2_pT1462 => Akt_pT308*TSC1_TSC2_T1462_phosphorylation_by_Akt_pT308*TSC1_TSC2_pS1387
]

Reductions:


new_vars = fmpq_mpoly[AMPK_T172_phosphorylation]
new_system = 
[
0
]


new_vars = fmpq_mpoly[AMPK_T172_phosphorylation, AMPK_pT172_dephosphorylation]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phosphorylation, AMPK_pT172_dephosphorylation, Akt_T308_phosphorylation_by_IRS1_p]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phosphorylation, AMPK_pT172_dephosphorylation, Akt_T308_phosphorylation_by_IRS1_p, Akt_pT308_dephosphorylation]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phosphorylation, AMPK_pT172_dephosphorylation, Akt_T308_phosphorylation_by_IRS1_p, Akt_pT308_dephosphorylation, Amino_Acids]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phosphorylation, AMPK_pT172_dephosphorylation, Akt_T308_phosphorylation_by_IRS1_p, Akt_pT308_dephosphorylation, Amino_Acids, IRS1_pS636_dephosphorylation]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phosphorylation, AMPK_pT172_dephosphorylation, Akt_T308_phosphorylation_by_IRS1_p, Akt_pT308_dephosphorylation, Amino_Acids, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389]
new_system = 
[
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phosphorylation, AMPK_pT172_dephosphorylation, Akt_T308_phosphorylation_by_IRS1_p, Akt_pT308_dephosphorylation, Amino_Acids, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phosphorylation, AMPK_pT172_dephosphorylation, Akt_T308_phosphorylation_by_IRS1_p, Akt_pT308_dephosphorylation, Amino_Acids, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta_pY1146_dephosphorylation]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phosphorylation, AMPK_pT172_dephosphorylation, Akt_T308_phosphorylation_by_IRS1_p, Akt_pT308_dephosphorylation, Amino_Acids, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phosphorylation, AMPK_pT172_dephosphorylation, Akt_T308_phosphorylation_by_IRS1_p, Akt_pT308_dephosphorylation, Amino_Acids, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin, IR_beta_ready]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phosphorylation, AMPK_pT172_dephosphorylation, Akt_T308_phosphorylation_by_IRS1_p, Akt_pT308_dephosphorylation, Amino_Acids, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin, IR_beta_ready, Insulin]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phosphorylation, AMPK_pT172_dephosphorylation, Akt_T308_phosphorylation_by_IRS1_p, Akt_pT308_dephosphorylation, Amino_Acids, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin, IR_beta_ready, Insulin, TSC1_TSC2_S1387_phosphorylation_by_AMPK_pT172]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phosphorylation, AMPK_pT172_dephosphorylation, Akt_T308_phosphorylation_by_IRS1_p, Akt_pT308_dephosphorylation, Amino_Acids, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin, IR_beta_ready, Insulin, TSC1_TSC2_S1387_phosphorylation_by_AMPK_pT172, TSC1_TSC2_T1462_phosphorylation_by_Akt_pT308]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phosphorylation, AMPK_pT172_dephosphorylation, Akt_T308_phosphorylation_by_IRS1_p, Akt_pT308_dephosphorylation, Amino_Acids, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin, IR_beta_ready, Insulin, TSC1_TSC2_S1387_phosphorylation_by_AMPK_pT172, TSC1_TSC2_T1462_phosphorylation_by_Akt_pT308, mTORC1_S2448_activation_by_Amino_Acids]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phosphorylation, AMPK_pT172_dephosphorylation, Akt_T308_phosphorylation_by_IRS1_p, Akt_pT308_dephosphorylation, Amino_Acids, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin, IR_beta_ready, Insulin, TSC1_TSC2_S1387_phosphorylation_by_AMPK_pT172, TSC1_TSC2_T1462_phosphorylation_by_Akt_pT308, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448_dephosphorylation_by_TSC1_TSC2_pS1387]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phosphorylation, AMPK_pT172_dephosphorylation, Akt_T308_phosphorylation_by_IRS1_p, Akt_pT308_dephosphorylation, Amino_Acids, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin, IR_beta_ready, Insulin, TSC1_TSC2_S1387_phosphorylation_by_AMPK_pT172, TSC1_TSC2_T1462_phosphorylation_by_Akt_pT308, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448_dephosphorylation_by_TSC1_TSC2_pS1387, p70S6K_T389_phosphorylation_by_mTORC1_pS2448]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phosphorylation, AMPK_pT172_dephosphorylation, Akt_T308_phosphorylation_by_IRS1_p, Akt_pT308_dephosphorylation, Amino_Acids, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin, IR_beta_ready, Insulin, TSC1_TSC2_S1387_phosphorylation_by_AMPK_pT172, TSC1_TSC2_T1462_phosphorylation_by_Akt_pT308, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448_dephosphorylation_by_TSC1_TSC2_pS1387, p70S6K_T389_phosphorylation_by_mTORC1_pS2448, p70S6K_pT389_dephosphorylation]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phosphorylation, AMPK_pT172_dephosphorylation, Akt_T308_phosphorylation_by_IRS1_p, Akt_pT308_dephosphorylation, Amino_Acids, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, TSC1_TSC2_S1387_phosphorylation_by_AMPK_pT172, TSC1_TSC2_T1462_phosphorylation_by_Akt_pT308, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448_dephosphorylation_by_TSC1_TSC2_pS1387, p70S6K_T389_phosphorylation_by_mTORC1_pS2448, p70S6K_pT389_dephosphorylation]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
y13*y14,
y9*y12*y15,
0,
0,
0,
y10*y11,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK, AMPK_T172_phosphorylation, AMPK_pT172, AMPK_pT172_dephosphorylation, Akt_T308, Akt_T308_phosphorylation_by_IRS1_p, Akt_pT308, Akt_pT308_dephosphorylation, Amino_Acids, IRS1, IRS1_p, IRS1_pS636, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, TSC1_TSC2_S1387_phosphorylation_by_AMPK_pT172, TSC1_TSC2_T1462_phosphorylation_by_Akt_pT308, TSC1_TSC2_pS1387, TSC1_TSC2_pT1462, mTORC1, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448, mTORC1_pS2448_dephosphorylation_by_TSC1_TSC2_pS1387, p70S6K, p70S6K_T389_phosphorylation_by_mTORC1_pS2448, p70S6K_pT389, p70S6K_pT389_dephosphorylation]
new_system = 
[
y3*y4,
0,
y1*y2*y11,
0,
y7*y8,
0,
y5*y6*y11,
0,
0,
y12*y13,
y10*y15*y17,
y11*y14*y33,
0,
0,
0,
y20*y21,
y16*y19*y22,
0,
0,
0,
y17*y18,
0,
0,
0,
y3*y23*y26,
y7*y24*y25,
y25*y29*y30,
0,
y9*y27*y28,
0,
y33*y34,
0,
y29*y31*y32,
0
]


new_vars = fmpq_mpoly[AMPK, AMPK_T172_phosphorylation, AMPK_pT172, AMPK_pT172_dephosphorylation, Akt_S473_phosphorylation_by_mTORC2_pS2481_n_IRS1_p, Akt_T308, Akt_T308_phosphorylation_by_IRS1_p, Akt_pT308, Akt_pT308_dephosphorylation, Amino_Acids, IRS1, IRS1_p, IRS1_pS636, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, TSC1_TSC2_S1387_phosphorylation_by_AMPK_pT172, TSC1_TSC2_T1462_phosphorylation_by_Akt_pT308, TSC1_TSC2_pS1387, TSC1_TSC2_pT1462, mTORC1, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448, mTORC1_pS2448_dephosphorylation_by_TSC1_TSC2_pS1387, p70S6K, p70S6K_T389_phosphorylation_by_mTORC1_pS2448, p70S6K_pT389, p70S6K_pT389_dephosphorylation]
new_system = 
[
y3*y4,
0,
y1*y2*y12,
0,
0,
y8*y9,
0,
y6*y7*y12,
0,
0,
y13*y14,
y11*y16*y18,
y12*y15*y34,
0,
0,
0,
y21*y22,
y17*y20*y23,
0,
0,
0,
y18*y19,
0,
0,
0,
y3*y24*y27,
y8*y25*y26,
y26*y30*y31,
0,
y10*y28*y29,
0,
y34*y35,
0,
y30*y32*y33,
0
]


new_vars = fmpq_mpoly[AMPK, AMPK_T172_phosphorylation, AMPK_pT172, AMPK_pT172_dephosphorylation, Akt_S473_phosphorylation_by_mTORC2_pS2481_n_IRS1_p, Akt_T308, Akt_T308_phosphorylation_by_IRS1_p, Akt_pS473_dephosphorylation, Akt_pT308, Akt_pT308_dephosphorylation, Amino_Acids, IRS1, IRS1_p, IRS1_pS636, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, TSC1_TSC2_S1387_phosphorylation_by_AMPK_pT172, TSC1_TSC2_T1462_phosphorylation_by_Akt_pT308, TSC1_TSC2_pS1387, TSC1_TSC2_pT1462, mTORC1, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448, mTORC1_pS2448_dephosphorylation_by_TSC1_TSC2_pS1387, p70S6K, p70S6K_T389_phosphorylation_by_mTORC1_pS2448, p70S6K_pT389, p70S6K_pT389_dephosphorylation]
new_system = 
[
y3*y4,
0,
y1*y2*y13,
0,
0,
y9*y10,
0,
0,
y6*y7*y13,
0,
0,
y14*y15,
y12*y17*y19,
y13*y16*y35,
0,
0,
0,
y22*y23,
y18*y21*y24,
0,
0,
0,
y19*y20,
0,
0,
0,
y3*y25*y28,
y9*y26*y27,
y27*y31*y32,
0,
y11*y29*y30,
0,
y35*y36,
0,
y31*y33*y34,
0
]


new_vars = fmpq_mpoly[AMPK, AMPK_T172_phosphorylation, AMPK_pT172, AMPK_pT172_dephosphorylation, Akt_S473_phosphorylation_by_mTORC2_pS2481_n_IRS1_p, Akt_T308, Akt_T308_phosphorylation_by_IRS1_p, Akt_pS473_dephosphorylation, Akt_pT308, Akt_pT308_dephosphorylation, Amino_Acids, IRS1, IRS1_p, IRS1_pS636, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, PI3K_variant_p_dephosphorylation, TSC1_TSC2_S1387_phosphorylation_by_AMPK_pT172, TSC1_TSC2_T1462_phosphorylation_by_Akt_pT308, TSC1_TSC2_pS1387, TSC1_TSC2_pT1462, mTORC1, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448, mTORC1_pS2448_dephosphorylation_by_TSC1_TSC2_pS1387, p70S6K, p70S6K_T389_phosphorylation_by_mTORC1_pS2448, p70S6K_pT389, p70S6K_pT389_dephosphorylation]
new_system = 
[
y3*y4,
0,
y1*y2*y13,
0,
0,
y9*y10,
0,
0,
y6*y7*y13,
0,
0,
y14*y15,
y12*y17*y19,
y13*y16*y36,
0,
0,
0,
y22*y23,
y18*y21*y24,
0,
0,
0,
y19*y20,
0,
0,
0,
0,
y3*y26*y29,
y9*y27*y28,
y28*y32*y33,
0,
y11*y30*y31,
0,
y36*y37,
0,
y32*y34*y35,
0
]


new_vars = fmpq_mpoly[AMPK, AMPK_T172_phosphorylation, AMPK_pT172, AMPK_pT172_dephosphorylation, Akt_S473_phosphorylation_by_mTORC2_pS2481_n_IRS1_p, Akt_T308, Akt_T308_phosphorylation_by_IRS1_p, Akt_pS473_dephosphorylation, Akt_pT308, Akt_pT308_dephosphorylation, Amino_Acids, IRS1, IRS1_p, IRS1_pS636, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, PI3K_variant_p_dephosphorylation, PI3K_variant_phosphorylation_by_IR_beta_pY1146, TSC1_TSC2_S1387_phosphorylation_by_AMPK_pT172, TSC1_TSC2_T1462_phosphorylation_by_Akt_pT308, TSC1_TSC2_pS1387, TSC1_TSC2_pT1462, mTORC1, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448, mTORC1_pS2448_dephosphorylation_by_TSC1_TSC2_pS1387, p70S6K, p70S6K_T389_phosphorylation_by_mTORC1_pS2448, p70S6K_pT389, p70S6K_pT389_dephosphorylation]
new_system = 
[
y3*y4,
0,
y1*y2*y13,
0,
0,
y9*y10,
0,
0,
y6*y7*y13,
0,
0,
y14*y15,
y12*y17*y19,
y13*y16*y37,
0,
0,
0,
y22*y23,
y18*y21*y24,
0,
0,
0,
y19*y20,
0,
0,
0,
0,
0,
y3*y27*y30,
y9*y28*y29,
y29*y33*y34,
0,
y11*y31*y32,
0,
y37*y38,
0,
y33*y35*y36,
0
]


new_vars = fmpq_mpoly[AMPK, AMPK_T172_phosphorylation, AMPK_pT172, AMPK_pT172_dephosphorylation, Akt_S473_phosphorylation_by_mTORC2_pS2481_n_IRS1_p, Akt_T308, Akt_T308_phosphorylation_by_IRS1_p, Akt_pS473_dephosphorylation, Akt_pT308, Akt_pT308_dephosphorylation, Amino_Acids, IRS1, IRS1_p, IRS1_pS636, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, PI3K_variant_p_dephosphorylation, PI3K_variant_phosphorylation_by_IR_beta_pY1146, TSC1_TSC2_S1387_phosphorylation_by_AMPK_pT172, TSC1_TSC2_T1462_phosphorylation_by_Akt_pT308, TSC1_TSC2_pS1387, TSC1_TSC2_pT1462, mTORC1, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448, mTORC1_pS2448_dephosphorylation_by_TSC1_TSC2_pS1387, mTORC2_S2481_phosphorylation_by_PI3K_variant_p, p70S6K, p70S6K_T389_phosphorylation_by_mTORC1_pS2448, p70S6K_pT389, p70S6K_pT389_dephosphorylation]
new_system = 
[
y3*y4,
0,
y1*y2*y13,
0,
0,
y9*y10,
0,
0,
y6*y7*y13,
0,
0,
y14*y15,
y12*y17*y19,
y13*y16*y38,
0,
0,
0,
y22*y23,
y18*y21*y24,
0,
0,
0,
y19*y20,
0,
0,
0,
0,
0,
y3*y27*y30,
y9*y28*y29,
y29*y33*y34,
0,
y11*y31*y32,
0,
0,
y38*y39,
0,
y33*y36*y37,
0
]


new_vars = fmpq_mpoly[AMPK, AMPK_T172_phosphorylation, AMPK_pT172, AMPK_pT172_dephosphorylation, Akt_S473_phosphorylation_by_mTORC2_pS2481_n_IRS1_p, Akt_T308, Akt_T308_phosphorylation_by_IRS1_p, Akt_pS473_dephosphorylation, Akt_pT308, Akt_pT308_dephosphorylation, Amino_Acids, IRS1, IRS1_p, IRS1_pS636, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, PI3K_variant_p_dephosphorylation, PI3K_variant_phosphorylation_by_IR_beta_pY1146, TSC1_TSC2_S1387_phosphorylation_by_AMPK_pT172, TSC1_TSC2_T1462_phosphorylation_by_Akt_pT308, TSC1_TSC2_pS1387, TSC1_TSC2_pT1462, mTORC1, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448, mTORC1_pS2448_dephosphorylation_by_TSC1_TSC2_pS1387, mTORC2_S2481_phosphorylation_by_PI3K_variant_p, mTORC2_pS2481_dephosphorylation, p70S6K, p70S6K_T389_phosphorylation_by_mTORC1_pS2448, p70S6K_pT389, p70S6K_pT389_dephosphorylation]
new_system = 
[
y3*y4,
0,
y1*y2*y13,
0,
0,
y9*y10,
0,
0,
y6*y7*y13,
0,
0,
y14*y15,
y12*y17*y19,
y13*y16*y39,
0,
0,
0,
y22*y23,
y18*y21*y24,
0,
0,
0,
y19*y20,
0,
0,
0,
0,
0,
y3*y27*y30,
y9*y28*y29,
y29*y33*y34,
0,
y11*y31*y32,
0,
0,
0,
y39*y40,
0,
y33*y37*y38,
0
]


new_vars = fmpq_mpoly[AMPK, AMPK_T172_phosphorylation, AMPK_pT172, AMPK_pT172_dephosphorylation, Akt_S473_phosphorylation_by_mTORC2_pS2481_n_IRS1_p, Akt_T308, Akt_T308_phosphorylation_by_IRS1_p, Akt_pS473_dephosphorylation, Akt_pT308, Akt_pT308_dephosphorylation, Amino_Acids, IRS1, IRS1_p, IRS1_pS636, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, PI3K_variant, PI3K_variant_p, PI3K_variant_p_dephosphorylation, PI3K_variant_phosphorylation_by_IR_beta_pY1146, TSC1_TSC2_S1387_phosphorylation_by_AMPK_pT172, TSC1_TSC2_T1462_phosphorylation_by_Akt_pT308, TSC1_TSC2_pS1387, TSC1_TSC2_pT1462, mTORC1, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448, mTORC1_pS2448_dephosphorylation_by_TSC1_TSC2_pS1387, mTORC2_S2481_phosphorylation_by_PI3K_variant_p, mTORC2_pS2481_dephosphorylation, p70S6K, p70S6K_T389_phosphorylation_by_mTORC1_pS2448, p70S6K_pT389, p70S6K_pT389_dephosphorylation]
new_system = 
[
y3*y4,
0,
y1*y2*y13,
0,
0,
y9*y10,
0,
0,
y6*y7*y13,
0,
0,
y14*y15,
y12*y17*y19,
y13*y16*y41,
0,
0,
0,
y22*y23,
y18*y21*y24,
0,
0,
0,
y19*y20,
0,
y26*y27,
y19*y25*y28,
0,
0,
0,
0,
y3*y29*y32,
y9*y30*y31,
y31*y35*y36,
0,
y11*y33*y34,
0,
0,
0,
y41*y42,
0,
y35*y39*y40,
0
]


new_vars = fmpq_mpoly[AMPK, AMPK_T172_phosphorylation, AMPK_pT172, AMPK_pT172_dephosphorylation, Akt_S473_phosphorylation_by_mTORC2_pS2481_n_IRS1_p, Akt_T308, Akt_T308_phosphorylation_by_IRS1_p, Akt_pS473_dephosphorylation, Akt_pT308, Akt_pT308_dephosphorylation, Amino_Acids, IRS1, IRS1_p, IRS1_pS636, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, PI3K_variant, PI3K_variant_p, PI3K_variant_p_dephosphorylation, PI3K_variant_phosphorylation_by_IR_beta_pY1146, TSC1_TSC2_S1387_phosphorylation_by_AMPK_pT172, TSC1_TSC2_T1462_phosphorylation_by_Akt_pT308, TSC1_TSC2_pS1387, TSC1_TSC2_pT1462, mTORC1, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448, mTORC1_pS2448_dephosphorylation_by_TSC1_TSC2_pS1387, mTORC2, mTORC2_S2481_phosphorylation_by_PI3K_variant_p, mTORC2_pS2481, mTORC2_pS2481_dephosphorylation, p70S6K, p70S6K_T389_phosphorylation_by_mTORC1_pS2448, p70S6K_pT389, p70S6K_pT389_dephosphorylation]
new_system = 
[
y3*y4,
0,
y1*y2*y13,
0,
0,
y9*y10,
0,
0,
y6*y7*y13,
0,
0,
y14*y15,
y12*y17*y19,
y13*y16*y43,
0,
0,
0,
y22*y23,
y18*y21*y24,
0,
0,
0,
y19*y20,
0,
y26*y27,
y19*y25*y28,
0,
0,
0,
0,
y3*y29*y32,
y9*y30*y31,
y31*y35*y36,
0,
y11*y33*y34,
0,
y39*y40,
0,
y26*y37*y38,
0,
y43*y44,
0,
y35*y41*y42,
0
]


new_vars = fmpq_mpoly[AMPK, AMPK_T172_phosphorylation, AMPK_pT172, AMPK_pT172_dephosphorylation, Akt_S473, Akt_S473_phosphorylation_by_mTORC2_pS2481_n_IRS1_p, Akt_T308, Akt_T308_phosphorylation_by_IRS1_p, Akt_pS473, Akt_pS473_dephosphorylation, Akt_pT308, Akt_pT308_dephosphorylation, Amino_Acids, IRS1, IRS1_p, IRS1_pS636, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, PI3K_variant, PI3K_variant_p, PI3K_variant_p_dephosphorylation, PI3K_variant_phosphorylation_by_IR_beta_pY1146, TSC1_TSC2_S1387_phosphorylation_by_AMPK_pT172, TSC1_TSC2_T1462_phosphorylation_by_Akt_pT308, TSC1_TSC2_pS1387, TSC1_TSC2_pT1462, mTORC1, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448, mTORC1_pS2448_dephosphorylation_by_TSC1_TSC2_pS1387, mTORC2, mTORC2_S2481_phosphorylation_by_PI3K_variant_p, mTORC2_pS2481, mTORC2_pS2481_dephosphorylation, p70S6K, p70S6K_T389_phosphorylation_by_mTORC1_pS2448, p70S6K_pT389, p70S6K_pT389_dephosphorylation]
new_system = 
[
y3*y4,
0,
y1*y2*y15,
0,
y9*y10,
0,
y11*y12,
0,
y5*y6*y15*y41,
0,
y7*y8*y15,
0,
0,
y16*y17,
y14*y19*y21,
y15*y18*y45,
0,
0,
0,
y24*y25,
y20*y23*y26,
0,
0,
0,
y21*y22,
0,
y28*y29,
y21*y27*y30,
0,
0,
0,
0,
y3*y31*y34,
y11*y32*y33,
y33*y37*y38,
0,
y13*y35*y36,
0,
y41*y42,
0,
y28*y39*y40,
0,
y45*y46,
0,
y37*y43*y44,
0
]


new_vars = fmpq_mpoly[AMPK, AMPK_T172_phosphorylation, AMPK_pT172, AMPK_pT172_dephosphorylation, Akt_S473, Akt_S473_phosphorylation_by_mTORC2_pS2481_n_IRS1_p, Akt_T308, Akt_T308_phosphorylation_by_IRS1_p, Akt_pS473, Akt_pS473_dephosphorylation, Akt_pT308, Akt_pT308_dephosphorylation, Amino_Acids, IRS1, IRS1_p, IRS1_pS636, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, PI3K_variant, PI3K_variant_p, PI3K_variant_p_dephosphorylation, PI3K_variant_phosphorylation_by_IR_beta_pY1146, PRAS40_S183_phosphorylation_by_mTORC1_pS2448, TSC1_TSC2_S1387_phosphorylation_by_AMPK_pT172, TSC1_TSC2_T1462_phosphorylation_by_Akt_pT308, TSC1_TSC2_pS1387, TSC1_TSC2_pT1462, mTORC1, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448, mTORC1_pS2448_dephosphorylation_by_TSC1_TSC2_pS1387, mTORC2, mTORC2_S2481_phosphorylation_by_PI3K_variant_p, mTORC2_pS2481, mTORC2_pS2481_dephosphorylation, p70S6K, p70S6K_T389_phosphorylation_by_mTORC1_pS2448, p70S6K_pT389, p70S6K_pT389_dephosphorylation]
new_system = 
[
y3*y4,
0,
y1*y2*y15,
0,
y9*y10,
0,
y11*y12,
0,
y5*y6*y15*y42,
0,
y7*y8*y15,
0,
0,
y16*y17,
y14*y19*y21,
y15*y18*y46,
0,
0,
0,
y24*y25,
y20*y23*y26,
0,
0,
0,
y21*y22,
0,
y28*y29,
y21*y27*y30,
0,
0,
0,
0,
0,
y3*y32*y35,
y11*y33*y34,
y34*y38*y39,
0,
y13*y36*y37,
0,
y42*y43,
0,
y28*y40*y41,
0,
y46*y47,
0,
y38*y44*y45,
0
]


new_vars = fmpq_mpoly[AMPK, AMPK_T172_phosphorylation, AMPK_pT172, AMPK_pT172_dephosphorylation, Akt_S473, Akt_S473_phosphorylation_by_mTORC2_pS2481_n_IRS1_p, Akt_T308, Akt_T308_phosphorylation_by_IRS1_p, Akt_pS473, Akt_pS473_dephosphorylation, Akt_pT308, Akt_pT308_dephosphorylation, Amino_Acids, IRS1, IRS1_p, IRS1_pS636, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, PI3K_variant, PI3K_variant_p, PI3K_variant_p_dephosphorylation, PI3K_variant_phosphorylation_by_IR_beta_pY1146, PRAS40_S183_phosphorylation_by_mTORC1_pS2448, PRAS40_pS183_dephosphorylation, TSC1_TSC2_S1387_phosphorylation_by_AMPK_pT172, TSC1_TSC2_T1462_phosphorylation_by_Akt_pT308, TSC1_TSC2_pS1387, TSC1_TSC2_pT1462, mTORC1, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448, mTORC1_pS2448_dephosphorylation_by_TSC1_TSC2_pS1387, mTORC2, mTORC2_S2481_phosphorylation_by_PI3K_variant_p, mTORC2_pS2481, mTORC2_pS2481_dephosphorylation, p70S6K, p70S6K_T389_phosphorylation_by_mTORC1_pS2448, p70S6K_pT389, p70S6K_pT389_dephosphorylation]
new_system = 
[
y3*y4,
0,
y1*y2*y15,
0,
y9*y10,
0,
y11*y12,
0,
y5*y6*y15*y43,
0,
y7*y8*y15,
0,
0,
y16*y17,
y14*y19*y21,
y15*y18*y47,
0,
0,
0,
y24*y25,
y20*y23*y26,
0,
0,
0,
y21*y22,
0,
y28*y29,
y21*y27*y30,
0,
0,
0,
0,
0,
0,
y3*y33*y36,
y11*y34*y35,
y35*y39*y40,
0,
y13*y37*y38,
0,
y43*y44,
0,
y28*y41*y42,
0,
y47*y48,
0,
y39*y45*y46,
0
]


new_vars = fmpq_mpoly[AMPK, AMPK_T172_phosphorylation, AMPK_pT172, AMPK_pT172_dephosphorylation, Akt_S473, Akt_S473_phosphorylation_by_mTORC2_pS2481_n_IRS1_p, Akt_T308, Akt_T308_phosphorylation_by_IRS1_p, Akt_pS473, Akt_pS473_dephosphorylation, Akt_pT308, Akt_pT308_dephosphorylation, Amino_Acids, IRS1, IRS1_p, IRS1_pS636, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, PI3K_variant, PI3K_variant_p, PI3K_variant_p_dephosphorylation, PI3K_variant_phosphorylation_by_IR_beta_pY1146, PRAS40_S183, PRAS40_S183_phosphorylation_by_mTORC1_pS2448, PRAS40_pS183, PRAS40_pS183_dephosphorylation, TSC1_TSC2_S1387_phosphorylation_by_AMPK_pT172, TSC1_TSC2_T1462_phosphorylation_by_Akt_pT308, TSC1_TSC2_pS1387, TSC1_TSC2_pT1462, mTORC1, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448, mTORC1_pS2448_dephosphorylation_by_TSC1_TSC2_pS1387, mTORC2, mTORC2_S2481_phosphorylation_by_PI3K_variant_p, mTORC2_pS2481, mTORC2_pS2481_dephosphorylation, p70S6K, p70S6K_T389_phosphorylation_by_mTORC1_pS2448, p70S6K_pT389, p70S6K_pT389_dephosphorylation]
new_system = 
[
y3*y4,
0,
y1*y2*y15,
0,
y9*y10,
0,
y11*y12,
0,
y5*y6*y15*y45,
0,
y7*y8*y15,
0,
0,
y16*y17,
y14*y19*y21,
y15*y18*y49,
0,
0,
0,
y24*y25,
y20*y23*y26,
0,
0,
0,
y21*y22,
0,
y28*y29,
y21*y27*y30,
0,
0,
y33*y34,
0,
y31*y32*y41,
0,
0,
0,
y3*y35*y38,
y11*y36*y37,
y37*y41*y42,
0,
y13*y39*y40,
0,
y45*y46,
0,
y28*y43*y44,
0,
y49*y50,
0,
y41*y47*y48,
0
]


new_vars = fmpq_mpoly[AMPK, AMPK_T172_phosphorylation, AMPK_pT172, AMPK_pT172_dephosphorylation, Akt_S473, Akt_S473_phosphorylation_by_mTORC2_pS2481_n_IRS1_p, Akt_T308, Akt_T308_phosphorylation_by_IRS1_p, Akt_pS473, Akt_pS473_dephosphorylation, Akt_pT308, Akt_pT308_dephosphorylation, Amino_Acids, IRS1, IRS1_p, IRS1_pS636, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, PI3K_variant, PI3K_variant_p, PI3K_variant_p_dephosphorylation, PI3K_variant_phosphorylation_by_IR_beta_pY1146, PRAS40_S183, PRAS40_S183_phosphorylation_by_mTORC1_pS2448, PRAS40_T246_phosphorylation_by_Akt_pT308, PRAS40_pS183, PRAS40_pS183_dephosphorylation, TSC1_TSC2_S1387_phosphorylation_by_AMPK_pT172, TSC1_TSC2_T1462_phosphorylation_by_Akt_pT308, TSC1_TSC2_pS1387, TSC1_TSC2_pT1462, mTORC1, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448, mTORC1_pS2448_dephosphorylation_by_TSC1_TSC2_pS1387, mTORC2, mTORC2_S2481_phosphorylation_by_PI3K_variant_p, mTORC2_pS2481, mTORC2_pS2481_dephosphorylation, p70S6K, p70S6K_T389_phosphorylation_by_mTORC1_pS2448, p70S6K_pT389, p70S6K_pT389_dephosphorylation]
new_system = 
[
y3*y4,
0,
y1*y2*y15,
0,
y9*y10,
0,
y11*y12,
0,
y5*y6*y15*y46,
0,
y7*y8*y15,
0,
0,
y16*y17,
y14*y19*y21,
y15*y18*y50,
0,
0,
0,
y24*y25,
y20*y23*y26,
0,
0,
0,
y21*y22,
0,
y28*y29,
y21*y27*y30,
0,
0,
y34*y35,
0,
0,
y31*y32*y42,
0,
0,
0,
y3*y36*y39,
y11*y37*y38,
y38*y42*y43,
0,
y13*y40*y41,
0,
y46*y47,
0,
y28*y44*y45,
0,
y50*y51,
0,
y42*y48*y49,
0
]


new_vars = fmpq_mpoly[AMPK, AMPK_T172_phosphorylation, AMPK_pT172, AMPK_pT172_dephosphorylation, Akt_S473, Akt_S473_phosphorylation_by_mTORC2_pS2481_n_IRS1_p, Akt_T308, Akt_T308_phosphorylation_by_IRS1_p, Akt_pS473, Akt_pS473_dephosphorylation, Akt_pT308, Akt_pT308_dephosphorylation, Amino_Acids, IRS1, IRS1_p, IRS1_pS636, IRS1_pS636_dephosphorylation, IRS1_p_phosphorylation_by_p70S6K_pT389, IRS1_phosphorylation_by_IR_beta_pY1146, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephosphorylation, IR_beta_phosphorylation_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, PI3K_variant, PI3K_variant_p, PI3K_variant_p_dephosphorylation, PI3K_variant_phosphorylation_by_IR_beta_pY1146, PRAS40_S183, PRAS40_S183_phosphorylation_by_mTORC1_pS2448, PRAS40_T246_phosphorylation_by_Akt_pT308, PRAS40_pS183, PRAS40_pS183_dephosphorylation, PRAS40_pT246_dephosphorylation, TSC1_TSC2_S1387_phosphorylation_by_AMPK_pT172, TSC1_TSC2_T1462_phosphorylation_by_Akt_pT308, TSC1_TSC2_pS1387, TSC1_TSC2_pT1462, mTORC1, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448, mTORC1_pS2448_dephosphorylation_by_TSC1_TSC2_pS1387, mTORC2, mTORC2_S2481_phosphorylation_by_PI3K_variant_p, mTORC2_pS2481, mTORC2_pS2481_dephosphorylation, p70S6K, p70S6K_T389_phosphorylation_by_mTORC1_pS2448, p70S6K_pT389, p70S6K_pT389_dephosphorylation]
new_system = 
[
y3*y4,
0,
y1*y2*y15,
0,
y9*y10,
0,
y11*y12,
0,
y5*y6*y15*y47,
0,
y7*y8*y15,
0,
0,
y16*y17,
y14*y19*y21,
y15*y18*y51,
0,
0,
0,
y24*y25,
y20*y23*y26,
0,
0,
0,
y21*y22,
0,
y28*y29,
y21*y27*y30,
0,
0,
y34*y35,
0,
0,
y31*y32*y43,
0,
0,
0,
0,
y3*y37*y40,
y11*y38*y39,
y39*y43*y44,
0,
y13*y41*y42,
0,
y47*y48,
0,
y28*y45*y46,
0,
y51*y52,
0,
y43*y49*y50,
0
]


