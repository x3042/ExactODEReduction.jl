Original system:

[
T => SSTUSST*k2r,
k2 => 0,
k7r => 0,
k6r => 0,
k10r => 0,
k2r => 0,
k3r => 0,
k5 => 0,
SSINK => -SST*k4 - SSTU*k4 - SSU*k4,
k1 => 0,
SSTUSS => SS*SSTU*k1 + SSTUSST*k2r + SSTUSSU*k9r,
SSTUSSU => SSTU*SSU*k10r + SSTUSS*U*k9,
U => SSTUSSU*k9r + SSUSSTU*k6r,
k1r => 0,
k3 => 0,
SS => SSTUSS*k1r,
k6 => 0,
k7 => 0,
SST => SSTUSST*k3 + SSUSST*k5r,
SSUSSTU => SSTU*SSU*k7r + SSUSST*U*k6,
k4 => 0,
k9r => 0,
k9 => 0,
SSTUSST => SST*SSTU*k3r + SSTUSS*T*k2,
SSU => SSTUSSU*k10 + SSUSST*k5r + SSUSSTU*k7,
SSTU => SSTUSS*k1r + SSTUSST*k3 + SSTUSSU*k10 + SSUSSTU*k7,
SSUSST => SST*SSU*k5 + SSUSSTU*k6r,
k10 => 0,
k5r => 0
]

Reductions:


new_vars = fmpq_mpoly[k1]
new_system = 
[
0
]


new_vars = fmpq_mpoly[k1, k10]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[k1, k10, k10r]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[k1, k10, k10r, k1r]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[k1, k10, k10r, k1r, k2]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[k1, k10, k10r, k1r, k2, k2r]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[k1, k10, k10r, k1r, k2, k2r, k3]
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


new_vars = fmpq_mpoly[k1, k10, k10r, k1r, k2, k2r, k3, k3r]
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


new_vars = fmpq_mpoly[k1, k10, k10r, k1r, k2, k2r, k3, k3r, k5]
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


new_vars = fmpq_mpoly[k1, k10, k10r, k1r, k2, k2r, k3, k3r, k5, k5r]
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


new_vars = fmpq_mpoly[k1, k10, k10r, k1r, k2, k2r, k3, k3r, k5, k5r, k6]
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


new_vars = fmpq_mpoly[k1, k10, k10r, k1r, k2, k2r, k3, k3r, k5, k5r, k6, k6r]
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


new_vars = fmpq_mpoly[k1, k10, k10r, k1r, k2, k2r, k3, k3r, k5, k5r, k6, k6r, k7]
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


new_vars = fmpq_mpoly[k1, k10, k10r, k1r, k2, k2r, k3, k3r, k5, k5r, k6, k6r, k7, k7r]
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
0
]


new_vars = fmpq_mpoly[k1, k10, k10r, k1r, k2, k2r, k3, k3r, k5, k5r, k6, k6r, k7, k7r, k9]
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
0,
0
]


new_vars = fmpq_mpoly[k1, k10, k10r, k1r, k2, k2r, k3, k3r, k5, k5r, k6, k6r, k7, k7r, k9, k9r]
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
0,
0,
0
]


new_vars = fmpq_mpoly[SS, SST, SSTU, SSTUSS, SSTUSST, SSTUSSU, SSU, SSUSST, SSUSSTU, T, U, k1, k10, k10r, k1r, k2, k2r, k3, k3r, k5, k5r, k6, k6r, k7, k7r, k9, k9r]
new_system = 
[
y4*y15,
y5*y18 + y8*y21,
y4*y15 + y5*y18 + y6*y13 + y9*y24,
y1*y3*y12 + y5*y17 + y6*y27,
y2*y3*y19 + y4*y10*y16,
y3*y7*y14 + y4*y11*y26,
y6*y13 + y8*y21 + y9*y24,
y2*y7*y20 + y9*y23,
y3*y7*y25 + y8*y11*y22,
y5*y17,
y6*y27 + y9*y23,
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
0,
0,
0
]


new_vars = fmpq_mpoly[SS, SST, SSTU, SSTUSS, SSTUSST, SSTUSSU, SSU, SSUSST, SSUSSTU, T, U, k1, k10, k10r, k1r, k2, k2r, k3, k3r, k4, k5, k5r, k6, k6r, k7, k7r, k9, k9r]
new_system = 
[
y4*y15,
y5*y18 + y8*y22,
y4*y15 + y5*y18 + y6*y13 + y9*y25,
y1*y3*y12 + y5*y17 + y6*y28,
y2*y3*y19 + y4*y10*y16,
y3*y7*y14 + y4*y11*y27,
y6*y13 + y8*y22 + y9*y25,
y2*y7*y21 + y9*y24,
y3*y7*y26 + y8*y11*y23,
y5*y17,
y6*y28 + y9*y24,
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
0,
0,
0,
0
]


