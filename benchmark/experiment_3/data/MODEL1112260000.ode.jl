Original system:

[
E2F1 => 0,
dnabound_Foxo1_Pa1_pUb0 => 1//20000*Akt*dnabound_Foxo1_Pa0_pUb0 + 1//20000*SGK*dnabound_Foxo1_Pa0_pUb0 + 1//8*nucleus_Foxo1_Pa1_pUb0,
Proteasome => 0,
cytoplasm_Foxo1_Pa0_pUb1 => 1//20000*PP2A*cytoplasm_Foxo1_Pa1_pUb1 + 1//1000000*SCF*cytoplasm_Foxo1_Pa0_pUb0 + 11//200*nucleus_Foxo1_Pa0_pUb1,
cytoplasm_Foxo1_Pa1_pUb0 => 1//20000*Akt*cytoplasm_Foxo1_Pa0_pUb0 + 1//20000*SGK*cytoplasm_Foxo1_Pa0_pUb0 + 11//20*nucleus_Foxo1_Pa1_pUb0,
degr_Foxo1 => 1//10000*Proteasome*cytoplasm_Foxo1_Pa0_pUb1 + 1//10000*Proteasome*cytoplasm_Foxo1_Pa1_pUb1,
SCF => 0,
nucleus_RNA_Inr => 3*I + 3//10*dnabound_Foxo1_Pa0_pUb0 + 3//10*dnabound_Foxo1_Pa0_pUb1 + 3//10*dnabound_Foxo1_Pa1_pUb0 + 3//10*dnabound_Foxo1_Pa1_pUb1,
Akt => 0,
PP2A => 0,
cytoplasm_RNA_Inr => 11//50*nucleus_RNA_Inr,
nucleus_Foxo1_Pa0_pUb0 => 1//20000*PP2A*nucleus_Foxo1_Pa1_pUb0 + 90909090909//500000000000*cytoplasm_Foxo1_Pa0_pUb0 + 1//8*dnabound_Foxo1_Pa0_pUb0,
dnabound_Foxo1_Pa1_pUb1 => 1//20000*Akt*dnabound_Foxo1_Pa0_pUb1 + 3//1000000*SCF*dnabound_Foxo1_Pa1_pUb0 + 1//20000*SGK*dnabound_Foxo1_Pa0_pUb1 + 1//8*nucleus_Foxo1_Pa1_pUb1,
cytoplasm_Inr => 123//100*cytoplasm_RNA_Inr,
nucleus_RNA_Sod2 => 3*I + 3//10*dnabound_Foxo1_Pa0_pUb0 + 3//10*dnabound_Foxo1_Pa0_pUb1 + 3//10*dnabound_Foxo1_Pa1_pUb0 + 3//10*dnabound_Foxo1_Pa1_pUb1,
dnabound_Foxo1_Pa0_pUb1 => 1//20000*PP2A*dnabound_Foxo1_Pa1_pUb1 + 1//1000000*SCF*dnabound_Foxo1_Pa0_pUb0 + 1//4*nucleus_Foxo1_Pa0_pUb1,
dnabound_Foxo1_Pa0_pUb0 => 1//20000*PP2A*dnabound_Foxo1_Pa1_pUb0 + 1//4*nucleus_Foxo1_Pa0_pUb0,
null => -11//2000*E2F1 - 6*I + 19//10000*cytoplasm_Inr + 549//125*cytoplasm_RNA_Inr + 549//125*cytoplasm_RNA_Sod2 + 19//10000*cytoplasm_Sod2 - 3//5*dnabound_Foxo1_Pa0_pUb0 - 3//5*dnabound_Foxo1_Pa0_pUb1 - 3//5*dnabound_Foxo1_Pa1_pUb0 - 3//5*dnabound_Foxo1_Pa1_pUb1,
SGK => 0,
cytoplasm_Foxo1_Pa0_pUb0 => 11//2000*E2F1 + 1//20000*PP2A*cytoplasm_Foxo1_Pa1_pUb0 + 11//200*nucleus_Foxo1_Pa0_pUb0,
cytoplasm_RNA_Sod2 => 11//50*nucleus_RNA_Sod2,
cytoplasm_Sod2 => 123//100*cytoplasm_RNA_Sod2,
nucleus_Foxo1_Pa0_pUb1 => 1//20000*PP2A*nucleus_Foxo1_Pa1_pUb1 + 1//1000000*SCF*nucleus_Foxo1_Pa0_pUb0 + 90909090909//500000000000*cytoplasm_Foxo1_Pa0_pUb1 + 1//8*dnabound_Foxo1_Pa0_pUb1,
nucleus_Foxo1_Pa1_pUb1 => 1//20000*Akt*nucleus_Foxo1_Pa0_pUb1 + 3//1000000*SCF*nucleus_Foxo1_Pa1_pUb0 + 1//20000*SGK*nucleus_Foxo1_Pa0_pUb1 + 90909090909//5000000000000*cytoplasm_Foxo1_Pa1_pUb1 + 1//8*dnabound_Foxo1_Pa1_pUb1,
I => 0,
nucleus_Foxo1_Pa1_pUb0 => 1//20000*Akt*nucleus_Foxo1_Pa0_pUb0 + 1//20000*SGK*nucleus_Foxo1_Pa0_pUb0 + 90909090909//5000000000000*cytoplasm_Foxo1_Pa1_pUb0 + 1//8*dnabound_Foxo1_Pa1_pUb0,
cytoplasm_Foxo1_Pa1_pUb1 => 1//20000*Akt*cytoplasm_Foxo1_Pa0_pUb1 + 3//1000000*SCF*cytoplasm_Foxo1_Pa1_pUb0 + 1//20000*SGK*cytoplasm_Foxo1_Pa0_pUb1 + 11//20*nucleus_Foxo1_Pa1_pUb1
]

Reductions:


new_vars = fmpq_mpoly[Akt]
new_system = 
[
0
]


new_vars = fmpq_mpoly[Akt, E2F1]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[Akt, E2F1, I]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[Akt, E2F1, I, PP2A]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Akt, E2F1, I, PP2A, Proteasome]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Akt, E2F1, I, PP2A, Proteasome, SCF]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Akt, E2F1, I, PP2A, Proteasome, SCF, SGK]
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


new_vars = fmpq_mpoly[Akt, E2F1, I, PP2A, Proteasome, SCF, SGK, cytoplasm_Foxo1_Pa0_pUb0, cytoplasm_Foxo1_Pa1_pUb0, dnabound_Foxo1_Pa0_pUb0, dnabound_Foxo1_Pa1_pUb0, nucleus_Foxo1_Pa0_pUb0, nucleus_Foxo1_Pa1_pUb0]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
11//2000*y2 + 1//20000*y4*y9 + 11//200*y12,
1//20000*y1*y8 + 1//20000*y7*y8 + 11//20*y13,
1//20000*y4*y11 + 1//4*y12,
1//20000*y1*y10 + 1//20000*y7*y10 + 1//8*y13,
1//20000*y4*y13 + 90909090909//500000000000*y8 + 1//8*y10,
1//20000*y1*y12 + 1//20000*y7*y12 + 90909090909//5000000000000*y9 + 1//8*y11
]


new_vars = fmpq_mpoly[Akt, E2F1, I, PP2A, Proteasome, SCF, SGK, cytoplasm_Foxo1_Pa0_pUb0, cytoplasm_Foxo1_Pa0_pUb1, cytoplasm_Foxo1_Pa1_pUb0, cytoplasm_Foxo1_Pa1_pUb1, dnabound_Foxo1_Pa0_pUb0, dnabound_Foxo1_Pa0_pUb1, dnabound_Foxo1_Pa1_pUb0, dnabound_Foxo1_Pa1_pUb1, nucleus_Foxo1_Pa0_pUb0, nucleus_Foxo1_Pa0_pUb1, nucleus_Foxo1_Pa1_pUb0, nucleus_Foxo1_Pa1_pUb1]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
11//2000*y2 + 1//20000*y4*y10 + 11//200*y16,
1//20000*y4*y11 + 1//1000000*y6*y8 + 11//200*y17,
1//20000*y1*y8 + 1//20000*y7*y8 + 11//20*y18,
1//20000*y1*y9 + 3//1000000*y6*y10 + 1//20000*y7*y9 + 11//20*y19,
1//20000*y4*y14 + 1//4*y16,
1//20000*y4*y15 + 1//1000000*y6*y12 + 1//4*y17,
1//20000*y1*y12 + 1//20000*y7*y12 + 1//8*y18,
1//20000*y1*y13 + 3//1000000*y6*y14 + 1//20000*y7*y13 + 1//8*y19,
1//20000*y4*y18 + 90909090909//500000000000*y8 + 1//8*y12,
1//20000*y4*y19 + 1//1000000*y6*y16 + 90909090909//500000000000*y9 + 1//8*y13,
1//20000*y1*y16 + 1//20000*y7*y16 + 90909090909//5000000000000*y10 + 1//8*y14,
1//20000*y1*y17 + 3//1000000*y6*y18 + 1//20000*y7*y17 + 90909090909//5000000000000*y11 + 1//8*y15
]


new_vars = fmpq_mpoly[Akt, E2F1, I, PP2A, Proteasome, SCF, SGK, cytoplasm_Foxo1_Pa0_pUb0, cytoplasm_Foxo1_Pa0_pUb1, cytoplasm_Foxo1_Pa1_pUb0, cytoplasm_Foxo1_Pa1_pUb1, dnabound_Foxo1_Pa0_pUb0, dnabound_Foxo1_Pa0_pUb1, dnabound_Foxo1_Pa1_pUb0, dnabound_Foxo1_Pa1_pUb1, nucleus_Foxo1_Pa0_pUb0, nucleus_Foxo1_Pa0_pUb1, nucleus_Foxo1_Pa1_pUb0, nucleus_Foxo1_Pa1_pUb1, nucleus_RNA_Inr]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
11//2000*y2 + 1//20000*y4*y10 + 11//200*y16,
1//20000*y4*y11 + 1//1000000*y6*y8 + 11//200*y17,
1//20000*y1*y8 + 1//20000*y7*y8 + 11//20*y18,
1//20000*y1*y9 + 3//1000000*y6*y10 + 1//20000*y7*y9 + 11//20*y19,
1//20000*y4*y14 + 1//4*y16,
1//20000*y4*y15 + 1//1000000*y6*y12 + 1//4*y17,
1//20000*y1*y12 + 1//20000*y7*y12 + 1//8*y18,
1//20000*y1*y13 + 3//1000000*y6*y14 + 1//20000*y7*y13 + 1//8*y19,
1//20000*y4*y18 + 90909090909//500000000000*y8 + 1//8*y12,
1//20000*y4*y19 + 1//1000000*y6*y16 + 90909090909//500000000000*y9 + 1//8*y13,
1//20000*y1*y16 + 1//20000*y7*y16 + 90909090909//5000000000000*y10 + 1//8*y14,
1//20000*y1*y17 + 3//1000000*y6*y18 + 1//20000*y7*y17 + 90909090909//5000000000000*y11 + 1//8*y15,
3*y3 + 3//10*y12 + 3//10*y13 + 3//10*y14 + 3//10*y15
]


new_vars = fmpq_mpoly[Akt, E2F1, I, PP2A, Proteasome, SCF, SGK, cytoplasm_Foxo1_Pa0_pUb0, cytoplasm_Foxo1_Pa0_pUb1, cytoplasm_Foxo1_Pa1_pUb0, cytoplasm_Foxo1_Pa1_pUb1, cytoplasm_RNA_Inr, dnabound_Foxo1_Pa0_pUb0, dnabound_Foxo1_Pa0_pUb1, dnabound_Foxo1_Pa1_pUb0, dnabound_Foxo1_Pa1_pUb1, nucleus_Foxo1_Pa0_pUb0, nucleus_Foxo1_Pa0_pUb1, nucleus_Foxo1_Pa1_pUb0, nucleus_Foxo1_Pa1_pUb1, nucleus_RNA_Inr]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
11//2000*y2 + 1//20000*y4*y10 + 11//200*y17,
1//20000*y4*y11 + 1//1000000*y6*y8 + 11//200*y18,
1//20000*y1*y8 + 1//20000*y7*y8 + 11//20*y19,
1//20000*y1*y9 + 3//1000000*y6*y10 + 1//20000*y7*y9 + 11//20*y20,
11//50*y21,
1//20000*y4*y15 + 1//4*y17,
1//20000*y4*y16 + 1//1000000*y6*y13 + 1//4*y18,
1//20000*y1*y13 + 1//20000*y7*y13 + 1//8*y19,
1//20000*y1*y14 + 3//1000000*y6*y15 + 1//20000*y7*y14 + 1//8*y20,
1//20000*y4*y19 + 90909090909//500000000000*y8 + 1//8*y13,
1//20000*y4*y20 + 1//1000000*y6*y17 + 90909090909//500000000000*y9 + 1//8*y14,
1//20000*y1*y17 + 1//20000*y7*y17 + 90909090909//5000000000000*y10 + 1//8*y15,
1//20000*y1*y18 + 3//1000000*y6*y19 + 1//20000*y7*y18 + 90909090909//5000000000000*y11 + 1//8*y16,
3*y3 + 3//10*y13 + 3//10*y14 + 3//10*y15 + 3//10*y16
]


new_vars = fmpq_mpoly[Akt, E2F1, I, PP2A, Proteasome, SCF, SGK, cytoplasm_Foxo1_Pa0_pUb0, cytoplasm_Foxo1_Pa0_pUb1, cytoplasm_Foxo1_Pa1_pUb0, cytoplasm_Foxo1_Pa1_pUb1, cytoplasm_Inr, cytoplasm_RNA_Inr, dnabound_Foxo1_Pa0_pUb0, dnabound_Foxo1_Pa0_pUb1, dnabound_Foxo1_Pa1_pUb0, dnabound_Foxo1_Pa1_pUb1, nucleus_Foxo1_Pa0_pUb0, nucleus_Foxo1_Pa0_pUb1, nucleus_Foxo1_Pa1_pUb0, nucleus_Foxo1_Pa1_pUb1, nucleus_RNA_Inr]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
11//2000*y2 + 1//20000*y4*y10 + 11//200*y18,
1//20000*y4*y11 + 1//1000000*y6*y8 + 11//200*y19,
1//20000*y1*y8 + 1//20000*y7*y8 + 11//20*y20,
1//20000*y1*y9 + 3//1000000*y6*y10 + 1//20000*y7*y9 + 11//20*y21,
123//100*y13,
11//50*y22,
1//20000*y4*y16 + 1//4*y18,
1//20000*y4*y17 + 1//1000000*y6*y14 + 1//4*y19,
1//20000*y1*y14 + 1//20000*y7*y14 + 1//8*y20,
1//20000*y1*y15 + 3//1000000*y6*y16 + 1//20000*y7*y15 + 1//8*y21,
1//20000*y4*y20 + 90909090909//500000000000*y8 + 1//8*y14,
1//20000*y4*y21 + 1//1000000*y6*y18 + 90909090909//500000000000*y9 + 1//8*y15,
1//20000*y1*y18 + 1//20000*y7*y18 + 90909090909//5000000000000*y10 + 1//8*y16,
1//20000*y1*y19 + 3//1000000*y6*y20 + 1//20000*y7*y19 + 90909090909//5000000000000*y11 + 1//8*y17,
3*y3 + 3//10*y14 + 3//10*y15 + 3//10*y16 + 3//10*y17
]


new_vars = fmpq_mpoly[Akt, E2F1, I, PP2A, Proteasome, SCF, SGK, cytoplasm_Foxo1_Pa0_pUb0, cytoplasm_Foxo1_Pa0_pUb1, cytoplasm_Foxo1_Pa1_pUb0, cytoplasm_Foxo1_Pa1_pUb1, cytoplasm_Inr, cytoplasm_RNA_Inr, dnabound_Foxo1_Pa0_pUb0, dnabound_Foxo1_Pa0_pUb1, dnabound_Foxo1_Pa1_pUb0, dnabound_Foxo1_Pa1_pUb1, nucleus_Foxo1_Pa0_pUb0, nucleus_Foxo1_Pa0_pUb1, nucleus_Foxo1_Pa1_pUb0, nucleus_Foxo1_Pa1_pUb1, nucleus_RNA_Inr, nucleus_RNA_Sod2]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
11//2000*y2 + 1//20000*y4*y10 + 11//200*y18,
1//20000*y4*y11 + 1//1000000*y6*y8 + 11//200*y19,
1//20000*y1*y8 + 1//20000*y7*y8 + 11//20*y20,
1//20000*y1*y9 + 3//1000000*y6*y10 + 1//20000*y7*y9 + 11//20*y21,
123//100*y13,
11//50*y22,
1//20000*y4*y16 + 1//4*y18,
1//20000*y4*y17 + 1//1000000*y6*y14 + 1//4*y19,
1//20000*y1*y14 + 1//20000*y7*y14 + 1//8*y20,
1//20000*y1*y15 + 3//1000000*y6*y16 + 1//20000*y7*y15 + 1//8*y21,
1//20000*y4*y20 + 90909090909//500000000000*y8 + 1//8*y14,
1//20000*y4*y21 + 1//1000000*y6*y18 + 90909090909//500000000000*y9 + 1//8*y15,
1//20000*y1*y18 + 1//20000*y7*y18 + 90909090909//5000000000000*y10 + 1//8*y16,
1//20000*y1*y19 + 3//1000000*y6*y20 + 1//20000*y7*y19 + 90909090909//5000000000000*y11 + 1//8*y17,
3*y3 + 3//10*y14 + 3//10*y15 + 3//10*y16 + 3//10*y17,
3*y3 + 3//10*y14 + 3//10*y15 + 3//10*y16 + 3//10*y17
]


new_vars = fmpq_mpoly[Akt, E2F1, I, PP2A, Proteasome, SCF, SGK, cytoplasm_Foxo1_Pa0_pUb0, cytoplasm_Foxo1_Pa0_pUb1, cytoplasm_Foxo1_Pa1_pUb0, cytoplasm_Foxo1_Pa1_pUb1, cytoplasm_Inr, cytoplasm_RNA_Inr, cytoplasm_RNA_Sod2, dnabound_Foxo1_Pa0_pUb0, dnabound_Foxo1_Pa0_pUb1, dnabound_Foxo1_Pa1_pUb0, dnabound_Foxo1_Pa1_pUb1, nucleus_Foxo1_Pa0_pUb0, nucleus_Foxo1_Pa0_pUb1, nucleus_Foxo1_Pa1_pUb0, nucleus_Foxo1_Pa1_pUb1, nucleus_RNA_Inr, nucleus_RNA_Sod2]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
11//2000*y2 + 1//20000*y4*y10 + 11//200*y19,
1//20000*y4*y11 + 1//1000000*y6*y8 + 11//200*y20,
1//20000*y1*y8 + 1//20000*y7*y8 + 11//20*y21,
1//20000*y1*y9 + 3//1000000*y6*y10 + 1//20000*y7*y9 + 11//20*y22,
123//100*y13,
11//50*y23,
11//50*y24,
1//20000*y4*y17 + 1//4*y19,
1//20000*y4*y18 + 1//1000000*y6*y15 + 1//4*y20,
1//20000*y1*y15 + 1//20000*y7*y15 + 1//8*y21,
1//20000*y1*y16 + 3//1000000*y6*y17 + 1//20000*y7*y16 + 1//8*y22,
1//20000*y4*y21 + 90909090909//500000000000*y8 + 1//8*y15,
1//20000*y4*y22 + 1//1000000*y6*y19 + 90909090909//500000000000*y9 + 1//8*y16,
1//20000*y1*y19 + 1//20000*y7*y19 + 90909090909//5000000000000*y10 + 1//8*y17,
1//20000*y1*y20 + 3//1000000*y6*y21 + 1//20000*y7*y20 + 90909090909//5000000000000*y11 + 1//8*y18,
3*y3 + 3//10*y15 + 3//10*y16 + 3//10*y17 + 3//10*y18,
3*y3 + 3//10*y15 + 3//10*y16 + 3//10*y17 + 3//10*y18
]


new_vars = fmpq_mpoly[Akt, E2F1, I, PP2A, Proteasome, SCF, SGK, cytoplasm_Foxo1_Pa0_pUb0, cytoplasm_Foxo1_Pa0_pUb1, cytoplasm_Foxo1_Pa1_pUb0, cytoplasm_Foxo1_Pa1_pUb1, cytoplasm_Inr, cytoplasm_RNA_Inr, cytoplasm_RNA_Sod2, cytoplasm_Sod2, dnabound_Foxo1_Pa0_pUb0, dnabound_Foxo1_Pa0_pUb1, dnabound_Foxo1_Pa1_pUb0, dnabound_Foxo1_Pa1_pUb1, nucleus_Foxo1_Pa0_pUb0, nucleus_Foxo1_Pa0_pUb1, nucleus_Foxo1_Pa1_pUb0, nucleus_Foxo1_Pa1_pUb1, nucleus_RNA_Inr, nucleus_RNA_Sod2]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
11//2000*y2 + 1//20000*y4*y10 + 11//200*y20,
1//20000*y4*y11 + 1//1000000*y6*y8 + 11//200*y21,
1//20000*y1*y8 + 1//20000*y7*y8 + 11//20*y22,
1//20000*y1*y9 + 3//1000000*y6*y10 + 1//20000*y7*y9 + 11//20*y23,
123//100*y13,
11//50*y24,
11//50*y25,
123//100*y14,
1//20000*y4*y18 + 1//4*y20,
1//20000*y4*y19 + 1//1000000*y6*y16 + 1//4*y21,
1//20000*y1*y16 + 1//20000*y7*y16 + 1//8*y22,
1//20000*y1*y17 + 3//1000000*y6*y18 + 1//20000*y7*y17 + 1//8*y23,
1//20000*y4*y22 + 90909090909//500000000000*y8 + 1//8*y16,
1//20000*y4*y23 + 1//1000000*y6*y20 + 90909090909//500000000000*y9 + 1//8*y17,
1//20000*y1*y20 + 1//20000*y7*y20 + 90909090909//5000000000000*y10 + 1//8*y18,
1//20000*y1*y21 + 3//1000000*y6*y22 + 1//20000*y7*y21 + 90909090909//5000000000000*y11 + 1//8*y19,
3*y3 + 3//10*y16 + 3//10*y17 + 3//10*y18 + 3//10*y19,
3*y3 + 3//10*y16 + 3//10*y17 + 3//10*y18 + 3//10*y19
]


new_vars = fmpq_mpoly[Akt, E2F1, I, PP2A, Proteasome, SCF, SGK, cytoplasm_Foxo1_Pa0_pUb0, cytoplasm_Foxo1_Pa0_pUb1, cytoplasm_Foxo1_Pa1_pUb0, cytoplasm_Foxo1_Pa1_pUb1, cytoplasm_Inr, cytoplasm_RNA_Inr, cytoplasm_RNA_Sod2, cytoplasm_Sod2, degr_Foxo1, dnabound_Foxo1_Pa0_pUb0, dnabound_Foxo1_Pa0_pUb1, dnabound_Foxo1_Pa1_pUb0, dnabound_Foxo1_Pa1_pUb1, nucleus_Foxo1_Pa0_pUb0, nucleus_Foxo1_Pa0_pUb1, nucleus_Foxo1_Pa1_pUb0, nucleus_Foxo1_Pa1_pUb1, nucleus_RNA_Inr, nucleus_RNA_Sod2]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
11//2000*y2 + 1//20000*y4*y10 + 11//200*y21,
1//20000*y4*y11 + 1//1000000*y6*y8 + 11//200*y22,
1//20000*y1*y8 + 1//20000*y7*y8 + 11//20*y23,
1//20000*y1*y9 + 3//1000000*y6*y10 + 1//20000*y7*y9 + 11//20*y24,
123//100*y13,
11//50*y25,
11//50*y26,
123//100*y14,
1//10000*y5*y9 + 1//10000*y5*y11,
1//20000*y4*y19 + 1//4*y21,
1//20000*y4*y20 + 1//1000000*y6*y17 + 1//4*y22,
1//20000*y1*y17 + 1//20000*y7*y17 + 1//8*y23,
1//20000*y1*y18 + 3//1000000*y6*y19 + 1//20000*y7*y18 + 1//8*y24,
1//20000*y4*y23 + 90909090909//500000000000*y8 + 1//8*y17,
1//20000*y4*y24 + 1//1000000*y6*y21 + 90909090909//500000000000*y9 + 1//8*y18,
1//20000*y1*y21 + 1//20000*y7*y21 + 90909090909//5000000000000*y10 + 1//8*y19,
1//20000*y1*y22 + 3//1000000*y6*y23 + 1//20000*y7*y22 + 90909090909//5000000000000*y11 + 1//8*y20,
3*y3 + 3//10*y17 + 3//10*y18 + 3//10*y19 + 3//10*y20,
3*y3 + 3//10*y17 + 3//10*y18 + 3//10*y19 + 3//10*y20
]


