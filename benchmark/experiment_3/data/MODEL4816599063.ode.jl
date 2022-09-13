Original system:

[
Pi => EPi*k8,
k2 => 0,
k_8 => 0,
ATP_Ca2_E1Auxprime => ADP*EP*k_6 + ATP*Ca2_E1Auxprime*k5,
Ca2plus => 0,
ADP => ATP_Ca2_E1Auxprime*k6,
k_4 => 0,
k5 => 0,
k7 => 0,
EPi => E2Aux*Pi*k_8 + EP*k7,
k_7 => 0,
k_3 => 0,
Ca2_E1Auxprime => ATP_Ca2_E1Auxprime*k_5 + Ca2plus*Ca_E1Auxprime*k4,
k8 => 0,
k1 => 0,
ATP => ATP_Ca2_E1Auxprime*k_5,
k4 => 0,
k_2 => 0,
E2Aux => E1Aux*k_1 + EPi*k8,
EP => ATP_Ca2_E1Auxprime*k6 + EPi*k_7,
E1Aux => Ca_E1Aux*k_2 + E2Aux*k1,
Ca_E1Auxprime => Ca2_E1Auxprime*k_4 + Ca_E1Aux*k3,
k3 => 0,
k6 => 0,
Ca_E1Aux => Ca2plus*E1Aux*k2 + Ca_E1Auxprime*k_3,
k_1 => 0,
k_5 => 0,
k_6 => 0
]

Reductions:


new_vars = fmpq_mpoly[Ca2plus]
new_system = 
[
0
]


new_vars = fmpq_mpoly[Ca2plus, k1]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[Ca2plus, k1, k2]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[Ca2plus, k1, k2, k3]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Ca2plus, k1, k2, k3, k4]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Ca2plus, k1, k2, k3, k4, k5]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Ca2plus, k1, k2, k3, k4, k5, k6]
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


new_vars = fmpq_mpoly[Ca2plus, k1, k2, k3, k4, k5, k6, k7]
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


new_vars = fmpq_mpoly[Ca2plus, k1, k2, k3, k4, k5, k6, k7, k8]
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


new_vars = fmpq_mpoly[Ca2plus, k1, k2, k3, k4, k5, k6, k7, k8, k_1]
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


new_vars = fmpq_mpoly[Ca2plus, k1, k2, k3, k4, k5, k6, k7, k8, k_1, k_2]
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


new_vars = fmpq_mpoly[Ca2plus, k1, k2, k3, k4, k5, k6, k7, k8, k_1, k_2, k_3]
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


new_vars = fmpq_mpoly[Ca2plus, k1, k2, k3, k4, k5, k6, k7, k8, k_1, k_2, k_3, k_4]
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


new_vars = fmpq_mpoly[Ca2plus, k1, k2, k3, k4, k5, k6, k7, k8, k_1, k_2, k_3, k_4, k_5]
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


new_vars = fmpq_mpoly[Ca2plus, k1, k2, k3, k4, k5, k6, k7, k8, k_1, k_2, k_3, k_4, k_5, k_6]
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


new_vars = fmpq_mpoly[Ca2plus, k1, k2, k3, k4, k5, k6, k7, k8, k_1, k_2, k_3, k_4, k_5, k_6, k_7]
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


new_vars = fmpq_mpoly[Ca2plus, k1, k2, k3, k4, k5, k6, k7, k8, k_1, k_2, k_3, k_4, k_5, k_6, k_7, k_8]
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


