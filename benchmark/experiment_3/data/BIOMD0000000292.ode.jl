Original system:

[
k4 => 0,
NADPH => -ATP*NADPH*Y*k2 + NADP*k4,
k1 => 0,
ATP => 2*ADP*NADP*k3 - ATP*NADPH*Y*k2 - ATP*X*Y*k1,
NADP => ATP*NADPH*Y*k2 - NADP*k4,
k3 => 0,
X => ATP*NADPH*Y*k2 - ATP*X*Y*k1,
Y => 0,
ADP => -2*ADP*NADP*k3 + ATP*NADPH*Y*k2 + ATP*X*Y*k1,
k2 => 0
]

Reductions:

Interesting
new_vars = fmpq_mpoly[ADP + ATP]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[ADP + ATP, NADP + NADPH]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[ADP + ATP, NADP + NADPH, Y]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[ADP + ATP, NADP + NADPH, Y, k1]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[ADP + ATP, NADP + NADPH, Y, k1, k2]
new_system = 
[
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[ADP + ATP, NADP + NADPH, Y, k1, k2, k3]
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
new_vars = fmpq_mpoly[ADP + ATP, NADP + NADPH, Y, k1, k2, k3, k4]
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


