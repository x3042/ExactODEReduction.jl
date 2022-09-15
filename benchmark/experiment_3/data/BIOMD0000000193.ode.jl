Original system:

[
k5r => 0,
kf6 => 0,
u => 0,
k4f => 0,
k5f => 0,
k2f => 0,
k1r => 0,
Bub3_BubR1 => -Bub3_BubR1*Cdc20*k5f*u - Bub3_BubR1*Cdc20_CMad2*k4f*u + Bub3_BubR1_Cdc20*k5r + MCC*k4r,
k3f => 0,
k4r => 0,
Mad1_CMad2 => Cdc20*Mad1_CMad2_OMad2*k2f*u - Mad1_CMad2*OMad2*k1f*u + Mad1_CMad2_OMad2*k1r,
Mad1_CMad2_OMad2 => -Cdc20*Mad1_CMad2_OMad2*k2f*u + Mad1_CMad2*OMad2*k1f*u - Mad1_CMad2_OMad2*k1r,
OMad2 => -Cdc20*OMad2*kf6 + Cdc20_CMad2*k3f - Mad1_CMad2*OMad2*k1f*u + Mad1_CMad2_OMad2*k1r,
MCC => Bub3_BubR1*Cdc20_CMad2*k4f*u - MCC*k4r,
Cdc20_CMad2 => -Bub3_BubR1*Cdc20_CMad2*k4f*u + Cdc20*Mad1_CMad2_OMad2*k2f*u + Cdc20*OMad2*kf6 - Cdc20_CMad2*k3f + MCC*k4r,
Bub3_BubR1_Cdc20 => Bub3_BubR1*Cdc20*k5f*u - Bub3_BubR1_Cdc20*k5r,
Cdc20 => -Bub3_BubR1*Cdc20*k5f*u + Bub3_BubR1_Cdc20*k5r - Cdc20*Mad1_CMad2_OMad2*k2f*u - Cdc20*OMad2*kf6 + Cdc20_CMad2*k3f,
k1f => 0
]

Reductions:

Interesting
new_vars = fmpq_mpoly[Bub3_BubR1 - Cdc20 + MCC + Mad1_CMad2_OMad2 + OMad2]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[Bub3_BubR1 - Cdc20 + MCC + Mad1_CMad2_OMad2 + OMad2, Bub3_BubR1_Cdc20 + Cdc20 - Mad1_CMad2_OMad2 - OMad2]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[Bub3_BubR1 + Bub3_BubR1_Cdc20 + MCC, Bub3_BubR1_Cdc20 + Cdc20 + Cdc20_CMad2 + MCC, Cdc20_CMad2 + MCC + Mad1_CMad2_OMad2 + OMad2]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Bub3_BubR1 + Bub3_BubR1_Cdc20 + MCC, Bub3_BubR1_Cdc20 + Cdc20 + Cdc20_CMad2 + MCC, Cdc20_CMad2 + MCC + Mad1_CMad2_OMad2 + OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Bub3_BubR1 + Bub3_BubR1_Cdc20 + MCC, Bub3_BubR1_Cdc20 + Cdc20 + Cdc20_CMad2 + MCC, Cdc20_CMad2 + MCC + Mad1_CMad2_OMad2 + OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, k1f]
new_system = 
[
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Bub3_BubR1 + Bub3_BubR1_Cdc20 + MCC, Bub3_BubR1_Cdc20 + Cdc20 + Cdc20_CMad2 + MCC, Cdc20_CMad2 + MCC + Mad1_CMad2_OMad2 + OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, k1f, k1r]
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
new_vars = fmpq_mpoly[Bub3_BubR1 + Bub3_BubR1_Cdc20 + MCC, Bub3_BubR1_Cdc20 + Cdc20 + Cdc20_CMad2 + MCC, Cdc20_CMad2 + MCC + Mad1_CMad2_OMad2 + OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, k1f, k1r, k2f]
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
new_vars = fmpq_mpoly[Bub3_BubR1 + Bub3_BubR1_Cdc20 + MCC, Bub3_BubR1_Cdc20 + Cdc20 + Cdc20_CMad2 + MCC, Cdc20_CMad2 + MCC + Mad1_CMad2_OMad2 + OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, k1f, k1r, k2f, k3f]
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
new_vars = fmpq_mpoly[Bub3_BubR1 + Bub3_BubR1_Cdc20 + MCC, Bub3_BubR1_Cdc20 + Cdc20 + Cdc20_CMad2 + MCC, Cdc20_CMad2 + MCC + Mad1_CMad2_OMad2 + OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, k1f, k1r, k2f, k3f, k4f]
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
new_vars = fmpq_mpoly[Bub3_BubR1 + Bub3_BubR1_Cdc20 + MCC, Bub3_BubR1_Cdc20 + Cdc20 + Cdc20_CMad2 + MCC, Cdc20_CMad2 + MCC + Mad1_CMad2_OMad2 + OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, k1f, k1r, k2f, k3f, k4f, k4r]
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
new_vars = fmpq_mpoly[Bub3_BubR1 + Bub3_BubR1_Cdc20 + MCC, Bub3_BubR1_Cdc20 + Cdc20 + Cdc20_CMad2 + MCC, Cdc20_CMad2 + MCC + Mad1_CMad2_OMad2 + OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, k1f, k1r, k2f, k3f, k4f, k4r, k5f]
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
new_vars = fmpq_mpoly[Bub3_BubR1 + Bub3_BubR1_Cdc20 + MCC, Bub3_BubR1_Cdc20 + Cdc20 + Cdc20_CMad2 + MCC, Cdc20_CMad2 + MCC + Mad1_CMad2_OMad2 + OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, k1f, k1r, k2f, k3f, k4f, k4r, k5f, k5r]
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
new_vars = fmpq_mpoly[Bub3_BubR1 + Bub3_BubR1_Cdc20 + MCC, Bub3_BubR1_Cdc20 + Cdc20 + Cdc20_CMad2 + MCC, Cdc20_CMad2 + MCC + Mad1_CMad2_OMad2 + OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, k1f, k1r, k2f, k3f, k4f, k4r, k5f, k5r, kf6]
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
new_vars = fmpq_mpoly[Bub3_BubR1 + Bub3_BubR1_Cdc20 + MCC, Bub3_BubR1_Cdc20 + Cdc20 + Cdc20_CMad2 + MCC, Cdc20_CMad2 + MCC + Mad1_CMad2_OMad2 + OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, k1f, k1r, k2f, k3f, k4f, k4r, k5f, k5r, kf6, u]
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


