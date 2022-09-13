Original system:

[
pfs_transl => 0,
pfs_mRNA_d => 0,
Met_recov => 0,
Met => Homocys*Met_recov + Nutrients*b_reac_r,
AI2_excret_r => 0,
AI2_intra => AI2_extra*AI2_trans_r + AI2_syn_r*DPD,
Putrescine => 0,
DPD_deg_r => 0,
SAH => Methy_trans*SAM,
MTR => MTA*MTR_syn_r*Pfs_prot,
Pfs_prot => Pfs_mRNA*pfs_transl,
I => 0,
AI2_syn_r => 0,
SAH_Hydro_r => 0,
SAM_Dec => 0,
Spermidine => Decarb_SAM*Putrescine*SpeE_syn_r,
Polyamine_uti => 0,
MTR_syn_r => 0,
Decarb_SAM => SAM*SAM_Dec,
Spermi_uti => 0,
SAM => AdoMet_r*Met,
Pfs_prot_d => 0,
DPD => LuxS_prot*SRH*SRH_cleav,
Methy_trans => 0,
pfs_transc => 0,
b_reac_r => 0,
AI2_phos_r => 0,
SINK => -AI2_intra*AI2_phos_r - Adenine*Polyamine_uti - DPD*DPD_deg_r - LuxS_mRNA*LuxS_mRNA_d - LuxS_prot*LuxS_prot_d - MTR*MTR_e - Pfs_mRNA*pfs_mRNA_d - Pfs_prot*Pfs_prot_d - Spermi_uti*Spermidine,
Homocys => LuxS_prot*SRH*SRH_cleav,
LuxS_mRNA => I*LuxS_transc,
LuxS_transl => 0,
LuxS_transc => 0,
LuxS_prot => LuxS_mRNA*LuxS_transl,
SRH_cleav => 0,
SRH => Pfs_prot*SAH*SAH_Hydro_r,
AI2_extra => AI2_excret_r*AI2_intra,
MTR_e => 0,
Adenine => MTA*MTR_syn_r*Pfs_prot + Pfs_prot*SAH*SAH_Hydro_r,
LuxS_prot_d => 0,
MTA => Decarb_SAM*Putrescine*SpeE_syn_r,
Nutrients => 0,
SpeE_syn_r => 0,
LuxS_mRNA_d => 0,
AI2_trans_r => 0,
Pfs_mRNA => I*pfs_transc,
AdoMet_r => 0
]

Reductions:


new_vars = fmpq_mpoly[AI2_excret_r]
new_system = 
[
0
]


new_vars = fmpq_mpoly[AI2_excret_r, AI2_syn_r]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[AI2_excret_r, AI2_syn_r, AI2_trans_r]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[AI2_excret_r, AI2_syn_r, AI2_trans_r, AdoMet_r]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[AI2_excret_r, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD - Homocys]
new_system = 
[
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[AI2_excret_r, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD - Homocys, I]
new_system = 
[
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[AI2_excret_r, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD - Homocys, I, LuxS_transc]
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

Interesting
new_vars = fmpq_mpoly[AI2_excret_r, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD - Homocys, I, LuxS_transc, LuxS_transl]
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

Interesting
new_vars = fmpq_mpoly[AI2_excret_r, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD - Homocys, I, LuxS_transc, LuxS_transl, Met_recov]
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

Interesting
new_vars = fmpq_mpoly[AI2_excret_r, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD - Homocys, I, LuxS_transc, LuxS_transl, Met_recov, Methy_trans]
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

Interesting
new_vars = fmpq_mpoly[AI2_excret_r, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD - Homocys, I, LuxS_transc, LuxS_transl, Met_recov, Methy_trans, Nutrients]
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

Interesting
new_vars = fmpq_mpoly[AI2_excret_r, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD - Homocys, I, LuxS_transc, LuxS_transl, Met_recov, Methy_trans, Nutrients, SAH_Hydro_r]
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

Interesting
new_vars = fmpq_mpoly[AI2_excret_r, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD - Homocys, I, LuxS_transc, LuxS_transl, Met_recov, Methy_trans, Nutrients, SAH_Hydro_r, SRH_cleav]
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

Interesting
new_vars = fmpq_mpoly[AI2_excret_r, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD - Homocys, I, LuxS_transc, LuxS_transl, Met_recov, Methy_trans, Nutrients, SAH_Hydro_r, SRH_cleav, b_reac_r]
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

Interesting
new_vars = fmpq_mpoly[AI2_excret_r, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD - Homocys, I, LuxS_transc, LuxS_transl, Met_recov, Methy_trans, Nutrients, SAH_Hydro_r, SRH_cleav, b_reac_r, pfs_transc]
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

Interesting
new_vars = fmpq_mpoly[AI2_excret_r, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD - Homocys, I, LuxS_transc, LuxS_transl, Met_recov, Methy_trans, Nutrients, SAH_Hydro_r, SRH_cleav, b_reac_r, pfs_transc, pfs_transl]
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

Interesting
new_vars = fmpq_mpoly[AI2_excret_r, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD - Homocys, I, LuxS_mRNA, LuxS_transc, LuxS_transl, Met_recov, Methy_trans, Nutrients, SAH_Hydro_r, SRH_cleav, b_reac_r, pfs_transc, pfs_transl]
new_system = 
[
0,
0,
0,
0,
0,
0,
y6*y8,
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

Interesting
new_vars = fmpq_mpoly[AI2_excret_r, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD - Homocys, I, LuxS_mRNA, LuxS_transc, LuxS_transl, Met_recov, Methy_trans, Nutrients, Pfs_mRNA, SAH_Hydro_r, SRH_cleav, b_reac_r, pfs_transc, pfs_transl]
new_system = 
[
0,
0,
0,
0,
0,
0,
y6*y8,
0,
0,
0,
0,
0,
y6*y17,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[AI2_excret_r, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD - Homocys, I, LuxS_mRNA, LuxS_prot, LuxS_transc, LuxS_transl, Met_recov, Methy_trans, Nutrients, Pfs_mRNA, SAH_Hydro_r, SRH_cleav, b_reac_r, pfs_transc, pfs_transl]
new_system = 
[
0,
0,
0,
0,
0,
0,
y6*y9,
y7*y10,
0,
0,
0,
0,
0,
y6*y18,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[AI2_excret_r, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD - Homocys, I, LuxS_mRNA, LuxS_prot, LuxS_transc, LuxS_transl, Met_recov, Methy_trans, Nutrients, Pfs_mRNA, Pfs_prot, SAH_Hydro_r, SRH_cleav, b_reac_r, pfs_transc, pfs_transl]
new_system = 
[
0,
0,
0,
0,
0,
0,
y6*y9,
y7*y10,
0,
0,
0,
0,
0,
y6*y19,
y14*y20,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AI2_excret_r, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD, Homocys, I, LuxS_mRNA, LuxS_prot, LuxS_transc, LuxS_transl, Met, Met_recov, Methy_trans, Nutrients, Pfs_mRNA, Pfs_prot, SAH, SAH_Hydro_r, SAM, SRH, SRH_cleav, b_reac_r, pfs_transc, pfs_transl]
new_system = 
[
0,
0,
0,
0,
y9*y21*y22,
y9*y21*y22,
0,
y7*y10,
y8*y11,
0,
0,
y6*y13 + y15*y23,
0,
0,
0,
y7*y24,
y16*y25,
y14*y20,
0,
y4*y12,
y17*y18*y19,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AI2_excret_r, AI2_extra, AI2_intra, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD, Homocys, I, LuxS_mRNA, LuxS_prot, LuxS_transc, LuxS_transl, Met, Met_recov, Methy_trans, Nutrients, Pfs_mRNA, Pfs_prot, SAH, SAH_Hydro_r, SAM, SRH, SRH_cleav, b_reac_r, pfs_transc, pfs_transl]
new_system = 
[
0,
y1*y3,
y2*y5 + y4*y7,
0,
0,
0,
y11*y23*y24,
y11*y23*y24,
0,
y9*y12,
y10*y13,
0,
0,
y8*y15 + y17*y25,
0,
0,
0,
y9*y26,
y18*y27,
y16*y22,
0,
y6*y14,
y19*y20*y21,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AI2_excret_r, AI2_extra, AI2_intra, AI2_phos_r, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD, Homocys, I, LuxS_mRNA, LuxS_prot, LuxS_transc, LuxS_transl, Met, Met_recov, Methy_trans, Nutrients, Pfs_mRNA, Pfs_prot, SAH, SAH_Hydro_r, SAM, SRH, SRH_cleav, b_reac_r, pfs_transc, pfs_transl]
new_system = 
[
0,
y1*y3,
y2*y6 + y5*y8,
0,
0,
0,
0,
y12*y24*y25,
y12*y24*y25,
0,
y10*y13,
y11*y14,
0,
0,
y9*y16 + y18*y26,
0,
0,
0,
y10*y27,
y19*y28,
y17*y23,
0,
y7*y15,
y20*y21*y22,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AI2_excret_r, AI2_extra, AI2_intra, AI2_phos_r, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD, Homocys, I, LuxS_mRNA, LuxS_prot, LuxS_transc, LuxS_transl, MTR_syn_r, Met, Met_recov, Methy_trans, Nutrients, Pfs_mRNA, Pfs_prot, SAH, SAH_Hydro_r, SAM, SRH, SRH_cleav, b_reac_r, pfs_transc, pfs_transl]
new_system = 
[
0,
y1*y3,
y2*y6 + y5*y8,
0,
0,
0,
0,
y12*y25*y26,
y12*y25*y26,
0,
y10*y13,
y11*y14,
0,
0,
0,
y9*y17 + y19*y27,
0,
0,
0,
y10*y28,
y20*y29,
y18*y24,
0,
y7*y16,
y21*y22*y23,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AI2_excret_r, AI2_extra, AI2_intra, AI2_phos_r, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD, Homocys, I, LuxS_mRNA, LuxS_prot, LuxS_transc, LuxS_transl, MTR_syn_r, Met, Met_recov, Methy_trans, Nutrients, Pfs_mRNA, Pfs_prot, Putrescine, SAH, SAH_Hydro_r, SAM, SRH, SRH_cleav, b_reac_r, pfs_transc, pfs_transl]
new_system = 
[
0,
y1*y3,
y2*y6 + y5*y8,
0,
0,
0,
0,
y12*y26*y27,
y12*y26*y27,
0,
y10*y13,
y11*y14,
0,
0,
0,
y9*y17 + y19*y28,
0,
0,
0,
y10*y29,
y20*y30,
0,
y18*y25,
0,
y7*y16,
y21*y23*y24,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AI2_excret_r, AI2_extra, AI2_intra, AI2_phos_r, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD, Homocys, I, LuxS_mRNA, LuxS_prot, LuxS_transc, LuxS_transl, MTR_syn_r, Met, Met_recov, Methy_trans, Nutrients, Pfs_mRNA, Pfs_prot, Putrescine, SAH, SAH_Hydro_r, SAM, SAM_Dec, SRH, SRH_cleav, b_reac_r, pfs_transc, pfs_transl]
new_system = 
[
0,
y1*y3,
y2*y6 + y5*y8,
0,
0,
0,
0,
y12*y27*y28,
y12*y27*y28,
0,
y10*y13,
y11*y14,
0,
0,
0,
y9*y17 + y19*y29,
0,
0,
0,
y10*y30,
y20*y31,
0,
y18*y25,
0,
y7*y16,
0,
y21*y23*y24,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AI2_excret_r, AI2_extra, AI2_intra, AI2_phos_r, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD, Homocys, I, LuxS_mRNA, LuxS_prot, LuxS_transc, LuxS_transl, MTR_syn_r, Met, Met_recov, Methy_trans, Nutrients, Pfs_mRNA, Pfs_prot, Putrescine, SAH, SAH_Hydro_r, SAM, SAM_Dec, SRH, SRH_cleav, SpeE_syn_r, b_reac_r, pfs_transc, pfs_transl]
new_system = 
[
0,
y1*y3,
y2*y6 + y5*y8,
0,
0,
0,
0,
y12*y27*y28,
y12*y27*y28,
0,
y10*y13,
y11*y14,
0,
0,
0,
y9*y17 + y19*y30,
0,
0,
0,
y10*y31,
y20*y32,
0,
y18*y25,
0,
y7*y16,
0,
y21*y23*y24,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AI2_excret_r, AI2_extra, AI2_intra, AI2_phos_r, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD, Decarb_SAM, Homocys, I, LuxS_mRNA, LuxS_prot, LuxS_transc, LuxS_transl, MTR_syn_r, Met, Met_recov, Methy_trans, Nutrients, Pfs_mRNA, Pfs_prot, Putrescine, SAH, SAH_Hydro_r, SAM, SAM_Dec, SRH, SRH_cleav, SpeE_syn_r, b_reac_r, pfs_transc, pfs_transl]
new_system = 
[
0,
y1*y3,
y2*y6 + y5*y8,
0,
0,
0,
0,
y13*y28*y29,
y26*y27,
y13*y28*y29,
0,
y11*y14,
y12*y15,
0,
0,
0,
y10*y18 + y20*y31,
0,
0,
0,
y11*y32,
y21*y33,
0,
y19*y26,
0,
y7*y17,
0,
y22*y24*y25,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AI2_excret_r, AI2_extra, AI2_intra, AI2_phos_r, AI2_syn_r, AI2_trans_r, AdoMet_r, DPD, Decarb_SAM, Homocys, I, LuxS_mRNA, LuxS_prot, LuxS_transc, LuxS_transl, MTA, MTR_syn_r, Met, Met_recov, Methy_trans, Nutrients, Pfs_mRNA, Pfs_prot, Putrescine, SAH, SAH_Hydro_r, SAM, SAM_Dec, SRH, SRH_cleav, SpeE_syn_r, b_reac_r, pfs_transc, pfs_transl]
new_system = 
[
0,
y1*y3,
y2*y6 + y5*y8,
0,
0,
0,
0,
y13*y29*y30,
y27*y28,
y13*y29*y30,
0,
y11*y14,
y12*y15,
0,
0,
y9*y24*y31,
0,
y10*y19 + y21*y32,
0,
0,
0,
y11*y33,
y22*y34,
0,
y20*y27,
0,
y7*y18,
0,
y23*y25*y26,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AI2_excret_r, AI2_extra, AI2_intra, AI2_phos_r, AI2_syn_r, AI2_trans_r, Adenine, AdoMet_r, DPD, Decarb_SAM, Homocys, I, LuxS_mRNA, LuxS_prot, LuxS_transc, LuxS_transl, MTA, MTR_syn_r, Met, Met_recov, Methy_trans, Nutrients, Pfs_mRNA, Pfs_prot, Putrescine, SAH, SAH_Hydro_r, SAM, SAM_Dec, SRH, SRH_cleav, SpeE_syn_r, b_reac_r, pfs_transc, pfs_transl]
new_system = 
[
0,
y1*y3,
y2*y6 + y5*y9,
0,
0,
0,
y17*y18*y24 + y24*y26*y27,
0,
y14*y30*y31,
y28*y29,
y14*y30*y31,
0,
y12*y15,
y13*y16,
0,
0,
y10*y25*y32,
0,
y11*y20 + y22*y33,
0,
0,
0,
y12*y34,
y23*y35,
0,
y21*y28,
0,
y8*y19,
0,
y24*y26*y27,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AI2_excret_r, AI2_extra, AI2_intra, AI2_phos_r, AI2_syn_r, AI2_trans_r, Adenine, AdoMet_r, DPD, DPD_deg_r, Decarb_SAM, Homocys, I, LuxS_mRNA, LuxS_prot, LuxS_transc, LuxS_transl, MTA, MTR_syn_r, Met, Met_recov, Methy_trans, Nutrients, Pfs_mRNA, Pfs_prot, Putrescine, SAH, SAH_Hydro_r, SAM, SAM_Dec, SRH, SRH_cleav, SpeE_syn_r, b_reac_r, pfs_transc, pfs_transl]
new_system = 
[
0,
y1*y3,
y2*y6 + y5*y9,
0,
0,
0,
y18*y19*y25 + y25*y27*y28,
0,
y15*y31*y32,
0,
y29*y30,
y15*y31*y32,
0,
y13*y16,
y14*y17,
0,
0,
y11*y26*y33,
0,
y12*y21 + y23*y34,
0,
0,
0,
y13*y35,
y24*y36,
0,
y22*y29,
0,
y8*y20,
0,
y25*y27*y28,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AI2_excret_r, AI2_extra, AI2_intra, AI2_phos_r, AI2_syn_r, AI2_trans_r, Adenine, AdoMet_r, DPD, DPD_deg_r, Decarb_SAM, Homocys, I, LuxS_mRNA, LuxS_mRNA_d, LuxS_prot, LuxS_transc, LuxS_transl, MTA, MTR_syn_r, Met, Met_recov, Methy_trans, Nutrients, Pfs_mRNA, Pfs_prot, Putrescine, SAH, SAH_Hydro_r, SAM, SAM_Dec, SRH, SRH_cleav, SpeE_syn_r, b_reac_r, pfs_transc, pfs_transl]
new_system = 
[
0,
y1*y3,
y2*y6 + y5*y9,
0,
0,
0,
y19*y20*y26 + y26*y28*y29,
0,
y16*y32*y33,
0,
y30*y31,
y16*y32*y33,
0,
y13*y17,
0,
y14*y18,
0,
0,
y11*y27*y34,
0,
y12*y22 + y24*y35,
0,
0,
0,
y13*y36,
y25*y37,
0,
y23*y30,
0,
y8*y21,
0,
y26*y28*y29,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AI2_excret_r, AI2_extra, AI2_intra, AI2_phos_r, AI2_syn_r, AI2_trans_r, Adenine, AdoMet_r, DPD, DPD_deg_r, Decarb_SAM, Homocys, I, LuxS_mRNA, LuxS_mRNA_d, LuxS_prot, LuxS_prot_d, LuxS_transc, LuxS_transl, MTA, MTR_syn_r, Met, Met_recov, Methy_trans, Nutrients, Pfs_mRNA, Pfs_prot, Putrescine, SAH, SAH_Hydro_r, SAM, SAM_Dec, SRH, SRH_cleav, SpeE_syn_r, b_reac_r, pfs_transc, pfs_transl]
new_system = 
[
0,
y1*y3,
y2*y6 + y5*y9,
0,
0,
0,
y20*y21*y27 + y27*y29*y30,
0,
y16*y33*y34,
0,
y31*y32,
y16*y33*y34,
0,
y13*y18,
0,
y14*y19,
0,
0,
0,
y11*y28*y35,
0,
y12*y23 + y25*y36,
0,
0,
0,
y13*y37,
y26*y38,
0,
y24*y31,
0,
y8*y22,
0,
y27*y29*y30,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AI2_excret_r, AI2_extra, AI2_intra, AI2_phos_r, AI2_syn_r, AI2_trans_r, Adenine, AdoMet_r, DPD, DPD_deg_r, Decarb_SAM, Homocys, I, LuxS_mRNA, LuxS_mRNA_d, LuxS_prot, LuxS_prot_d, LuxS_transc, LuxS_transl, MTA, MTR, MTR_syn_r, Met, Met_recov, Methy_trans, Nutrients, Pfs_mRNA, Pfs_prot, Putrescine, SAH, SAH_Hydro_r, SAM, SAM_Dec, SRH, SRH_cleav, SpeE_syn_r, b_reac_r, pfs_transc, pfs_transl]
new_system = 
[
0,
y1*y3,
y2*y6 + y5*y9,
0,
0,
0,
y20*y22*y28 + y28*y30*y31,
0,
y16*y34*y35,
0,
y32*y33,
y16*y34*y35,
0,
y13*y18,
0,
y14*y19,
0,
0,
0,
y11*y29*y36,
y20*y22*y28,
0,
y12*y24 + y26*y37,
0,
0,
0,
y13*y38,
y27*y39,
0,
y25*y32,
0,
y8*y23,
0,
y28*y30*y31,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AI2_excret_r, AI2_extra, AI2_intra, AI2_phos_r, AI2_syn_r, AI2_trans_r, Adenine, AdoMet_r, DPD, DPD_deg_r, Decarb_SAM, Homocys, I, LuxS_mRNA, LuxS_mRNA_d, LuxS_prot, LuxS_prot_d, LuxS_transc, LuxS_transl, MTA, MTR, MTR_e, MTR_syn_r, Met, Met_recov, Methy_trans, Nutrients, Pfs_mRNA, Pfs_prot, Putrescine, SAH, SAH_Hydro_r, SAM, SAM_Dec, SRH, SRH_cleav, SpeE_syn_r, b_reac_r, pfs_transc, pfs_transl]
new_system = 
[
0,
y1*y3,
y2*y6 + y5*y9,
0,
0,
0,
y20*y23*y29 + y29*y31*y32,
0,
y16*y35*y36,
0,
y33*y34,
y16*y35*y36,
0,
y13*y18,
0,
y14*y19,
0,
0,
0,
y11*y30*y37,
y20*y23*y29,
0,
0,
y12*y25 + y27*y38,
0,
0,
0,
y13*y39,
y28*y40,
0,
y26*y33,
0,
y8*y24,
0,
y29*y31*y32,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AI2_excret_r, AI2_extra, AI2_intra, AI2_phos_r, AI2_syn_r, AI2_trans_r, Adenine, AdoMet_r, DPD, DPD_deg_r, Decarb_SAM, Homocys, I, LuxS_mRNA, LuxS_mRNA_d, LuxS_prot, LuxS_prot_d, LuxS_transc, LuxS_transl, MTA, MTR, MTR_e, MTR_syn_r, Met, Met_recov, Methy_trans, Nutrients, Pfs_mRNA, Pfs_prot, Pfs_prot_d, Putrescine, SAH, SAH_Hydro_r, SAM, SAM_Dec, SRH, SRH_cleav, SpeE_syn_r, b_reac_r, pfs_transc, pfs_transl]
new_system = 
[
0,
y1*y3,
y2*y6 + y5*y9,
0,
0,
0,
y20*y23*y29 + y29*y32*y33,
0,
y16*y36*y37,
0,
y34*y35,
y16*y36*y37,
0,
y13*y18,
0,
y14*y19,
0,
0,
0,
y11*y31*y38,
y20*y23*y29,
0,
0,
y12*y25 + y27*y39,
0,
0,
0,
y13*y40,
y28*y41,
0,
0,
y26*y34,
0,
y8*y24,
0,
y29*y32*y33,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AI2_excret_r, AI2_extra, AI2_intra, AI2_phos_r, AI2_syn_r, AI2_trans_r, Adenine, AdoMet_r, DPD, DPD_deg_r, Decarb_SAM, Homocys, I, LuxS_mRNA, LuxS_mRNA_d, LuxS_prot, LuxS_prot_d, LuxS_transc, LuxS_transl, MTA, MTR, MTR_e, MTR_syn_r, Met, Met_recov, Methy_trans, Nutrients, Pfs_mRNA, Pfs_prot, Pfs_prot_d, Polyamine_uti, Putrescine, SAH, SAH_Hydro_r, SAM, SAM_Dec, SRH, SRH_cleav, SpeE_syn_r, b_reac_r, pfs_transc, pfs_transl]
new_system = 
[
0,
y1*y3,
y2*y6 + y5*y9,
0,
0,
0,
y20*y23*y29 + y29*y33*y34,
0,
y16*y37*y38,
0,
y35*y36,
y16*y37*y38,
0,
y13*y18,
0,
y14*y19,
0,
0,
0,
y11*y32*y39,
y20*y23*y29,
0,
0,
y12*y25 + y27*y40,
0,
0,
0,
y13*y41,
y28*y42,
0,
0,
0,
y26*y35,
0,
y8*y24,
0,
y29*y33*y34,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AI2_excret_r, AI2_extra, AI2_intra, AI2_phos_r, AI2_syn_r, AI2_trans_r, Adenine, AdoMet_r, DPD, DPD_deg_r, Decarb_SAM, Homocys, I, LuxS_mRNA, LuxS_mRNA_d, LuxS_prot, LuxS_prot_d, LuxS_transc, LuxS_transl, MTA, MTR, MTR_e, MTR_syn_r, Met, Met_recov, Methy_trans, Nutrients, Pfs_mRNA, Pfs_prot, Pfs_prot_d, Polyamine_uti, Putrescine, SAH, SAH_Hydro_r, SAM, SAM_Dec, SRH, SRH_cleav, SpeE_syn_r, Spermi_uti, b_reac_r, pfs_transc, pfs_transl]
new_system = 
[
0,
y1*y3,
y2*y6 + y5*y9,
0,
0,
0,
y20*y23*y29 + y29*y33*y34,
0,
y16*y37*y38,
0,
y35*y36,
y16*y37*y38,
0,
y13*y18,
0,
y14*y19,
0,
0,
0,
y11*y32*y39,
y20*y23*y29,
0,
0,
y12*y25 + y27*y41,
0,
0,
0,
y13*y42,
y28*y43,
0,
0,
0,
y26*y35,
0,
y8*y24,
0,
y29*y33*y34,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AI2_excret_r, AI2_extra, AI2_intra, AI2_phos_r, AI2_syn_r, AI2_trans_r, Adenine, AdoMet_r, DPD, DPD_deg_r, Decarb_SAM, Homocys, I, LuxS_mRNA, LuxS_mRNA_d, LuxS_prot, LuxS_prot_d, LuxS_transc, LuxS_transl, MTA, MTR, MTR_e, MTR_syn_r, Met, Met_recov, Methy_trans, Nutrients, Pfs_mRNA, Pfs_prot, Pfs_prot_d, Polyamine_uti, Putrescine, SAH, SAH_Hydro_r, SAM, SAM_Dec, SRH, SRH_cleav, SpeE_syn_r, Spermi_uti, Spermidine, b_reac_r, pfs_transc, pfs_transl]
new_system = 
[
0,
y1*y3,
y2*y6 + y5*y9,
0,
0,
0,
y20*y23*y29 + y29*y33*y34,
0,
y16*y37*y38,
0,
y35*y36,
y16*y37*y38,
0,
y13*y18,
0,
y14*y19,
0,
0,
0,
y11*y32*y39,
y20*y23*y29,
0,
0,
y12*y25 + y27*y42,
0,
0,
0,
y13*y43,
y28*y44,
0,
0,
0,
y26*y35,
0,
y8*y24,
0,
y29*y33*y34,
0,
0,
0,
y11*y32*y39,
0,
0,
0
]


new_vars = fmpq_mpoly[AI2_excret_r, AI2_extra, AI2_intra, AI2_phos_r, AI2_syn_r, AI2_trans_r, Adenine, AdoMet_r, DPD, DPD_deg_r, Decarb_SAM, Homocys, I, LuxS_mRNA, LuxS_mRNA_d, LuxS_prot, LuxS_prot_d, LuxS_transc, LuxS_transl, MTA, MTR, MTR_e, MTR_syn_r, Met, Met_recov, Methy_trans, Nutrients, Pfs_mRNA, Pfs_prot, Pfs_prot_d, Polyamine_uti, Putrescine, SAH, SAH_Hydro_r, SAM, SAM_Dec, SRH, SRH_cleav, SpeE_syn_r, Spermi_uti, Spermidine, b_reac_r, pfs_mRNA_d, pfs_transc, pfs_transl]
new_system = 
[
0,
y1*y3,
y2*y6 + y5*y9,
0,
0,
0,
y20*y23*y29 + y29*y33*y34,
0,
y16*y37*y38,
0,
y35*y36,
y16*y37*y38,
0,
y13*y18,
0,
y14*y19,
0,
0,
0,
y11*y32*y39,
y20*y23*y29,
0,
0,
y12*y25 + y27*y42,
0,
0,
0,
y13*y44,
y28*y45,
0,
0,
0,
y26*y35,
0,
y8*y24,
0,
y29*y33*y34,
0,
0,
0,
y11*y32*y39,
0,
0,
0,
0
]


