Original system:

[
empty => Inh*k26d + alpha*k24d + beta*k25d - empty*k24d - empty*k25d - empty*k26d,
k16d => 0,
k24d => 0,
T2_beta => T2*beta*k9r - T2_beta*alpha*k10r - T2_beta*k9d + alpha_T2_beta*k10d,
k25d => 0,
k3r => 0,
beta_T3_Inh => Inh*beta_T3*k15r + T3_Inh*beta*k17d + beta_Inh_T3*k20d - beta_T3_Inh*k15d - beta_T3_Inh*k17r - beta_T3_Inh*k19d,
alpha_alpha_T1 => alpha_T1*k4d + alpha_T1_alpha*k5d - alpha_alpha_T1*k6d,
alpha_T2 => T2*alpha*k7d - alpha_T2*beta*k8r - alpha_T2*k11d - alpha_T2*k7r + alpha_T2_beta*k8d,
k21d => 0,
k21r => 0,
beta_T3 => -Inh*beta_T3*k15r + T3*beta*k14d - beta_T3*k14r - beta_T3*k18d + beta_T3_Inh*k15d,
k7r => 0,
k14r => 0,
Inh_T1 => Inh*T1*k21d + Inh*T1_alpha*k22d + Inh*alpha_T1*k23r - Inh_T1*alpha*k22r - Inh_T1*alpha*k23d - Inh_T1*k21r,
k0d => 0,
k1r => 0,
k9r => 0,
k7d => 0,
T2 => -T2*alpha*k7d - T2*beta*k9r + T2_beta*k9d + alpha_T2*k7r,
k10r => 0,
k14d => 0,
T3_Inh => Inh*T3*k16d - T3_Inh*beta*k17d - T3_Inh*k16r + beta_T3_Inh*k17r,
k19d => 0,
k17d => 0,
k26d => 0,
k23d => 0,
k15r => 0,
k22d => 0,
k22r => 0,
alpha_T1 => -Inh*alpha_T1*k23r + Inh_T1*alpha*k23d + T1*alpha*k0d - alpha*alpha_T1*k1r - alpha_T1*k0r - alpha_T1*k4d + alpha_T1_alpha*k1d,
k12d => 0,
k16r => 0,
k4d => 0,
k0r => 0,
k8r => 0,
alpha_beta_T2 => alpha_T2*k11d + alpha_T2_beta*k12d - alpha_beta_T2*k13d,
k23r => 0,
k18d => 0,
k2d => 0,
k5d => 0,
Inh => -Inh*T1*k21d - Inh*T1_alpha*k22d - Inh*T3*k16d - Inh*alpha_T1*k23r - Inh*beta_T3*k15r - Inh*k26d + Inh_T1*alpha*k22r + Inh_T1*alpha*k23d + Inh_T1*k21r + T3_Inh*k16r + beta_T3_Inh*k15d + beta_T3_Inh*k19d + empty*k26d,
alpha_T2_beta => T2_beta*alpha*k10r + alpha_T2*beta*k8r - alpha_T2_beta*k10d - alpha_T2_beta*k12d - alpha_T2_beta*k8d + alpha_beta_T2*k13d,
k10d => 0,
T1_alpha => -Inh*T1_alpha*k22d + Inh_T1*alpha*k22r + T1*alpha*k2r - T1_alpha*alpha*k3r - T1_alpha*k2d + alpha_T1_alpha*k3d,
alpha_T1_alpha => T1_alpha*alpha*k3r + alpha*alpha_T1*k1r - alpha_T1_alpha*k1d - alpha_T1_alpha*k3d - alpha_T1_alpha*k5d + alpha_alpha_T1*k6d,
T3 => -Inh*T3*k16d - T3*beta*k14d + T3_Inh*k16r + beta_T3*k14r,
beta_Inh_T3 => -beta_Inh_T3*k20d + beta_T3*k18d + beta_T3_Inh*k19d,
alpha => Inh*T1_alpha*k22d + Inh*alpha_T1*k23r - Inh_T1*alpha*k22r - Inh_T1*alpha*k23d - T1*alpha*k0d - T1*alpha*k2r - T1_alpha*alpha*k3r + T1_alpha*k2d - T2*alpha*k7d - T2_beta*alpha*k10r - alpha*alpha_T1*k1r - alpha*k24d + alpha_T1*k0r + alpha_T1_alpha*k1d + alpha_T1_alpha*k3d + alpha_T1_alpha*k5d + alpha_T2*k7r + alpha_T2_beta*k10d + empty*k24d,
k11d => 0,
k2r => 0,
k8d => 0,
k13d => 0,
k6d => 0,
k20d => 0,
k3d => 0,
T1 => -Inh*T1*k21d + Inh_T1*k21r - T1*alpha*k0d - T1*alpha*k2r + T1_alpha*k2d + alpha_T1*k0r,
k9d => 0,
k15d => 0,
beta => -T2*beta*k9r + T2_beta*k9d - T3*beta*k14d - T3_Inh*beta*k17d - alpha_T2*beta*k8r + alpha_T2_beta*k12d + alpha_T2_beta*k8d - beta*k25d + beta_T3*k14r + beta_T3_Inh*k17r + empty*k25d,
k17r => 0,
k1d => 0
]

Reductions:

Interesting
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r]
new_system = 
[
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d, k1r]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d, k1r, k20d]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d, k1r, k20d, k21d]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d, k1r, k20d, k21d, k21r]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d, k1r, k20d, k21d, k21r, k22d]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d, k1r, k20d, k21d, k21r, k22d, k22r]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d, k1r, k20d, k21d, k21r, k22d, k22r, k23d]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d, k1r, k20d, k21d, k21r, k22d, k22r, k23d, k23r]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d, k1r, k20d, k21d, k21r, k22d, k22r, k23d, k23r, k24d]
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

Interesting
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d, k1r, k20d, k21d, k21r, k22d, k22r, k23d, k23r, k24d, k25d]
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
0,
0
]

Interesting
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d, k1r, k20d, k21d, k21r, k22d, k22r, k23d, k23r, k24d, k25d, k26d]
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
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d, k1r, k20d, k21d, k21r, k22d, k22r, k23d, k23r, k24d, k25d, k26d, k2d]
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
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d, k1r, k20d, k21d, k21r, k22d, k22r, k23d, k23r, k24d, k25d, k26d, k2d, k2r]
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
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d, k1r, k20d, k21d, k21r, k22d, k22r, k23d, k23r, k24d, k25d, k26d, k2d, k2r, k3d]
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
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d, k1r, k20d, k21d, k21r, k22d, k22r, k23d, k23r, k24d, k25d, k26d, k2d, k2r, k3d, k3r]
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
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d, k1r, k20d, k21d, k21r, k22d, k22r, k23d, k23r, k24d, k25d, k26d, k2d, k2r, k3d, k3r, k4d]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d, k1r, k20d, k21d, k21r, k22d, k22r, k23d, k23r, k24d, k25d, k26d, k2d, k2r, k3d, k3r, k4d, k5d]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d, k1r, k20d, k21d, k21r, k22d, k22r, k23d, k23r, k24d, k25d, k26d, k2d, k2r, k3d, k3r, k4d, k5d, k6d]
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d, k1r, k20d, k21d, k21r, k22d, k22r, k23d, k23r, k24d, k25d, k26d, k2d, k2r, k3d, k3r, k4d, k5d, k6d, k7d]
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
0,
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d, k1r, k20d, k21d, k21r, k22d, k22r, k23d, k23r, k24d, k25d, k26d, k2d, k2r, k3d, k3r, k4d, k5d, k6d, k7d, k7r]
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
0,
0,
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d, k1r, k20d, k21d, k21r, k22d, k22r, k23d, k23r, k24d, k25d, k26d, k2d, k2r, k3d, k3r, k4d, k5d, k6d, k7d, k7r, k8d]
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
0,
0,
0,
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d, k1r, k20d, k21d, k21r, k22d, k22r, k23d, k23r, k24d, k25d, k26d, k2d, k2r, k3d, k3r, k4d, k5d, k6d, k7d, k7r, k8d, k8r]
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
0,
0,
0,
0,
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d, k1r, k20d, k21d, k21r, k22d, k22r, k23d, k23r, k24d, k25d, k26d, k2d, k2r, k3d, k3r, k4d, k5d, k6d, k7d, k7r, k8d, k8r, k9d]
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
0,
0,
0,
0,
0,
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
new_vars = fmpq_mpoly[Inh_T1 + T1 + T1_alpha + alpha_T1 + alpha_T1_alpha + alpha_alpha_T1, T2 + T2_beta + alpha_T2 + alpha_T2_beta + alpha_beta_T2, T3 + T3_Inh + beta_Inh_T3 + beta_T3 + beta_T3_Inh, k0d, k0r, k10d, k10r, k11d, k12d, k13d, k14d, k14r, k15d, k15r, k16d, k16r, k17d, k17r, k18d, k19d, k1d, k1r, k20d, k21d, k21r, k22d, k22r, k23d, k23r, k24d, k25d, k26d, k2d, k2r, k3d, k3r, k4d, k5d, k6d, k7d, k7r, k8d, k8r, k9d, k9r]
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
0,
0,
0,
0,
0,
0,
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


