Original system:

[
DNA_01B1 => DNA_011*Kon_P1,
DNA_1B1B1 => DNA_11B1*Kon_P1 + DNA_1B11*Kon_P1,
Kon_P1 => 0,
DNA_111 => DNA_011*Kon_NG1*S1 + DNA_101*Kon_G1*S1 + DNA_110*Kon_NG1*S1 + DNA_11B1*Koff_P1 + DNA_1B11*Koff_P1,
DNA_11B1 => DNA_111*Kon_P1 + DNA_1B1B1*Koff_P1,
Koff_G1 => 0,
Kon_G1 => 0,
Kon_NG1 => 0,
DNA_1B10 => DNA_110*Kon_P1,
DNA_010 => DNA_000*Kon_G1*S1 + DNA_011*Koff_NG1 + DNA_110*Koff_NG1,
DNA_000 => DNA_001*Koff_NG1 + DNA_010*Koff_G1 + DNA_100*Koff_NG1,
DNA_011 => DNA_001*Kon_G1*S1 + DNA_010*Kon_NG1*S1 + DNA_01B1*Koff_P1 + DNA_111*Koff_NG1,
DNA_1B11 => DNA_111*Kon_P1 + DNA_1B1B1*Koff_P1,
S1 => DNA_001*Koff_NG1 + DNA_010*Koff_G1 + DNA_011*Koff_G1 + DNA_011*Koff_NG1 + DNA_100*Koff_NG1 + 2*DNA_101*Koff_NG1 + DNA_110*Koff_G1 + DNA_110*Koff_NG1 + DNA_111*Koff_G1 + 2*DNA_111*Koff_NG1,
DNA_001 => DNA_000*Kon_NG1*S1 + DNA_011*Koff_G1 + DNA_101*Koff_NG1,
Koff_NG1 => 0,
Koff_P1 => 0,
DNA_110 => DNA_010*Kon_NG1*S1 + DNA_100*Kon_G1*S1 + DNA_111*Koff_NG1 + DNA_1B10*Koff_P1,
DNA_101 => DNA_001*Kon_NG1*S1 + DNA_100*Kon_NG1*S1 + DNA_111*Koff_G1,
DNA_100 => DNA_000*Kon_NG1*S1 + DNA_101*Koff_NG1 + DNA_110*Koff_G1
]

Reductions:


new_vars = fmpq_mpoly[Koff_G1]
new_system = 
[
0
]


new_vars = fmpq_mpoly[Koff_G1, Koff_NG1]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[Koff_G1, Koff_NG1, Koff_P1]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[Koff_G1, Koff_NG1, Koff_P1, Kon_G1]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Koff_G1, Koff_NG1, Koff_P1, Kon_G1, Kon_NG1]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Koff_G1, Koff_NG1, Koff_P1, Kon_G1, Kon_NG1, Kon_P1]
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
new_vars = fmpq_mpoly[DNA_000, DNA_001 + DNA_100, DNA_010, DNA_011 + DNA_110, DNA_01B1 + DNA_1B10, DNA_101, DNA_111, DNA_11B1 + DNA_1B11, DNA_1B1B1, Koff_G1, Koff_NG1, Koff_P1, Kon_G1, Kon_NG1, Kon_P1, S1]
new_system = 
[
y2*y11 + y3*y10,
2*y1*y14*y16 + y4*y10 + 2*y6*y11,
y1*y13*y16 + y4*y11,
y2*y13*y16 + 2*y3*y14*y16 + y5*y12 + 2*y7*y11,
y4*y15,
y2*y14*y16 + y7*y10,
y4*y14*y16 + y6*y13*y16 + y8*y12,
2*y7*y15 + 2*y9*y12,
y8*y15,
0,
0,
0,
0,
0,
0,
y2*y11 + y3*y10 + y4*y10 + y4*y11 + 2*y6*y11 + y7*y10 + 2*y7*y11
]

Interesting
new_vars = fmpq_mpoly[DNA_000, DNA_001, DNA_010, DNA_011, DNA_01B1, DNA_100, DNA_101, DNA_110, DNA_111, DNA_11B1 + DNA_1B11, DNA_1B10, DNA_1B1B1, Koff_G1, Koff_NG1, Koff_P1, Kon_G1, Kon_NG1, Kon_P1, S1]
new_system = 
[
y2*y14 + y3*y13 + y6*y14,
y1*y17*y19 + y4*y13 + y7*y14,
y1*y16*y19 + y4*y14 + y8*y14,
y2*y16*y19 + y3*y17*y19 + y5*y15 + y9*y14,
y4*y18,
y1*y17*y19 + y7*y14 + y8*y13,
y2*y17*y19 + y6*y17*y19 + y9*y13,
y3*y17*y19 + y6*y16*y19 + y9*y14 + y11*y15,
y4*y17*y19 + y7*y16*y19 + y8*y17*y19 + y10*y15,
2*y9*y18 + 2*y12*y15,
y8*y18,
y10*y18,
0,
0,
0,
0,
0,
0,
y2*y14 + y3*y13 + y4*y13 + y4*y14 + y6*y14 + 2*y7*y14 + y8*y13 + y8*y14 + y9*y13 + 2*y9*y14
]


