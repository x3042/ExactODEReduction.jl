Original system:

[
a => 0,
k4 => 0,
b => -a*k3 + k2*source,
k1 => 0,
source => 0,
k2 => 0,
k3 => 0
]

Reductions:


new_vars = fmpq_mpoly[a]
new_system = 
[
0
]


new_vars = fmpq_mpoly[a, k2]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[a, k2, k3]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[a, k2, k3, source]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[a, b, k2, k3, source]
new_system = 
[
0,
-y1*y4 + y3*y5,
0,
0,
0
]


new_vars = fmpq_mpoly[a, b, k1, k2, k3, source]
new_system = 
[
0,
-y1*y5 + y4*y6,
0,
0,
0,
0
]


