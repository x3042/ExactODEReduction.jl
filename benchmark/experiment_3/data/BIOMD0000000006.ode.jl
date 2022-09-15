Original system:

[
I => 0,
k4 => 0,
k6 => 0,
v => 0,
u => k4prime*v,
z => I*kappa - 2*k4*u*v + 3*k4*u + k4prime*u - k4prime*v,
EmptySet => -I*kappa + k6*u,
k4prime => 0,
kappa => 0
]

Reductions:


new_vars = fmpq_mpoly[I]
new_system = 
[
0
]


new_vars = fmpq_mpoly[I, k4prime]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[I, k4prime, k6]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[I, k4prime, k6, kappa]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[I, k4prime, k6, kappa, v]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[I, k4prime, k6, kappa, u, v]
new_system = 
[
0,
0,
0,
0,
y2*y6,
0
]


new_vars = fmpq_mpoly[EmptySet, I, k4prime, k6, kappa, u, v]
new_system = 
[
-y2*y5 + y4*y6,
0,
0,
0,
0,
y3*y7,
0
]


new_vars = fmpq_mpoly[EmptySet, I, k4, k4prime, k6, kappa, u, v]
new_system = 
[
-y2*y6 + y5*y7,
0,
0,
0,
0,
0,
y4*y8,
0
]


