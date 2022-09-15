Original system:

[
zeta => 0,
source => 0,
R => S*Z*alpha + S*sdelta,
sdelta => 0,
beta => 0,
S => 0,
Z => R*zeta,
alpha => 0
]

Reductions:


new_vars = fmpq_mpoly[S]
new_system = 
[
0
]


new_vars = fmpq_mpoly[S, alpha]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[S, alpha, sdelta]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[S, alpha, sdelta, zeta]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[R, S, Z, alpha, sdelta, zeta]
new_system = 
[
y2*y3*y4 + y2*y5,
0,
y1*y6,
0,
0,
0
]


new_vars = fmpq_mpoly[R, S, Z, alpha, beta, sdelta, zeta]
new_system = 
[
y2*y3*y4 + y2*y6,
0,
y1*y7,
0,
0,
0,
0
]


