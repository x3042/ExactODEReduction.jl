Original system:

[
agonist => 1//2*DR - 5000000*Recptor*agonist,
DRG_GTP => 10000000*DRG*GTP - 3//20*DRG_GTP,
G_GDP => -100000000*DR*G_GDP + 1//10*DRG_GDP + 1//10*G_GTP,
DRG => -100000*DRG*GDP - 10000000*DRG*GTP + 1//10*DRG_GDP + 1//10*DRG_GTP,
DRG_GDP => 100000000*DR*G_GDP + 100000*DRG*GDP - 1//5*DRG_GDP,
Recptor => 1//2*DR - 5000000*Recptor*agonist,
GDP => -100000*DRG*GDP + 1//10*DRG_GDP,
GTP => -10000000*DRG*GTP + 1//10*DRG_GTP,
DR => -100000000*DR*G_GDP - 1//2*DR + 1//10*DRG_GDP + 1//20*DRG_GTP + 5000000*Recptor*agonist,
G_GTP => 1//20*DRG_GTP - 1//10*G_GTP
]

Reductions:

Interesting
new_vars = fmpq_mpoly[DR - G_GDP - G_GTP + agonist]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[DR - G_GDP - G_GTP + agonist, DRG - GDP - GTP]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[DR + DRG + DRG_GDP + DRG_GTP + agonist, DR + DRG_GDP + DRG_GTP + GDP + GTP + agonist, DRG + DRG_GDP + DRG_GTP + G_GDP + G_GTP]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[DR + DRG + DRG_GDP + DRG_GTP + agonist, DR + DRG + DRG_GDP + DRG_GTP + Recptor, DR + DRG_GDP + DRG_GTP + GDP + GTP + agonist, DRG + DRG_GDP + DRG_GTP + G_GDP + G_GTP]
new_system = 
[
0,
0,
0,
0
]


