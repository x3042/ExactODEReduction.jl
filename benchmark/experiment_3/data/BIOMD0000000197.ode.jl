Original system:

[
x3 => p1*x1 + p10*x4 + p3*x1,
x4 => p11*p9*x3,
x5 => 17//50*II*p12 + p2*x3 + p5*x3,
p9 => 0,
x2 => p6*p8*x1,
p7 => 0,
p6 => 0,
II => 0,
p8 => 0,
x1 => -17//50*II*p12 + p4*x3 + p7*x2,
p2 => 0,
p3 => 0,
p4 => 0,
p12 => 0,
p11 => 0,
p1 => 0,
p10 => 0,
p5 => 0
]

Reductions:


new_vars = fmpq_mpoly[II]
new_system = 
[
0
]


new_vars = fmpq_mpoly[II, p1]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[II, p1, p10]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[II, p1, p10, p11]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[II, p1, p10, p11, p12]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[II, p1, p10, p11, p12, p2]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[II, p1, p10, p11, p12, p2, p3]
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


new_vars = fmpq_mpoly[II, p1, p10, p11, p12, p2, p3, p4]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[II, p1, p10, p11, p12, p2, p3, p4, p5]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[II, p1, p10, p11, p12, p2, p3, p4, p5, p6]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[II, p1, p10, p11, p12, p2, p3, p4, p5, p6, p7]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[II, p1, p10, p11, p12, p2, p3, p4, p5, p6, p7, p8]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[II, p1, p10, p11, p12, p2, p3, p4, p5, p6, p7, p8, p9]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[II, p1, p10, p11, p12, p2, p3, p4, p5, p6, p7, p8, p9, x1, x2, x3, x4]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
-17//50*y1*y5 + y8*y16 + y11*y15,
y10*y12*y14,
y2*y14 + y3*y17 + y7*y14,
y4*y13*y16
]


