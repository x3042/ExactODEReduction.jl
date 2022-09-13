Original system:

[
gamma_ms => 0,
s6 => cd8_in_lung*delta_l,
cd8_in_spleen => cd8_in_mln*gamma_ms,
rho_s => 0,
D_m => 0,
delta_s => 0,
gamma_ml => 0,
cd8_in_lung => cd8_in_mln*gamma_ml + cd8_in_spleen*gamma_sl,
rho_m => 0,
cd8_in_mln => 0,
gamma_sl => 0,
s7 => -D_m*cd8_in_mln*rho_m + cd8_in_mln*delta_m,
s8 => -D_m*cd8_in_spleen*rho_s + cd8_in_spleen*delta_s,
delta_l => 0,
delta_m => 0
]

Reductions:


new_vars = fmpq_mpoly[D_m]
new_system = 
[
0
]


new_vars = fmpq_mpoly[D_m, cd8_in_mln]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[D_m, cd8_in_mln, gamma_ml]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[D_m, cd8_in_mln, gamma_ml, gamma_ms]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[D_m, cd8_in_mln, gamma_ml, gamma_ms, gamma_sl]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[D_m, cd8_in_mln, cd8_in_spleen, gamma_ml, gamma_ms, gamma_sl]
new_system = 
[
0,
0,
y2*y5,
0,
0,
0
]


new_vars = fmpq_mpoly[D_m, cd8_in_lung, cd8_in_mln, cd8_in_spleen, gamma_ml, gamma_ms, gamma_sl]
new_system = 
[
0,
y3*y5 + y4*y7,
0,
y3*y6,
0,
0,
0
]


new_vars = fmpq_mpoly[D_m, cd8_in_lung, cd8_in_mln, cd8_in_spleen, delta_l, gamma_ml, gamma_ms, gamma_sl]
new_system = 
[
0,
y3*y6 + y4*y8,
0,
y3*y7,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[D_m, cd8_in_lung, cd8_in_mln, cd8_in_spleen, delta_l, delta_m, gamma_ml, gamma_ms, gamma_sl]
new_system = 
[
0,
y3*y7 + y4*y9,
0,
y3*y8,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[D_m, cd8_in_lung, cd8_in_mln, cd8_in_spleen, delta_l, delta_m, delta_s, gamma_ml, gamma_ms, gamma_sl]
new_system = 
[
0,
y3*y8 + y4*y10,
0,
y3*y9,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[D_m, cd8_in_lung, cd8_in_mln, cd8_in_spleen, delta_l, delta_m, delta_s, gamma_ml, gamma_ms, gamma_sl, rho_m]
new_system = 
[
0,
y3*y8 + y4*y10,
0,
y3*y9,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[D_m, cd8_in_lung, cd8_in_mln, cd8_in_spleen, delta_l, delta_m, delta_s, gamma_ml, gamma_ms, gamma_sl, rho_m, rho_s]
new_system = 
[
0,
y3*y8 + y4*y10,
0,
y3*y9,
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[D_m, cd8_in_lung, cd8_in_mln, cd8_in_spleen, delta_l, delta_m, delta_s, gamma_ml, gamma_ms, gamma_sl, rho_m, rho_s, s6]
new_system = 
[
0,
y3*y8 + y4*y10,
0,
y3*y9,
0,
0,
0,
0,
0,
0,
0,
0,
y2*y5
]


new_vars = fmpq_mpoly[D_m, cd8_in_lung, cd8_in_mln, cd8_in_spleen, delta_l, delta_m, delta_s, gamma_ml, gamma_ms, gamma_sl, rho_m, rho_s, s6, s7]
new_system = 
[
0,
y3*y8 + y4*y10,
0,
y3*y9,
0,
0,
0,
0,
0,
0,
0,
0,
y2*y5,
-y1*y3*y11 + y3*y6
]


