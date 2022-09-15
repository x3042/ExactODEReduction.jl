Original system:

[
SINK => -2*a*f*k2 - f*k1,
k2 => 0,
I => 0,
f => I*k1,
k1 => 0,
a => 0
]

Reductions:


new_vars = fmpq_mpoly[I]
new_system = 
[
0
]


new_vars = fmpq_mpoly[I, a]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[I, a, k1]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[I, a, k1, k2]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[I, a, f, k1, k2]
new_system = 
[
0,
0,
y1*y4,
0,
0
]


