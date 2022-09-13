Original system:

[
ERK2 => CAR1*k5,
k1 => 0,
II => 0,
k11 => 0,
SIINK => -CAR1*k14 - PKA*k4 - excAMP*k12,
ACA => CAR1*k1,
k8 => 0,
k4 => 0,
k10 => 0,
excAMP => ACA*k11,
k2 => 0,
REGA => II*k7,
PKA => incAMP*k3,
k7 => 0,
k13 => 0,
k9 => 0,
incAMP => ACA*k9,
k5 => 0,
k12 => 0,
k14 => 0,
k6 => 0,
k3 => 0,
CAR1 => excAMP*k13
]

Reductions:


new_vars = fmpq_mpoly[k1]
new_system = 
[
0
]


new_vars = fmpq_mpoly[k1, k11]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[k1, k11, k13]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[ACA, CAR1, excAMP, k1, k11, k13]
new_system = 
[
y2*y4,
y3*y6,
y1*y5,
0,
0,
0
]


new_vars = fmpq_mpoly[ACA, CAR1, excAMP, k1, k11, k13, k5]
new_system = 
[
y2*y4,
y3*y6,
y1*y5,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[ACA, CAR1, ERK2, excAMP, k1, k11, k13, k5]
new_system = 
[
y2*y5,
y4*y7,
y2*y8,
y1*y6,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[ACA, CAR1, ERK2, II, excAMP, k1, k11, k13, k5]
new_system = 
[
y2*y6,
y5*y8,
y2*y9,
0,
y1*y7,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[ACA, CAR1, ERK2, II, excAMP, k1, k11, k13, k3, k5]
new_system = 
[
y2*y6,
y5*y8,
y2*y10,
0,
y1*y7,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[ACA, CAR1, ERK2, II, excAMP, k1, k11, k13, k3, k5, k9]
new_system = 
[
y2*y6,
y5*y8,
y2*y10,
0,
y1*y7,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[ACA, CAR1, ERK2, II, excAMP, incAMP, k1, k11, k13, k3, k5, k9]
new_system = 
[
y2*y7,
y5*y9,
y2*y11,
0,
y1*y8,
y1*y12,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[ACA, CAR1, ERK2, II, PKA, excAMP, incAMP, k1, k11, k13, k3, k5, k9]
new_system = 
[
y2*y8,
y6*y10,
y2*y12,
0,
y7*y11,
y1*y9,
y1*y13,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[ACA, CAR1, ERK2, II, PKA, excAMP, incAMP, k1, k11, k13, k3, k5, k7, k9]
new_system = 
[
y2*y8,
y6*y10,
y2*y12,
0,
y7*y11,
y1*y9,
y1*y14,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[ACA, CAR1, ERK2, II, PKA, REGA, excAMP, incAMP, k1, k11, k13, k3, k5, k7, k9]
new_system = 
[
y2*y9,
y7*y11,
y2*y13,
0,
y8*y12,
y4*y14,
y1*y10,
y1*y15,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[ACA, CAR1, ERK2, II, PKA, REGA, excAMP, incAMP, k1, k11, k12, k13, k3, k5, k7, k9]
new_system = 
[
y2*y9,
y7*y12,
y2*y14,
0,
y8*y13,
y4*y15,
y1*y10,
y1*y16,
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[ACA, CAR1, ERK2, II, PKA, REGA, excAMP, incAMP, k1, k11, k12, k13, k14, k3, k5, k7, k9]
new_system = 
[
y2*y9,
y7*y12,
y2*y15,
0,
y8*y14,
y4*y16,
y1*y10,
y1*y17,
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


new_vars = fmpq_mpoly[ACA, CAR1, ERK2, II, PKA, REGA, excAMP, incAMP, k1, k11, k12, k13, k14, k3, k4, k5, k7, k9]
new_system = 
[
y2*y9,
y7*y12,
y2*y16,
0,
y8*y14,
y4*y17,
y1*y10,
y1*y18,
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


new_vars = fmpq_mpoly[ACA, CAR1, ERK2, II, PKA, REGA, SIINK, excAMP, incAMP, k1, k11, k12, k13, k14, k3, k4, k5, k7, k9]
new_system = 
[
y2*y10,
y8*y13,
y2*y17,
0,
y9*y15,
y4*y18,
-y2*y14 - y5*y16 - y8*y12,
y1*y11,
y1*y19,
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


new_vars = fmpq_mpoly[ACA, CAR1, ERK2, II, PKA, REGA, SIINK, excAMP, incAMP, k1, k10, k11, k12, k13, k14, k3, k4, k5, k7, k9]
new_system = 
[
y2*y10,
y8*y14,
y2*y18,
0,
y9*y16,
y4*y19,
-y2*y15 - y5*y17 - y8*y13,
y1*y12,
y1*y20,
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


new_vars = fmpq_mpoly[ACA, CAR1, ERK2, II, PKA, REGA, SIINK, excAMP, incAMP, k1, k10, k11, k12, k13, k14, k2, k3, k4, k5, k7, k9]
new_system = 
[
y2*y10,
y8*y14,
y2*y19,
0,
y9*y17,
y4*y20,
-y2*y15 - y5*y18 - y8*y13,
y1*y12,
y1*y21,
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


new_vars = fmpq_mpoly[ACA, CAR1, ERK2, II, PKA, REGA, SIINK, excAMP, incAMP, k1, k10, k11, k12, k13, k14, k2, k3, k4, k5, k6, k7, k9]
new_system = 
[
y2*y10,
y8*y14,
y2*y19,
0,
y9*y17,
y4*y21,
-y2*y15 - y5*y18 - y8*y13,
y1*y12,
y1*y22,
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


