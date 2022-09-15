Original system:

[
E => ES*kcat + ES*kr,
kf => 0,
ES => E*S*kf,
P => ES*kcat,
kr => 0,
S => ES*kr,
kcat => 0
]

Reductions:


new_vars = fmpq_mpoly[kcat]
new_system = 
[
0
]


new_vars = fmpq_mpoly[kcat, kf]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[kcat, kf, kr]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[E, ES, S, kcat, kf, kr]
new_system = 
[
y2*y4 + y2*y6,
y1*y3*y5,
y2*y6,
0,
0,
0
]


