Original system:

[
dEpoe => Epo_EpoRi*kde,
kt => 0,
dEpoi => Epo_EpoRi*kdi,
EpoR => Bmax*kt*source + Epo_EpoR*koff + Epo_EpoRi*kex,
kdi => 0,
koff => 0,
Epo => Epo_EpoR*koff + Epo_EpoRi*kex,
Bmax => 0,
Epo_EpoRi => Epo_EpoR*ke,
kex => 0,
kon => 0,
ke => 0,
kde => 0,
source => 0,
Epo_EpoR => Epo*EpoR*kon,
SINK => -EpoR*kt
]

Reductions:


new_vars = fmpq_mpoly[Bmax]
new_system = 
[
0
]


new_vars = fmpq_mpoly[Bmax, ke]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[Bmax, ke, kex]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[Bmax, ke, kex, koff]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Bmax, ke, kex, koff, kon]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Bmax, ke, kex, koff, kon, kt]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Bmax, ke, kex, koff, kon, kt, source]
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
new_vars = fmpq_mpoly[Bmax, Epo - EpoR, ke, kex, koff, kon, kt, source]
new_system = 
[
0,
-y1*y7*y8,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Bmax, Epo, EpoR, Epo_EpoR, Epo_EpoRi, ke, kex, koff, kon, kt, source]
new_system = 
[
0,
y4*y8 + y5*y7,
y1*y10*y11 + y4*y8 + y5*y7,
y2*y3*y9,
y4*y6,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Bmax, Epo, EpoR, Epo_EpoR, Epo_EpoRi, SINK, ke, kex, koff, kon, kt, source]
new_system = 
[
0,
y4*y9 + y5*y8,
y1*y11*y12 + y4*y9 + y5*y8,
y2*y3*y10,
y4*y7,
-y3*y11,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Bmax, Epo, EpoR, Epo_EpoR, Epo_EpoRi, SINK, kde, ke, kex, koff, kon, kt, source]
new_system = 
[
0,
y4*y10 + y5*y9,
y1*y12*y13 + y4*y10 + y5*y9,
y2*y3*y11,
y4*y8,
-y3*y12,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Bmax, Epo, EpoR, Epo_EpoR, Epo_EpoRi, SINK, dEpoe, kde, ke, kex, koff, kon, kt, source]
new_system = 
[
0,
y4*y11 + y5*y10,
y1*y13*y14 + y4*y11 + y5*y10,
y2*y3*y12,
y4*y9,
-y3*y13,
y5*y8,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Bmax, Epo, EpoR, Epo_EpoR, Epo_EpoRi, SINK, dEpoe, kde, kdi, ke, kex, koff, kon, kt, source]
new_system = 
[
0,
y4*y12 + y5*y11,
y1*y14*y15 + y4*y12 + y5*y11,
y2*y3*y13,
y4*y10,
-y3*y14,
y5*y8,
0,
0,
0,
0,
0,
0,
0,
0
]


