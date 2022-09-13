Original system:

[
SINK => -d1*x1 - d2x*x2 - d2y*y2,
y2 => b2*x1,
y0 => 0,
d1 => 0,
a2 => 0,
d2y => 0,
a1 => 0,
x2 => a2*x1,
b1 => 0,
d2x => 0,
x1 => a1*x0 + b1*y0,
b2 => 0,
x0 => 0
]

Reductions:


new_vars = fmpq_mpoly[a1]
new_system = 
[
0
]


new_vars = fmpq_mpoly[a1, a2]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[a1, a2, b1]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[a1, a2, b1, b2]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[a1, a2, b1, b2, d1]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[a1, a2, b1, b2, d1, d2x]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[a1, a2, b1, b2, d1, d2x, d2y]
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


new_vars = fmpq_mpoly[a1, a2, b1, b2, d1, d2x, d2y, x0]
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


new_vars = fmpq_mpoly[a1, a2, b1, b2, d1, d2x, d2y, x0, y0]
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


new_vars = fmpq_mpoly[a1, a2, b1, b2, d1, d2x, d2y, x0, x1, y0]
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
y1*y8 + y3*y10,
0
]


new_vars = fmpq_mpoly[a1, a2, b1, b2, d1, d2x, d2y, x0, x1, x2, y0]
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
y1*y8 + y3*y11,
y2*y9,
0
]


new_vars = fmpq_mpoly[a1, a2, b1, b2, d1, d2x, d2y, x0, x1, x2, y0, y2]
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
y1*y8 + y3*y11,
y2*y9,
0,
y4*y9
]


