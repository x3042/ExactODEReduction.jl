Original system:

[
k4 => 0,
k3 => 0,
R => -R*X*k2 + S*k1,
k2 => 0,
k1 => 0,
S => 0,
SINK => -SINK*k4,
X => S*k3 + SINK*k4
]

Reductions:


new_vars = fmpq_mpoly[S]
new_system = 
[
0
]


new_vars = fmpq_mpoly[S, k1]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[S, k1, k2]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[S, k1, k2, k3]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[S, k1, k2, k3, k4]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[S, SINK, k1, k2, k3, k4]
new_system = 
[
0,
-y2*y6,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[S, SINK, X, k1, k2, k3, k4]
new_system = 
[
0,
-y2*y7,
y1*y6 + y2*y7,
0,
0,
0,
0
]


