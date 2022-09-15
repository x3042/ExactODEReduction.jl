Original system:

[
kcd => 0,
pRII => 0,
ki => 0,
RII_endo => RII*ki,
kr => 0,
ligand => 0,
RII => RII_endo*kr + kr*lRIRII_endo + pRII*source,
RI => RI_endo*kr + kr*lRIRII_endo + pRI*source,
SINK => -RI*kcd - RII*kcd - kcd*lRIRII - klid*lRIRII,
lRIRII_endo => ki*lRIRII,
pRI => 0,
lRIRII => RI*RII*ka*ligand,
klid => 0,
source => 0,
RI_endo => RI*ki,
ka => 0
]

Reductions:


new_vars = fmpq_mpoly[ka]
new_system = 
[
0
]


new_vars = fmpq_mpoly[ka, ki]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[ka, ki, kr]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[ka, ki, kr, ligand]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[ka, ki, kr, ligand, pRI]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[ka, ki, kr, ligand, pRI, pRII]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[ka, ki, kr, ligand, pRI, pRII, source]
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
new_vars = fmpq_mpoly[RI - RII, RII_endo - RI_endo, ka, ki, kr, ligand, pRI, pRII, source]
new_system = 
[
-y2*y5 + y7*y9 - y8*y9,
-y1*y4,
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[RI, RII, RII_endo + lRIRII_endo, RI_endo + lRIRII_endo, ka, ki, kr, lRIRII, ligand, pRI, pRII, source]
new_system = 
[
y4*y7 + y10*y12,
y3*y7 + y11*y12,
y2*y6 + y6*y8,
y1*y6 + y6*y8,
0,
0,
0,
y1*y2*y5*y9,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[RI, RII, RII_endo + lRIRII_endo, RI_endo + lRIRII_endo, ka, kcd, ki, kr, lRIRII, ligand, pRI, pRII, source]
new_system = 
[
y4*y8 + y11*y13,
y3*y8 + y12*y13,
y2*y7 + y7*y9,
y1*y7 + y7*y9,
0,
0,
0,
0,
y1*y2*y5*y10,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[RI, RII, RII_endo + lRIRII_endo, RI_endo + lRIRII_endo, ka, kcd, ki, klid, kr, lRIRII, ligand, pRI, pRII, source]
new_system = 
[
y4*y9 + y12*y14,
y3*y9 + y13*y14,
y2*y7 + y7*y10,
y1*y7 + y7*y10,
0,
0,
0,
0,
0,
y1*y2*y5*y11,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[RI, RII, RII_endo + lRIRII_endo, RI_endo + lRIRII_endo, SINK, ka, kcd, ki, klid, kr, lRIRII, ligand, pRI, pRII, source]
new_system = 
[
y4*y10 + y13*y15,
y3*y10 + y14*y15,
y2*y8 + y8*y11,
y1*y8 + y8*y11,
-y1*y7 - y2*y7 - y7*y11 - y9*y11,
0,
0,
0,
0,
0,
y1*y2*y6*y12,
0,
0,
0,
0
]


