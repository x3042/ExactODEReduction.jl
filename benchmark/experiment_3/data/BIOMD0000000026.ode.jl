Original system:

[
MAPKK => -M*MAPKK*k1 - MAPKK*Mp*k3 + M_MAPKK*k2 + M_MAPKK*k_1 + Mp_MAPKK*k4 + Mp_MAPKK*k_3,
h_3 => 0,
M_MKP3 => M*MKP3*h_6 - M_MKP3*h6 + Mp_MKP3*h5,
Mp_MKP3_dep => MKP3*Mp*h_3 - Mp_MKP3_dep*h3 + Mpp_MKP3*h2,
Mpp => -MKP3*Mpp*h1 + Mp_MAPKK*k4 + Mpp_MKP3*h_1,
h5 => 0,
Mp => -MAPKK*Mp*k3 - MKP3*Mp*h4 - MKP3*Mp*h_3 + M_MAPKK*k2 + Mp_MAPKK*k_3 + Mp_MKP3*h_4 + Mp_MKP3_dep*h3,
k4 => 0,
M => -M*MAPKK*k1 - M*MKP3*h_6 + M_MAPKK*k_1 + M_MKP3*h6,
M_MAPKK => M*MAPKK*k1 - M_MAPKK*k2 - M_MAPKK*k_1,
h2 => 0,
h_6 => 0,
h_4 => 0,
h1 => 0,
k_1 => 0,
h_1 => 0,
h6 => 0,
k_3 => 0,
Mp_MAPKK => MAPKK*Mp*k3 - Mp_MAPKK*k4 - Mp_MAPKK*k_3,
Mp_MKP3 => MKP3*Mp*h4 - Mp_MKP3*h5 - Mp_MKP3*h_4,
h3 => 0,
h4 => 0,
k1 => 0,
k3 => 0,
MKP3 => -M*MKP3*h_6 - MKP3*Mp*h4 - MKP3*Mp*h_3 - MKP3*Mpp*h1 + M_MKP3*h6 + Mp_MKP3*h_4 + Mp_MKP3_dep*h3 + Mpp_MKP3*h_1,
k2 => 0,
Mpp_MKP3 => MKP3*Mpp*h1 - Mpp_MKP3*h2 - Mpp_MKP3*h_1
]

Reductions:

Interesting
new_vars = fmpq_mpoly[M + M_MAPKK + M_MKP3 + Mp + Mp_MAPKK + Mp_MKP3 + Mp_MKP3_dep + Mpp + Mpp_MKP3]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[M + M_MAPKK + M_MKP3 + Mp + Mp_MAPKK + Mp_MKP3 + Mp_MKP3_dep + Mpp + Mpp_MKP3, MAPKK + M_MAPKK + Mp_MAPKK]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[M + M_MAPKK + M_MKP3 + Mp + Mp_MAPKK + Mp_MKP3 + Mp_MKP3_dep + Mpp + Mpp_MKP3, MAPKK + M_MAPKK + Mp_MAPKK, MKP3 + M_MKP3 + Mp_MKP3 + Mp_MKP3_dep + Mpp_MKP3]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[M + M_MAPKK + M_MKP3 + Mp + Mp_MAPKK + Mp_MKP3 + Mp_MKP3_dep + Mpp + Mpp_MKP3, MAPKK + M_MAPKK + Mp_MAPKK, MKP3 + M_MKP3 + Mp_MKP3 + Mp_MKP3_dep + Mpp_MKP3, h1]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[M + M_MAPKK + M_MKP3 + Mp + Mp_MAPKK + Mp_MKP3 + Mp_MKP3_dep + Mpp + Mpp_MKP3, MAPKK + M_MAPKK + Mp_MAPKK, MKP3 + M_MKP3 + Mp_MKP3 + Mp_MKP3_dep + Mpp_MKP3, h1, h2]
new_system = 
[
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[M + M_MAPKK + M_MKP3 + Mp + Mp_MAPKK + Mp_MKP3 + Mp_MKP3_dep + Mpp + Mpp_MKP3, MAPKK + M_MAPKK + Mp_MAPKK, MKP3 + M_MKP3 + Mp_MKP3 + Mp_MKP3_dep + Mpp_MKP3, h1, h2, h3]
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
new_vars = fmpq_mpoly[M + M_MAPKK + M_MKP3 + Mp + Mp_MAPKK + Mp_MKP3 + Mp_MKP3_dep + Mpp + Mpp_MKP3, MAPKK + M_MAPKK + Mp_MAPKK, MKP3 + M_MKP3 + Mp_MKP3 + Mp_MKP3_dep + Mpp_MKP3, h1, h2, h3, h4]
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
new_vars = fmpq_mpoly[M + M_MAPKK + M_MKP3 + Mp + Mp_MAPKK + Mp_MKP3 + Mp_MKP3_dep + Mpp + Mpp_MKP3, MAPKK + M_MAPKK + Mp_MAPKK, MKP3 + M_MKP3 + Mp_MKP3 + Mp_MKP3_dep + Mpp_MKP3, h1, h2, h3, h4, h5]
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
new_vars = fmpq_mpoly[M + M_MAPKK + M_MKP3 + Mp + Mp_MAPKK + Mp_MKP3 + Mp_MKP3_dep + Mpp + Mpp_MKP3, MAPKK + M_MAPKK + Mp_MAPKK, MKP3 + M_MKP3 + Mp_MKP3 + Mp_MKP3_dep + Mpp_MKP3, h1, h2, h3, h4, h5, h6]
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
new_vars = fmpq_mpoly[M + M_MAPKK + M_MKP3 + Mp + Mp_MAPKK + Mp_MKP3 + Mp_MKP3_dep + Mpp + Mpp_MKP3, MAPKK + M_MAPKK + Mp_MAPKK, MKP3 + M_MKP3 + Mp_MKP3 + Mp_MKP3_dep + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h_1]
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
new_vars = fmpq_mpoly[M + M_MAPKK + M_MKP3 + Mp + Mp_MAPKK + Mp_MKP3 + Mp_MKP3_dep + Mpp + Mpp_MKP3, MAPKK + M_MAPKK + Mp_MAPKK, MKP3 + M_MKP3 + Mp_MKP3 + Mp_MKP3_dep + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h_1, h_3]
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
new_vars = fmpq_mpoly[M + M_MAPKK + M_MKP3 + Mp + Mp_MAPKK + Mp_MKP3 + Mp_MKP3_dep + Mpp + Mpp_MKP3, MAPKK + M_MAPKK + Mp_MAPKK, MKP3 + M_MKP3 + Mp_MKP3 + Mp_MKP3_dep + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h_1, h_3, h_4]
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
new_vars = fmpq_mpoly[M + M_MAPKK + M_MKP3 + Mp + Mp_MAPKK + Mp_MKP3 + Mp_MKP3_dep + Mpp + Mpp_MKP3, MAPKK + M_MAPKK + Mp_MAPKK, MKP3 + M_MKP3 + Mp_MKP3 + Mp_MKP3_dep + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h_1, h_3, h_4, h_6]
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
new_vars = fmpq_mpoly[M + M_MAPKK + M_MKP3 + Mp + Mp_MAPKK + Mp_MKP3 + Mp_MKP3_dep + Mpp + Mpp_MKP3, MAPKK + M_MAPKK + Mp_MAPKK, MKP3 + M_MKP3 + Mp_MKP3 + Mp_MKP3_dep + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h_1, h_3, h_4, h_6, k1]
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
new_vars = fmpq_mpoly[M + M_MAPKK + M_MKP3 + Mp + Mp_MAPKK + Mp_MKP3 + Mp_MKP3_dep + Mpp + Mpp_MKP3, MAPKK + M_MAPKK + Mp_MAPKK, MKP3 + M_MKP3 + Mp_MKP3 + Mp_MKP3_dep + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h_1, h_3, h_4, h_6, k1, k2]
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
new_vars = fmpq_mpoly[M + M_MAPKK + M_MKP3 + Mp + Mp_MAPKK + Mp_MKP3 + Mp_MKP3_dep + Mpp + Mpp_MKP3, MAPKK + M_MAPKK + Mp_MAPKK, MKP3 + M_MKP3 + Mp_MKP3 + Mp_MKP3_dep + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h_1, h_3, h_4, h_6, k1, k2, k3]
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
new_vars = fmpq_mpoly[M + M_MAPKK + M_MKP3 + Mp + Mp_MAPKK + Mp_MKP3 + Mp_MKP3_dep + Mpp + Mpp_MKP3, MAPKK + M_MAPKK + Mp_MAPKK, MKP3 + M_MKP3 + Mp_MKP3 + Mp_MKP3_dep + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h_1, h_3, h_4, h_6, k1, k2, k3, k4]
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
new_vars = fmpq_mpoly[M + M_MAPKK + M_MKP3 + Mp + Mp_MAPKK + Mp_MKP3 + Mp_MKP3_dep + Mpp + Mpp_MKP3, MAPKK + M_MAPKK + Mp_MAPKK, MKP3 + M_MKP3 + Mp_MKP3 + Mp_MKP3_dep + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h_1, h_3, h_4, h_6, k1, k2, k3, k4, k_1]
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
new_vars = fmpq_mpoly[M + M_MAPKK + M_MKP3 + Mp + Mp_MAPKK + Mp_MKP3 + Mp_MKP3_dep + Mpp + Mpp_MKP3, MAPKK + M_MAPKK + Mp_MAPKK, MKP3 + M_MKP3 + Mp_MKP3 + Mp_MKP3_dep + Mpp_MKP3, h1, h2, h3, h4, h5, h6, h_1, h_3, h_4, h_6, k1, k2, k3, k4, k_1, k_3]
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


