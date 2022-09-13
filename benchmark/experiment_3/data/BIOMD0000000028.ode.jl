Original system:

[
k1 => 0,
MpY_MEK => MEK*MpY*k3 - MpY_MEK*k4 - MpY_MEK*k_3,
h4 => 0,
h_6 => 0,
k6 => 0,
M_MEK_Y => M*MEK*k1 - M_MEK_Y*k2 - M_MEK_Y*k_1,
k7 => 0,
k8 => 0,
h_1 => 0,
k_1 => 0,
h8 => 0,
h_7 => 0,
M_MKP3_T => M*MKP3*h_6 - M_MKP3_T*h6 + MpT_MKP3_T*h5,
MKP3 => -M*MKP3*h_6 - M*MKP3*h_9 - MKP3*MpT*h4 - MKP3*MpT*h_3 - MKP3*MpY*h7 - MKP3*Mpp*h1 + M_MKP3_T*h6 + M_MKP3_Y*h9 + MpT_MKP3_T*h_4 + MpT_MKP3_Y*h3 + MpY_MKP3*h_7 + Mpp_MKP3*h_1,
h_4 => 0,
Mpp_MKP3 => MKP3*Mpp*h1 - Mpp_MKP3*h2 - Mpp_MKP3*h_1,
MpY_MKP3 => MKP3*MpY*h7 - MpY_MKP3*h8 - MpY_MKP3*h_7,
h_9 => 0,
M_MKP3_Y => M*MKP3*h_9 - M_MKP3_Y*h9 + MpY_MKP3*h8,
k_7 => 0,
MEK => -M*MEK*k1 - M*MEK*k5 - MEK*MpT*k7 - MEK*MpY*k3 + M_MEK_T*k6 + M_MEK_T*k_5 + M_MEK_Y*k2 + M_MEK_Y*k_1 + MpT_MEK*k8 + MpT_MEK*k_7 + MpY_MEK*k4 + MpY_MEK*k_3,
k5 => 0,
M => -M*MEK*k1 - M*MEK*k5 - M*MKP3*h_6 - M*MKP3*h_9 + M_MEK_T*k_5 + M_MEK_Y*k_1 + M_MKP3_T*h6 + M_MKP3_Y*h9,
MpT_MKP3_Y => MKP3*MpT*h_3 - MpT_MKP3_Y*h3 + Mpp_MKP3*h2,
k_5 => 0,
h7 => 0,
h1 => 0,
h6 => 0,
k_3 => 0,
MpT_MKP3_T => MKP3*MpT*h4 - MpT_MKP3_T*h5 - MpT_MKP3_T*h_4,
MpY => -MEK*MpY*k3 - MKP3*MpY*h7 + M_MEK_Y*k2 + MpY_MEK*k_3 + MpY_MKP3*h_7,
Mpp => -MKP3*Mpp*h1 + MpT_MEK*k8 + MpY_MEK*k4 + Mpp_MKP3*h_1,
M_MEK_T => M*MEK*k5 - M_MEK_T*k6 - M_MEK_T*k_5,
MpT_MEK => MEK*MpT*k7 - MpT_MEK*k8 - MpT_MEK*k_7,
k2 => 0,
k3 => 0,
h2 => 0,
h5 => 0,
k4 => 0,
h9 => 0,
MpT => -MEK*MpT*k7 - MKP3*MpT*h4 - MKP3*MpT*h_3 + M_MEK_T*k6 + MpT_MEK*k_7 + MpT_MKP3_T*h_4 + MpT_MKP3_Y*h3,
h3 => 0,
h_3 => 0
]

Reductions:

Interesting
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2]
new_system = 
[
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3]
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
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3, h4]
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
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3, h4, h5]
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
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3, h4, h5, h6]
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
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h7]
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
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h7, h8]
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
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h7, h8, h9]
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
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h7, h8, h9, h_1]
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

Interesting
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h7, h8, h9, h_1, h_3]
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

Interesting
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h7, h8, h9, h_1, h_3, h_4]
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

Interesting
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h7, h8, h9, h_1, h_3, h_4, h_6]
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

Interesting
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h7, h8, h9, h_1, h_3, h_4, h_6, h_7]
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

Interesting
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h7, h8, h9, h_1, h_3, h_4, h_6, h_7, h_9]
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

Interesting
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h7, h8, h9, h_1, h_3, h_4, h_6, h_7, h_9, k1]
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

Interesting
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h7, h8, h9, h_1, h_3, h_4, h_6, h_7, h_9, k1, k2]
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

Interesting
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h7, h8, h9, h_1, h_3, h_4, h_6, h_7, h_9, k1, k2, k3]
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

Interesting
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h7, h8, h9, h_1, h_3, h_4, h_6, h_7, h_9, k1, k2, k3, k4]
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

Interesting
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h7, h8, h9, h_1, h_3, h_4, h_6, h_7, h_9, k1, k2, k3, k4, k5]
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
0,
0
]

Interesting
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h7, h8, h9, h_1, h_3, h_4, h_6, h_7, h_9, k1, k2, k3, k4, k5, k6]
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
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h7, h8, h9, h_1, h_3, h_4, h_6, h_7, h_9, k1, k2, k3, k4, k5, k6, k7]
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
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h7, h8, h9, h_1, h_3, h_4, h_6, h_7, h_9, k1, k2, k3, k4, k5, k6, k7, k8]
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
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h7, h8, h9, h_1, h_3, h_4, h_6, h_7, h_9, k1, k2, k3, k4, k5, k6, k7, k8, k_1]
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
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h7, h8, h9, h_1, h_3, h_4, h_6, h_7, h_9, k1, k2, k3, k4, k5, k6, k7, k8, k_1, k_3]
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
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h7, h8, h9, h_1, h_3, h_4, h_6, h_7, h_9, k1, k2, k3, k4, k5, k6, k7, k8, k_1, k_3, k_5]
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
new_vars = fmpq_mpoly[M + M_MEK_T + M_MEK_Y + M_MKP3_T + M_MKP3_Y + MpT + MpT_MEK + MpT_MKP3_T + MpT_MKP3_Y + MpY + MpY_MEK + MpY_MKP3 + Mpp + Mpp_MKP3, MEK + M_MEK_T + M_MEK_Y + MpT_MEK + MpY_MEK, MKP3 + M_MKP3_T + M_MKP3_Y + MpT_MKP3_T + MpT_MKP3_Y + MpY_MKP3 + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h7, h8, h9, h_1, h_3, h_4, h_6, h_7, h_9, k1, k2, k3, k4, k5, k6, k7, k8, k_1, k_3, k_5, k_7]
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


