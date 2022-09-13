Original system:

[
Rec_phosphorylation => 0,
Rec => 100*Rec_i*Rec_recycle,
SINK => -100*pRec_degradation*p_IL13_Rec_i,
p_IL13_Rec => 100*IL13_Rec*Rec_phosphorylation*pJAK2,
Rec_recycle => 0,
pRec_degradation => 0,
pJAK2 => 100*IL13_Rec*JAK2*JAK2_phosphorylation + 100*JAK2*JAK2_phosphorylation*p_IL13_Rec,
IL13stimulation => 0,
Rec_i => 100*Rec*Rec_intern,
CD274mRNA_production => 0,
p_IL13_Rec_i => 100*pRec_intern*p_IL13_Rec,
pSTAT5_dephosphorylation => 0,
STAT5_phosphorylation => 0,
Kon_IL13Rec => 0,
pRec_intern => 0,
pJAK2_dephosphorylation => 0,
Rec_intern => 0,
JAK2_phosphorylation => 0,
IL13_Rec => 1888//5*IL13stimulation*Kon_IL13Rec*Rec,
SHP1 => 0,
STAT5 => 100*SHP1*pSTAT5*pSTAT5_dephosphorylation,
CD274mRNA => 100*CD274mRNA_production*pSTAT5,
JAK2 => 100*SHP1*pJAK2*pJAK2_dephosphorylation,
pSTAT5 => 100*STAT5*STAT5_phosphorylation*pJAK2
]

Reductions:


new_vars = fmpq_mpoly[CD274mRNA_production]
new_system = 
[
0
]


new_vars = fmpq_mpoly[CD274mRNA_production, IL13stimulation]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[CD274mRNA_production, IL13stimulation, JAK2_phosphorylation]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[CD274mRNA_production, IL13stimulation, JAK2_phosphorylation, Kon_IL13Rec]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[CD274mRNA_production, IL13stimulation, JAK2_phosphorylation, Kon_IL13Rec, Rec_intern]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[CD274mRNA_production, IL13stimulation, JAK2_phosphorylation, Kon_IL13Rec, Rec_intern, Rec_phosphorylation]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[CD274mRNA_production, IL13stimulation, JAK2_phosphorylation, Kon_IL13Rec, Rec_intern, Rec_phosphorylation, Rec_recycle]
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


new_vars = fmpq_mpoly[CD274mRNA_production, IL13stimulation, JAK2_phosphorylation, Kon_IL13Rec, Rec_intern, Rec_phosphorylation, Rec_recycle, SHP1]
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


new_vars = fmpq_mpoly[CD274mRNA_production, IL13stimulation, JAK2_phosphorylation, Kon_IL13Rec, Rec_intern, Rec_phosphorylation, Rec_recycle, SHP1, STAT5_phosphorylation]
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


new_vars = fmpq_mpoly[CD274mRNA_production, IL13stimulation, JAK2_phosphorylation, Kon_IL13Rec, Rec_intern, Rec_phosphorylation, Rec_recycle, SHP1, STAT5_phosphorylation, pJAK2_dephosphorylation]
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


new_vars = fmpq_mpoly[CD274mRNA_production, IL13stimulation, JAK2_phosphorylation, Kon_IL13Rec, Rec_intern, Rec_phosphorylation, Rec_recycle, SHP1, STAT5_phosphorylation, pJAK2_dephosphorylation, pSTAT5_dephosphorylation]
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


new_vars = fmpq_mpoly[CD274mRNA_production, IL13stimulation, JAK2_phosphorylation, Kon_IL13Rec, Rec, Rec_i, Rec_intern, Rec_phosphorylation, Rec_recycle, SHP1, STAT5_phosphorylation, pJAK2_dephosphorylation, pSTAT5_dephosphorylation]
new_system = 
[
0,
0,
0,
0,
100*y6*y9,
100*y5*y7,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[CD274mRNA_production, IL13_Rec, IL13stimulation, JAK2_phosphorylation, Kon_IL13Rec, Rec, Rec_i, Rec_intern, Rec_phosphorylation, Rec_recycle, SHP1, STAT5_phosphorylation, pJAK2_dephosphorylation, pSTAT5_dephosphorylation]
new_system = 
[
0,
1888//5*y3*y5*y6,
0,
0,
0,
100*y7*y10,
100*y6*y8,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[CD274mRNA_production, IL13_Rec, IL13stimulation, JAK2, JAK2_phosphorylation, Kon_IL13Rec, Rec, Rec_i, Rec_intern, Rec_phosphorylation, Rec_recycle, SHP1, STAT5_phosphorylation, pJAK2, pJAK2_dephosphorylation, pSTAT5_dephosphorylation, p_IL13_Rec]
new_system = 
[
0,
1888//5*y3*y6*y7,
0,
100*y12*y14*y15,
0,
0,
100*y8*y11,
100*y7*y9,
0,
0,
0,
0,
0,
100*y2*y4*y5 + 100*y4*y5*y17,
0,
0,
100*y2*y10*y14
]


new_vars = fmpq_mpoly[CD274mRNA_production, IL13_Rec, IL13stimulation, JAK2, JAK2_phosphorylation, Kon_IL13Rec, Rec, Rec_i, Rec_intern, Rec_phosphorylation, Rec_recycle, SHP1, STAT5, STAT5_phosphorylation, pJAK2, pJAK2_dephosphorylation, pSTAT5, pSTAT5_dephosphorylation, p_IL13_Rec]
new_system = 
[
0,
1888//5*y3*y6*y7,
0,
100*y12*y15*y16,
0,
0,
100*y8*y11,
100*y7*y9,
0,
0,
0,
0,
100*y12*y17*y18,
0,
100*y2*y4*y5 + 100*y4*y5*y19,
0,
100*y13*y14*y15,
0,
100*y2*y10*y15
]


new_vars = fmpq_mpoly[CD274mRNA, CD274mRNA_production, IL13_Rec, IL13stimulation, JAK2, JAK2_phosphorylation, Kon_IL13Rec, Rec, Rec_i, Rec_intern, Rec_phosphorylation, Rec_recycle, SHP1, STAT5, STAT5_phosphorylation, pJAK2, pJAK2_dephosphorylation, pSTAT5, pSTAT5_dephosphorylation, p_IL13_Rec]
new_system = 
[
100*y2*y18,
0,
1888//5*y4*y7*y8,
0,
100*y13*y16*y17,
0,
0,
100*y9*y12,
100*y8*y10,
0,
0,
0,
0,
100*y13*y18*y19,
0,
100*y3*y5*y6 + 100*y5*y6*y20,
0,
100*y14*y15*y16,
0,
100*y3*y11*y16
]


new_vars = fmpq_mpoly[CD274mRNA, CD274mRNA_production, IL13_Rec, IL13stimulation, JAK2, JAK2_phosphorylation, Kon_IL13Rec, Rec, Rec_i, Rec_intern, Rec_phosphorylation, Rec_recycle, SHP1, STAT5, STAT5_phosphorylation, pJAK2, pJAK2_dephosphorylation, pRec_degradation, pSTAT5, pSTAT5_dephosphorylation, p_IL13_Rec]
new_system = 
[
100*y2*y19,
0,
1888//5*y4*y7*y8,
0,
100*y13*y16*y17,
0,
0,
100*y9*y12,
100*y8*y10,
0,
0,
0,
0,
100*y13*y19*y20,
0,
100*y3*y5*y6 + 100*y5*y6*y21,
0,
0,
100*y14*y15*y16,
0,
100*y3*y11*y16
]


new_vars = fmpq_mpoly[CD274mRNA, CD274mRNA_production, IL13_Rec, IL13stimulation, JAK2, JAK2_phosphorylation, Kon_IL13Rec, Rec, Rec_i, Rec_intern, Rec_phosphorylation, Rec_recycle, SHP1, STAT5, STAT5_phosphorylation, pJAK2, pJAK2_dephosphorylation, pRec_degradation, pRec_intern, pSTAT5, pSTAT5_dephosphorylation, p_IL13_Rec]
new_system = 
[
100*y2*y20,
0,
1888//5*y4*y7*y8,
0,
100*y13*y16*y17,
0,
0,
100*y9*y12,
100*y8*y10,
0,
0,
0,
0,
100*y13*y20*y21,
0,
100*y3*y5*y6 + 100*y5*y6*y22,
0,
0,
0,
100*y14*y15*y16,
0,
100*y3*y11*y16
]


new_vars = fmpq_mpoly[CD274mRNA, CD274mRNA_production, IL13_Rec, IL13stimulation, JAK2, JAK2_phosphorylation, Kon_IL13Rec, Rec, Rec_i, Rec_intern, Rec_phosphorylation, Rec_recycle, SHP1, STAT5, STAT5_phosphorylation, pJAK2, pJAK2_dephosphorylation, pRec_degradation, pRec_intern, pSTAT5, pSTAT5_dephosphorylation, p_IL13_Rec, p_IL13_Rec_i]
new_system = 
[
100*y2*y20,
0,
1888//5*y4*y7*y8,
0,
100*y13*y16*y17,
0,
0,
100*y9*y12,
100*y8*y10,
0,
0,
0,
0,
100*y13*y20*y21,
0,
100*y3*y5*y6 + 100*y5*y6*y22,
0,
0,
0,
100*y14*y15*y16,
0,
100*y3*y11*y16,
100*y19*y22
]


