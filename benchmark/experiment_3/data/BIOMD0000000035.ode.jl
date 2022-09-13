Original system:

[
R => -2*A*R + C + 5*MR - 1//5*R,
DAp => A*DA - 50*DAp,
EmptySet => A + 10*MA + 1//2*MR + 1//5*R,
C => 2*A*R - C,
DA => -A*DA + 50*DAp,
MR => 1//100*DR + 50*DRp - 1//2*MR,
DR => -A*DR + 100*DRp,
DRp => A*DR - 100*DRp,
A => -A*DA - A*DR - 2*A*R - A + 50*DAp + 100*DRp + 50*MA,
MA => 50*DA + 500*DAp - 10*MA
]

Reductions:

Interesting
new_vars = fmpq_mpoly[DA + DAp]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[DA + DAp, DR + DRp]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[A, C, DA, DAp, DR, DRp, MA, MR, R]
new_system = 
[
-y1*y3 - y1*y5 - 2*y1*y9 - y1 + 50*y4 + 100*y6 + 50*y7,
2*y1*y9 - y2,
-y1*y3 + 50*y4,
y1*y3 - 50*y4,
-y1*y5 + 100*y6,
y1*y5 - 100*y6,
50*y3 + 500*y4 - 10*y7,
1//100*y5 + 50*y6 - 1//2*y8,
-2*y1*y9 + y2 + 5*y8 - 1//5*y9
]


