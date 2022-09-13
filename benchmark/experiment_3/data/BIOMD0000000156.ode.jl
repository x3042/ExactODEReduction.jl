Original system:

[
psi => 0,
source => 0,
x => 0,
Theta => 0,
SINK => -alpha_y*y,
alpha_y => 0,
beta_y => 0,
alpha_xy => 0,
alpha_0 => 0,
y => alpha_0*y0,
y0 => beta_y*psi*x
]

Reductions:


new_vars = fmpq_mpoly[alpha_0]
new_system = 
[
0
]


new_vars = fmpq_mpoly[alpha_0, alpha_y]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[alpha_0, alpha_y, beta_y]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[alpha_0, alpha_y, beta_y, psi]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[alpha_0, alpha_y, beta_y, psi, x]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[alpha_0, alpha_y, beta_y, psi, x, y0]
new_system = 
[
0,
0,
0,
0,
0,
y3*y4*y5
]


new_vars = fmpq_mpoly[alpha_0, alpha_y, beta_y, psi, x, y, y0]
new_system = 
[
0,
0,
0,
0,
0,
y1*y7,
y3*y4*y5
]


new_vars = fmpq_mpoly[SINK, alpha_0, alpha_y, beta_y, psi, x, y, y0]
new_system = 
[
-y3*y7,
0,
0,
0,
0,
0,
y2*y8,
y4*y5*y6
]


new_vars = fmpq_mpoly[SINK, Theta, alpha_0, alpha_y, beta_y, psi, x, y, y0]
new_system = 
[
-y4*y8,
0,
0,
0,
0,
0,
0,
y3*y9,
y5*y6*y7
]


new_vars = fmpq_mpoly[SINK, Theta, alpha_0, alpha_xy, alpha_y, beta_y, psi, x, y, y0]
new_system = 
[
-y5*y9,
0,
0,
0,
0,
0,
0,
0,
y3*y10,
y6*y7*y8
]


