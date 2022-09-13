Original system:

[
sD => 10*DR - 5000000*R*sD,
DRG_GTP => 5000000*DRG*GTP - 56*DRG_GTP,
G_GDP => -100000000*DR*G_GDP + 1//10*DRG_GDP + 2*G_GTP,
DRG => -100000*DRG*GDP - 5000000*DRG*GTP + 5*DRG_GDP + 55*DRG_GTP,
DRG_GDP => 100000000*DR*G_GDP + 100000*DRG*GDP - 51//10*DRG_GDP,
R => 10*DR - 5000000*R*sD,
GDP => -100000*DRG*GDP + 5*DRG_GDP,
GTP => -5000000*DRG*GTP + 55*DRG_GTP,
DR => -100000000*DR*G_GDP - 10*DR + 1//10*DRG_GDP + DRG_GTP + 5000000*R*sD,
G_GTP => DRG_GTP - 2*G_GTP
]

Reductions:

Interesting
new_vars = fmpq_mpoly[DR - G_GDP - G_GTP + sD]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[DR - G_GDP - G_GTP + sD, DRG - GDP - GTP]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[DR + DRG + DRG_GDP + DRG_GTP + sD, DR + DRG_GDP + DRG_GTP + GDP + GTP + sD, DRG + DRG_GDP + DRG_GTP + G_GDP + G_GTP]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[DR + DRG + DRG_GDP + DRG_GTP + sD, DR + DRG + DRG_GDP + DRG_GTP + R, DR + DRG_GDP + DRG_GTP + GDP + GTP + sD, DRG + DRG_GDP + DRG_GTP + G_GDP + G_GTP]
new_system = 
[
0,
0,
0,
0
]


