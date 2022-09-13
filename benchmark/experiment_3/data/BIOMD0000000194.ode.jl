Original system:

[
u => 0,
Mad1_CMad2_OMad2 => -Cdc20*Mad1_CMad2_OMad2*gamma_T*u + Mad1_CMad2*OMad2*alpha_T*u - Mad1_CMad2_OMad2*beta_T,
beta_T => 0,
Cdc20_CMad2 => Cdc20*Mad1_CMad2_OMad2*gamma_T*u - Cdc20_CMad2*eta_T,
Mad1_CMad2 => Cdc20*Mad1_CMad2_OMad2*gamma_T*u - Mad1_CMad2*OMad2*alpha_T*u + Mad1_CMad2_OMad2*beta_T,
gamma_T => 0,
OMad2 => Cdc20_CMad2*eta_T - Mad1_CMad2*OMad2*alpha_T*u + Mad1_CMad2_OMad2*beta_T,
alpha_T => 0,
Cdc20 => -Cdc20*Mad1_CMad2_OMad2*gamma_T*u + Cdc20_CMad2*eta_T,
eta_T => 0
]

Reductions:

Interesting
new_vars = fmpq_mpoly[Cdc20 - Mad1_CMad2_OMad2 - OMad2]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[Cdc20 + Cdc20_CMad2, Cdc20_CMad2 + Mad1_CMad2_OMad2 + OMad2]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[Cdc20 + Cdc20_CMad2, Cdc20_CMad2 + Mad1_CMad2_OMad2 + OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Cdc20 + Cdc20_CMad2, Cdc20_CMad2 + Mad1_CMad2_OMad2 + OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, alpha_T]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Cdc20 + Cdc20_CMad2, Cdc20_CMad2 + Mad1_CMad2_OMad2 + OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, alpha_T, beta_T]
new_system = 
[
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Cdc20 + Cdc20_CMad2, Cdc20_CMad2 + Mad1_CMad2_OMad2 + OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, alpha_T, beta_T, eta_T]
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
new_vars = fmpq_mpoly[Cdc20 + Cdc20_CMad2, Cdc20_CMad2 + Mad1_CMad2_OMad2 + OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, alpha_T, beta_T, eta_T, gamma_T]
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
new_vars = fmpq_mpoly[Cdc20 + Cdc20_CMad2, Cdc20_CMad2 + Mad1_CMad2_OMad2 + OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, alpha_T, beta_T, eta_T, gamma_T, u]
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


