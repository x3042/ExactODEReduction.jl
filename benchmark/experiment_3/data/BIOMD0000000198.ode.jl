Original system:

[
NO_sGCfast => -NO_sGCfast*k2 - NO_sGCfast*k3 + k1*sGCfast*sNO,
NO_sGCslow => -NO_sGCslow*k7 - NO_sGCslow*k8 + k6*sGCslow*sNO,
k7 => 0,
k9 => 0,
NO_sGCslow_6coord => NO_sGCslow*k8 - NO_sGCslow_6coord*k9*sNO + NO_sGCslow_6coord_NO_int*k10,
k4 => 0,
sGCslow => NO_sGCslow*k7 - k6*sGCslow*sNO,
k3 => 0,
k6 => 0,
NO_sGCslow_6coord_NO_int => NO_sGCslow_5coord*k12 + NO_sGCslow_6coord*k9*sNO - NO_sGCslow_6coord_NO_int*k10 - NO_sGCslow_6coord_NO_int*k11,
k2 => 0,
k12 => 0,
k1 => 0,
NO_sGCfast_5coord => -NO_sGCfast_5coord*k5 + NO_sGCfast_6coord*k4,
k11 => 0,
NO_sGCslow_5coord => -NO_sGCslow_5coord*k12 + NO_sGCslow_6coord_NO_int*k11,
NO_sGCfast_6coord => NO_sGCfast*k3 + NO_sGCfast_5coord*k5 - NO_sGCfast_6coord*k4,
sNO => NO_sGCfast*k2 + NO_sGCslow*k7 - NO_sGCslow_6coord*k9*sNO + NO_sGCslow_6coord_NO_int*k10 - k1*sGCfast*sNO - k6*sGCslow*sNO,
k10 => 0,
k5 => 0,
k8 => 0,
sGCfast => NO_sGCfast*k2 - k1*sGCfast*sNO
]

Reductions:

Interesting
new_vars = fmpq_mpoly[NO_sGCslow + NO_sGCslow_6coord + sGCfast + 2*sGCslow - sNO]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[NO_sGCslow + NO_sGCslow_6coord + sGCfast + 2*sGCslow - sNO, NO_sGCslow_5coord + NO_sGCslow_6coord_NO_int - sGCfast - sGCslow + sNO]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[NO_sGCslow + NO_sGCslow_6coord + sGCfast + 2*sGCslow - sNO, NO_sGCslow_5coord + NO_sGCslow_6coord_NO_int - sGCfast - sGCslow + sNO, k1]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[NO_sGCslow + NO_sGCslow_6coord + sGCfast + 2*sGCslow - sNO, NO_sGCslow_5coord + NO_sGCslow_6coord_NO_int - sGCfast - sGCslow + sNO, k1, k10]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[NO_sGCslow + NO_sGCslow_6coord + sGCfast + 2*sGCslow - sNO, NO_sGCslow_5coord + NO_sGCslow_6coord_NO_int - sGCfast - sGCslow + sNO, k1, k10, k11]
new_system = 
[
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[NO_sGCslow + NO_sGCslow_6coord + sGCfast + 2*sGCslow - sNO, NO_sGCslow_5coord + NO_sGCslow_6coord_NO_int - sGCfast - sGCslow + sNO, k1, k10, k11, k12]
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
new_vars = fmpq_mpoly[NO_sGCslow + NO_sGCslow_6coord + sGCfast + 2*sGCslow - sNO, NO_sGCslow_5coord + NO_sGCslow_6coord_NO_int - sGCfast - sGCslow + sNO, k1, k10, k11, k12, k2]
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
new_vars = fmpq_mpoly[NO_sGCslow + NO_sGCslow_6coord + sGCfast + 2*sGCslow - sNO, NO_sGCslow_5coord + NO_sGCslow_6coord_NO_int - sGCfast - sGCslow + sNO, k1, k10, k11, k12, k2, k3]
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
new_vars = fmpq_mpoly[NO_sGCslow + NO_sGCslow_6coord + sGCfast + 2*sGCslow - sNO, NO_sGCslow_5coord + NO_sGCslow_6coord_NO_int - sGCfast - sGCslow + sNO, k1, k10, k11, k12, k2, k3, k6]
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
new_vars = fmpq_mpoly[NO_sGCslow + NO_sGCslow_6coord + sGCfast + 2*sGCslow - sNO, NO_sGCslow_5coord + NO_sGCslow_6coord_NO_int - sGCfast - sGCslow + sNO, k1, k10, k11, k12, k2, k3, k6, k7]
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
new_vars = fmpq_mpoly[NO_sGCslow + NO_sGCslow_6coord + sGCfast + 2*sGCslow - sNO, NO_sGCslow_5coord + NO_sGCslow_6coord_NO_int - sGCfast - sGCslow + sNO, k1, k10, k11, k12, k2, k3, k6, k7, k8]
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
new_vars = fmpq_mpoly[NO_sGCslow + NO_sGCslow_6coord + sGCfast + 2*sGCslow - sNO, NO_sGCslow_5coord + NO_sGCslow_6coord_NO_int - sGCfast - sGCslow + sNO, k1, k10, k11, k12, k2, k3, k6, k7, k8, k9]
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


new_vars = fmpq_mpoly[NO_sGCfast, NO_sGCslow, NO_sGCslow_5coord, NO_sGCslow_6coord, NO_sGCslow_6coord_NO_int, k1, k10, k11, k12, k2, k3, k6, k7, k8, k9, sGCfast, sGCslow, sNO]
new_system = 
[
-y1*y10 - y1*y11 + y6*y16*y18,
-y2*y13 - y2*y14 + y12*y17*y18,
-y3*y9 + y5*y8,
y2*y14 - y4*y15*y18 + y5*y7,
y3*y9 + y4*y15*y18 - y5*y7 - y5*y8,
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
y1*y10 - y6*y16*y18,
y2*y13 - y12*y17*y18,
y1*y10 + y2*y13 - y4*y15*y18 + y5*y7 - y6*y16*y18 - y12*y17*y18
]

Interesting
new_vars = fmpq_mpoly[NO_sGCfast, NO_sGCfast_5coord + NO_sGCfast_6coord, NO_sGCslow, NO_sGCslow_5coord, NO_sGCslow_6coord, NO_sGCslow_6coord_NO_int, k1, k10, k11, k12, k2, k3, k6, k7, k8, k9, sGCfast, sGCslow, sNO]
new_system = 
[
-y1*y11 - y1*y12 + y7*y17*y19,
y1*y12,
-y3*y14 - y3*y15 + y13*y18*y19,
-y4*y10 + y6*y9,
y3*y15 - y5*y16*y19 + y6*y8,
y4*y10 + y5*y16*y19 - y6*y8 - y6*y9,
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
y1*y11 - y7*y17*y19,
y3*y14 - y13*y18*y19,
y1*y11 + y3*y14 - y5*y16*y19 + y6*y8 - y7*y17*y19 - y13*y18*y19
]

Interesting
new_vars = fmpq_mpoly[NO_sGCfast, NO_sGCfast_5coord + NO_sGCfast_6coord, NO_sGCslow, NO_sGCslow_5coord, NO_sGCslow_6coord, NO_sGCslow_6coord_NO_int, k1, k10, k11, k12, k2, k3, k4, k6, k7, k8, k9, sGCfast, sGCslow, sNO]
new_system = 
[
-y1*y11 - y1*y12 + y7*y18*y20,
y1*y12,
-y3*y15 - y3*y16 + y14*y19*y20,
-y4*y10 + y6*y9,
y3*y16 - y5*y17*y20 + y6*y8,
y4*y10 + y5*y17*y20 - y6*y8 - y6*y9,
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
y1*y11 - y7*y18*y20,
y3*y15 - y14*y19*y20,
y1*y11 + y3*y15 - y5*y17*y20 + y6*y8 - y7*y18*y20 - y14*y19*y20
]

Interesting
new_vars = fmpq_mpoly[NO_sGCfast, NO_sGCfast_5coord + NO_sGCfast_6coord, NO_sGCslow, NO_sGCslow_5coord, NO_sGCslow_6coord, NO_sGCslow_6coord_NO_int, k1, k10, k11, k12, k2, k3, k4, k5, k6, k7, k8, k9, sGCfast, sGCslow, sNO]
new_system = 
[
-y1*y11 - y1*y12 + y7*y19*y21,
y1*y12,
-y3*y16 - y3*y17 + y15*y20*y21,
-y4*y10 + y6*y9,
y3*y17 - y5*y18*y21 + y6*y8,
y4*y10 + y5*y18*y21 - y6*y8 - y6*y9,
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
y1*y11 - y7*y19*y21,
y3*y16 - y15*y20*y21,
y1*y11 + y3*y16 - y5*y18*y21 + y6*y8 - y7*y19*y21 - y15*y20*y21
]


