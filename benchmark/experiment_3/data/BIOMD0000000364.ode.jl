Original system:

[
k7 => 0,
P => -E*P*k1 - E*P*k5 + E_P_1*j1 + E_P_2*j5,
E_M1 => E*M1*k3 - E_M1*j3 - E_M1*k4,
E_M => E*M*k3a - E_M*j3a - E_M*k4a,
k8a => 0,
kC2 => 0,
M1 => -E*M1*k3 + E_M1*j3 + M*k9,
P21 => -E*P21*k7 + E_P21*j7 + P2*k10,
k3 => 0,
k1 => 0,
j5 => 0,
j7 => 0,
j1 => 0,
k10 => 0,
k3a => 0,
k5 => 0,
j3a => 0,
E_P_1 => E*P*k1 - E_P_1*j1 - E_P_1*k2 - E_P_1*kC1,
E_P21 => E*P21*k7 - E_P21*j7 - E_P21*k8,
kC1 => 0,
M => -E*M*k3a + E_M*j3a + E_P_1*k2 - M*k9,
E_P2 => E*P2*k7a - E_P2*j7a - E_P2*k8a,
E => -E*M*k3a - E*M1*k3 - E*P*k1 - E*P*k5 - E*P2*k7a - E*P21*k7 + E_M*j3a + E_M*k4a + E_M1*j3 + E_M1*k4 + E_P2*j7a + E_P2*k8a + E_P21*j7 + E_P21*k8 + E_P_1*j1 + E_P_1*k2 + E_P_2*j5 + E_P_2*k6,
P2 => -E*P2*k7a + E_P2*j7a + E_P_2*k6 - P2*k10,
k8 => 0,
k4a => 0,
k6 => 0,
k7a => 0,
k4 => 0,
j3 => 0,
T => E_M*k4a + E_M1*k4 + E_P2*k8a + E_P21*k8 + E_P_1*kC1 + E_P_2*kC2,
E_P_2 => E*P*k5 - E_P_2*j5 - E_P_2*k6 - E_P_2*kC2,
j7a => 0,
k9 => 0,
k2 => 0
]

Reductions:


new_vars = fmpq_mpoly[j1]
new_system = 
[
0
]


new_vars = fmpq_mpoly[j1, j3]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[j1, j3, j3a]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[j1, j3, j3a, j5]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[j1, j3, j3a, j5, j7]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[j1, j3, j3a, j5, j7, j7a]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[j1, j3, j3a, j5, j7, j7a, k1]
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


new_vars = fmpq_mpoly[j1, j3, j3a, j5, j7, j7a, k1, k10]
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


new_vars = fmpq_mpoly[j1, j3, j3a, j5, j7, j7a, k1, k10, k2]
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


new_vars = fmpq_mpoly[j1, j3, j3a, j5, j7, j7a, k1, k10, k2, k3]
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


new_vars = fmpq_mpoly[j1, j3, j3a, j5, j7, j7a, k1, k10, k2, k3, k3a]
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


new_vars = fmpq_mpoly[j1, j3, j3a, j5, j7, j7a, k1, k10, k2, k3, k3a, k4]
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


new_vars = fmpq_mpoly[j1, j3, j3a, j5, j7, j7a, k1, k10, k2, k3, k3a, k4, k4a]
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


new_vars = fmpq_mpoly[j1, j3, j3a, j5, j7, j7a, k1, k10, k2, k3, k3a, k4, k4a, k5]
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


new_vars = fmpq_mpoly[j1, j3, j3a, j5, j7, j7a, k1, k10, k2, k3, k3a, k4, k4a, k5, k6]
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


new_vars = fmpq_mpoly[j1, j3, j3a, j5, j7, j7a, k1, k10, k2, k3, k3a, k4, k4a, k5, k6, k7]
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


new_vars = fmpq_mpoly[j1, j3, j3a, j5, j7, j7a, k1, k10, k2, k3, k3a, k4, k4a, k5, k6, k7, k7a]
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
0,
0
]


new_vars = fmpq_mpoly[j1, j3, j3a, j5, j7, j7a, k1, k10, k2, k3, k3a, k4, k4a, k5, k6, k7, k7a, k8]
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
0,
0,
0
]


new_vars = fmpq_mpoly[j1, j3, j3a, j5, j7, j7a, k1, k10, k2, k3, k3a, k4, k4a, k5, k6, k7, k7a, k8, k8a]
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
0,
0,
0,
0
]


new_vars = fmpq_mpoly[j1, j3, j3a, j5, j7, j7a, k1, k10, k2, k3, k3a, k4, k4a, k5, k6, k7, k7a, k8, k8a, k9]
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
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[j1, j3, j3a, j5, j7, j7a, k1, k10, k2, k3, k3a, k4, k4a, k5, k6, k7, k7a, k8, k8a, k9, kC1]
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
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[j1, j3, j3a, j5, j7, j7a, k1, k10, k2, k3, k3a, k4, k4a, k5, k6, k7, k7a, k8, k8a, k9, kC1, kC2]
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
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[E, E_M, E_M1, E_P2, E_P21, E_P_1, E_P_2, M, M1, P, P2, P21, j1, j3, j3a, j5, j7, j7a, k1, k10, k2, k3, k3a, k4, k4a, k5, k6, k7, k7a, k8, k8a, k9, kC1, kC2]
new_system = 
[
-y1*y8*y23 - y1*y9*y22 - y1*y10*y19 - y1*y10*y26 - y1*y11*y29 - y1*y12*y28 + y2*y15 + y2*y25 + y3*y14 + y3*y24 + y4*y18 + y4*y31 + y5*y17 + y5*y30 + y6*y13 + y6*y21 + y7*y16 + y7*y27,
y1*y8*y23 - y2*y15 - y2*y25,
y1*y9*y22 - y3*y14 - y3*y24,
y1*y11*y29 - y4*y18 - y4*y31,
y1*y12*y28 - y5*y17 - y5*y30,
y1*y10*y19 - y6*y13 - y6*y21 - y6*y33,
y1*y10*y26 - y7*y16 - y7*y27 - y7*y34,
-y1*y8*y23 + y2*y15 + y6*y21 - y8*y32,
-y1*y9*y22 + y3*y14 + y8*y32,
-y1*y10*y19 - y1*y10*y26 + y6*y13 + y7*y16,
-y1*y11*y29 + y4*y18 + y7*y27 - y11*y20,
-y1*y12*y28 + y5*y17 + y11*y20,
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
0,
0,
0,
0,
0,
0
]


