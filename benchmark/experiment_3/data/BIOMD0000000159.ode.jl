Original system:

[
psi => 0,
source => 0,
SINK => -alpha_x*x - alpha_y*y,
alpha_y => 0,
x => beta_x*psi*source,
alpha_xy => 0,
beta_x => 0,
alpha_x => 0,
y => alpha_0*y0,
y0 => beta_y*psi*x,
alpha_0 => 0,
beta_y => 0
]

Reductions:


new_vars = fmpq_mpoly[alpha_0]
new_system = 
[
0
]


new_vars = fmpq_mpoly[alpha_0, alpha_x]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[alpha_0, alpha_x, alpha_y]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[alpha_0, alpha_x, alpha_y, beta_x]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[alpha_0, alpha_x, alpha_y, beta_x, beta_y]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[alpha_0, alpha_x, alpha_y, beta_x, beta_y, psi]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[alpha_0, alpha_x, alpha_y, beta_x, beta_y, psi, source]
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


new_vars = fmpq_mpoly[alpha_0, alpha_x, alpha_y, beta_x, beta_y, psi, source, x]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
y4*y6*y7
]


new_vars = fmpq_mpoly[alpha_0, alpha_x, alpha_y, beta_x, beta_y, psi, source, x, y0]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
y4*y6*y7,
y5*y6*y8
]


new_vars = fmpq_mpoly[alpha_0, alpha_x, alpha_y, beta_x, beta_y, psi, source, x, y, y0]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
y4*y6*y7,
y1*y10,
y5*y6*y8
]


new_vars = fmpq_mpoly[SINK, alpha_0, alpha_x, alpha_y, beta_x, beta_y, psi, source, x, y, y0]
new_system = 
[
-y3*y9 - y4*y10,
0,
0,
0,
0,
0,
0,
0,
y5*y7*y8,
y2*y11,
y6*y7*y9
]


