Original system:

[
Ap => -3*Ap*B - Ap*r2 + 4*ApB + Au*r1,
r1 => 0,
ApB => 3*Ap*B - 4*ApB,
Au => Ap*r2 - 3*Au*B - Au*r1 + 4*AuB,
r2 => 0,
AuB => 3*Au*B - 4*AuB,
B => -3*Ap*B + 4*ApB - 3*Au*B + 4*AuB
]

Reductions:

Interesting
new_vars = fmpq_mpoly[Ap + Au - B]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[Ap + ApB + Au + AuB, ApB + AuB + B]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[Ap + ApB + Au + AuB, ApB + AuB + B, r1]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Ap + ApB + Au + AuB, ApB + AuB + B, r1, r2]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Ap + Au, ApB + AuB, B, r1, r2]
new_system = 
[
-3*y1*y3 + 4*y2,
3*y1*y3 - 4*y2,
-3*y1*y3 + 4*y2,
0,
0
]


