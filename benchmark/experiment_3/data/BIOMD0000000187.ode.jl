Original system:

[
OMad2 => -Cdc20*OMad2*kf6 + Cdc20_CMad2*k3f - Mad1_CMad2*OMad2*k1f*u + Mad1_CMad2_OMad2*k1r,
MCC_APC => APC*MCC*k7f*u,
k2f => 0,
kf6 => 0,
k1f => 0,
k5r => 0,
k4r => 0,
Bub3_BubR1_Cdc20 => Bub3_BubR1*Cdc20*k5f*u - Bub3_BubR1_Cdc20*k5r,
Mad1_CMad2 => Cdc20*Mad1_CMad2_OMad2*k2f*u - Mad1_CMad2*OMad2*k1f*u + Mad1_CMad2_OMad2*k1r,
APC_Cdc20 => APC*Cdc20*k8f - APC_Cdc20*k8r,
u => 0,
k8r => 0,
k4f => 0,
MCC => -APC*MCC*k7f*u + Bub3_BubR1*Cdc20_CMad2*k4f*u - MCC*k4r,
k7f => 0,
k5f => 0,
Mad1_CMad2_OMad2 => -Cdc20*Mad1_CMad2_OMad2*k2f*u + Mad1_CMad2*OMad2*k1f*u - Mad1_CMad2_OMad2*k1r,
Cdc20_CMad2 => -Bub3_BubR1*Cdc20_CMad2*k4f*u + Cdc20*Mad1_CMad2_OMad2*k2f*u + Cdc20*OMad2*kf6 - Cdc20_CMad2*k3f + MCC*k4r,
Bub3_BubR1 => -Bub3_BubR1*Cdc20*k5f*u - Bub3_BubR1*Cdc20_CMad2*k4f*u + Bub3_BubR1_Cdc20*k5r + MCC*k4r,
k1r => 0,
k3f => 0,
APC => -APC*Cdc20*k8f - APC*MCC*k7f*u + APC_Cdc20*k8r,
Cdc20 => -APC*Cdc20*k8f + APC_Cdc20*k8r - Bub3_BubR1*Cdc20*k5f*u + Bub3_BubR1_Cdc20*k5r - Cdc20*Mad1_CMad2_OMad2*k2f*u - Cdc20*OMad2*kf6 + Cdc20_CMad2*k3f,
k8f => 0
]

Reductions:

Interesting
new_vars = fmpq_mpoly[APC - Bub3_BubR1_Cdc20 - Cdc20 - Cdc20_CMad2 - MCC]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[APC - Bub3_BubR1_Cdc20 - Cdc20 - Cdc20_CMad2 - MCC, APC_Cdc20 + Bub3_BubR1_Cdc20 + Cdc20 - Mad1_CMad2_OMad2 - OMad2]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[APC - Bub3_BubR1_Cdc20 - Cdc20 - Cdc20_CMad2 - MCC, APC_Cdc20 + Bub3_BubR1_Cdc20 + Cdc20 - Mad1_CMad2_OMad2 - OMad2, Bub3_BubR1 + Bub3_BubR1_Cdc20 - Cdc20_CMad2 - Mad1_CMad2_OMad2 - OMad2]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[APC - Bub3_BubR1_Cdc20 - Cdc20 - Cdc20_CMad2 - MCC, APC_Cdc20 + Bub3_BubR1_Cdc20 + Cdc20 - Mad1_CMad2_OMad2 - OMad2, Bub3_BubR1 + Bub3_BubR1_Cdc20 - Cdc20_CMad2 - Mad1_CMad2_OMad2 - OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[APC - Bub3_BubR1_Cdc20 - Cdc20 - Cdc20_CMad2 - MCC, APC_Cdc20 + Bub3_BubR1_Cdc20 + Cdc20 - Mad1_CMad2_OMad2 - OMad2, Bub3_BubR1 + Bub3_BubR1_Cdc20 - Cdc20_CMad2 - Mad1_CMad2_OMad2 - OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, k1f]
new_system = 
[
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[APC - Bub3_BubR1_Cdc20 - Cdc20 - Cdc20_CMad2 - MCC, APC_Cdc20 + Bub3_BubR1_Cdc20 + Cdc20 - Mad1_CMad2_OMad2 - OMad2, Bub3_BubR1 + Bub3_BubR1_Cdc20 - Cdc20_CMad2 - Mad1_CMad2_OMad2 - OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, k1f, k1r]
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
new_vars = fmpq_mpoly[APC - Bub3_BubR1_Cdc20 - Cdc20 - Cdc20_CMad2 - MCC, APC_Cdc20 + Bub3_BubR1_Cdc20 + Cdc20 - Mad1_CMad2_OMad2 - OMad2, Bub3_BubR1 + Bub3_BubR1_Cdc20 - Cdc20_CMad2 - Mad1_CMad2_OMad2 - OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, k1f, k1r, k2f]
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
new_vars = fmpq_mpoly[APC - Bub3_BubR1_Cdc20 - Cdc20 - Cdc20_CMad2 - MCC, APC_Cdc20 + Bub3_BubR1_Cdc20 + Cdc20 - Mad1_CMad2_OMad2 - OMad2, Bub3_BubR1 + Bub3_BubR1_Cdc20 - Cdc20_CMad2 - Mad1_CMad2_OMad2 - OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, k1f, k1r, k2f, k3f]
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
new_vars = fmpq_mpoly[APC - Bub3_BubR1_Cdc20 - Cdc20 - Cdc20_CMad2 - MCC, APC_Cdc20 + Bub3_BubR1_Cdc20 + Cdc20 - Mad1_CMad2_OMad2 - OMad2, Bub3_BubR1 + Bub3_BubR1_Cdc20 - Cdc20_CMad2 - Mad1_CMad2_OMad2 - OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, k1f, k1r, k2f, k3f, k4f]
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
new_vars = fmpq_mpoly[APC - Bub3_BubR1_Cdc20 - Cdc20 - Cdc20_CMad2 - MCC, APC_Cdc20 + Bub3_BubR1_Cdc20 + Cdc20 - Mad1_CMad2_OMad2 - OMad2, Bub3_BubR1 + Bub3_BubR1_Cdc20 - Cdc20_CMad2 - Mad1_CMad2_OMad2 - OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, k1f, k1r, k2f, k3f, k4f, k4r]
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
new_vars = fmpq_mpoly[APC - Bub3_BubR1_Cdc20 - Cdc20 - Cdc20_CMad2 - MCC, APC_Cdc20 + Bub3_BubR1_Cdc20 + Cdc20 - Mad1_CMad2_OMad2 - OMad2, Bub3_BubR1 + Bub3_BubR1_Cdc20 - Cdc20_CMad2 - Mad1_CMad2_OMad2 - OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, k1f, k1r, k2f, k3f, k4f, k4r, k5f]
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
new_vars = fmpq_mpoly[APC - Bub3_BubR1_Cdc20 - Cdc20 - Cdc20_CMad2 - MCC, APC_Cdc20 + Bub3_BubR1_Cdc20 + Cdc20 - Mad1_CMad2_OMad2 - OMad2, Bub3_BubR1 + Bub3_BubR1_Cdc20 - Cdc20_CMad2 - Mad1_CMad2_OMad2 - OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, k1f, k1r, k2f, k3f, k4f, k4r, k5f, k5r]
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
new_vars = fmpq_mpoly[APC - Bub3_BubR1_Cdc20 - Cdc20 - Cdc20_CMad2 - MCC, APC_Cdc20 + Bub3_BubR1_Cdc20 + Cdc20 - Mad1_CMad2_OMad2 - OMad2, Bub3_BubR1 + Bub3_BubR1_Cdc20 - Cdc20_CMad2 - Mad1_CMad2_OMad2 - OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, k1f, k1r, k2f, k3f, k4f, k4r, k5f, k5r, k7f]
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
new_vars = fmpq_mpoly[APC - Bub3_BubR1_Cdc20 - Cdc20 - Cdc20_CMad2 - MCC, APC_Cdc20 + Bub3_BubR1_Cdc20 + Cdc20 - Mad1_CMad2_OMad2 - OMad2, Bub3_BubR1 + Bub3_BubR1_Cdc20 - Cdc20_CMad2 - Mad1_CMad2_OMad2 - OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, k1f, k1r, k2f, k3f, k4f, k4r, k5f, k5r, k7f, k8f]
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
new_vars = fmpq_mpoly[APC - Bub3_BubR1_Cdc20 - Cdc20 - Cdc20_CMad2 - MCC, APC_Cdc20 + Bub3_BubR1_Cdc20 + Cdc20 - Mad1_CMad2_OMad2 - OMad2, Bub3_BubR1 + Bub3_BubR1_Cdc20 - Cdc20_CMad2 - Mad1_CMad2_OMad2 - OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, k1f, k1r, k2f, k3f, k4f, k4r, k5f, k5r, k7f, k8f, k8r]
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
new_vars = fmpq_mpoly[APC - Bub3_BubR1_Cdc20 - Cdc20 - Cdc20_CMad2 - MCC, APC_Cdc20 + Bub3_BubR1_Cdc20 + Cdc20 - Mad1_CMad2_OMad2 - OMad2, Bub3_BubR1 + Bub3_BubR1_Cdc20 - Cdc20_CMad2 - Mad1_CMad2_OMad2 - OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, k1f, k1r, k2f, k3f, k4f, k4r, k5f, k5r, k7f, k8f, k8r, kf6]
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
new_vars = fmpq_mpoly[APC - Bub3_BubR1_Cdc20 - Cdc20 - Cdc20_CMad2 - MCC, APC_Cdc20 + Bub3_BubR1_Cdc20 + Cdc20 - Mad1_CMad2_OMad2 - OMad2, Bub3_BubR1 + Bub3_BubR1_Cdc20 - Cdc20_CMad2 - Mad1_CMad2_OMad2 - OMad2, Mad1_CMad2 + Mad1_CMad2_OMad2, k1f, k1r, k2f, k3f, k4f, k4r, k5f, k5r, k7f, k8f, k8r, kf6, u]
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


new_vars = fmpq_mpoly[APC, APC_Cdc20, Bub3_BubR1, Bub3_BubR1_Cdc20, Cdc20, Cdc20_CMad2, MCC, Mad1_CMad2, Mad1_CMad2_OMad2, OMad2, k1f, k1r, k2f, k3f, k4f, k4r, k5f, k5r, k7f, k8f, k8r, kf6, u]
new_system = 
[
-y1*y5*y20 - y1*y7*y19*y23 + y2*y21,
y1*y5*y20 - y2*y21,
-y3*y5*y17*y23 - y3*y6*y15*y23 + y4*y18 + y7*y16,
y3*y5*y17*y23 - y4*y18,
-y1*y5*y20 + y2*y21 - y3*y5*y17*y23 + y4*y18 - y5*y9*y13*y23 - y5*y10*y22 + y6*y14,
-y3*y6*y15*y23 + y5*y9*y13*y23 + y5*y10*y22 - y6*y14 + y7*y16,
-y1*y7*y19*y23 + y3*y6*y15*y23 - y7*y16,
y5*y9*y13*y23 - y8*y10*y11*y23 + y9*y12,
-y5*y9*y13*y23 + y8*y10*y11*y23 - y9*y12,
-y5*y10*y22 + y6*y14 - y8*y10*y11*y23 + y9*y12,
0,
0,
0,
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


