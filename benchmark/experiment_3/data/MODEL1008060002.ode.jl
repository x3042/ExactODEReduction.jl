Original system:

[
kappa => 0,
R => I*sdelta + Q*gamma + S*Z*alpha + S*sdelta,
I => S*Z*beta,
Z => I*rho + R*zeta,
beta => 0,
S => 0,
source => 0,
rho => 0,
sigma => 0,
zeta => 0,
gamma => 0,
sdelta => 0,
Q => I*kappa + Z*sigma,
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


new_vars = fmpq_mpoly[S, alpha, beta]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[S, alpha, beta, gamma]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[S, alpha, beta, gamma, kappa]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[S, alpha, beta, gamma, kappa, rho]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[S, alpha, beta, gamma, kappa, rho, sdelta]
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


new_vars = fmpq_mpoly[S, alpha, beta, gamma, kappa, rho, sdelta, sigma]
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


new_vars = fmpq_mpoly[S, alpha, beta, gamma, kappa, rho, sdelta, sigma, zeta]
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


new_vars = fmpq_mpoly[I, Q, R, S, Z, alpha, beta, gamma, kappa, rho, sdelta, sigma, zeta]
new_system = 
[
y4*y5*y7,
y1*y9 + y5*y12,
y1*y11 + y2*y8 + y4*y5*y6 + y4*y11,
0,
y1*y10 + y3*y13,
0,
0,
0,
0,
0,
0,
0,
0
]


