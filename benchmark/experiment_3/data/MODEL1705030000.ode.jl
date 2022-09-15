Original system:

[
p70_S6K_pT389_dephos => 0,
IR_beta_ready => 0,
Akt_T308_phos_by_PI3K_p_PDK1_first => 0,
Akt_pS473 => Akt*Akt_S473_phos_by_mTORC2_pS2481_first*mTORC2_pS2481 + Akt_pT308_dephos_second*Akt_pT308_pS473,
PRAS40_pT246 => Akt_pT308*PRAS40*PRAS40_T246_phos_by_Akt_pT308_first + Akt_pT308_pS473*PRAS40*PRAS40_T246_phos_by_Akt_pT308_first + PRAS40_pS183_dephos_second*PRAS40_pT246_pS183,
Akt_pT308_pS473 => Akt_S473_phos_by_mTORC2_pS2481_second*Akt_pT308*mTORC2_pS2481 + Akt_T308_phos_by_PI3K_p_PDK1_second*Akt_pS473*PI3K_p_PDK1,
PRAS40_pS183_dephos_second => 0,
p70_S6K_T389_phos_by_mTORC1_pS2448 => 0,
PRAS40 => PRAS40_pS183*PRAS40_pS183_dephos_first + PRAS40_pT246*PRAS40_pT246_dephos_first,
Akt_S473_phos_by_mTORC2_pS2481_first => 0,
Akt_pT308_dephos_second => 0,
PRAS40_pT246_pS183 => Akt_pT308*PRAS40_T246_phos_by_Akt_pT308_second*PRAS40_pS183 + Akt_pT308_pS473*PRAS40_T246_phos_by_Akt_pT308_second*PRAS40_pS183 + PRAS40_S183_phos_by_mTORC1_pS2448_second*PRAS40_pT246*mTORC1_pS2448,
TSC1_TSC2 => TSC1_TSC2_pS1387*TSC1_TSC2_pS1387_dephos + TSC1_TSC2_pT1462*TSC1_TSC2_pT1462_dephos,
IR_beta_pY1146_dephos => 0,
Akt_S473_phos_by_mTORC2_pS2481_second => 0,
PRAS40_pS183_dephos_first => 0,
p70_S6K_pT389 => mTORC1_pS2448*p70_S6K*p70_S6K_T389_phos_by_mTORC1_pS2448,
IRS => IRS_pS636*IRS_pS636_turnover,
IR_beta_phos_by_Insulin => 0,
mTORC1_pS2448_dephos_by_TSC1_TSC2 => 0,
PI3K_variant_p_dephos => 0,
AMPK_pT172_dephos => 0,
Amino_Acids => 0,
mTORC1_pS2448 => Amino_Acids*mTORC1*mTORC1_S2448_activation_by_Amino_Acids,
PRAS40_S183_phos_by_mTORC1_pS2448_second => 0,
IR_beta => IR_beta_ready*IR_beta_refractory,
IR_beta_refractory => IR_beta_pY1146*IR_beta_pY1146_dephos,
TSC1_TSC2_pT1462 => Akt_pT308*TSC1_TSC2*TSC1_TSC2_T1462_phos_by_Akt_pT308 + Akt_pT308_pS473*TSC1_TSC2*TSC1_TSC2_T1462_phos_by_Akt_pT308,
IRS_p_phos_by_p70_S6K_pT389 => 0,
IRS_pS636 => IRS*IRS_phos_by_p70_S6K_pT389*p70_S6K_pT389 + IRS_p*IRS_p_phos_by_p70_S6K_pT389*p70_S6K_pT389,
TSC1_TSC2_pS1387 => AMPK_pT172*TSC1_TSC2*TSC1_TSC2_S1387_phos_by_AMPK_pT172,
mTORC2 => mTORC2_pS2481*mTORC2_pS2481_dephos,
p70_S6K => p70_S6K_pT389*p70_S6K_pT389_dephos,
Akt_pS473_dephos_first => 0,
Insulin => 0,
PRAS40_pT246_dephos_first => 0,
PI3K_PDK1_phos_by_IRS_p => 0,
AMPK_T172_phos => 0,
Akt_pT308_dephos_first => 0,
mTORC2_pS2481 => PI3K_variant_p*mTORC2*mTORC2_S2481_phos_by_PI3K_variant_p,
PI3K_p_PDK1 => IRS_p*PI3K_PDK1*PI3K_PDK1_phos_by_IRS_p,
AMPK_pT172 => AMPK*AMPK_T172_phos*IRS_p,
mTORC1 => TSC1_TSC2*mTORC1_pS2448*mTORC1_pS2448_dephos_by_TSC1_TSC2 + TSC1_TSC2_pS1387*mTORC1_pS2448*mTORC1_pS2448_dephos_by_TSC1_TSC2,
Akt_pS473_dephos_second => 0,
PI3K_PDK1 => PI3K_p_PDK1*PI3K_p_PDK1_dephos,
mTORC1_S2448_activation_by_Amino_Acids => 0,
mTORC2_pS2481_dephos => 0,
IRS_phos_by_IR_beta_pY1146 => 0,
PI3K_variant => PI3K_variant_p*PI3K_variant_p_dephos,
PRAS40_T246_phos_by_Akt_pT308_second => 0,
Akt_T308_phos_by_PI3K_p_PDK1_second => 0,
Akt => Akt_pS473*Akt_pS473_dephos_first + Akt_pT308*Akt_pT308_dephos_first,
PRAS40_S183_phos_by_mTORC1_pS2448_first => 0,
TSC1_TSC2_T1462_phos_by_Akt_pT308 => 0,
PI3K_variant_p => IR_beta_pY1146*PI3K_variant*PI3K_variant_phos_by_IR_beta_pY1146,
PRAS40_pT246_dephos_second => 0,
IR_beta_pY1146 => IR_beta*IR_beta_phos_by_Insulin*Insulin,
TSC1_TSC2_S1387_phos_by_AMPK_pT172 => 0,
IRS_phos_by_p70_S6K_pT389 => 0,
TSC1_TSC2_pS1387_dephos => 0,
PI3K_variant_phos_by_IR_beta_pY1146 => 0,
PRAS40_T246_phos_by_Akt_pT308_first => 0,
mTORC2_S2481_phos_by_PI3K_variant_p => 0,
IRS_pS636_turnover => 0,
TSC1_TSC2_pT1462_dephos => 0,
PI3K_p_PDK1_dephos => 0,
PRAS40_pS183 => PRAS40*PRAS40_S183_phos_by_mTORC1_pS2448_first*mTORC1_pS2448 + PRAS40_pT246_dephos_second*PRAS40_pT246_pS183,
Akt_pT308 => Akt*Akt_T308_phos_by_PI3K_p_PDK1_first*PI3K_p_PDK1 + Akt_pS473_dephos_second*Akt_pT308_pS473,
AMPK => AMPK_pT172*AMPK_pT172_dephos,
IRS_p => IRS*IRS_phos_by_IR_beta_pY1146*IR_beta_pY1146
]

Reductions:


new_vars = fmpq_mpoly[AMPK_T172_phos]
new_system = 
[
0
]


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first]
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


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second]
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


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first]
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


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second]
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


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids]
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


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover]
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


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389]
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


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146]
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


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389]
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


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta_pY1146_dephos]
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


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin]
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


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready]
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


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, Insulin]
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
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, Insulin, PI3K_PDK1_phos_by_IRS_p]
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
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, Insulin, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1_dephos]
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
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, Insulin, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1_dephos, PI3K_variant_p_dephos]
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
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, Insulin, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1_dephos, PI3K_variant_p_dephos, PI3K_variant_phos_by_IR_beta_pY1146]
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
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, Insulin, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1_dephos, PI3K_variant_p_dephos, PI3K_variant_phos_by_IR_beta_pY1146, TSC1_TSC2_S1387_phos_by_AMPK_pT172]
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
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, Insulin, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1_dephos, PI3K_variant_p_dephos, PI3K_variant_phos_by_IR_beta_pY1146, TSC1_TSC2_S1387_phos_by_AMPK_pT172, TSC1_TSC2_T1462_phos_by_Akt_pT308]
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
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, Insulin, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1_dephos, PI3K_variant_p_dephos, PI3K_variant_phos_by_IR_beta_pY1146, TSC1_TSC2_S1387_phos_by_AMPK_pT172, TSC1_TSC2_T1462_phos_by_Akt_pT308, TSC1_TSC2_pS1387_dephos]
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


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, Insulin, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1_dephos, PI3K_variant_p_dephos, PI3K_variant_phos_by_IR_beta_pY1146, TSC1_TSC2_S1387_phos_by_AMPK_pT172, TSC1_TSC2_T1462_phos_by_Akt_pT308, TSC1_TSC2_pS1387_dephos, TSC1_TSC2_pT1462_dephos]
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


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, Insulin, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1_dephos, PI3K_variant_p_dephos, PI3K_variant_phos_by_IR_beta_pY1146, TSC1_TSC2_S1387_phos_by_AMPK_pT172, TSC1_TSC2_T1462_phos_by_Akt_pT308, TSC1_TSC2_pS1387_dephos, TSC1_TSC2_pT1462_dephos, mTORC1_S2448_activation_by_Amino_Acids]
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


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, Insulin, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1_dephos, PI3K_variant_p_dephos, PI3K_variant_phos_by_IR_beta_pY1146, TSC1_TSC2_S1387_phos_by_AMPK_pT172, TSC1_TSC2_T1462_phos_by_Akt_pT308, TSC1_TSC2_pS1387_dephos, TSC1_TSC2_pT1462_dephos, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448_dephos_by_TSC1_TSC2]
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


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, Insulin, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1_dephos, PI3K_variant_p_dephos, PI3K_variant_phos_by_IR_beta_pY1146, TSC1_TSC2_S1387_phos_by_AMPK_pT172, TSC1_TSC2_T1462_phos_by_Akt_pT308, TSC1_TSC2_pS1387_dephos, TSC1_TSC2_pT1462_dephos, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448_dephos_by_TSC1_TSC2, mTORC2_S2481_phos_by_PI3K_variant_p]
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


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, Insulin, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1_dephos, PI3K_variant_p_dephos, PI3K_variant_phos_by_IR_beta_pY1146, TSC1_TSC2_S1387_phos_by_AMPK_pT172, TSC1_TSC2_T1462_phos_by_Akt_pT308, TSC1_TSC2_pS1387_dephos, TSC1_TSC2_pT1462_dephos, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448_dephos_by_TSC1_TSC2, mTORC2_S2481_phos_by_PI3K_variant_p, mTORC2_pS2481_dephos]
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


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, Insulin, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1_dephos, PI3K_variant_p_dephos, PI3K_variant_phos_by_IR_beta_pY1146, TSC1_TSC2_S1387_phos_by_AMPK_pT172, TSC1_TSC2_T1462_phos_by_Akt_pT308, TSC1_TSC2_pS1387_dephos, TSC1_TSC2_pT1462_dephos, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448_dephos_by_TSC1_TSC2, mTORC2_S2481_phos_by_PI3K_variant_p, mTORC2_pS2481_dephos, p70_S6K_T389_phos_by_mTORC1_pS2448]
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


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, Insulin, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1_dephos, PI3K_variant_p_dephos, PI3K_variant_phos_by_IR_beta_pY1146, TSC1_TSC2_S1387_phos_by_AMPK_pT172, TSC1_TSC2_T1462_phos_by_Akt_pT308, TSC1_TSC2_pS1387_dephos, TSC1_TSC2_pT1462_dephos, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448_dephos_by_TSC1_TSC2, mTORC2_S2481_phos_by_PI3K_variant_p, mTORC2_pS2481_dephos, p70_S6K_T389_phos_by_mTORC1_pS2448, p70_S6K_pT389_dephos]
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


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1_dephos, PI3K_variant_p_dephos, PI3K_variant_phos_by_IR_beta_pY1146, TSC1_TSC2_S1387_phos_by_AMPK_pT172, TSC1_TSC2_T1462_phos_by_Akt_pT308, TSC1_TSC2_pS1387_dephos, TSC1_TSC2_pT1462_dephos, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448_dephos_by_TSC1_TSC2, mTORC2_S2481_phos_by_PI3K_variant_p, mTORC2_pS2481_dephos, p70_S6K_T389_phos_by_mTORC1_pS2448, p70_S6K_pT389_dephos]
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
y20*y21,
y16*y19*y22,
0,
0,
0,
y17*y18,
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


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1_dephos, PI3K_variant, PI3K_variant_p, PI3K_variant_p_dephos, PI3K_variant_phos_by_IR_beta_pY1146, TSC1_TSC2_S1387_phos_by_AMPK_pT172, TSC1_TSC2_T1462_phos_by_Akt_pT308, TSC1_TSC2_pS1387_dephos, TSC1_TSC2_pT1462_dephos, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448_dephos_by_TSC1_TSC2, mTORC2_S2481_phos_by_PI3K_variant_p, mTORC2_pS2481_dephos, p70_S6K_T389_phos_by_mTORC1_pS2448, p70_S6K_pT389_dephos]
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
y20*y21,
y16*y19*y22,
0,
0,
0,
y17*y18,
0,
0,
0,
y26*y27,
y17*y25*y28,
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


new_vars = fmpq_mpoly[AMPK_T172_phos, AMPK_pT172_dephos, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Amino_Acids, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1_dephos, PI3K_variant, PI3K_variant_p, PI3K_variant_p_dephos, PI3K_variant_phos_by_IR_beta_pY1146, TSC1_TSC2_S1387_phos_by_AMPK_pT172, TSC1_TSC2_T1462_phos_by_Akt_pT308, TSC1_TSC2_pS1387_dephos, TSC1_TSC2_pT1462_dephos, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448_dephos_by_TSC1_TSC2, mTORC2, mTORC2_S2481_phos_by_PI3K_variant_p, mTORC2_pS2481, mTORC2_pS2481_dephos, p70_S6K_T389_phos_by_mTORC1_pS2448, p70_S6K_pT389_dephos]
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
y20*y21,
y16*y19*y22,
0,
0,
0,
y17*y18,
0,
0,
0,
y26*y27,
y17*y25*y28,
0,
0,
0,
0,
0,
0,
0,
0,
y37*y38,
0,
y26*y35*y36,
0,
0,
0
]


new_vars = fmpq_mpoly[AMPK, AMPK_T172_phos, AMPK_pT172, AMPK_pT172_dephos, Akt, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Akt_pT308_pS473, Amino_Acids, IRS, IRS_p, IRS_pS636, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, PI3K_PDK1, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1, PI3K_p_PDK1_dephos, PI3K_variant, PI3K_variant_p, PI3K_variant_p_dephos, PI3K_variant_phos_by_IR_beta_pY1146, TSC1_TSC2, TSC1_TSC2_S1387_phos_by_AMPK_pT172, TSC1_TSC2_T1462_phos_by_Akt_pT308, TSC1_TSC2_pS1387, TSC1_TSC2_pS1387_dephos, TSC1_TSC2_pT1462, TSC1_TSC2_pT1462_dephos, mTORC1, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448, mTORC1_pS2448_dephos_by_TSC1_TSC2, mTORC2, mTORC2_S2481_phos_by_PI3K_variant_p, mTORC2_pS2481, mTORC2_pS2481_dephos, p70_S6K, p70_S6K_T389_phos_by_mTORC1_pS2448, p70_S6K_pT389, p70_S6K_pT389_dephos]
new_system = 
[
y3*y4,
0,
y1*y2*y19,
0,
y10*y11 + y13*y14,
0,
0,
0,
0,
y5*y6*y53 + y15*y16,
0,
0,
y5*y8*y34 + y12*y16,
0,
0,
y7*y13*y53 + y9*y10*y34,
0,
y20*y21,
y18*y23*y26,
y18*y24*y57 + y19*y22*y57,
0,
0,
0,
0,
y29*y30,
y25*y28*y31,
0,
0,
0,
y26*y27,
0,
y34*y35,
0,
y19*y32*y33,
0,
y37*y38,
y26*y36*y39,
0,
0,
y43*y44 + y45*y46,
0,
0,
y3*y40*y41,
0,
y13*y40*y42 + y16*y40*y42,
0,
y40*y49*y50 + y43*y49*y50,
0,
y17*y47*y48,
0,
y53*y54,
0,
y37*y51*y52,
0,
y57*y58,
0,
y49*y55*y56,
0
]


new_vars = fmpq_mpoly[AMPK, AMPK_T172_phos, AMPK_pT172, AMPK_pT172_dephos, Akt, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Akt_pT308_pS473, Amino_Acids, IRS, IRS_p, IRS_pS636, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, PI3K_PDK1, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1, PI3K_p_PDK1_dephos, PI3K_variant, PI3K_variant_p, PI3K_variant_p_dephos, PI3K_variant_phos_by_IR_beta_pY1146, PRAS40_S183_phos_by_mTORC1_pS2448_first, TSC1_TSC2, TSC1_TSC2_S1387_phos_by_AMPK_pT172, TSC1_TSC2_T1462_phos_by_Akt_pT308, TSC1_TSC2_pS1387, TSC1_TSC2_pS1387_dephos, TSC1_TSC2_pT1462, TSC1_TSC2_pT1462_dephos, mTORC1, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448, mTORC1_pS2448_dephos_by_TSC1_TSC2, mTORC2, mTORC2_S2481_phos_by_PI3K_variant_p, mTORC2_pS2481, mTORC2_pS2481_dephos, p70_S6K, p70_S6K_T389_phos_by_mTORC1_pS2448, p70_S6K_pT389, p70_S6K_pT389_dephos]
new_system = 
[
y3*y4,
0,
y1*y2*y19,
0,
y10*y11 + y13*y14,
0,
0,
0,
0,
y5*y6*y54 + y15*y16,
0,
0,
y5*y8*y34 + y12*y16,
0,
0,
y7*y13*y54 + y9*y10*y34,
0,
y20*y21,
y18*y23*y26,
y18*y24*y58 + y19*y22*y58,
0,
0,
0,
0,
y29*y30,
y25*y28*y31,
0,
0,
0,
y26*y27,
0,
y34*y35,
0,
y19*y32*y33,
0,
y37*y38,
y26*y36*y39,
0,
0,
0,
y44*y45 + y46*y47,
0,
0,
y3*y41*y42,
0,
y13*y41*y43 + y16*y41*y43,
0,
y41*y50*y51 + y44*y50*y51,
0,
y17*y48*y49,
0,
y54*y55,
0,
y37*y52*y53,
0,
y58*y59,
0,
y50*y56*y57,
0
]


new_vars = fmpq_mpoly[AMPK, AMPK_T172_phos, AMPK_pT172, AMPK_pT172_dephos, Akt, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Akt_pT308_pS473, Amino_Acids, IRS, IRS_p, IRS_pS636, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, PI3K_PDK1, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1, PI3K_p_PDK1_dephos, PI3K_variant, PI3K_variant_p, PI3K_variant_p_dephos, PI3K_variant_phos_by_IR_beta_pY1146, PRAS40_S183_phos_by_mTORC1_pS2448_first, PRAS40_S183_phos_by_mTORC1_pS2448_second, TSC1_TSC2, TSC1_TSC2_S1387_phos_by_AMPK_pT172, TSC1_TSC2_T1462_phos_by_Akt_pT308, TSC1_TSC2_pS1387, TSC1_TSC2_pS1387_dephos, TSC1_TSC2_pT1462, TSC1_TSC2_pT1462_dephos, mTORC1, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448, mTORC1_pS2448_dephos_by_TSC1_TSC2, mTORC2, mTORC2_S2481_phos_by_PI3K_variant_p, mTORC2_pS2481, mTORC2_pS2481_dephos, p70_S6K, p70_S6K_T389_phos_by_mTORC1_pS2448, p70_S6K_pT389, p70_S6K_pT389_dephos]
new_system = 
[
y3*y4,
0,
y1*y2*y19,
0,
y10*y11 + y13*y14,
0,
0,
0,
0,
y5*y6*y55 + y15*y16,
0,
0,
y5*y8*y34 + y12*y16,
0,
0,
y7*y13*y55 + y9*y10*y34,
0,
y20*y21,
y18*y23*y26,
y18*y24*y59 + y19*y22*y59,
0,
0,
0,
0,
y29*y30,
y25*y28*y31,
0,
0,
0,
y26*y27,
0,
y34*y35,
0,
y19*y32*y33,
0,
y37*y38,
y26*y36*y39,
0,
0,
0,
0,
y45*y46 + y47*y48,
0,
0,
y3*y42*y43,
0,
y13*y42*y44 + y16*y42*y44,
0,
y42*y51*y52 + y45*y51*y52,
0,
y17*y49*y50,
0,
y55*y56,
0,
y37*y53*y54,
0,
y59*y60,
0,
y51*y57*y58,
0
]


new_vars = fmpq_mpoly[AMPK, AMPK_T172_phos, AMPK_pT172, AMPK_pT172_dephos, Akt, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Akt_pT308_pS473, Amino_Acids, IRS, IRS_p, IRS_pS636, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, PI3K_PDK1, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1, PI3K_p_PDK1_dephos, PI3K_variant, PI3K_variant_p, PI3K_variant_p_dephos, PI3K_variant_phos_by_IR_beta_pY1146, PRAS40_S183_phos_by_mTORC1_pS2448_first, PRAS40_S183_phos_by_mTORC1_pS2448_second, PRAS40_T246_phos_by_Akt_pT308_first, TSC1_TSC2, TSC1_TSC2_S1387_phos_by_AMPK_pT172, TSC1_TSC2_T1462_phos_by_Akt_pT308, TSC1_TSC2_pS1387, TSC1_TSC2_pS1387_dephos, TSC1_TSC2_pT1462, TSC1_TSC2_pT1462_dephos, mTORC1, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448, mTORC1_pS2448_dephos_by_TSC1_TSC2, mTORC2, mTORC2_S2481_phos_by_PI3K_variant_p, mTORC2_pS2481, mTORC2_pS2481_dephos, p70_S6K, p70_S6K_T389_phos_by_mTORC1_pS2448, p70_S6K_pT389, p70_S6K_pT389_dephos]
new_system = 
[
y3*y4,
0,
y1*y2*y19,
0,
y10*y11 + y13*y14,
0,
0,
0,
0,
y5*y6*y56 + y15*y16,
0,
0,
y5*y8*y34 + y12*y16,
0,
0,
y7*y13*y56 + y9*y10*y34,
0,
y20*y21,
y18*y23*y26,
y18*y24*y60 + y19*y22*y60,
0,
0,
0,
0,
y29*y30,
y25*y28*y31,
0,
0,
0,
y26*y27,
0,
y34*y35,
0,
y19*y32*y33,
0,
y37*y38,
y26*y36*y39,
0,
0,
0,
0,
0,
y46*y47 + y48*y49,
0,
0,
y3*y43*y44,
0,
y13*y43*y45 + y16*y43*y45,
0,
y43*y52*y53 + y46*y52*y53,
0,
y17*y50*y51,
0,
y56*y57,
0,
y37*y54*y55,
0,
y60*y61,
0,
y52*y58*y59,
0
]


new_vars = fmpq_mpoly[AMPK, AMPK_T172_phos, AMPK_pT172, AMPK_pT172_dephos, Akt, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Akt_pT308_pS473, Amino_Acids, IRS, IRS_p, IRS_pS636, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, PI3K_PDK1, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1, PI3K_p_PDK1_dephos, PI3K_variant, PI3K_variant_p, PI3K_variant_p_dephos, PI3K_variant_phos_by_IR_beta_pY1146, PRAS40_S183_phos_by_mTORC1_pS2448_first, PRAS40_S183_phos_by_mTORC1_pS2448_second, PRAS40_T246_phos_by_Akt_pT308_first, PRAS40_T246_phos_by_Akt_pT308_second, TSC1_TSC2, TSC1_TSC2_S1387_phos_by_AMPK_pT172, TSC1_TSC2_T1462_phos_by_Akt_pT308, TSC1_TSC2_pS1387, TSC1_TSC2_pS1387_dephos, TSC1_TSC2_pT1462, TSC1_TSC2_pT1462_dephos, mTORC1, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448, mTORC1_pS2448_dephos_by_TSC1_TSC2, mTORC2, mTORC2_S2481_phos_by_PI3K_variant_p, mTORC2_pS2481, mTORC2_pS2481_dephos, p70_S6K, p70_S6K_T389_phos_by_mTORC1_pS2448, p70_S6K_pT389, p70_S6K_pT389_dephos]
new_system = 
[
y3*y4,
0,
y1*y2*y19,
0,
y10*y11 + y13*y14,
0,
0,
0,
0,
y5*y6*y57 + y15*y16,
0,
0,
y5*y8*y34 + y12*y16,
0,
0,
y7*y13*y57 + y9*y10*y34,
0,
y20*y21,
y18*y23*y26,
y18*y24*y61 + y19*y22*y61,
0,
0,
0,
0,
y29*y30,
y25*y28*y31,
0,
0,
0,
y26*y27,
0,
y34*y35,
0,
y19*y32*y33,
0,
y37*y38,
y26*y36*y39,
0,
0,
0,
0,
0,
0,
y47*y48 + y49*y50,
0,
0,
y3*y44*y45,
0,
y13*y44*y46 + y16*y44*y46,
0,
y44*y53*y54 + y47*y53*y54,
0,
y17*y51*y52,
0,
y57*y58,
0,
y37*y55*y56,
0,
y61*y62,
0,
y53*y59*y60,
0
]


new_vars = fmpq_mpoly[AMPK, AMPK_T172_phos, AMPK_pT172, AMPK_pT172_dephos, Akt, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Akt_pT308_pS473, Amino_Acids, IRS, IRS_p, IRS_pS636, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, PI3K_PDK1, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1, PI3K_p_PDK1_dephos, PI3K_variant, PI3K_variant_p, PI3K_variant_p_dephos, PI3K_variant_phos_by_IR_beta_pY1146, PRAS40_S183_phos_by_mTORC1_pS2448_first, PRAS40_S183_phos_by_mTORC1_pS2448_second, PRAS40_T246_phos_by_Akt_pT308_first, PRAS40_T246_phos_by_Akt_pT308_second, PRAS40_pS183_dephos_first, TSC1_TSC2, TSC1_TSC2_S1387_phos_by_AMPK_pT172, TSC1_TSC2_T1462_phos_by_Akt_pT308, TSC1_TSC2_pS1387, TSC1_TSC2_pS1387_dephos, TSC1_TSC2_pT1462, TSC1_TSC2_pT1462_dephos, mTORC1, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448, mTORC1_pS2448_dephos_by_TSC1_TSC2, mTORC2, mTORC2_S2481_phos_by_PI3K_variant_p, mTORC2_pS2481, mTORC2_pS2481_dephos, p70_S6K, p70_S6K_T389_phos_by_mTORC1_pS2448, p70_S6K_pT389, p70_S6K_pT389_dephos]
new_system = 
[
y3*y4,
0,
y1*y2*y19,
0,
y10*y11 + y13*y14,
0,
0,
0,
0,
y5*y6*y58 + y15*y16,
0,
0,
y5*y8*y34 + y12*y16,
0,
0,
y7*y13*y58 + y9*y10*y34,
0,
y20*y21,
y18*y23*y26,
y18*y24*y62 + y19*y22*y62,
0,
0,
0,
0,
y29*y30,
y25*y28*y31,
0,
0,
0,
y26*y27,
0,
y34*y35,
0,
y19*y32*y33,
0,
y37*y38,
y26*y36*y39,
0,
0,
0,
0,
0,
0,
0,
y48*y49 + y50*y51,
0,
0,
y3*y45*y46,
0,
y13*y45*y47 + y16*y45*y47,
0,
y45*y54*y55 + y48*y54*y55,
0,
y17*y52*y53,
0,
y58*y59,
0,
y37*y56*y57,
0,
y62*y63,
0,
y54*y60*y61,
0
]


new_vars = fmpq_mpoly[AMPK, AMPK_T172_phos, AMPK_pT172, AMPK_pT172_dephos, Akt, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Akt_pT308_pS473, Amino_Acids, IRS, IRS_p, IRS_pS636, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, PI3K_PDK1, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1, PI3K_p_PDK1_dephos, PI3K_variant, PI3K_variant_p, PI3K_variant_p_dephos, PI3K_variant_phos_by_IR_beta_pY1146, PRAS40_S183_phos_by_mTORC1_pS2448_first, PRAS40_S183_phos_by_mTORC1_pS2448_second, PRAS40_T246_phos_by_Akt_pT308_first, PRAS40_T246_phos_by_Akt_pT308_second, PRAS40_pS183_dephos_first, PRAS40_pS183_dephos_second, TSC1_TSC2, TSC1_TSC2_S1387_phos_by_AMPK_pT172, TSC1_TSC2_T1462_phos_by_Akt_pT308, TSC1_TSC2_pS1387, TSC1_TSC2_pS1387_dephos, TSC1_TSC2_pT1462, TSC1_TSC2_pT1462_dephos, mTORC1, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448, mTORC1_pS2448_dephos_by_TSC1_TSC2, mTORC2, mTORC2_S2481_phos_by_PI3K_variant_p, mTORC2_pS2481, mTORC2_pS2481_dephos, p70_S6K, p70_S6K_T389_phos_by_mTORC1_pS2448, p70_S6K_pT389, p70_S6K_pT389_dephos]
new_system = 
[
y3*y4,
0,
y1*y2*y19,
0,
y10*y11 + y13*y14,
0,
0,
0,
0,
y5*y6*y59 + y15*y16,
0,
0,
y5*y8*y34 + y12*y16,
0,
0,
y7*y13*y59 + y9*y10*y34,
0,
y20*y21,
y18*y23*y26,
y18*y24*y63 + y19*y22*y63,
0,
0,
0,
0,
y29*y30,
y25*y28*y31,
0,
0,
0,
y26*y27,
0,
y34*y35,
0,
y19*y32*y33,
0,
y37*y38,
y26*y36*y39,
0,
0,
0,
0,
0,
0,
0,
0,
y49*y50 + y51*y52,
0,
0,
y3*y46*y47,
0,
y13*y46*y48 + y16*y46*y48,
0,
y46*y55*y56 + y49*y55*y56,
0,
y17*y53*y54,
0,
y59*y60,
0,
y37*y57*y58,
0,
y63*y64,
0,
y55*y61*y62,
0
]


new_vars = fmpq_mpoly[AMPK, AMPK_T172_phos, AMPK_pT172, AMPK_pT172_dephos, Akt, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Akt_pT308_pS473, Amino_Acids, IRS, IRS_p, IRS_pS636, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, PI3K_PDK1, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1, PI3K_p_PDK1_dephos, PI3K_variant, PI3K_variant_p, PI3K_variant_p_dephos, PI3K_variant_phos_by_IR_beta_pY1146, PRAS40_S183_phos_by_mTORC1_pS2448_first, PRAS40_S183_phos_by_mTORC1_pS2448_second, PRAS40_T246_phos_by_Akt_pT308_first, PRAS40_T246_phos_by_Akt_pT308_second, PRAS40_pS183_dephos_first, PRAS40_pS183_dephos_second, PRAS40_pT246_dephos_first, TSC1_TSC2, TSC1_TSC2_S1387_phos_by_AMPK_pT172, TSC1_TSC2_T1462_phos_by_Akt_pT308, TSC1_TSC2_pS1387, TSC1_TSC2_pS1387_dephos, TSC1_TSC2_pT1462, TSC1_TSC2_pT1462_dephos, mTORC1, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448, mTORC1_pS2448_dephos_by_TSC1_TSC2, mTORC2, mTORC2_S2481_phos_by_PI3K_variant_p, mTORC2_pS2481, mTORC2_pS2481_dephos, p70_S6K, p70_S6K_T389_phos_by_mTORC1_pS2448, p70_S6K_pT389, p70_S6K_pT389_dephos]
new_system = 
[
y3*y4,
0,
y1*y2*y19,
0,
y10*y11 + y13*y14,
0,
0,
0,
0,
y5*y6*y60 + y15*y16,
0,
0,
y5*y8*y34 + y12*y16,
0,
0,
y7*y13*y60 + y9*y10*y34,
0,
y20*y21,
y18*y23*y26,
y18*y24*y64 + y19*y22*y64,
0,
0,
0,
0,
y29*y30,
y25*y28*y31,
0,
0,
0,
y26*y27,
0,
y34*y35,
0,
y19*y32*y33,
0,
y37*y38,
y26*y36*y39,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y50*y51 + y52*y53,
0,
0,
y3*y47*y48,
0,
y13*y47*y49 + y16*y47*y49,
0,
y47*y56*y57 + y50*y56*y57,
0,
y17*y54*y55,
0,
y60*y61,
0,
y37*y58*y59,
0,
y64*y65,
0,
y56*y62*y63,
0
]


new_vars = fmpq_mpoly[AMPK, AMPK_T172_phos, AMPK_pT172, AMPK_pT172_dephos, Akt, Akt_S473_phos_by_mTORC2_pS2481_first, Akt_S473_phos_by_mTORC2_pS2481_second, Akt_T308_phos_by_PI3K_p_PDK1_first, Akt_T308_phos_by_PI3K_p_PDK1_second, Akt_pS473, Akt_pS473_dephos_first, Akt_pS473_dephos_second, Akt_pT308, Akt_pT308_dephos_first, Akt_pT308_dephos_second, Akt_pT308_pS473, Amino_Acids, IRS, IRS_p, IRS_pS636, IRS_pS636_turnover, IRS_p_phos_by_p70_S6K_pT389, IRS_phos_by_IR_beta_pY1146, IRS_phos_by_p70_S6K_pT389, IR_beta, IR_beta_pY1146, IR_beta_pY1146_dephos, IR_beta_phos_by_Insulin, IR_beta_ready, IR_beta_refractory, Insulin, PI3K_PDK1, PI3K_PDK1_phos_by_IRS_p, PI3K_p_PDK1, PI3K_p_PDK1_dephos, PI3K_variant, PI3K_variant_p, PI3K_variant_p_dephos, PI3K_variant_phos_by_IR_beta_pY1146, PRAS40_S183_phos_by_mTORC1_pS2448_first, PRAS40_S183_phos_by_mTORC1_pS2448_second, PRAS40_T246_phos_by_Akt_pT308_first, PRAS40_T246_phos_by_Akt_pT308_second, PRAS40_pS183_dephos_first, PRAS40_pS183_dephos_second, PRAS40_pT246_dephos_first, PRAS40_pT246_dephos_second, TSC1_TSC2, TSC1_TSC2_S1387_phos_by_AMPK_pT172, TSC1_TSC2_T1462_phos_by_Akt_pT308, TSC1_TSC2_pS1387, TSC1_TSC2_pS1387_dephos, TSC1_TSC2_pT1462, TSC1_TSC2_pT1462_dephos, mTORC1, mTORC1_S2448_activation_by_Amino_Acids, mTORC1_pS2448, mTORC1_pS2448_dephos_by_TSC1_TSC2, mTORC2, mTORC2_S2481_phos_by_PI3K_variant_p, mTORC2_pS2481, mTORC2_pS2481_dephos, p70_S6K, p70_S6K_T389_phos_by_mTORC1_pS2448, p70_S6K_pT389, p70_S6K_pT389_dephos]
new_system = 
[
y3*y4,
0,
y1*y2*y19,
0,
y10*y11 + y13*y14,
0,
0,
0,
0,
y5*y6*y61 + y15*y16,
0,
0,
y5*y8*y34 + y12*y16,
0,
0,
y7*y13*y61 + y9*y10*y34,
0,
y20*y21,
y18*y23*y26,
y18*y24*y65 + y19*y22*y65,
0,
0,
0,
0,
y29*y30,
y25*y28*y31,
0,
0,
0,
y26*y27,
0,
y34*y35,
0,
y19*y32*y33,
0,
y37*y38,
y26*y36*y39,
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
y51*y52 + y53*y54,
0,
0,
y3*y48*y49,
0,
y13*y48*y50 + y16*y48*y50,
0,
y48*y57*y58 + y51*y57*y58,
0,
y17*y55*y56,
0,
y61*y62,
0,
y37*y59*y60,
0,
y65*y66,
0,
y57*y63*y64,
0
]


