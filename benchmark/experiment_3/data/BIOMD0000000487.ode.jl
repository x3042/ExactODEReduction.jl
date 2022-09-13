Original system:

[
k2 => 0,
k3 => 0,
S1 => S3*k2 + S3*k3,
S5 => S3*k3 + S6*k5,
k4 => 0,
S4 => S6*k5 + S6*k6,
S6 => S4*S5*k4,
S3 => S1*S2*k1,
k5 => 0,
k6 => 0,
S2 => S3*k2 + S6*k6,
k1 => 0
]

Reductions:

Interesting
new_vars = fmpq_mpoly[S1 - S2 + S4 - S5]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[S1 - S2 + S4 - S5, k1]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[S1 - S2 + S4 - S5, k1, k2]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[S1 - S2 + S4 - S5, k1, k2, k3]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[S1 - S2 + S4 - S5, k1, k2, k3, k4]
new_system = 
[
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[S1 - S2 + S4 - S5, k1, k2, k3, k4, k5]
new_system = 
[
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[S1 - S2 + S4 - S5, k1, k2, k3, k4, k5, k6]
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


