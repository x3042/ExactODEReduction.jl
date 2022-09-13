Original system:

[
P => E*X - K3*P,
K3 => 0,
Q => K3*P,
E => -E*X + K3*P,
X => -E*X
]

Reductions:

Interesting
new_vars = fmpq_mpoly[E + P]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[E + P, K3]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[E, K3, P, X]
new_system = 
[
-y1*y4 + y2*y3,
0,
y1*y4 - y2*y3,
-y1*y4
]


