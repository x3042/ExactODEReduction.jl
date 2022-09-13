Original system:

[
NFAT_Act_C_Nuc => 113//1000000000000000*Act_C_Nuc*NFAT_Nuc*k16 + 269//1000000000000000*NFAT_Act_C_Cyt*k9 + 113//1000000000000000*NFAT_Pi_Act_C_Nuc*k13,
NFAT_Act_C_Cyt => 269//1000000000000000*Act_C_Cyt*NFAT_Cyt*k16 + 113//1000000000000000*NFAT_Act_C_Nuc*k10 + 269//1000000000000000*NFAT_Pi_Act_C_Cyt*k13,
k20 => 0,
k17 => 0,
k2 => 0,
k10 => 0,
NFAT_Pi_Act_C_Cyt => 269//1000000000000000*Act_C_Cyt*NFAT_Pi_Cyt*k11 + 269//1000000000000000*NFAT_Act_C_Cyt*k14 + 113//1000000000000000*NFAT_Pi_Act_C_Nuc*k8,
Act_C_Cyt => 113//1000000000000000*Act_C_Nuc*k6 + 807//1000000000000000*Ca_Cyt*Inact_C_Cyt*k19 + 269//1000000000000000*NFAT_Act_C_Cyt*k15 + 269//1000000000000000*NFAT_Pi_Act_C_Cyt*k12,
Inact_C_Nuc => 113//1000000000000000*Act_C_Nuc*k20 + 269//1000000000000000*Inact_C_Cyt*k5,
k3 => 0,
k6 => 0,
k22 => 0,
k14 => 0,
k18 => 0,
k19 => 0,
Inact_C_Cyt => 269//1000000000000000*Act_C_Cyt*k20 + 113//1000000000000000*Inact_C_Nuc*k6,
NFAT_Pi_Cyt => 269//1000000000000000*NFAT_Cyt*k2 + 269//1000000000000000*NFAT_Pi_Act_C_Cyt*k12 + 113//1000000000000000*NFAT_Pi_Nuc*k4,
NFAT_Nuc => 113//1000000000000000*NFAT_Act_C_Nuc*k15 + 269//1000000000000000*NFAT_Cyt*k17 + 113//1000000000000000*NFAT_Pi_Nuc*k1,
k1 => 0,
NFAT_Pi_Nuc => 113//1000000000000000*NFAT_Nuc*k2 + 113//1000000000000000*NFAT_Pi_Act_C_Nuc*k12 + 269//1000000000000000*NFAT_Pi_Cyt*k3,
k16 => 0,
k7 => 0,
k11 => 0,
Ca_Nuc => 339//1000000000000000*Act_C_Nuc*k20 + 269//1000000000000000*Ca_Cyt*k21,
k12 => 0,
NFAT_Cyt => 269//1000000000000000*NFAT_Act_C_Cyt*k15 + 113//1000000000000000*NFAT_Nuc*k18 + 269//1000000000000000*NFAT_Pi_Cyt*k1,
NFAT_Pi_Act_C_Nuc => 113//1000000000000000*Act_C_Nuc*NFAT_Pi_Nuc*k11 + 113//1000000000000000*NFAT_Act_C_Nuc*k14 + 269//1000000000000000*NFAT_Pi_Act_C_Cyt*k7,
k21 => 0,
k5 => 0,
k4 => 0,
k9 => 0,
Act_C_Nuc => 269//1000000000000000*Act_C_Cyt*k5 + 339//1000000000000000*Ca_Nuc*Inact_C_Nuc*k19 + 113//1000000000000000*NFAT_Act_C_Nuc*k15 + 113//1000000000000000*NFAT_Pi_Act_C_Nuc*k12,
Ca_Cyt => 807//1000000000000000*Act_C_Cyt*k20 + 113//1000000000000000*Ca_Nuc*k22,
k13 => 0,
k15 => 0,
k8 => 0
]

Reductions:


new_vars = fmpq_mpoly[k1]
new_system = 
[
0
]


new_vars = fmpq_mpoly[k1, k10]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[k1, k10, k11]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[k1, k10, k11, k12]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[k1, k10, k11, k12, k13]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[k1, k10, k11, k12, k13, k14]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[k1, k10, k11, k12, k13, k14, k15]
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


new_vars = fmpq_mpoly[k1, k10, k11, k12, k13, k14, k15, k16]
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


new_vars = fmpq_mpoly[k1, k10, k11, k12, k13, k14, k15, k16, k17]
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


new_vars = fmpq_mpoly[k1, k10, k11, k12, k13, k14, k15, k16, k17, k18]
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


new_vars = fmpq_mpoly[k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19]
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


new_vars = fmpq_mpoly[k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2]
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


new_vars = fmpq_mpoly[k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20]
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


new_vars = fmpq_mpoly[k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k21]
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


new_vars = fmpq_mpoly[k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k21, k22]
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


new_vars = fmpq_mpoly[k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k21, k22, k3]
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


new_vars = fmpq_mpoly[k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k21, k22, k3, k4]
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


new_vars = fmpq_mpoly[k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k21, k22, k3, k4, k5]
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


new_vars = fmpq_mpoly[k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k21, k22, k3, k4, k5, k6]
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


new_vars = fmpq_mpoly[k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k21, k22, k3, k4, k5, k6, k7]
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


new_vars = fmpq_mpoly[k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k21, k22, k3, k4, k5, k6, k7, k8]
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


new_vars = fmpq_mpoly[k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k21, k22, k3, k4, k5, k6, k7, k8, k9]
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


