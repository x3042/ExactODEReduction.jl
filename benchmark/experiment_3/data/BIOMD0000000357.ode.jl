Original system:

[
j1 => 0,
P2 => -E*P2*k7a + E_P2*j7a + E_P_2*k6,
j7a => 0,
k4a => 0,
k5 => 0,
E_P_1 => E*P*k1 - E_P_1*j1 - E_P_1*k2,
j5 => 0,
k2 => 0,
k6 => 0,
k1 => 0,
E => -E*M*k3a - E*P*k1 - E*P*k5 - E*P2*k7a + E_M*j3a + E_M*k4a + E_P2*j7a + E_P2*k8a + E_P_1*j1 + E_P_1*k2 + E_P_2*j5 + E_P_2*k6,
E_P2 => E*P2*k7a - E_P2*j7a - E_P2*k8a,
j3a => 0,
E_M => E*M*k3a - E_M*j3a - E_M*k4a,
k3a => 0,
E_P_2 => E*P*k5 - E_P_2*j5 - E_P_2*k6,
P => -E*P*k1 - E*P*k5 + E_P_1*j1 + E_P_2*j5,
M => -E*M*k3a + E_M*j3a + E_P_1*k2,
T => E_M*k4a + E_P2*k8a,
k7a => 0,
k8a => 0
]

Reductions:

Interesting
new_vars = fmpq_mpoly[E + E_M + E_P2 + E_P_1 + E_P_2]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[E + E_M + E_P2 + E_P_1 + E_P_2, j1]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[E + E_M + E_P2 + E_P_1 + E_P_2, j1, j3a]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[E + E_M + E_P2 + E_P_1 + E_P_2, j1, j3a, j5]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[E + E_M + E_P2 + E_P_1 + E_P_2, j1, j3a, j5, j7a]
new_system = 
[
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[E + E_M + E_P2 + E_P_1 + E_P_2, j1, j3a, j5, j7a, k1]
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
new_vars = fmpq_mpoly[E + E_M + E_P2 + E_P_1 + E_P_2, j1, j3a, j5, j7a, k1, k2]
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

Interesting
new_vars = fmpq_mpoly[E + E_M + E_P2 + E_P_1 + E_P_2, j1, j3a, j5, j7a, k1, k2, k3a]
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

Interesting
new_vars = fmpq_mpoly[E + E_M + E_P2 + E_P_1 + E_P_2, j1, j3a, j5, j7a, k1, k2, k3a, k4a]
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

Interesting
new_vars = fmpq_mpoly[E + E_M + E_P2 + E_P_1 + E_P_2, j1, j3a, j5, j7a, k1, k2, k3a, k4a, k5]
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

Interesting
new_vars = fmpq_mpoly[E + E_M + E_P2 + E_P_1 + E_P_2, j1, j3a, j5, j7a, k1, k2, k3a, k4a, k5, k6]
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

Interesting
new_vars = fmpq_mpoly[E + E_M + E_P2 + E_P_1 + E_P_2, j1, j3a, j5, j7a, k1, k2, k3a, k4a, k5, k6, k7a]
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

Interesting
new_vars = fmpq_mpoly[E + E_M + E_P2 + E_P_1 + E_P_2, j1, j3a, j5, j7a, k1, k2, k3a, k4a, k5, k6, k7a, k8a]
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


new_vars = fmpq_mpoly[E, E_M, E_P2, E_P_1, E_P_2, M, P, P2, j1, j3a, j5, j7a, k1, k2, k3a, k4a, k5, k6, k7a, k8a]
new_system = 
[
-y1*y6*y15 - y1*y7*y13 - y1*y7*y17 - y1*y8*y19 + y2*y10 + y2*y16 + y3*y12 + y3*y20 + y4*y9 + y4*y14 + y5*y11 + y5*y18,
y1*y6*y15 - y2*y10 - y2*y16,
y1*y8*y19 - y3*y12 - y3*y20,
y1*y7*y13 - y4*y9 - y4*y14,
y1*y7*y17 - y5*y11 - y5*y18,
-y1*y6*y15 + y2*y10 + y4*y14,
-y1*y7*y13 - y1*y7*y17 + y4*y9 + y5*y11,
-y1*y8*y19 + y3*y12 + y5*y18,
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


