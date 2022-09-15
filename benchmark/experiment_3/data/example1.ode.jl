Original system:

[
ApB => Ap*B*r3 - ApB*r4,
Au => Ap*r2 - Au*B*r3 - Au*r1 + AuB*r4,
B => -Ap*B*r3 + ApB*r4 - Au*B*r3 + AuB*r4,
r3 => 0,
r2 => 0,
r4 => 0,
Ap => -Ap*B*r3 - Ap*r2 + ApB*r4 + Au*r1,
AuB => Au*B*r3 - AuB*r4,
r1 => 0
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
new_vars = fmpq_mpoly[Ap + ApB + Au + AuB, ApB + AuB + B, r1, r2, r3]
new_system = 
[
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Ap + ApB + Au + AuB, ApB + AuB + B, r1, r2, r3, r4]
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
new_vars = fmpq_mpoly[Ap + Au, ApB + AuB, B, r1, r2, r3, r4]
new_system = 
[
-y1*y3*y6 + y2*y7,
y1*y3*y6 - y2*y7,
-y1*y3*y6 + y2*y7,
0,
0,
0,
0
]


