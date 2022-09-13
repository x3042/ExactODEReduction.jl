Original system:

[
kde => 0,
kon_SAv => 0,
SAv_EpoR => EpoR*SAv*kon_SAv,
koff_SAv => 0,
Bmax_SAv => 0,
dSAve => SAv_EpoRi*kde,
dSAvi => SAv_EpoRi*kdi,
EpoR => Bmax_SAv*kt*src + SAv_EpoR*koff_SAv,
kex_SAv => 0,
SAv => SAv_EpoR*koff_SAv + SAv_EpoRi*kex_SAv,
kdi => 0,
kt => 0,
src => 0,
SAv_EpoRi => SAv_EpoR*kt,
SINK => -EpoR*kt
]

Reductions:


new_vars = fmpq_mpoly[Bmax_SAv]
new_system = 
[
0
]


new_vars = fmpq_mpoly[Bmax_SAv, kex_SAv]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[Bmax_SAv, kex_SAv, koff_SAv]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[Bmax_SAv, kex_SAv, koff_SAv, kon_SAv]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Bmax_SAv, kex_SAv, koff_SAv, kon_SAv, kt]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Bmax_SAv, kex_SAv, koff_SAv, kon_SAv, kt, src]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Bmax_SAv, EpoR, SAv, SAv_EpoR, SAv_EpoRi, kex_SAv, koff_SAv, kon_SAv, kt, src]
new_system = 
[
0,
y1*y9*y10 + y4*y7,
y4*y7 + y5*y6,
y2*y3*y8,
y4*y9,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Bmax_SAv, EpoR, SAv, SAv_EpoR, SAv_EpoRi, SINK, kex_SAv, koff_SAv, kon_SAv, kt, src]
new_system = 
[
0,
y1*y10*y11 + y4*y8,
y4*y8 + y5*y7,
y2*y3*y9,
y4*y10,
-y2*y10,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Bmax_SAv, EpoR, SAv, SAv_EpoR, SAv_EpoRi, SINK, kde, kex_SAv, koff_SAv, kon_SAv, kt, src]
new_system = 
[
0,
y1*y11*y12 + y4*y9,
y4*y9 + y5*y8,
y2*y3*y10,
y4*y11,
-y2*y11,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Bmax_SAv, EpoR, SAv, SAv_EpoR, SAv_EpoRi, SINK, dSAve, kde, kex_SAv, koff_SAv, kon_SAv, kt, src]
new_system = 
[
0,
y1*y12*y13 + y4*y10,
y4*y10 + y5*y9,
y2*y3*y11,
y4*y12,
-y2*y12,
y5*y8,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Bmax_SAv, EpoR, SAv, SAv_EpoR, SAv_EpoRi, SINK, dSAve, kde, kdi, kex_SAv, koff_SAv, kon_SAv, kt, src]
new_system = 
[
0,
y1*y13*y14 + y4*y11,
y4*y11 + y5*y10,
y2*y3*y12,
y4*y13,
-y2*y13,
y5*y8,
0,
0,
0,
0,
0,
0,
0
]


