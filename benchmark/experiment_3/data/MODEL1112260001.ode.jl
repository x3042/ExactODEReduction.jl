Original system:

[
dnabound_Foxo1_Pa1_Ac0_pUb1 => 1//20000*Akt*dnabound_Foxo1_Pa0_Ac0_pUb1 + 3//1000000*SCF*dnabound_Foxo1_Pa1_Ac0_pUb0 + 1//20000*SGK*dnabound_Foxo1_Pa0_Ac0_pUb1 + 1//10000*SIRT1*dnabound_Foxo1_Pa1_Ac1_pUb1 + 1//8*nucleus_Foxo1_Pa1_Ac0_pUb1,
cytoplasm_Sod2 => 123//100*cytoplasm_RNA_Sod2,
Akt => 0,
cytoplasm_Foxo1_Pa1_Ac1_pUb1 => 1//20000*Akt*cytoplasm_Foxo1_Pa0_Ac1_pUb1 + 1//10000000*SCF*cytoplasm_Foxo1_Pa1_Ac1_pUb0 + 1//20000*SGK*cytoplasm_Foxo1_Pa0_Ac1_pUb1 + 11//20*nucleus_Foxo1_Pa1_Ac1_pUb1,
cytoplasm_RNA_Inr => 11//50*nucleus_RNA_Inr,
nucleus_Foxo1_Pa1_Ac1_pUb0 => 1//20000*Akt*nucleus_Foxo1_Pa0_Ac1_pUb0 + 1//10000*CBPP300*nucleus_Foxo1_Pa1_Ac0_pUb0 + 1//20000*SGK*nucleus_Foxo1_Pa0_Ac1_pUb0 + 90909090909//5000000000000*cytoplasm_Foxo1_Pa1_Ac1_pUb0 + 1//8*dnabound_Foxo1_Pa1_Ac1_pUb0,
dnabound_Foxo1_Pa0_Ac0_pUb1 => 1//20000*PP2A*dnabound_Foxo1_Pa1_Ac0_pUb1 + 1//1000000*SCF*dnabound_Foxo1_Pa0_Ac0_pUb0 + 1//10000*SIRT1*dnabound_Foxo1_Pa0_Ac1_pUb1 + 1//4*nucleus_Foxo1_Pa0_Ac0_pUb1,
PP2A => 0,
dnabound_Foxo1_Pa0_Ac1_pUb1 => 1//10000*CBPP300*dnabound_Foxo1_Pa0_Ac0_pUb1 + 1//20000*PP2A*dnabound_Foxo1_Pa1_Ac1_pUb1 + 333333333333//10000000000000000000*SCF*dnabound_Foxo1_Pa0_Ac1_pUb0 + 1//8*nucleus_Foxo1_Pa0_Ac1_pUb1,
null => -11//2000*E2F1 - 6*I + 19//10000*cytoplasm_Inr + 549//125*cytoplasm_RNA_Inr + 549//125*cytoplasm_RNA_Sod2 + 19//10000*cytoplasm_Sod2 - 3//5*dnabound_Foxo1_Pa0_Ac0_pUb0 - 3//5*dnabound_Foxo1_Pa0_Ac0_pUb1 - 3//5*dnabound_Foxo1_Pa0_Ac1_pUb0 - 3//5*dnabound_Foxo1_Pa0_Ac1_pUb1 - 3//5*dnabound_Foxo1_Pa1_Ac0_pUb0 - 3//5*dnabound_Foxo1_Pa1_Ac0_pUb1 - 3//5*dnabound_Foxo1_Pa1_Ac1_pUb0 - 3//5*dnabound_Foxo1_Pa1_Ac1_pUb1,
cytoplasm_Foxo1_Pa0_Ac1_pUb1 => 1//20000*PP2A*cytoplasm_Foxo1_Pa1_Ac1_pUb1 + 333333333333//10000000000000000000*SCF*cytoplasm_Foxo1_Pa0_Ac1_pUb0 + 11//200*nucleus_Foxo1_Pa0_Ac1_pUb1,
nucleus_Foxo1_Pa0_Ac0_pUb0 => 1//20000*PP2A*nucleus_Foxo1_Pa1_Ac0_pUb0 + 1//10000*SIRT1*nucleus_Foxo1_Pa0_Ac1_pUb0 + 90909090909//500000000000*cytoplasm_Foxo1_Pa0_Ac0_pUb0 + 1//8*dnabound_Foxo1_Pa0_Ac0_pUb0,
degr_Foxo1 => 1//10000*Proteasome*cytoplasm_Foxo1_Pa0_Ac0_pUb1 + 1//10000*Proteasome*cytoplasm_Foxo1_Pa0_Ac1_pUb1 + 1//10000*Proteasome*cytoplasm_Foxo1_Pa1_Ac0_pUb1 + 1//10000*Proteasome*cytoplasm_Foxo1_Pa1_Ac1_pUb1,
SCF => 0,
Proteasome => 0,
nucleus_Foxo1_Pa0_Ac1_pUb0 => 1//10000*CBPP300*nucleus_Foxo1_Pa0_Ac0_pUb0 + 1//20000*PP2A*nucleus_Foxo1_Pa1_Ac1_pUb0 + 90909090909//500000000000*cytoplasm_Foxo1_Pa0_Ac1_pUb0 + 1//8*dnabound_Foxo1_Pa0_Ac1_pUb0,
E2F1 => 0,
nucleus_Foxo1_Pa0_Ac1_pUb1 => 1//10000*CBPP300*nucleus_Foxo1_Pa0_Ac0_pUb1 + 1//20000*PP2A*nucleus_Foxo1_Pa1_Ac1_pUb1 + 333333333333//10000000000000000000*SCF*nucleus_Foxo1_Pa0_Ac1_pUb0 + 90909090909//500000000000*cytoplasm_Foxo1_Pa0_Ac1_pUb1 + 1//8*dnabound_Foxo1_Pa0_Ac1_pUb1,
I => 0,
nucleus_Foxo1_Pa0_Ac0_pUb1 => 1//20000*PP2A*nucleus_Foxo1_Pa1_Ac0_pUb1 + 1//1000000*SCF*nucleus_Foxo1_Pa0_Ac0_pUb0 + 1//10000*SIRT1*nucleus_Foxo1_Pa0_Ac1_pUb1 + 90909090909//500000000000*cytoplasm_Foxo1_Pa0_Ac0_pUb1 + 1//8*dnabound_Foxo1_Pa0_Ac0_pUb1,
cytoplasm_Foxo1_Pa1_Ac1_pUb0 => 1//20000*Akt*cytoplasm_Foxo1_Pa0_Ac1_pUb0 + 1//20000*SGK*cytoplasm_Foxo1_Pa0_Ac1_pUb0 + 11//20*nucleus_Foxo1_Pa1_Ac1_pUb0,
CBPP300 => 0,
cytoplasm_Foxo1_Pa1_Ac0_pUb1 => 1//20000*Akt*cytoplasm_Foxo1_Pa0_Ac0_pUb1 + 3//1000000*SCF*cytoplasm_Foxo1_Pa1_Ac0_pUb0 + 1//20000*SGK*cytoplasm_Foxo1_Pa0_Ac0_pUb1 + 11//20*nucleus_Foxo1_Pa1_Ac0_pUb1,
nucleus_RNA_Inr => 3*I + 3//10*dnabound_Foxo1_Pa0_Ac0_pUb0 + 3//10*dnabound_Foxo1_Pa0_Ac0_pUb1 + 3//10*dnabound_Foxo1_Pa0_Ac1_pUb0 + 3//10*dnabound_Foxo1_Pa0_Ac1_pUb1 + 3//10*dnabound_Foxo1_Pa1_Ac0_pUb0 + 3//10*dnabound_Foxo1_Pa1_Ac0_pUb1 + 3//10*dnabound_Foxo1_Pa1_Ac1_pUb0 + 3//10*dnabound_Foxo1_Pa1_Ac1_pUb1,
dnabound_Foxo1_Pa1_Ac1_pUb1 => 1//20000*Akt*dnabound_Foxo1_Pa0_Ac1_pUb1 + 1//10000*CBPP300*dnabound_Foxo1_Pa1_Ac0_pUb1 + 1//10000000*SCF*dnabound_Foxo1_Pa1_Ac1_pUb0 + 1//20000*SGK*dnabound_Foxo1_Pa0_Ac1_pUb1 + 1//16*nucleus_Foxo1_Pa1_Ac1_pUb1,
SIRT1 => 0,
cytoplasm_Foxo1_Pa1_Ac0_pUb0 => 1//20000*Akt*cytoplasm_Foxo1_Pa0_Ac0_pUb0 + 1//20000*SGK*cytoplasm_Foxo1_Pa0_Ac0_pUb0 + 11//20*nucleus_Foxo1_Pa1_Ac0_pUb0,
cytoplasm_RNA_Sod2 => 11//50*nucleus_RNA_Sod2,
nucleus_Foxo1_Pa1_Ac1_pUb1 => 1//20000*Akt*nucleus_Foxo1_Pa0_Ac1_pUb1 + 1//10000*CBPP300*nucleus_Foxo1_Pa1_Ac0_pUb1 + 1//10000000*SCF*nucleus_Foxo1_Pa1_Ac1_pUb0 + 1//20000*SGK*nucleus_Foxo1_Pa0_Ac1_pUb1 + 90909090909//5000000000000*cytoplasm_Foxo1_Pa1_Ac1_pUb1 + 1//8*dnabound_Foxo1_Pa1_Ac1_pUb1,
cytoplasm_Foxo1_Pa0_Ac0_pUb1 => 1//20000*PP2A*cytoplasm_Foxo1_Pa1_Ac0_pUb1 + 1//1000000*SCF*cytoplasm_Foxo1_Pa0_Ac0_pUb0 + 11//200*nucleus_Foxo1_Pa0_Ac0_pUb1,
nucleus_Foxo1_Pa1_Ac0_pUb0 => 1//20000*Akt*nucleus_Foxo1_Pa0_Ac0_pUb0 + 1//20000*SGK*nucleus_Foxo1_Pa0_Ac0_pUb0 + 1//10000*SIRT1*nucleus_Foxo1_Pa1_Ac1_pUb0 + 90909090909//5000000000000*cytoplasm_Foxo1_Pa1_Ac0_pUb0 + 1//8*dnabound_Foxo1_Pa1_Ac0_pUb0,
cytoplasm_Foxo1_Pa0_Ac0_pUb0 => 11//2000*E2F1 + 1//20000*PP2A*cytoplasm_Foxo1_Pa1_Ac0_pUb0 + 11//200*nucleus_Foxo1_Pa0_Ac0_pUb0,
SGK => 0,
cytoplasm_Foxo1_Pa0_Ac1_pUb0 => 1//20000*PP2A*cytoplasm_Foxo1_Pa1_Ac1_pUb0 + 11//200*nucleus_Foxo1_Pa0_Ac1_pUb0,
dnabound_Foxo1_Pa0_Ac0_pUb0 => 1//20000*PP2A*dnabound_Foxo1_Pa1_Ac0_pUb0 + 1//10000*SIRT1*dnabound_Foxo1_Pa0_Ac1_pUb0 + 1//4*nucleus_Foxo1_Pa0_Ac0_pUb0,
dnabound_Foxo1_Pa0_Ac1_pUb0 => 1//10000*CBPP300*dnabound_Foxo1_Pa0_Ac0_pUb0 + 1//20000*PP2A*dnabound_Foxo1_Pa1_Ac1_pUb0 + 1//8*nucleus_Foxo1_Pa0_Ac1_pUb0,
dnabound_Foxo1_Pa1_Ac0_pUb0 => 1//20000*Akt*dnabound_Foxo1_Pa0_Ac0_pUb0 + 1//20000*SGK*dnabound_Foxo1_Pa0_Ac0_pUb0 + 1//10000*SIRT1*dnabound_Foxo1_Pa1_Ac1_pUb0 + 1//8*nucleus_Foxo1_Pa1_Ac0_pUb0,
nucleus_Foxo1_Pa1_Ac0_pUb1 => 1//20000*Akt*nucleus_Foxo1_Pa0_Ac0_pUb1 + 3//1000000*SCF*nucleus_Foxo1_Pa1_Ac0_pUb0 + 1//20000*SGK*nucleus_Foxo1_Pa0_Ac0_pUb1 + 1//10000*SIRT1*nucleus_Foxo1_Pa1_Ac1_pUb1 + 90909090909//5000000000000*cytoplasm_Foxo1_Pa1_Ac0_pUb1 + 1//8*dnabound_Foxo1_Pa1_Ac0_pUb1,
cytoplasm_Inr => 123//100*cytoplasm_RNA_Inr,
dnabound_Foxo1_Pa1_Ac1_pUb0 => 1//20000*Akt*dnabound_Foxo1_Pa0_Ac1_pUb0 + 1//10000*CBPP300*dnabound_Foxo1_Pa1_Ac0_pUb0 + 1//20000*SGK*dnabound_Foxo1_Pa0_Ac1_pUb0 + 1//16*nucleus_Foxo1_Pa1_Ac1_pUb0,
nucleus_RNA_Sod2 => 3*I + 3//10*dnabound_Foxo1_Pa0_Ac0_pUb0 + 3//10*dnabound_Foxo1_Pa0_Ac0_pUb1 + 3//10*dnabound_Foxo1_Pa0_Ac1_pUb0 + 3//10*dnabound_Foxo1_Pa0_Ac1_pUb1 + 3//10*dnabound_Foxo1_Pa1_Ac0_pUb0 + 3//10*dnabound_Foxo1_Pa1_Ac0_pUb1 + 3//10*dnabound_Foxo1_Pa1_Ac1_pUb0 + 3//10*dnabound_Foxo1_Pa1_Ac1_pUb1
]

Reductions:


new_vars = fmpq_mpoly[Akt]
new_system = 
[
0
]


new_vars = fmpq_mpoly[Akt, CBPP300]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[Akt, CBPP300, E2F1]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[Akt, CBPP300, E2F1, I]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Akt, CBPP300, E2F1, I, PP2A]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Akt, CBPP300, E2F1, I, PP2A, Proteasome]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Akt, CBPP300, E2F1, I, PP2A, Proteasome, SCF]
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


new_vars = fmpq_mpoly[Akt, CBPP300, E2F1, I, PP2A, Proteasome, SCF, SGK]
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


new_vars = fmpq_mpoly[Akt, CBPP300, E2F1, I, PP2A, Proteasome, SCF, SGK, SIRT1]
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


new_vars = fmpq_mpoly[Akt, CBPP300, E2F1, I, PP2A, Proteasome, SCF, SGK, SIRT1, cytoplasm_Foxo1_Pa0_Ac0_pUb0, cytoplasm_Foxo1_Pa0_Ac1_pUb0, cytoplasm_Foxo1_Pa1_Ac0_pUb0, cytoplasm_Foxo1_Pa1_Ac1_pUb0, dnabound_Foxo1_Pa0_Ac0_pUb0, dnabound_Foxo1_Pa0_Ac1_pUb0, dnabound_Foxo1_Pa1_Ac0_pUb0, dnabound_Foxo1_Pa1_Ac1_pUb0, nucleus_Foxo1_Pa0_Ac0_pUb0, nucleus_Foxo1_Pa0_Ac1_pUb0, nucleus_Foxo1_Pa1_Ac0_pUb0, nucleus_Foxo1_Pa1_Ac1_pUb0]
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
11//2000*y3 + 1//20000*y5*y12 + 11//200*y18,
1//20000*y5*y13 + 11//200*y19,
1//20000*y1*y10 + 1//20000*y8*y10 + 11//20*y20,
1//20000*y1*y11 + 1//20000*y8*y11 + 11//20*y21,
1//20000*y5*y16 + 1//10000*y9*y15 + 1//4*y18,
1//10000*y2*y14 + 1//20000*y5*y17 + 1//8*y19,
1//20000*y1*y14 + 1//20000*y8*y14 + 1//10000*y9*y17 + 1//8*y20,
1//20000*y1*y15 + 1//10000*y2*y16 + 1//20000*y8*y15 + 1//16*y21,
1//20000*y5*y20 + 1//10000*y9*y19 + 90909090909//500000000000*y10 + 1//8*y14,
1//10000*y2*y18 + 1//20000*y5*y21 + 90909090909//500000000000*y11 + 1//8*y15,
1//20000*y1*y18 + 1//20000*y8*y18 + 1//10000*y9*y21 + 90909090909//5000000000000*y12 + 1//8*y16,
1//20000*y1*y19 + 1//10000*y2*y20 + 1//20000*y8*y19 + 90909090909//5000000000000*y13 + 1//8*y17
]


new_vars = fmpq_mpoly[Akt, CBPP300, E2F1, I, PP2A, Proteasome, SCF, SGK, SIRT1, cytoplasm_Foxo1_Pa0_Ac0_pUb0, cytoplasm_Foxo1_Pa0_Ac0_pUb1, cytoplasm_Foxo1_Pa0_Ac1_pUb0, cytoplasm_Foxo1_Pa0_Ac1_pUb1, cytoplasm_Foxo1_Pa1_Ac0_pUb0, cytoplasm_Foxo1_Pa1_Ac0_pUb1, cytoplasm_Foxo1_Pa1_Ac1_pUb0, cytoplasm_Foxo1_Pa1_Ac1_pUb1, dnabound_Foxo1_Pa0_Ac0_pUb0, dnabound_Foxo1_Pa0_Ac0_pUb1, dnabound_Foxo1_Pa0_Ac1_pUb0, dnabound_Foxo1_Pa0_Ac1_pUb1, dnabound_Foxo1_Pa1_Ac0_pUb0, dnabound_Foxo1_Pa1_Ac0_pUb1, dnabound_Foxo1_Pa1_Ac1_pUb0, dnabound_Foxo1_Pa1_Ac1_pUb1, nucleus_Foxo1_Pa0_Ac0_pUb0, nucleus_Foxo1_Pa0_Ac0_pUb1, nucleus_Foxo1_Pa0_Ac1_pUb0, nucleus_Foxo1_Pa0_Ac1_pUb1, nucleus_Foxo1_Pa1_Ac0_pUb0, nucleus_Foxo1_Pa1_Ac0_pUb1, nucleus_Foxo1_Pa1_Ac1_pUb0, nucleus_Foxo1_Pa1_Ac1_pUb1]
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
11//2000*y3 + 1//20000*y5*y14 + 11//200*y26,
1//20000*y5*y15 + 1//1000000*y7*y10 + 11//200*y27,
1//20000*y5*y16 + 11//200*y28,
1//20000*y5*y17 + 333333333333//10000000000000000000*y7*y12 + 11//200*y29,
1//20000*y1*y10 + 1//20000*y8*y10 + 11//20*y30,
1//20000*y1*y11 + 3//1000000*y7*y14 + 1//20000*y8*y11 + 11//20*y31,
1//20000*y1*y12 + 1//20000*y8*y12 + 11//20*y32,
1//20000*y1*y13 + 1//10000000*y7*y16 + 1//20000*y8*y13 + 11//20*y33,
1//20000*y5*y22 + 1//10000*y9*y20 + 1//4*y26,
1//20000*y5*y23 + 1//1000000*y7*y18 + 1//10000*y9*y21 + 1//4*y27,
1//10000*y2*y18 + 1//20000*y5*y24 + 1//8*y28,
1//10000*y2*y19 + 1//20000*y5*y25 + 333333333333//10000000000000000000*y7*y20 + 1//8*y29,
1//20000*y1*y18 + 1//20000*y8*y18 + 1//10000*y9*y24 + 1//8*y30,
1//20000*y1*y19 + 3//1000000*y7*y22 + 1//20000*y8*y19 + 1//10000*y9*y25 + 1//8*y31,
1//20000*y1*y20 + 1//10000*y2*y22 + 1//20000*y8*y20 + 1//16*y32,
1//20000*y1*y21 + 1//10000*y2*y23 + 1//10000000*y7*y24 + 1//20000*y8*y21 + 1//16*y33,
1//20000*y5*y30 + 1//10000*y9*y28 + 90909090909//500000000000*y10 + 1//8*y18,
1//20000*y5*y31 + 1//1000000*y7*y26 + 1//10000*y9*y29 + 90909090909//500000000000*y11 + 1//8*y19,
1//10000*y2*y26 + 1//20000*y5*y32 + 90909090909//500000000000*y12 + 1//8*y20,
1//10000*y2*y27 + 1//20000*y5*y33 + 333333333333//10000000000000000000*y7*y28 + 90909090909//500000000000*y13 + 1//8*y21,
1//20000*y1*y26 + 1//20000*y8*y26 + 1//10000*y9*y32 + 90909090909//5000000000000*y14 + 1//8*y22,
1//20000*y1*y27 + 3//1000000*y7*y30 + 1//20000*y8*y27 + 1//10000*y9*y33 + 90909090909//5000000000000*y15 + 1//8*y23,
1//20000*y1*y28 + 1//10000*y2*y30 + 1//20000*y8*y28 + 90909090909//5000000000000*y16 + 1//8*y24,
1//20000*y1*y29 + 1//10000*y2*y31 + 1//10000000*y7*y32 + 1//20000*y8*y29 + 90909090909//5000000000000*y17 + 1//8*y25
]


new_vars = fmpq_mpoly[Akt, CBPP300, E2F1, I, PP2A, Proteasome, SCF, SGK, SIRT1, cytoplasm_Foxo1_Pa0_Ac0_pUb0, cytoplasm_Foxo1_Pa0_Ac0_pUb1, cytoplasm_Foxo1_Pa0_Ac1_pUb0, cytoplasm_Foxo1_Pa0_Ac1_pUb1, cytoplasm_Foxo1_Pa1_Ac0_pUb0, cytoplasm_Foxo1_Pa1_Ac0_pUb1, cytoplasm_Foxo1_Pa1_Ac1_pUb0, cytoplasm_Foxo1_Pa1_Ac1_pUb1, dnabound_Foxo1_Pa0_Ac0_pUb0, dnabound_Foxo1_Pa0_Ac0_pUb1, dnabound_Foxo1_Pa0_Ac1_pUb0, dnabound_Foxo1_Pa0_Ac1_pUb1, dnabound_Foxo1_Pa1_Ac0_pUb0, dnabound_Foxo1_Pa1_Ac0_pUb1, dnabound_Foxo1_Pa1_Ac1_pUb0, dnabound_Foxo1_Pa1_Ac1_pUb1, nucleus_Foxo1_Pa0_Ac0_pUb0, nucleus_Foxo1_Pa0_Ac0_pUb1, nucleus_Foxo1_Pa0_Ac1_pUb0, nucleus_Foxo1_Pa0_Ac1_pUb1, nucleus_Foxo1_Pa1_Ac0_pUb0, nucleus_Foxo1_Pa1_Ac0_pUb1, nucleus_Foxo1_Pa1_Ac1_pUb0, nucleus_Foxo1_Pa1_Ac1_pUb1, nucleus_RNA_Inr]
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
11//2000*y3 + 1//20000*y5*y14 + 11//200*y26,
1//20000*y5*y15 + 1//1000000*y7*y10 + 11//200*y27,
1//20000*y5*y16 + 11//200*y28,
1//20000*y5*y17 + 333333333333//10000000000000000000*y7*y12 + 11//200*y29,
1//20000*y1*y10 + 1//20000*y8*y10 + 11//20*y30,
1//20000*y1*y11 + 3//1000000*y7*y14 + 1//20000*y8*y11 + 11//20*y31,
1//20000*y1*y12 + 1//20000*y8*y12 + 11//20*y32,
1//20000*y1*y13 + 1//10000000*y7*y16 + 1//20000*y8*y13 + 11//20*y33,
1//20000*y5*y22 + 1//10000*y9*y20 + 1//4*y26,
1//20000*y5*y23 + 1//1000000*y7*y18 + 1//10000*y9*y21 + 1//4*y27,
1//10000*y2*y18 + 1//20000*y5*y24 + 1//8*y28,
1//10000*y2*y19 + 1//20000*y5*y25 + 333333333333//10000000000000000000*y7*y20 + 1//8*y29,
1//20000*y1*y18 + 1//20000*y8*y18 + 1//10000*y9*y24 + 1//8*y30,
1//20000*y1*y19 + 3//1000000*y7*y22 + 1//20000*y8*y19 + 1//10000*y9*y25 + 1//8*y31,
1//20000*y1*y20 + 1//10000*y2*y22 + 1//20000*y8*y20 + 1//16*y32,
1//20000*y1*y21 + 1//10000*y2*y23 + 1//10000000*y7*y24 + 1//20000*y8*y21 + 1//16*y33,
1//20000*y5*y30 + 1//10000*y9*y28 + 90909090909//500000000000*y10 + 1//8*y18,
1//20000*y5*y31 + 1//1000000*y7*y26 + 1//10000*y9*y29 + 90909090909//500000000000*y11 + 1//8*y19,
1//10000*y2*y26 + 1//20000*y5*y32 + 90909090909//500000000000*y12 + 1//8*y20,
1//10000*y2*y27 + 1//20000*y5*y33 + 333333333333//10000000000000000000*y7*y28 + 90909090909//500000000000*y13 + 1//8*y21,
1//20000*y1*y26 + 1//20000*y8*y26 + 1//10000*y9*y32 + 90909090909//5000000000000*y14 + 1//8*y22,
1//20000*y1*y27 + 3//1000000*y7*y30 + 1//20000*y8*y27 + 1//10000*y9*y33 + 90909090909//5000000000000*y15 + 1//8*y23,
1//20000*y1*y28 + 1//10000*y2*y30 + 1//20000*y8*y28 + 90909090909//5000000000000*y16 + 1//8*y24,
1//20000*y1*y29 + 1//10000*y2*y31 + 1//10000000*y7*y32 + 1//20000*y8*y29 + 90909090909//5000000000000*y17 + 1//8*y25,
3*y4 + 3//10*y18 + 3//10*y19 + 3//10*y20 + 3//10*y21 + 3//10*y22 + 3//10*y23 + 3//10*y24 + 3//10*y25
]


new_vars = fmpq_mpoly[Akt, CBPP300, E2F1, I, PP2A, Proteasome, SCF, SGK, SIRT1, cytoplasm_Foxo1_Pa0_Ac0_pUb0, cytoplasm_Foxo1_Pa0_Ac0_pUb1, cytoplasm_Foxo1_Pa0_Ac1_pUb0, cytoplasm_Foxo1_Pa0_Ac1_pUb1, cytoplasm_Foxo1_Pa1_Ac0_pUb0, cytoplasm_Foxo1_Pa1_Ac0_pUb1, cytoplasm_Foxo1_Pa1_Ac1_pUb0, cytoplasm_Foxo1_Pa1_Ac1_pUb1, cytoplasm_RNA_Inr, dnabound_Foxo1_Pa0_Ac0_pUb0, dnabound_Foxo1_Pa0_Ac0_pUb1, dnabound_Foxo1_Pa0_Ac1_pUb0, dnabound_Foxo1_Pa0_Ac1_pUb1, dnabound_Foxo1_Pa1_Ac0_pUb0, dnabound_Foxo1_Pa1_Ac0_pUb1, dnabound_Foxo1_Pa1_Ac1_pUb0, dnabound_Foxo1_Pa1_Ac1_pUb1, nucleus_Foxo1_Pa0_Ac0_pUb0, nucleus_Foxo1_Pa0_Ac0_pUb1, nucleus_Foxo1_Pa0_Ac1_pUb0, nucleus_Foxo1_Pa0_Ac1_pUb1, nucleus_Foxo1_Pa1_Ac0_pUb0, nucleus_Foxo1_Pa1_Ac0_pUb1, nucleus_Foxo1_Pa1_Ac1_pUb0, nucleus_Foxo1_Pa1_Ac1_pUb1, nucleus_RNA_Inr]
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
11//2000*y3 + 1//20000*y5*y14 + 11//200*y27,
1//20000*y5*y15 + 1//1000000*y7*y10 + 11//200*y28,
1//20000*y5*y16 + 11//200*y29,
1//20000*y5*y17 + 333333333333//10000000000000000000*y7*y12 + 11//200*y30,
1//20000*y1*y10 + 1//20000*y8*y10 + 11//20*y31,
1//20000*y1*y11 + 3//1000000*y7*y14 + 1//20000*y8*y11 + 11//20*y32,
1//20000*y1*y12 + 1//20000*y8*y12 + 11//20*y33,
1//20000*y1*y13 + 1//10000000*y7*y16 + 1//20000*y8*y13 + 11//20*y34,
11//50*y35,
1//20000*y5*y23 + 1//10000*y9*y21 + 1//4*y27,
1//20000*y5*y24 + 1//1000000*y7*y19 + 1//10000*y9*y22 + 1//4*y28,
1//10000*y2*y19 + 1//20000*y5*y25 + 1//8*y29,
1//10000*y2*y20 + 1//20000*y5*y26 + 333333333333//10000000000000000000*y7*y21 + 1//8*y30,
1//20000*y1*y19 + 1//20000*y8*y19 + 1//10000*y9*y25 + 1//8*y31,
1//20000*y1*y20 + 3//1000000*y7*y23 + 1//20000*y8*y20 + 1//10000*y9*y26 + 1//8*y32,
1//20000*y1*y21 + 1//10000*y2*y23 + 1//20000*y8*y21 + 1//16*y33,
1//20000*y1*y22 + 1//10000*y2*y24 + 1//10000000*y7*y25 + 1//20000*y8*y22 + 1//16*y34,
1//20000*y5*y31 + 1//10000*y9*y29 + 90909090909//500000000000*y10 + 1//8*y19,
1//20000*y5*y32 + 1//1000000*y7*y27 + 1//10000*y9*y30 + 90909090909//500000000000*y11 + 1//8*y20,
1//10000*y2*y27 + 1//20000*y5*y33 + 90909090909//500000000000*y12 + 1//8*y21,
1//10000*y2*y28 + 1//20000*y5*y34 + 333333333333//10000000000000000000*y7*y29 + 90909090909//500000000000*y13 + 1//8*y22,
1//20000*y1*y27 + 1//20000*y8*y27 + 1//10000*y9*y33 + 90909090909//5000000000000*y14 + 1//8*y23,
1//20000*y1*y28 + 3//1000000*y7*y31 + 1//20000*y8*y28 + 1//10000*y9*y34 + 90909090909//5000000000000*y15 + 1//8*y24,
1//20000*y1*y29 + 1//10000*y2*y31 + 1//20000*y8*y29 + 90909090909//5000000000000*y16 + 1//8*y25,
1//20000*y1*y30 + 1//10000*y2*y32 + 1//10000000*y7*y33 + 1//20000*y8*y30 + 90909090909//5000000000000*y17 + 1//8*y26,
3*y4 + 3//10*y19 + 3//10*y20 + 3//10*y21 + 3//10*y22 + 3//10*y23 + 3//10*y24 + 3//10*y25 + 3//10*y26
]


new_vars = fmpq_mpoly[Akt, CBPP300, E2F1, I, PP2A, Proteasome, SCF, SGK, SIRT1, cytoplasm_Foxo1_Pa0_Ac0_pUb0, cytoplasm_Foxo1_Pa0_Ac0_pUb1, cytoplasm_Foxo1_Pa0_Ac1_pUb0, cytoplasm_Foxo1_Pa0_Ac1_pUb1, cytoplasm_Foxo1_Pa1_Ac0_pUb0, cytoplasm_Foxo1_Pa1_Ac0_pUb1, cytoplasm_Foxo1_Pa1_Ac1_pUb0, cytoplasm_Foxo1_Pa1_Ac1_pUb1, cytoplasm_Inr, cytoplasm_RNA_Inr, dnabound_Foxo1_Pa0_Ac0_pUb0, dnabound_Foxo1_Pa0_Ac0_pUb1, dnabound_Foxo1_Pa0_Ac1_pUb0, dnabound_Foxo1_Pa0_Ac1_pUb1, dnabound_Foxo1_Pa1_Ac0_pUb0, dnabound_Foxo1_Pa1_Ac0_pUb1, dnabound_Foxo1_Pa1_Ac1_pUb0, dnabound_Foxo1_Pa1_Ac1_pUb1, nucleus_Foxo1_Pa0_Ac0_pUb0, nucleus_Foxo1_Pa0_Ac0_pUb1, nucleus_Foxo1_Pa0_Ac1_pUb0, nucleus_Foxo1_Pa0_Ac1_pUb1, nucleus_Foxo1_Pa1_Ac0_pUb0, nucleus_Foxo1_Pa1_Ac0_pUb1, nucleus_Foxo1_Pa1_Ac1_pUb0, nucleus_Foxo1_Pa1_Ac1_pUb1, nucleus_RNA_Inr]
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
11//2000*y3 + 1//20000*y5*y14 + 11//200*y28,
1//20000*y5*y15 + 1//1000000*y7*y10 + 11//200*y29,
1//20000*y5*y16 + 11//200*y30,
1//20000*y5*y17 + 333333333333//10000000000000000000*y7*y12 + 11//200*y31,
1//20000*y1*y10 + 1//20000*y8*y10 + 11//20*y32,
1//20000*y1*y11 + 3//1000000*y7*y14 + 1//20000*y8*y11 + 11//20*y33,
1//20000*y1*y12 + 1//20000*y8*y12 + 11//20*y34,
1//20000*y1*y13 + 1//10000000*y7*y16 + 1//20000*y8*y13 + 11//20*y35,
123//100*y19,
11//50*y36,
1//20000*y5*y24 + 1//10000*y9*y22 + 1//4*y28,
1//20000*y5*y25 + 1//1000000*y7*y20 + 1//10000*y9*y23 + 1//4*y29,
1//10000*y2*y20 + 1//20000*y5*y26 + 1//8*y30,
1//10000*y2*y21 + 1//20000*y5*y27 + 333333333333//10000000000000000000*y7*y22 + 1//8*y31,
1//20000*y1*y20 + 1//20000*y8*y20 + 1//10000*y9*y26 + 1//8*y32,
1//20000*y1*y21 + 3//1000000*y7*y24 + 1//20000*y8*y21 + 1//10000*y9*y27 + 1//8*y33,
1//20000*y1*y22 + 1//10000*y2*y24 + 1//20000*y8*y22 + 1//16*y34,
1//20000*y1*y23 + 1//10000*y2*y25 + 1//10000000*y7*y26 + 1//20000*y8*y23 + 1//16*y35,
1//20000*y5*y32 + 1//10000*y9*y30 + 90909090909//500000000000*y10 + 1//8*y20,
1//20000*y5*y33 + 1//1000000*y7*y28 + 1//10000*y9*y31 + 90909090909//500000000000*y11 + 1//8*y21,
1//10000*y2*y28 + 1//20000*y5*y34 + 90909090909//500000000000*y12 + 1//8*y22,
1//10000*y2*y29 + 1//20000*y5*y35 + 333333333333//10000000000000000000*y7*y30 + 90909090909//500000000000*y13 + 1//8*y23,
1//20000*y1*y28 + 1//20000*y8*y28 + 1//10000*y9*y34 + 90909090909//5000000000000*y14 + 1//8*y24,
1//20000*y1*y29 + 3//1000000*y7*y32 + 1//20000*y8*y29 + 1//10000*y9*y35 + 90909090909//5000000000000*y15 + 1//8*y25,
1//20000*y1*y30 + 1//10000*y2*y32 + 1//20000*y8*y30 + 90909090909//5000000000000*y16 + 1//8*y26,
1//20000*y1*y31 + 1//10000*y2*y33 + 1//10000000*y7*y34 + 1//20000*y8*y31 + 90909090909//5000000000000*y17 + 1//8*y27,
3*y4 + 3//10*y20 + 3//10*y21 + 3//10*y22 + 3//10*y23 + 3//10*y24 + 3//10*y25 + 3//10*y26 + 3//10*y27
]


new_vars = fmpq_mpoly[Akt, CBPP300, E2F1, I, PP2A, Proteasome, SCF, SGK, SIRT1, cytoplasm_Foxo1_Pa0_Ac0_pUb0, cytoplasm_Foxo1_Pa0_Ac0_pUb1, cytoplasm_Foxo1_Pa0_Ac1_pUb0, cytoplasm_Foxo1_Pa0_Ac1_pUb1, cytoplasm_Foxo1_Pa1_Ac0_pUb0, cytoplasm_Foxo1_Pa1_Ac0_pUb1, cytoplasm_Foxo1_Pa1_Ac1_pUb0, cytoplasm_Foxo1_Pa1_Ac1_pUb1, cytoplasm_Inr, cytoplasm_RNA_Inr, dnabound_Foxo1_Pa0_Ac0_pUb0, dnabound_Foxo1_Pa0_Ac0_pUb1, dnabound_Foxo1_Pa0_Ac1_pUb0, dnabound_Foxo1_Pa0_Ac1_pUb1, dnabound_Foxo1_Pa1_Ac0_pUb0, dnabound_Foxo1_Pa1_Ac0_pUb1, dnabound_Foxo1_Pa1_Ac1_pUb0, dnabound_Foxo1_Pa1_Ac1_pUb1, nucleus_Foxo1_Pa0_Ac0_pUb0, nucleus_Foxo1_Pa0_Ac0_pUb1, nucleus_Foxo1_Pa0_Ac1_pUb0, nucleus_Foxo1_Pa0_Ac1_pUb1, nucleus_Foxo1_Pa1_Ac0_pUb0, nucleus_Foxo1_Pa1_Ac0_pUb1, nucleus_Foxo1_Pa1_Ac1_pUb0, nucleus_Foxo1_Pa1_Ac1_pUb1, nucleus_RNA_Inr, nucleus_RNA_Sod2]
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
11//2000*y3 + 1//20000*y5*y14 + 11//200*y28,
1//20000*y5*y15 + 1//1000000*y7*y10 + 11//200*y29,
1//20000*y5*y16 + 11//200*y30,
1//20000*y5*y17 + 333333333333//10000000000000000000*y7*y12 + 11//200*y31,
1//20000*y1*y10 + 1//20000*y8*y10 + 11//20*y32,
1//20000*y1*y11 + 3//1000000*y7*y14 + 1//20000*y8*y11 + 11//20*y33,
1//20000*y1*y12 + 1//20000*y8*y12 + 11//20*y34,
1//20000*y1*y13 + 1//10000000*y7*y16 + 1//20000*y8*y13 + 11//20*y35,
123//100*y19,
11//50*y36,
1//20000*y5*y24 + 1//10000*y9*y22 + 1//4*y28,
1//20000*y5*y25 + 1//1000000*y7*y20 + 1//10000*y9*y23 + 1//4*y29,
1//10000*y2*y20 + 1//20000*y5*y26 + 1//8*y30,
1//10000*y2*y21 + 1//20000*y5*y27 + 333333333333//10000000000000000000*y7*y22 + 1//8*y31,
1//20000*y1*y20 + 1//20000*y8*y20 + 1//10000*y9*y26 + 1//8*y32,
1//20000*y1*y21 + 3//1000000*y7*y24 + 1//20000*y8*y21 + 1//10000*y9*y27 + 1//8*y33,
1//20000*y1*y22 + 1//10000*y2*y24 + 1//20000*y8*y22 + 1//16*y34,
1//20000*y1*y23 + 1//10000*y2*y25 + 1//10000000*y7*y26 + 1//20000*y8*y23 + 1//16*y35,
1//20000*y5*y32 + 1//10000*y9*y30 + 90909090909//500000000000*y10 + 1//8*y20,
1//20000*y5*y33 + 1//1000000*y7*y28 + 1//10000*y9*y31 + 90909090909//500000000000*y11 + 1//8*y21,
1//10000*y2*y28 + 1//20000*y5*y34 + 90909090909//500000000000*y12 + 1//8*y22,
1//10000*y2*y29 + 1//20000*y5*y35 + 333333333333//10000000000000000000*y7*y30 + 90909090909//500000000000*y13 + 1//8*y23,
1//20000*y1*y28 + 1//20000*y8*y28 + 1//10000*y9*y34 + 90909090909//5000000000000*y14 + 1//8*y24,
1//20000*y1*y29 + 3//1000000*y7*y32 + 1//20000*y8*y29 + 1//10000*y9*y35 + 90909090909//5000000000000*y15 + 1//8*y25,
1//20000*y1*y30 + 1//10000*y2*y32 + 1//20000*y8*y30 + 90909090909//5000000000000*y16 + 1//8*y26,
1//20000*y1*y31 + 1//10000*y2*y33 + 1//10000000*y7*y34 + 1//20000*y8*y31 + 90909090909//5000000000000*y17 + 1//8*y27,
3*y4 + 3//10*y20 + 3//10*y21 + 3//10*y22 + 3//10*y23 + 3//10*y24 + 3//10*y25 + 3//10*y26 + 3//10*y27,
3*y4 + 3//10*y20 + 3//10*y21 + 3//10*y22 + 3//10*y23 + 3//10*y24 + 3//10*y25 + 3//10*y26 + 3//10*y27
]


new_vars = fmpq_mpoly[Akt, CBPP300, E2F1, I, PP2A, Proteasome, SCF, SGK, SIRT1, cytoplasm_Foxo1_Pa0_Ac0_pUb0, cytoplasm_Foxo1_Pa0_Ac0_pUb1, cytoplasm_Foxo1_Pa0_Ac1_pUb0, cytoplasm_Foxo1_Pa0_Ac1_pUb1, cytoplasm_Foxo1_Pa1_Ac0_pUb0, cytoplasm_Foxo1_Pa1_Ac0_pUb1, cytoplasm_Foxo1_Pa1_Ac1_pUb0, cytoplasm_Foxo1_Pa1_Ac1_pUb1, cytoplasm_Inr, cytoplasm_RNA_Inr, cytoplasm_RNA_Sod2, dnabound_Foxo1_Pa0_Ac0_pUb0, dnabound_Foxo1_Pa0_Ac0_pUb1, dnabound_Foxo1_Pa0_Ac1_pUb0, dnabound_Foxo1_Pa0_Ac1_pUb1, dnabound_Foxo1_Pa1_Ac0_pUb0, dnabound_Foxo1_Pa1_Ac0_pUb1, dnabound_Foxo1_Pa1_Ac1_pUb0, dnabound_Foxo1_Pa1_Ac1_pUb1, nucleus_Foxo1_Pa0_Ac0_pUb0, nucleus_Foxo1_Pa0_Ac0_pUb1, nucleus_Foxo1_Pa0_Ac1_pUb0, nucleus_Foxo1_Pa0_Ac1_pUb1, nucleus_Foxo1_Pa1_Ac0_pUb0, nucleus_Foxo1_Pa1_Ac0_pUb1, nucleus_Foxo1_Pa1_Ac1_pUb0, nucleus_Foxo1_Pa1_Ac1_pUb1, nucleus_RNA_Inr, nucleus_RNA_Sod2]
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
11//2000*y3 + 1//20000*y5*y14 + 11//200*y29,
1//20000*y5*y15 + 1//1000000*y7*y10 + 11//200*y30,
1//20000*y5*y16 + 11//200*y31,
1//20000*y5*y17 + 333333333333//10000000000000000000*y7*y12 + 11//200*y32,
1//20000*y1*y10 + 1//20000*y8*y10 + 11//20*y33,
1//20000*y1*y11 + 3//1000000*y7*y14 + 1//20000*y8*y11 + 11//20*y34,
1//20000*y1*y12 + 1//20000*y8*y12 + 11//20*y35,
1//20000*y1*y13 + 1//10000000*y7*y16 + 1//20000*y8*y13 + 11//20*y36,
123//100*y19,
11//50*y37,
11//50*y38,
1//20000*y5*y25 + 1//10000*y9*y23 + 1//4*y29,
1//20000*y5*y26 + 1//1000000*y7*y21 + 1//10000*y9*y24 + 1//4*y30,
1//10000*y2*y21 + 1//20000*y5*y27 + 1//8*y31,
1//10000*y2*y22 + 1//20000*y5*y28 + 333333333333//10000000000000000000*y7*y23 + 1//8*y32,
1//20000*y1*y21 + 1//20000*y8*y21 + 1//10000*y9*y27 + 1//8*y33,
1//20000*y1*y22 + 3//1000000*y7*y25 + 1//20000*y8*y22 + 1//10000*y9*y28 + 1//8*y34,
1//20000*y1*y23 + 1//10000*y2*y25 + 1//20000*y8*y23 + 1//16*y35,
1//20000*y1*y24 + 1//10000*y2*y26 + 1//10000000*y7*y27 + 1//20000*y8*y24 + 1//16*y36,
1//20000*y5*y33 + 1//10000*y9*y31 + 90909090909//500000000000*y10 + 1//8*y21,
1//20000*y5*y34 + 1//1000000*y7*y29 + 1//10000*y9*y32 + 90909090909//500000000000*y11 + 1//8*y22,
1//10000*y2*y29 + 1//20000*y5*y35 + 90909090909//500000000000*y12 + 1//8*y23,
1//10000*y2*y30 + 1//20000*y5*y36 + 333333333333//10000000000000000000*y7*y31 + 90909090909//500000000000*y13 + 1//8*y24,
1//20000*y1*y29 + 1//20000*y8*y29 + 1//10000*y9*y35 + 90909090909//5000000000000*y14 + 1//8*y25,
1//20000*y1*y30 + 3//1000000*y7*y33 + 1//20000*y8*y30 + 1//10000*y9*y36 + 90909090909//5000000000000*y15 + 1//8*y26,
1//20000*y1*y31 + 1//10000*y2*y33 + 1//20000*y8*y31 + 90909090909//5000000000000*y16 + 1//8*y27,
1//20000*y1*y32 + 1//10000*y2*y34 + 1//10000000*y7*y35 + 1//20000*y8*y32 + 90909090909//5000000000000*y17 + 1//8*y28,
3*y4 + 3//10*y21 + 3//10*y22 + 3//10*y23 + 3//10*y24 + 3//10*y25 + 3//10*y26 + 3//10*y27 + 3//10*y28,
3*y4 + 3//10*y21 + 3//10*y22 + 3//10*y23 + 3//10*y24 + 3//10*y25 + 3//10*y26 + 3//10*y27 + 3//10*y28
]


new_vars = fmpq_mpoly[Akt, CBPP300, E2F1, I, PP2A, Proteasome, SCF, SGK, SIRT1, cytoplasm_Foxo1_Pa0_Ac0_pUb0, cytoplasm_Foxo1_Pa0_Ac0_pUb1, cytoplasm_Foxo1_Pa0_Ac1_pUb0, cytoplasm_Foxo1_Pa0_Ac1_pUb1, cytoplasm_Foxo1_Pa1_Ac0_pUb0, cytoplasm_Foxo1_Pa1_Ac0_pUb1, cytoplasm_Foxo1_Pa1_Ac1_pUb0, cytoplasm_Foxo1_Pa1_Ac1_pUb1, cytoplasm_Inr, cytoplasm_RNA_Inr, cytoplasm_RNA_Sod2, cytoplasm_Sod2, dnabound_Foxo1_Pa0_Ac0_pUb0, dnabound_Foxo1_Pa0_Ac0_pUb1, dnabound_Foxo1_Pa0_Ac1_pUb0, dnabound_Foxo1_Pa0_Ac1_pUb1, dnabound_Foxo1_Pa1_Ac0_pUb0, dnabound_Foxo1_Pa1_Ac0_pUb1, dnabound_Foxo1_Pa1_Ac1_pUb0, dnabound_Foxo1_Pa1_Ac1_pUb1, nucleus_Foxo1_Pa0_Ac0_pUb0, nucleus_Foxo1_Pa0_Ac0_pUb1, nucleus_Foxo1_Pa0_Ac1_pUb0, nucleus_Foxo1_Pa0_Ac1_pUb1, nucleus_Foxo1_Pa1_Ac0_pUb0, nucleus_Foxo1_Pa1_Ac0_pUb1, nucleus_Foxo1_Pa1_Ac1_pUb0, nucleus_Foxo1_Pa1_Ac1_pUb1, nucleus_RNA_Inr, nucleus_RNA_Sod2]
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
11//2000*y3 + 1//20000*y5*y14 + 11//200*y30,
1//20000*y5*y15 + 1//1000000*y7*y10 + 11//200*y31,
1//20000*y5*y16 + 11//200*y32,
1//20000*y5*y17 + 333333333333//10000000000000000000*y7*y12 + 11//200*y33,
1//20000*y1*y10 + 1//20000*y8*y10 + 11//20*y34,
1//20000*y1*y11 + 3//1000000*y7*y14 + 1//20000*y8*y11 + 11//20*y35,
1//20000*y1*y12 + 1//20000*y8*y12 + 11//20*y36,
1//20000*y1*y13 + 1//10000000*y7*y16 + 1//20000*y8*y13 + 11//20*y37,
123//100*y19,
11//50*y38,
11//50*y39,
123//100*y20,
1//20000*y5*y26 + 1//10000*y9*y24 + 1//4*y30,
1//20000*y5*y27 + 1//1000000*y7*y22 + 1//10000*y9*y25 + 1//4*y31,
1//10000*y2*y22 + 1//20000*y5*y28 + 1//8*y32,
1//10000*y2*y23 + 1//20000*y5*y29 + 333333333333//10000000000000000000*y7*y24 + 1//8*y33,
1//20000*y1*y22 + 1//20000*y8*y22 + 1//10000*y9*y28 + 1//8*y34,
1//20000*y1*y23 + 3//1000000*y7*y26 + 1//20000*y8*y23 + 1//10000*y9*y29 + 1//8*y35,
1//20000*y1*y24 + 1//10000*y2*y26 + 1//20000*y8*y24 + 1//16*y36,
1//20000*y1*y25 + 1//10000*y2*y27 + 1//10000000*y7*y28 + 1//20000*y8*y25 + 1//16*y37,
1//20000*y5*y34 + 1//10000*y9*y32 + 90909090909//500000000000*y10 + 1//8*y22,
1//20000*y5*y35 + 1//1000000*y7*y30 + 1//10000*y9*y33 + 90909090909//500000000000*y11 + 1//8*y23,
1//10000*y2*y30 + 1//20000*y5*y36 + 90909090909//500000000000*y12 + 1//8*y24,
1//10000*y2*y31 + 1//20000*y5*y37 + 333333333333//10000000000000000000*y7*y32 + 90909090909//500000000000*y13 + 1//8*y25,
1//20000*y1*y30 + 1//20000*y8*y30 + 1//10000*y9*y36 + 90909090909//5000000000000*y14 + 1//8*y26,
1//20000*y1*y31 + 3//1000000*y7*y34 + 1//20000*y8*y31 + 1//10000*y9*y37 + 90909090909//5000000000000*y15 + 1//8*y27,
1//20000*y1*y32 + 1//10000*y2*y34 + 1//20000*y8*y32 + 90909090909//5000000000000*y16 + 1//8*y28,
1//20000*y1*y33 + 1//10000*y2*y35 + 1//10000000*y7*y36 + 1//20000*y8*y33 + 90909090909//5000000000000*y17 + 1//8*y29,
3*y4 + 3//10*y22 + 3//10*y23 + 3//10*y24 + 3//10*y25 + 3//10*y26 + 3//10*y27 + 3//10*y28 + 3//10*y29,
3*y4 + 3//10*y22 + 3//10*y23 + 3//10*y24 + 3//10*y25 + 3//10*y26 + 3//10*y27 + 3//10*y28 + 3//10*y29
]


new_vars = fmpq_mpoly[Akt, CBPP300, E2F1, I, PP2A, Proteasome, SCF, SGK, SIRT1, cytoplasm_Foxo1_Pa0_Ac0_pUb0, cytoplasm_Foxo1_Pa0_Ac0_pUb1, cytoplasm_Foxo1_Pa0_Ac1_pUb0, cytoplasm_Foxo1_Pa0_Ac1_pUb1, cytoplasm_Foxo1_Pa1_Ac0_pUb0, cytoplasm_Foxo1_Pa1_Ac0_pUb1, cytoplasm_Foxo1_Pa1_Ac1_pUb0, cytoplasm_Foxo1_Pa1_Ac1_pUb1, cytoplasm_Inr, cytoplasm_RNA_Inr, cytoplasm_RNA_Sod2, cytoplasm_Sod2, degr_Foxo1, dnabound_Foxo1_Pa0_Ac0_pUb0, dnabound_Foxo1_Pa0_Ac0_pUb1, dnabound_Foxo1_Pa0_Ac1_pUb0, dnabound_Foxo1_Pa0_Ac1_pUb1, dnabound_Foxo1_Pa1_Ac0_pUb0, dnabound_Foxo1_Pa1_Ac0_pUb1, dnabound_Foxo1_Pa1_Ac1_pUb0, dnabound_Foxo1_Pa1_Ac1_pUb1, nucleus_Foxo1_Pa0_Ac0_pUb0, nucleus_Foxo1_Pa0_Ac0_pUb1, nucleus_Foxo1_Pa0_Ac1_pUb0, nucleus_Foxo1_Pa0_Ac1_pUb1, nucleus_Foxo1_Pa1_Ac0_pUb0, nucleus_Foxo1_Pa1_Ac0_pUb1, nucleus_Foxo1_Pa1_Ac1_pUb0, nucleus_Foxo1_Pa1_Ac1_pUb1, nucleus_RNA_Inr, nucleus_RNA_Sod2]
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
11//2000*y3 + 1//20000*y5*y14 + 11//200*y31,
1//20000*y5*y15 + 1//1000000*y7*y10 + 11//200*y32,
1//20000*y5*y16 + 11//200*y33,
1//20000*y5*y17 + 333333333333//10000000000000000000*y7*y12 + 11//200*y34,
1//20000*y1*y10 + 1//20000*y8*y10 + 11//20*y35,
1//20000*y1*y11 + 3//1000000*y7*y14 + 1//20000*y8*y11 + 11//20*y36,
1//20000*y1*y12 + 1//20000*y8*y12 + 11//20*y37,
1//20000*y1*y13 + 1//10000000*y7*y16 + 1//20000*y8*y13 + 11//20*y38,
123//100*y19,
11//50*y39,
11//50*y40,
123//100*y20,
1//10000*y6*y11 + 1//10000*y6*y13 + 1//10000*y6*y15 + 1//10000*y6*y17,
1//20000*y5*y27 + 1//10000*y9*y25 + 1//4*y31,
1//20000*y5*y28 + 1//1000000*y7*y23 + 1//10000*y9*y26 + 1//4*y32,
1//10000*y2*y23 + 1//20000*y5*y29 + 1//8*y33,
1//10000*y2*y24 + 1//20000*y5*y30 + 333333333333//10000000000000000000*y7*y25 + 1//8*y34,
1//20000*y1*y23 + 1//20000*y8*y23 + 1//10000*y9*y29 + 1//8*y35,
1//20000*y1*y24 + 3//1000000*y7*y27 + 1//20000*y8*y24 + 1//10000*y9*y30 + 1//8*y36,
1//20000*y1*y25 + 1//10000*y2*y27 + 1//20000*y8*y25 + 1//16*y37,
1//20000*y1*y26 + 1//10000*y2*y28 + 1//10000000*y7*y29 + 1//20000*y8*y26 + 1//16*y38,
1//20000*y5*y35 + 1//10000*y9*y33 + 90909090909//500000000000*y10 + 1//8*y23,
1//20000*y5*y36 + 1//1000000*y7*y31 + 1//10000*y9*y34 + 90909090909//500000000000*y11 + 1//8*y24,
1//10000*y2*y31 + 1//20000*y5*y37 + 90909090909//500000000000*y12 + 1//8*y25,
1//10000*y2*y32 + 1//20000*y5*y38 + 333333333333//10000000000000000000*y7*y33 + 90909090909//500000000000*y13 + 1//8*y26,
1//20000*y1*y31 + 1//20000*y8*y31 + 1//10000*y9*y37 + 90909090909//5000000000000*y14 + 1//8*y27,
1//20000*y1*y32 + 3//1000000*y7*y35 + 1//20000*y8*y32 + 1//10000*y9*y38 + 90909090909//5000000000000*y15 + 1//8*y28,
1//20000*y1*y33 + 1//10000*y2*y35 + 1//20000*y8*y33 + 90909090909//5000000000000*y16 + 1//8*y29,
1//20000*y1*y34 + 1//10000*y2*y36 + 1//10000000*y7*y37 + 1//20000*y8*y34 + 90909090909//5000000000000*y17 + 1//8*y30,
3*y4 + 3//10*y23 + 3//10*y24 + 3//10*y25 + 3//10*y26 + 3//10*y27 + 3//10*y28 + 3//10*y29 + 3//10*y30,
3*y4 + 3//10*y23 + 3//10*y24 + 3//10*y25 + 3//10*y26 + 3//10*y27 + 3//10*y28 + 3//10*y29 + 3//10*y30
]


