Original system:

[
OR1 => 2*COR1*ku_Cro2OR1 + 2*COR1*ku_Cro2OR1c1 + COR1*ku_Cro2OR1c2 + 2*ROR1*ku_CI2OR1 + 2*ROR1*ku_CI2OR1c1 + ROR1*ku_CI2OR1c2,
OR3 => 2*COR3*ku_Cro2OR3 + 2*COR3*ku_Cro2OR3c1 + COR3*ku_Cro2OR3c2 + 2*ROR3*ku_CI2OR3 + 2*ROR3*ku_CI2OR3c1 + ROR3*ku_CI2OR3c2,
ROR3 => CI2*OR3*kb_DimerDNA,
COR3 => Cro2*OR3*kb_DimerDNA,
kb_DimerCI => 0,
ku_CI2OR3c2 => 0,
ku_Dimer => 0,
ku_CI2OR1c1 => 0,
ku_CI2OR3c1 => 0,
ku_CI2OR2 => 0,
CI => 2*CI2*ku_Dimer + 2*I*ks_CI + I*ks_CIcoop,
ku_CI2OR3 => 0,
kd_Cro => 0,
EmptySet => CI*kd_CI + Cro*kd_Cro - 2*I*ks_CI - I*ks_CIcoop - I*ks_Cro,
ks_Cro => 0,
ku_Cro2OR1 => 0,
Cro2 => 2*COR1*ku_Cro2OR1 + 2*COR1*ku_Cro2OR1c1 + COR1*ku_Cro2OR1c2 + 4*COR2*ku_Cro2OR2 + 2*COR2*ku_Cro2OR2c1 + 2*COR2*ku_Cro2OR2c2 + COR2*ku_Cro2OR2c3 + 2*COR3*ku_Cro2OR3 + 2*COR3*ku_Cro2OR3c1 + COR3*ku_Cro2OR3c2 + 1//2*Cro*kb_DimerCro,
ku_CI2OR2c3 => 0,
OR2 => 4*COR2*ku_Cro2OR2 + 2*COR2*ku_Cro2OR2c1 + 2*COR2*ku_Cro2OR2c2 + COR2*ku_Cro2OR2c3 + 4*ROR2*ku_CI2OR2 + 2*ROR2*ku_CI2OR2c1 + 2*ROR2*ku_CI2OR2c2 + ROR2*ku_CI2OR2c3,
ROR1 => CI2*OR1*kb_DimerDNA,
ku_Cro2OR2c3 => 0,
ku_CI2OR2c2 => 0,
ks_CI => 0,
kb_DimerDNA => 0,
ROR2 => CI2*OR2*kb_DimerDNA,
ku_CI2OR1c2 => 0,
ku_Cro2OR2 => 0,
Cro => 2*Cro2*ku_Dimer + I*ks_Cro,
ks_CIcoop => 0,
ku_Cro2OR3c2 => 0,
ku_CI2OR1 => 0,
CI2 => 1//2*CI*kb_DimerCI + 2*ROR1*ku_CI2OR1 + 2*ROR1*ku_CI2OR1c1 + ROR1*ku_CI2OR1c2 + 4*ROR2*ku_CI2OR2 + 2*ROR2*ku_CI2OR2c1 + 2*ROR2*ku_CI2OR2c2 + ROR2*ku_CI2OR2c3 + 2*ROR3*ku_CI2OR3 + 2*ROR3*ku_CI2OR3c1 + ROR3*ku_CI2OR3c2,
kb_DimerCro => 0,
ku_Cro2OR2c2 => 0,
I => 0,
ku_Cro2OR1c2 => 0,
ku_Cro2OR2c1 => 0,
kd_CI => 0,
COR1 => Cro2*OR1*kb_DimerDNA,
ku_Cro2OR1c1 => 0,
ku_CI2OR2c1 => 0,
COR2 => Cro2*OR2*kb_DimerDNA,
ku_Cro2OR3 => 0,
ku_Cro2OR3c1 => 0
]

Reductions:


new_vars = fmpq_mpoly[I]
new_system = 
[
0
]


new_vars = fmpq_mpoly[I, kb_DimerCI]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[I, kb_DimerCI, kb_DimerCro]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[I, kb_DimerCI, kb_DimerCro, kb_DimerDNA]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[I, kb_DimerCI, kb_DimerCro, kb_DimerDNA, 2*ks_CI + ks_CIcoop]
new_system = 
[
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[I, kb_DimerCI, kb_DimerCro, kb_DimerDNA, 2*ks_CI + ks_CIcoop, ks_Cro]
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
new_vars = fmpq_mpoly[I, kb_DimerCI, kb_DimerCro, kb_DimerDNA, 2*ks_CI + ks_CIcoop, ks_Cro, 2*ku_CI2OR1 + 2*ku_CI2OR1c1 + ku_CI2OR1c2]
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
new_vars = fmpq_mpoly[I, kb_DimerCI, kb_DimerCro, kb_DimerDNA, 2*ks_CI + ks_CIcoop, ks_Cro, 2*ku_CI2OR1 + 2*ku_CI2OR1c1 + ku_CI2OR1c2, 4*ku_CI2OR2 + 2*ku_CI2OR2c1 + 2*ku_CI2OR2c2 + ku_CI2OR2c3]
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
new_vars = fmpq_mpoly[I, kb_DimerCI, kb_DimerCro, kb_DimerDNA, 2*ks_CI + ks_CIcoop, ks_Cro, 2*ku_CI2OR1 + 2*ku_CI2OR1c1 + ku_CI2OR1c2, 4*ku_CI2OR2 + 2*ku_CI2OR2c1 + 2*ku_CI2OR2c2 + ku_CI2OR2c3, 2*ku_CI2OR3 + 2*ku_CI2OR3c1 + ku_CI2OR3c2]
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
new_vars = fmpq_mpoly[I, kb_DimerCI, kb_DimerCro, kb_DimerDNA, 2*ks_CI + ks_CIcoop, ks_Cro, 2*ku_CI2OR1 + 2*ku_CI2OR1c1 + ku_CI2OR1c2, 4*ku_CI2OR2 + 2*ku_CI2OR2c1 + 2*ku_CI2OR2c2 + ku_CI2OR2c3, 2*ku_CI2OR3 + 2*ku_CI2OR3c1 + ku_CI2OR3c2, 2*ku_Cro2OR1 + 2*ku_Cro2OR1c1 + ku_Cro2OR1c2]
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
new_vars = fmpq_mpoly[I, kb_DimerCI, kb_DimerCro, kb_DimerDNA, 2*ks_CI + ks_CIcoop, ks_Cro, 2*ku_CI2OR1 + 2*ku_CI2OR1c1 + ku_CI2OR1c2, 4*ku_CI2OR2 + 2*ku_CI2OR2c1 + 2*ku_CI2OR2c2 + ku_CI2OR2c3, 2*ku_CI2OR3 + 2*ku_CI2OR3c1 + ku_CI2OR3c2, 2*ku_Cro2OR1 + 2*ku_Cro2OR1c1 + ku_Cro2OR1c2, 4*ku_Cro2OR2 + 2*ku_Cro2OR2c1 + 2*ku_Cro2OR2c2 + ku_Cro2OR2c3]
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
new_vars = fmpq_mpoly[I, kb_DimerCI, kb_DimerCro, kb_DimerDNA, 2*ks_CI + ks_CIcoop, ks_Cro, 2*ku_CI2OR1 + 2*ku_CI2OR1c1 + ku_CI2OR1c2, 4*ku_CI2OR2 + 2*ku_CI2OR2c1 + 2*ku_CI2OR2c2 + ku_CI2OR2c3, 2*ku_CI2OR3 + 2*ku_CI2OR3c1 + ku_CI2OR3c2, 2*ku_Cro2OR1 + 2*ku_Cro2OR1c1 + ku_Cro2OR1c2, 4*ku_Cro2OR2 + 2*ku_Cro2OR2c1 + 2*ku_Cro2OR2c2 + ku_Cro2OR2c3, 2*ku_Cro2OR3 + 2*ku_Cro2OR3c1 + ku_Cro2OR3c2]
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
new_vars = fmpq_mpoly[I, kb_DimerCI, kb_DimerCro, kb_DimerDNA, 2*ks_CI + ks_CIcoop, ks_Cro, 2*ku_CI2OR1 + 2*ku_CI2OR1c1 + ku_CI2OR1c2, 4*ku_CI2OR2 + 2*ku_CI2OR2c1 + 2*ku_CI2OR2c2 + ku_CI2OR2c3, 2*ku_CI2OR3 + 2*ku_CI2OR3c1 + ku_CI2OR3c2, 2*ku_Cro2OR1 + 2*ku_Cro2OR1c1 + ku_Cro2OR1c2, 4*ku_Cro2OR2 + 2*ku_Cro2OR2c1 + 2*ku_Cro2OR2c2 + ku_Cro2OR2c3, 2*ku_Cro2OR3 + 2*ku_Cro2OR3c1 + ku_Cro2OR3c2, ku_Dimer]
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
new_vars = fmpq_mpoly[CI, CI2, COR1, COR2, COR3, Cro, Cro2, I, OR1, OR2, OR3, ROR1, ROR2, ROR3, kb_DimerCI, kb_DimerCro, kb_DimerDNA, 2*ks_CI + ks_CIcoop, ks_Cro, 2*ku_CI2OR1 + 2*ku_CI2OR1c1 + ku_CI2OR1c2, 4*ku_CI2OR2 + 2*ku_CI2OR2c1 + 2*ku_CI2OR2c2 + ku_CI2OR2c3, 2*ku_CI2OR3 + 2*ku_CI2OR3c1 + ku_CI2OR3c2, 2*ku_Cro2OR1 + 2*ku_Cro2OR1c1 + ku_Cro2OR1c2, 4*ku_Cro2OR2 + 2*ku_Cro2OR2c1 + 2*ku_Cro2OR2c2 + ku_Cro2OR2c3, 2*ku_Cro2OR3 + 2*ku_Cro2OR3c1 + ku_Cro2OR3c2, ku_Dimer]
new_system = 
[
2*y2*y26 + y8*y18,
1//2*y1*y15 + y12*y20 + y13*y21 + y14*y22,
y7*y9*y17,
y7*y10*y17,
y7*y11*y17,
2*y7*y26 + y8*y19,
y3*y23 + y4*y24 + y5*y25 + 1//2*y6*y16,
0,
y3*y23 + y12*y20,
y4*y24 + y13*y21,
y5*y25 + y14*y22,
y2*y9*y17,
y2*y10*y17,
y2*y11*y17,
0,
0,
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
new_vars = fmpq_mpoly[CI, CI2, COR1, COR2, COR3, Cro, Cro2, I, OR1, OR2, OR3, ROR1, ROR2, ROR3, kb_DimerCI, kb_DimerCro, kb_DimerDNA, kd_CI, 2*ks_CI + ks_CIcoop, ks_Cro, 2*ku_CI2OR1 + 2*ku_CI2OR1c1 + ku_CI2OR1c2, 4*ku_CI2OR2 + 2*ku_CI2OR2c1 + 2*ku_CI2OR2c2 + ku_CI2OR2c3, 2*ku_CI2OR3 + 2*ku_CI2OR3c1 + ku_CI2OR3c2, 2*ku_Cro2OR1 + 2*ku_Cro2OR1c1 + ku_Cro2OR1c2, 4*ku_Cro2OR2 + 2*ku_Cro2OR2c1 + 2*ku_Cro2OR2c2 + ku_Cro2OR2c3, 2*ku_Cro2OR3 + 2*ku_Cro2OR3c1 + ku_Cro2OR3c2, ku_Dimer]
new_system = 
[
2*y2*y27 + y8*y19,
1//2*y1*y15 + y12*y21 + y13*y22 + y14*y23,
y7*y9*y17,
y7*y10*y17,
y7*y11*y17,
2*y7*y27 + y8*y20,
y3*y24 + y4*y25 + y5*y26 + 1//2*y6*y16,
0,
y3*y24 + y12*y21,
y4*y25 + y13*y22,
y5*y26 + y14*y23,
y2*y9*y17,
y2*y10*y17,
y2*y11*y17,
0,
0,
0,
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
new_vars = fmpq_mpoly[CI, CI2, COR1, COR2, COR3, Cro, Cro2, I, OR1, OR2, OR3, ROR1, ROR2, ROR3, kb_DimerCI, kb_DimerCro, kb_DimerDNA, kd_CI, kd_Cro, 2*ks_CI + ks_CIcoop, ks_Cro, 2*ku_CI2OR1 + 2*ku_CI2OR1c1 + ku_CI2OR1c2, 4*ku_CI2OR2 + 2*ku_CI2OR2c1 + 2*ku_CI2OR2c2 + ku_CI2OR2c3, 2*ku_CI2OR3 + 2*ku_CI2OR3c1 + ku_CI2OR3c2, 2*ku_Cro2OR1 + 2*ku_Cro2OR1c1 + ku_Cro2OR1c2, 4*ku_Cro2OR2 + 2*ku_Cro2OR2c1 + 2*ku_Cro2OR2c2 + ku_Cro2OR2c3, 2*ku_Cro2OR3 + 2*ku_Cro2OR3c1 + ku_Cro2OR3c2, ku_Dimer]
new_system = 
[
2*y2*y28 + y8*y20,
1//2*y1*y15 + y12*y22 + y13*y23 + y14*y24,
y7*y9*y17,
y7*y10*y17,
y7*y11*y17,
2*y7*y28 + y8*y21,
y3*y25 + y4*y26 + y5*y27 + 1//2*y6*y16,
0,
y3*y25 + y12*y22,
y4*y26 + y13*y23,
y5*y27 + y14*y24,
y2*y9*y17,
y2*y10*y17,
y2*y11*y17,
0,
0,
0,
0,
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
new_vars = fmpq_mpoly[CI, CI2, COR1, COR2, COR3, Cro, Cro2, EmptySet, I, OR1, OR2, OR3, ROR1, ROR2, ROR3, kb_DimerCI, kb_DimerCro, kb_DimerDNA, kd_CI, kd_Cro, 2*ks_CI + ks_CIcoop, ks_Cro, 2*ku_CI2OR1 + 2*ku_CI2OR1c1 + ku_CI2OR1c2, 4*ku_CI2OR2 + 2*ku_CI2OR2c1 + 2*ku_CI2OR2c2 + ku_CI2OR2c3, 2*ku_CI2OR3 + 2*ku_CI2OR3c1 + ku_CI2OR3c2, 2*ku_Cro2OR1 + 2*ku_Cro2OR1c1 + ku_Cro2OR1c2, 4*ku_Cro2OR2 + 2*ku_Cro2OR2c1 + 2*ku_Cro2OR2c2 + ku_Cro2OR2c3, 2*ku_Cro2OR3 + 2*ku_Cro2OR3c1 + ku_Cro2OR3c2, ku_Dimer]
new_system = 
[
2*y2*y29 + y9*y21,
1//2*y1*y16 + y13*y23 + y14*y24 + y15*y25,
y7*y10*y18,
y7*y11*y18,
y7*y12*y18,
2*y7*y29 + y9*y22,
y3*y26 + y4*y27 + y5*y28 + 1//2*y6*y17,
y1*y19 + y6*y20 - y9*y21 - y9*y22,
0,
y3*y26 + y13*y23,
y4*y27 + y14*y24,
y5*y28 + y15*y25,
y2*y10*y18,
y2*y11*y18,
y2*y12*y18,
0,
0,
0,
0,
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
new_vars = fmpq_mpoly[CI, CI2, COR1, COR2, COR3, Cro, Cro2, EmptySet, I, OR1, OR2, OR3, ROR1, ROR2, ROR3, kb_DimerCI, kb_DimerCro, kb_DimerDNA, kd_CI, kd_Cro, ks_CI, ks_CIcoop, ks_Cro, 2*ku_CI2OR1 + 2*ku_CI2OR1c1 + ku_CI2OR1c2, 4*ku_CI2OR2 + 2*ku_CI2OR2c1 + 2*ku_CI2OR2c2 + ku_CI2OR2c3, 2*ku_CI2OR3 + 2*ku_CI2OR3c1 + ku_CI2OR3c2, 2*ku_Cro2OR1 + 2*ku_Cro2OR1c1 + ku_Cro2OR1c2, 4*ku_Cro2OR2 + 2*ku_Cro2OR2c1 + 2*ku_Cro2OR2c2 + ku_Cro2OR2c3, 2*ku_Cro2OR3 + 2*ku_Cro2OR3c1 + ku_Cro2OR3c2, ku_Dimer]
new_system = 
[
2*y2*y30 + 2*y9*y21 + y9*y22,
1//2*y1*y16 + y13*y24 + y14*y25 + y15*y26,
y7*y10*y18,
y7*y11*y18,
y7*y12*y18,
2*y7*y30 + y9*y23,
y3*y27 + y4*y28 + y5*y29 + 1//2*y6*y17,
y1*y19 + y6*y20 - 2*y9*y21 - y9*y22 - y9*y23,
0,
y3*y27 + y13*y24,
y4*y28 + y14*y25,
y5*y29 + y15*y26,
y2*y10*y18,
y2*y11*y18,
y2*y12*y18,
0,
0,
0,
0,
0,
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
new_vars = fmpq_mpoly[CI, CI2, COR1, COR2, COR3, Cro, Cro2, EmptySet, I, OR1, OR2, OR3, ROR1, ROR2, ROR3, kb_DimerCI, kb_DimerCro, kb_DimerDNA, kd_CI, kd_Cro, ks_CI, ks_CIcoop, ks_Cro, 2*ku_CI2OR1 + ku_CI2OR1c2, ku_CI2OR1c1, 4*ku_CI2OR2 + 2*ku_CI2OR2c1 + 2*ku_CI2OR2c2 + ku_CI2OR2c3, 2*ku_CI2OR3 + 2*ku_CI2OR3c1 + ku_CI2OR3c2, 2*ku_Cro2OR1 + 2*ku_Cro2OR1c1 + ku_Cro2OR1c2, 4*ku_Cro2OR2 + 2*ku_Cro2OR2c1 + 2*ku_Cro2OR2c2 + ku_Cro2OR2c3, 2*ku_Cro2OR3 + 2*ku_Cro2OR3c1 + ku_Cro2OR3c2, ku_Dimer]
new_system = 
[
2*y2*y31 + 2*y9*y21 + y9*y22,
1//2*y1*y16 + y13*y24 + 2*y13*y25 + y14*y26 + y15*y27,
y7*y10*y18,
y7*y11*y18,
y7*y12*y18,
2*y7*y31 + y9*y23,
y3*y28 + y4*y29 + y5*y30 + 1//2*y6*y17,
y1*y19 + y6*y20 - 2*y9*y21 - y9*y22 - y9*y23,
0,
y3*y28 + y13*y24 + 2*y13*y25,
y4*y29 + y14*y26,
y5*y30 + y15*y27,
y2*y10*y18,
y2*y11*y18,
y2*y12*y18,
0,
0,
0,
0,
0,
0,
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
new_vars = fmpq_mpoly[CI, CI2, COR1, COR2, COR3, Cro, Cro2, EmptySet, I, OR1, OR2, OR3, ROR1, ROR2, ROR3, kb_DimerCI, kb_DimerCro, kb_DimerDNA, kd_CI, kd_Cro, ks_CI, ks_CIcoop, ks_Cro, ku_CI2OR1, ku_CI2OR1c1, ku_CI2OR1c2, 4*ku_CI2OR2 + 2*ku_CI2OR2c1 + 2*ku_CI2OR2c2 + ku_CI2OR2c3, 2*ku_CI2OR3 + 2*ku_CI2OR3c1 + ku_CI2OR3c2, 2*ku_Cro2OR1 + 2*ku_Cro2OR1c1 + ku_Cro2OR1c2, 4*ku_Cro2OR2 + 2*ku_Cro2OR2c1 + 2*ku_Cro2OR2c2 + ku_Cro2OR2c3, 2*ku_Cro2OR3 + 2*ku_Cro2OR3c1 + ku_Cro2OR3c2, ku_Dimer]
new_system = 
[
2*y2*y32 + 2*y9*y21 + y9*y22,
1//2*y1*y16 + 2*y13*y24 + 2*y13*y25 + y13*y26 + y14*y27 + y15*y28,
y7*y10*y18,
y7*y11*y18,
y7*y12*y18,
2*y7*y32 + y9*y23,
y3*y29 + y4*y30 + y5*y31 + 1//2*y6*y17,
y1*y19 + y6*y20 - 2*y9*y21 - y9*y22 - y9*y23,
0,
y3*y29 + 2*y13*y24 + 2*y13*y25 + y13*y26,
y4*y30 + y14*y27,
y5*y31 + y15*y28,
y2*y10*y18,
y2*y11*y18,
y2*y12*y18,
0,
0,
0,
0,
0,
0,
0,
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
new_vars = fmpq_mpoly[CI, CI2, COR1, COR2, COR3, Cro, Cro2, EmptySet, I, OR1, OR2, OR3, ROR1, ROR2, ROR3, kb_DimerCI, kb_DimerCro, kb_DimerDNA, kd_CI, kd_Cro, ks_CI, ks_CIcoop, ks_Cro, ku_CI2OR1, ku_CI2OR1c1, ku_CI2OR1c2, 4*ku_CI2OR2 + 2*ku_CI2OR2c2 + ku_CI2OR2c3, ku_CI2OR2c1, 2*ku_CI2OR3 + 2*ku_CI2OR3c1 + ku_CI2OR3c2, 2*ku_Cro2OR1 + 2*ku_Cro2OR1c1 + ku_Cro2OR1c2, 4*ku_Cro2OR2 + 2*ku_Cro2OR2c1 + 2*ku_Cro2OR2c2 + ku_Cro2OR2c3, 2*ku_Cro2OR3 + 2*ku_Cro2OR3c1 + ku_Cro2OR3c2, ku_Dimer]
new_system = 
[
2*y2*y33 + 2*y9*y21 + y9*y22,
1//2*y1*y16 + 2*y13*y24 + 2*y13*y25 + y13*y26 + y14*y27 + 2*y14*y28 + y15*y29,
y7*y10*y18,
y7*y11*y18,
y7*y12*y18,
2*y7*y33 + y9*y23,
y3*y30 + y4*y31 + y5*y32 + 1//2*y6*y17,
y1*y19 + y6*y20 - 2*y9*y21 - y9*y22 - y9*y23,
0,
y3*y30 + 2*y13*y24 + 2*y13*y25 + y13*y26,
y4*y31 + y14*y27 + 2*y14*y28,
y5*y32 + y15*y29,
y2*y10*y18,
y2*y11*y18,
y2*y12*y18,
0,
0,
0,
0,
0,
0,
0,
0,
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
new_vars = fmpq_mpoly[CI, CI2, COR1, COR2, COR3, Cro, Cro2, EmptySet, I, OR1, OR2, OR3, ROR1, ROR2, ROR3, kb_DimerCI, kb_DimerCro, kb_DimerDNA, kd_CI, kd_Cro, ks_CI, ks_CIcoop, ks_Cro, ku_CI2OR1, ku_CI2OR1c1, ku_CI2OR1c2, 4*ku_CI2OR2 + ku_CI2OR2c3, ku_CI2OR2c1, ku_CI2OR2c2, 2*ku_CI2OR3 + 2*ku_CI2OR3c1 + ku_CI2OR3c2, 2*ku_Cro2OR1 + 2*ku_Cro2OR1c1 + ku_Cro2OR1c2, 4*ku_Cro2OR2 + 2*ku_Cro2OR2c1 + 2*ku_Cro2OR2c2 + ku_Cro2OR2c3, 2*ku_Cro2OR3 + 2*ku_Cro2OR3c1 + ku_Cro2OR3c2, ku_Dimer]
new_system = 
[
2*y2*y34 + 2*y9*y21 + y9*y22,
1//2*y1*y16 + 2*y13*y24 + 2*y13*y25 + y13*y26 + y14*y27 + 2*y14*y28 + 2*y14*y29 + y15*y30,
y7*y10*y18,
y7*y11*y18,
y7*y12*y18,
2*y7*y34 + y9*y23,
y3*y31 + y4*y32 + y5*y33 + 1//2*y6*y17,
y1*y19 + y6*y20 - 2*y9*y21 - y9*y22 - y9*y23,
0,
y3*y31 + 2*y13*y24 + 2*y13*y25 + y13*y26,
y4*y32 + y14*y27 + 2*y14*y28 + 2*y14*y29,
y5*y33 + y15*y30,
y2*y10*y18,
y2*y11*y18,
y2*y12*y18,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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
new_vars = fmpq_mpoly[CI, CI2, COR1, COR2, COR3, Cro, Cro2, EmptySet, I, OR1, OR2, OR3, ROR1, ROR2, ROR3, kb_DimerCI, kb_DimerCro, kb_DimerDNA, kd_CI, kd_Cro, ks_CI, ks_CIcoop, ks_Cro, ku_CI2OR1, ku_CI2OR1c1, ku_CI2OR1c2, ku_CI2OR2, ku_CI2OR2c1, ku_CI2OR2c2, ku_CI2OR2c3, 2*ku_CI2OR3 + 2*ku_CI2OR3c1 + ku_CI2OR3c2, 2*ku_Cro2OR1 + 2*ku_Cro2OR1c1 + ku_Cro2OR1c2, 4*ku_Cro2OR2 + 2*ku_Cro2OR2c1 + 2*ku_Cro2OR2c2 + ku_Cro2OR2c3, 2*ku_Cro2OR3 + 2*ku_Cro2OR3c1 + ku_Cro2OR3c2, ku_Dimer]
new_system = 
[
2*y2*y35 + 2*y9*y21 + y9*y22,
1//2*y1*y16 + 2*y13*y24 + 2*y13*y25 + y13*y26 + 4*y14*y27 + 2*y14*y28 + 2*y14*y29 + y14*y30 + y15*y31,
y7*y10*y18,
y7*y11*y18,
y7*y12*y18,
2*y7*y35 + y9*y23,
y3*y32 + y4*y33 + y5*y34 + 1//2*y6*y17,
y1*y19 + y6*y20 - 2*y9*y21 - y9*y22 - y9*y23,
0,
y3*y32 + 2*y13*y24 + 2*y13*y25 + y13*y26,
y4*y33 + 4*y14*y27 + 2*y14*y28 + 2*y14*y29 + y14*y30,
y5*y34 + y15*y31,
y2*y10*y18,
y2*y11*y18,
y2*y12*y18,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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
new_vars = fmpq_mpoly[CI, CI2, COR1, COR2, COR3, Cro, Cro2, EmptySet, I, OR1, OR2, OR3, ROR1, ROR2, ROR3, kb_DimerCI, kb_DimerCro, kb_DimerDNA, kd_CI, kd_Cro, ks_CI, ks_CIcoop, ks_Cro, ku_CI2OR1, ku_CI2OR1c1, ku_CI2OR1c2, ku_CI2OR2, ku_CI2OR2c1, ku_CI2OR2c2, ku_CI2OR2c3, 2*ku_CI2OR3 + ku_CI2OR3c2, ku_CI2OR3c1, 2*ku_Cro2OR1 + 2*ku_Cro2OR1c1 + ku_Cro2OR1c2, 4*ku_Cro2OR2 + 2*ku_Cro2OR2c1 + 2*ku_Cro2OR2c2 + ku_Cro2OR2c3, 2*ku_Cro2OR3 + 2*ku_Cro2OR3c1 + ku_Cro2OR3c2, ku_Dimer]
new_system = 
[
2*y2*y36 + 2*y9*y21 + y9*y22,
1//2*y1*y16 + 2*y13*y24 + 2*y13*y25 + y13*y26 + 4*y14*y27 + 2*y14*y28 + 2*y14*y29 + y14*y30 + y15*y31 + 2*y15*y32,
y7*y10*y18,
y7*y11*y18,
y7*y12*y18,
2*y7*y36 + y9*y23,
y3*y33 + y4*y34 + y5*y35 + 1//2*y6*y17,
y1*y19 + y6*y20 - 2*y9*y21 - y9*y22 - y9*y23,
0,
y3*y33 + 2*y13*y24 + 2*y13*y25 + y13*y26,
y4*y34 + 4*y14*y27 + 2*y14*y28 + 2*y14*y29 + y14*y30,
y5*y35 + y15*y31 + 2*y15*y32,
y2*y10*y18,
y2*y11*y18,
y2*y12*y18,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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
new_vars = fmpq_mpoly[CI, CI2, COR1, COR2, COR3, Cro, Cro2, EmptySet, I, OR1, OR2, OR3, ROR1, ROR2, ROR3, kb_DimerCI, kb_DimerCro, kb_DimerDNA, kd_CI, kd_Cro, ks_CI, ks_CIcoop, ks_Cro, ku_CI2OR1, ku_CI2OR1c1, ku_CI2OR1c2, ku_CI2OR2, ku_CI2OR2c1, ku_CI2OR2c2, ku_CI2OR2c3, ku_CI2OR3, ku_CI2OR3c1, ku_CI2OR3c2, 2*ku_Cro2OR1 + 2*ku_Cro2OR1c1 + ku_Cro2OR1c2, 4*ku_Cro2OR2 + 2*ku_Cro2OR2c1 + 2*ku_Cro2OR2c2 + ku_Cro2OR2c3, 2*ku_Cro2OR3 + 2*ku_Cro2OR3c1 + ku_Cro2OR3c2, ku_Dimer]
new_system = 
[
2*y2*y37 + 2*y9*y21 + y9*y22,
1//2*y1*y16 + 2*y13*y24 + 2*y13*y25 + y13*y26 + 4*y14*y27 + 2*y14*y28 + 2*y14*y29 + y14*y30 + 2*y15*y31 + 2*y15*y32 + y15*y33,
y7*y10*y18,
y7*y11*y18,
y7*y12*y18,
2*y7*y37 + y9*y23,
y3*y34 + y4*y35 + y5*y36 + 1//2*y6*y17,
y1*y19 + y6*y20 - 2*y9*y21 - y9*y22 - y9*y23,
0,
y3*y34 + 2*y13*y24 + 2*y13*y25 + y13*y26,
y4*y35 + 4*y14*y27 + 2*y14*y28 + 2*y14*y29 + y14*y30,
y5*y36 + 2*y15*y31 + 2*y15*y32 + y15*y33,
y2*y10*y18,
y2*y11*y18,
y2*y12*y18,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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
new_vars = fmpq_mpoly[CI, CI2, COR1, COR2, COR3, Cro, Cro2, EmptySet, I, OR1, OR2, OR3, ROR1, ROR2, ROR3, kb_DimerCI, kb_DimerCro, kb_DimerDNA, kd_CI, kd_Cro, ks_CI, ks_CIcoop, ks_Cro, ku_CI2OR1, ku_CI2OR1c1, ku_CI2OR1c2, ku_CI2OR2, ku_CI2OR2c1, ku_CI2OR2c2, ku_CI2OR2c3, ku_CI2OR3, ku_CI2OR3c1, ku_CI2OR3c2, 2*ku_Cro2OR1 + ku_Cro2OR1c2, ku_Cro2OR1c1, 4*ku_Cro2OR2 + 2*ku_Cro2OR2c1 + 2*ku_Cro2OR2c2 + ku_Cro2OR2c3, 2*ku_Cro2OR3 + 2*ku_Cro2OR3c1 + ku_Cro2OR3c2, ku_Dimer]
new_system = 
[
2*y2*y38 + 2*y9*y21 + y9*y22,
1//2*y1*y16 + 2*y13*y24 + 2*y13*y25 + y13*y26 + 4*y14*y27 + 2*y14*y28 + 2*y14*y29 + y14*y30 + 2*y15*y31 + 2*y15*y32 + y15*y33,
y7*y10*y18,
y7*y11*y18,
y7*y12*y18,
2*y7*y38 + y9*y23,
y3*y34 + 2*y3*y35 + y4*y36 + y5*y37 + 1//2*y6*y17,
y1*y19 + y6*y20 - 2*y9*y21 - y9*y22 - y9*y23,
0,
y3*y34 + 2*y3*y35 + 2*y13*y24 + 2*y13*y25 + y13*y26,
y4*y36 + 4*y14*y27 + 2*y14*y28 + 2*y14*y29 + y14*y30,
y5*y37 + 2*y15*y31 + 2*y15*y32 + y15*y33,
y2*y10*y18,
y2*y11*y18,
y2*y12*y18,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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
new_vars = fmpq_mpoly[CI, CI2, COR1, COR2, COR3, Cro, Cro2, EmptySet, I, OR1, OR2, OR3, ROR1, ROR2, ROR3, kb_DimerCI, kb_DimerCro, kb_DimerDNA, kd_CI, kd_Cro, ks_CI, ks_CIcoop, ks_Cro, ku_CI2OR1, ku_CI2OR1c1, ku_CI2OR1c2, ku_CI2OR2, ku_CI2OR2c1, ku_CI2OR2c2, ku_CI2OR2c3, ku_CI2OR3, ku_CI2OR3c1, ku_CI2OR3c2, ku_Cro2OR1, ku_Cro2OR1c1, ku_Cro2OR1c2, 4*ku_Cro2OR2 + 2*ku_Cro2OR2c1 + 2*ku_Cro2OR2c2 + ku_Cro2OR2c3, 2*ku_Cro2OR3 + 2*ku_Cro2OR3c1 + ku_Cro2OR3c2, ku_Dimer]
new_system = 
[
2*y2*y39 + 2*y9*y21 + y9*y22,
1//2*y1*y16 + 2*y13*y24 + 2*y13*y25 + y13*y26 + 4*y14*y27 + 2*y14*y28 + 2*y14*y29 + y14*y30 + 2*y15*y31 + 2*y15*y32 + y15*y33,
y7*y10*y18,
y7*y11*y18,
y7*y12*y18,
2*y7*y39 + y9*y23,
2*y3*y34 + 2*y3*y35 + y3*y36 + y4*y37 + y5*y38 + 1//2*y6*y17,
y1*y19 + y6*y20 - 2*y9*y21 - y9*y22 - y9*y23,
0,
2*y3*y34 + 2*y3*y35 + y3*y36 + 2*y13*y24 + 2*y13*y25 + y13*y26,
y4*y37 + 4*y14*y27 + 2*y14*y28 + 2*y14*y29 + y14*y30,
y5*y38 + 2*y15*y31 + 2*y15*y32 + y15*y33,
y2*y10*y18,
y2*y11*y18,
y2*y12*y18,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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
new_vars = fmpq_mpoly[CI, CI2, COR1, COR2, COR3, Cro, Cro2, EmptySet, I, OR1, OR2, OR3, ROR1, ROR2, ROR3, kb_DimerCI, kb_DimerCro, kb_DimerDNA, kd_CI, kd_Cro, ks_CI, ks_CIcoop, ks_Cro, ku_CI2OR1, ku_CI2OR1c1, ku_CI2OR1c2, ku_CI2OR2, ku_CI2OR2c1, ku_CI2OR2c2, ku_CI2OR2c3, ku_CI2OR3, ku_CI2OR3c1, ku_CI2OR3c2, ku_Cro2OR1, ku_Cro2OR1c1, ku_Cro2OR1c2, 4*ku_Cro2OR2 + 2*ku_Cro2OR2c2 + ku_Cro2OR2c3, ku_Cro2OR2c1, 2*ku_Cro2OR3 + 2*ku_Cro2OR3c1 + ku_Cro2OR3c2, ku_Dimer]
new_system = 
[
2*y2*y40 + 2*y9*y21 + y9*y22,
1//2*y1*y16 + 2*y13*y24 + 2*y13*y25 + y13*y26 + 4*y14*y27 + 2*y14*y28 + 2*y14*y29 + y14*y30 + 2*y15*y31 + 2*y15*y32 + y15*y33,
y7*y10*y18,
y7*y11*y18,
y7*y12*y18,
2*y7*y40 + y9*y23,
2*y3*y34 + 2*y3*y35 + y3*y36 + y4*y37 + 2*y4*y38 + y5*y39 + 1//2*y6*y17,
y1*y19 + y6*y20 - 2*y9*y21 - y9*y22 - y9*y23,
0,
2*y3*y34 + 2*y3*y35 + y3*y36 + 2*y13*y24 + 2*y13*y25 + y13*y26,
y4*y37 + 2*y4*y38 + 4*y14*y27 + 2*y14*y28 + 2*y14*y29 + y14*y30,
y5*y39 + 2*y15*y31 + 2*y15*y32 + y15*y33,
y2*y10*y18,
y2*y11*y18,
y2*y12*y18,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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
new_vars = fmpq_mpoly[CI, CI2, COR1, COR2, COR3, Cro, Cro2, EmptySet, I, OR1, OR2, OR3, ROR1, ROR2, ROR3, kb_DimerCI, kb_DimerCro, kb_DimerDNA, kd_CI, kd_Cro, ks_CI, ks_CIcoop, ks_Cro, ku_CI2OR1, ku_CI2OR1c1, ku_CI2OR1c2, ku_CI2OR2, ku_CI2OR2c1, ku_CI2OR2c2, ku_CI2OR2c3, ku_CI2OR3, ku_CI2OR3c1, ku_CI2OR3c2, ku_Cro2OR1, ku_Cro2OR1c1, ku_Cro2OR1c2, 4*ku_Cro2OR2 + ku_Cro2OR2c3, ku_Cro2OR2c1, ku_Cro2OR2c2, 2*ku_Cro2OR3 + 2*ku_Cro2OR3c1 + ku_Cro2OR3c2, ku_Dimer]
new_system = 
[
2*y2*y41 + 2*y9*y21 + y9*y22,
1//2*y1*y16 + 2*y13*y24 + 2*y13*y25 + y13*y26 + 4*y14*y27 + 2*y14*y28 + 2*y14*y29 + y14*y30 + 2*y15*y31 + 2*y15*y32 + y15*y33,
y7*y10*y18,
y7*y11*y18,
y7*y12*y18,
2*y7*y41 + y9*y23,
2*y3*y34 + 2*y3*y35 + y3*y36 + y4*y37 + 2*y4*y38 + 2*y4*y39 + y5*y40 + 1//2*y6*y17,
y1*y19 + y6*y20 - 2*y9*y21 - y9*y22 - y9*y23,
0,
2*y3*y34 + 2*y3*y35 + y3*y36 + 2*y13*y24 + 2*y13*y25 + y13*y26,
y4*y37 + 2*y4*y38 + 2*y4*y39 + 4*y14*y27 + 2*y14*y28 + 2*y14*y29 + y14*y30,
y5*y40 + 2*y15*y31 + 2*y15*y32 + y15*y33,
y2*y10*y18,
y2*y11*y18,
y2*y12*y18,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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
new_vars = fmpq_mpoly[CI, CI2, COR1, COR2, COR3, Cro, Cro2, EmptySet, I, OR1, OR2, OR3, ROR1, ROR2, ROR3, kb_DimerCI, kb_DimerCro, kb_DimerDNA, kd_CI, kd_Cro, ks_CI, ks_CIcoop, ks_Cro, ku_CI2OR1, ku_CI2OR1c1, ku_CI2OR1c2, ku_CI2OR2, ku_CI2OR2c1, ku_CI2OR2c2, ku_CI2OR2c3, ku_CI2OR3, ku_CI2OR3c1, ku_CI2OR3c2, ku_Cro2OR1, ku_Cro2OR1c1, ku_Cro2OR1c2, ku_Cro2OR2, ku_Cro2OR2c1, ku_Cro2OR2c2, ku_Cro2OR2c3, 2*ku_Cro2OR3 + 2*ku_Cro2OR3c1 + ku_Cro2OR3c2, ku_Dimer]
new_system = 
[
2*y2*y42 + 2*y9*y21 + y9*y22,
1//2*y1*y16 + 2*y13*y24 + 2*y13*y25 + y13*y26 + 4*y14*y27 + 2*y14*y28 + 2*y14*y29 + y14*y30 + 2*y15*y31 + 2*y15*y32 + y15*y33,
y7*y10*y18,
y7*y11*y18,
y7*y12*y18,
2*y7*y42 + y9*y23,
2*y3*y34 + 2*y3*y35 + y3*y36 + 4*y4*y37 + 2*y4*y38 + 2*y4*y39 + y4*y40 + y5*y41 + 1//2*y6*y17,
y1*y19 + y6*y20 - 2*y9*y21 - y9*y22 - y9*y23,
0,
2*y3*y34 + 2*y3*y35 + y3*y36 + 2*y13*y24 + 2*y13*y25 + y13*y26,
4*y4*y37 + 2*y4*y38 + 2*y4*y39 + y4*y40 + 4*y14*y27 + 2*y14*y28 + 2*y14*y29 + y14*y30,
y5*y41 + 2*y15*y31 + 2*y15*y32 + y15*y33,
y2*y10*y18,
y2*y11*y18,
y2*y12*y18,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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
new_vars = fmpq_mpoly[CI, CI2, COR1, COR2, COR3, Cro, Cro2, EmptySet, I, OR1, OR2, OR3, ROR1, ROR2, ROR3, kb_DimerCI, kb_DimerCro, kb_DimerDNA, kd_CI, kd_Cro, ks_CI, ks_CIcoop, ks_Cro, ku_CI2OR1, ku_CI2OR1c1, ku_CI2OR1c2, ku_CI2OR2, ku_CI2OR2c1, ku_CI2OR2c2, ku_CI2OR2c3, ku_CI2OR3, ku_CI2OR3c1, ku_CI2OR3c2, ku_Cro2OR1, ku_Cro2OR1c1, ku_Cro2OR1c2, ku_Cro2OR2, ku_Cro2OR2c1, ku_Cro2OR2c2, ku_Cro2OR2c3, 2*ku_Cro2OR3 + ku_Cro2OR3c2, ku_Cro2OR3c1, ku_Dimer]
new_system = 
[
2*y2*y43 + 2*y9*y21 + y9*y22,
1//2*y1*y16 + 2*y13*y24 + 2*y13*y25 + y13*y26 + 4*y14*y27 + 2*y14*y28 + 2*y14*y29 + y14*y30 + 2*y15*y31 + 2*y15*y32 + y15*y33,
y7*y10*y18,
y7*y11*y18,
y7*y12*y18,
2*y7*y43 + y9*y23,
2*y3*y34 + 2*y3*y35 + y3*y36 + 4*y4*y37 + 2*y4*y38 + 2*y4*y39 + y4*y40 + y5*y41 + 2*y5*y42 + 1//2*y6*y17,
y1*y19 + y6*y20 - 2*y9*y21 - y9*y22 - y9*y23,
0,
2*y3*y34 + 2*y3*y35 + y3*y36 + 2*y13*y24 + 2*y13*y25 + y13*y26,
4*y4*y37 + 2*y4*y38 + 2*y4*y39 + y4*y40 + 4*y14*y27 + 2*y14*y28 + 2*y14*y29 + y14*y30,
y5*y41 + 2*y5*y42 + 2*y15*y31 + 2*y15*y32 + y15*y33,
y2*y10*y18,
y2*y11*y18,
y2*y12*y18,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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


