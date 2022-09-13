Original system:

[
LR => -7//500*CA*LR + 3//5*L*R - 1//10*LR + 1//5*LRCA,
L => -3//5*L*R + 1//10*LR,
LRCA => 7//500*CA*LR - 1//5*LRCA,
CA => -7//500*CA*LR + 1//5*LRCA,
R => -3//5*L*R + 1//10*LR
]

Reductions:

Interesting
new_vars = fmpq_mpoly[CA + LRCA]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[CA + LRCA, L - R]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[CA + LRCA, L + LR + LRCA, LR + LRCA + R]
new_system = 
[
0,
0,
0
]


