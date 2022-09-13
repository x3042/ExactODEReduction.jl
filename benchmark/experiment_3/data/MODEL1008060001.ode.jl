Original system:

[
c => 0,
rho => 0,
sdelta => 0,
R => I*sdelta + S*Z*alpha + S*sdelta,
I => S*Z*beta,
alpha => 0,
beta => 0,
Z => I*rho + R*zeta,
S => Z*c,
source => 0,
zeta => 0
]

Reductions:


new_vars = fmpq_mpoly[alpha]
new_system = 
[
0
]


new_vars = fmpq_mpoly[alpha, beta]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[alpha, beta, c]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[alpha, beta, c, rho]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[alpha, beta, c, rho, sdelta]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[alpha, beta, c, rho, sdelta, zeta]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[I, R, S, Z, alpha, beta, c, rho, sdelta, zeta]
new_system = 
[
y3*y4*y6,
y1*y9 + y3*y4*y5 + y3*y9,
y4*y7,
y1*y8 + y2*y10,
0,
0,
0,
0,
0,
0
]


