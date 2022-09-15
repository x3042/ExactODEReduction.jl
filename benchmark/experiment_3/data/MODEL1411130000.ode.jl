Original system:

[
s6 => delta_sm*s1,
s7 => delta_nm*s2,
s8 => -S1*rho_nm*s2,
s3 => -alpha*gamma_nm*s2 + gamma_nm*s2 + gamma_slm*s1,
s5 => -S2*rho_sm*s1,
s1 => alpha*gamma_nm*s2,
rho_sm => 0,
S1 => 0,
s2 => 0,
s4 => delta_lm*s3,
delta_sm => 0,
gamma_nm => 0,
gamma_slm => 0,
delta_nm => 0,
delta_lm => 0,
S2 => 0,
alpha => 0,
rho_nm => 0
]

Reductions:


new_vars = fmpq_mpoly[S1]
new_system = 
[
0
]


new_vars = fmpq_mpoly[S1, S2]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[S1, S2, alpha]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[S1, S2, alpha, delta_lm]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[S1, S2, alpha, delta_lm, delta_nm]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[S1, S2, alpha, delta_lm, delta_nm, delta_sm]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[S1, S2, alpha, delta_lm, delta_nm, delta_sm, gamma_nm]
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


new_vars = fmpq_mpoly[S1, S2, alpha, delta_lm, delta_nm, delta_sm, gamma_nm, gamma_slm]
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


new_vars = fmpq_mpoly[S1, S2, alpha, delta_lm, delta_nm, delta_sm, gamma_nm, gamma_slm, rho_nm]
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


new_vars = fmpq_mpoly[S1, S2, alpha, delta_lm, delta_nm, delta_sm, gamma_nm, gamma_slm, rho_nm, rho_sm]
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


new_vars = fmpq_mpoly[S1, S2, alpha, delta_lm, delta_nm, delta_sm, gamma_nm, gamma_slm, rho_nm, rho_sm, s2]
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


new_vars = fmpq_mpoly[S1, S2, alpha, delta_lm, delta_nm, delta_sm, gamma_nm, gamma_slm, rho_nm, rho_sm, s1, s2]
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
y3*y7*y12,
0
]


new_vars = fmpq_mpoly[S1, S2, alpha, delta_lm, delta_nm, delta_sm, gamma_nm, gamma_slm, rho_nm, rho_sm, s1, s2, s3]
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
y3*y7*y12,
0,
-y3*y7*y12 + y7*y12 + y8*y11
]


new_vars = fmpq_mpoly[S1, S2, alpha, delta_lm, delta_nm, delta_sm, gamma_nm, gamma_slm, rho_nm, rho_sm, s1, s2, s3, s4]
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
y3*y7*y12,
0,
-y3*y7*y12 + y7*y12 + y8*y11,
y4*y13
]


new_vars = fmpq_mpoly[S1, S2, alpha, delta_lm, delta_nm, delta_sm, gamma_nm, gamma_slm, rho_nm, rho_sm, s1, s2, s3, s4, s5]
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
y3*y7*y12,
0,
-y3*y7*y12 + y7*y12 + y8*y11,
y4*y13,
-y2*y10*y11
]


new_vars = fmpq_mpoly[S1, S2, alpha, delta_lm, delta_nm, delta_sm, gamma_nm, gamma_slm, rho_nm, rho_sm, s1, s2, s3, s4, s5, s6]
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
y3*y7*y12,
0,
-y3*y7*y12 + y7*y12 + y8*y11,
y4*y13,
-y2*y10*y11,
y6*y11
]


new_vars = fmpq_mpoly[S1, S2, alpha, delta_lm, delta_nm, delta_sm, gamma_nm, gamma_slm, rho_nm, rho_sm, s1, s2, s3, s4, s5, s6, s7]
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
y3*y7*y12,
0,
-y3*y7*y12 + y7*y12 + y8*y11,
y4*y13,
-y2*y10*y11,
y6*y11,
y5*y12
]


