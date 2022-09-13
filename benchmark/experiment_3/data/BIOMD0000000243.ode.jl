Original system:

[
k15 => 0,
SINK => -C3_star*k12 - C8_star*k11 - NF_kB_star*k17 - k16*p43_FLIP_IKK_star,
C3 => 0,
NF_kB_IkB => 0,
NF_kB_star => NF_kB_IkB_P*k15,
k8 => 0,
k11 => 0,
FL => 0,
k13 => 0,
p43_p41 => C3_star*C8*k10 + 2*C8*L_RF_C8*k5,
L_RF_FL_FL => FL*L_RF_FL*k6,
k2 => 0,
k1 => 0,
IKK => 0,
FS => 0,
k4 => 0,
C8 => 0,
k5 => 0,
C8_star => 2*k8*p43_p41,
k3 => 0,
L_RF_FS_FS => FS*L_RF_FS*k7,
C3_star => C3*C8_star*k9,
L_RF_FS => FS*L_RF*k4,
p43_FLIP => C8*L_RF_FL*k5 + FL*L_RF_C8*k6,
k17 => 0,
L_RF => L*RF*k1,
L_RF_FL_FS => FL*L_RF_FS*k6 + FS*L_RF_FL*k7,
RF => 0,
k9 => 0,
L_RF_C8_FS => C8*L_RF_FS*k5 + FS*L_RF_C8*k7,
k6 => 0,
L_RF_C8 => C8*L_RF*k2,
L => 0,
L_RF_FL => FL*L_RF*k3,
k10 => 0,
k12 => 0,
k14 => 0,
k7 => 0,
NF_kB_IkB_P => NF_kB_IkB*k14*p43_FLIP_IKK_star,
k16 => 0,
p43_FLIP_IKK_star => IKK*k13*p43_FLIP
]

Reductions:


new_vars = fmpq_mpoly[C3]
new_system = 
[
0
]


new_vars = fmpq_mpoly[C3, C8]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[C3, C8, L]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[C3, C8, L, RF]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[C3, C8, L, RF, k1]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[C3, C8, L, RF, k1, k10]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[C3, C8, L, RF, k1, k10, k2]
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


new_vars = fmpq_mpoly[C3, C8, L, RF, k1, k10, k2, k5]
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


new_vars = fmpq_mpoly[C3, C8, L, RF, k1, k10, k2, k5, k8]
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


new_vars = fmpq_mpoly[C3, C8, L, RF, k1, k10, k2, k5, k8, k9]
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


new_vars = fmpq_mpoly[C3, C8, L, L_RF, RF, k1, k10, k2, k5, k8, k9]
new_system = 
[
0,
0,
0,
y3*y5*y6,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[C3, C8, L, L_RF, L_RF_C8, RF, k1, k10, k2, k5, k8, k9]
new_system = 
[
0,
0,
0,
y3*y6*y7,
y2*y4*y9,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, L, L_RF, L_RF_C8, RF, k1, k10, k2, k5, k8, k9, p43_p41]
new_system = 
[
0,
y1*y4*y14,
0,
2*y13*y15,
0,
y5*y8*y9,
y3*y6*y11,
0,
0,
0,
0,
0,
0,
0,
y2*y3*y10 + 2*y3*y7*y12
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, L, L_RF, L_RF_C8, RF, k1, k10, k2, k5, k8, k9, p43_p41]
new_system = 
[
0,
y1*y4*y15,
0,
2*y14*y16,
0,
0,
y6*y9*y10,
y3*y7*y12,
0,
0,
0,
0,
0,
0,
0,
y2*y3*y11 + 2*y3*y8*y13
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, FS, L, L_RF, L_RF_C8, RF, k1, k10, k2, k5, k8, k9, p43_p41]
new_system = 
[
0,
y1*y4*y16,
0,
2*y15*y17,
0,
0,
0,
y7*y10*y11,
y3*y8*y13,
0,
0,
0,
0,
0,
0,
0,
y2*y3*y12 + 2*y3*y9*y14
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, FS, IKK, L, L_RF, L_RF_C8, RF, k1, k10, k2, k5, k8, k9, p43_p41]
new_system = 
[
0,
y1*y4*y17,
0,
2*y16*y18,
0,
0,
0,
0,
y8*y11*y12,
y3*y9*y14,
0,
0,
0,
0,
0,
0,
0,
y2*y3*y13 + 2*y3*y10*y15
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, FS, IKK, L, L_RF, L_RF_C8, RF, k1, k10, k2, k4, k5, k8, k9, p43_p41]
new_system = 
[
0,
y1*y4*y18,
0,
2*y17*y19,
0,
0,
0,
0,
y8*y11*y12,
y3*y9*y14,
0,
0,
0,
0,
0,
0,
0,
0,
y2*y3*y13 + 2*y3*y10*y16
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, FS, IKK, L, L_RF, L_RF_C8, RF, k1, k10, k2, k4, k5, k7, k8, k9, p43_p41]
new_system = 
[
0,
y1*y4*y19,
0,
2*y18*y20,
0,
0,
0,
0,
y8*y11*y12,
y3*y9*y14,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y2*y3*y13 + 2*y3*y10*y16
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, FS, IKK, L, L_RF, L_RF_C8, L_RF_FS, RF, k1, k10, k2, k4, k5, k7, k8, k9, p43_p41]
new_system = 
[
0,
y1*y4*y20,
0,
2*y19*y21,
0,
0,
0,
0,
y8*y12*y13,
y3*y9*y15,
y6*y9*y16,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y2*y3*y14 + 2*y3*y10*y17
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, FS, IKK, L, L_RF, L_RF_C8, L_RF_C8_FS, L_RF_FS, RF, k1, k10, k2, k4, k5, k7, k8, k9, p43_p41]
new_system = 
[
0,
y1*y4*y21,
0,
2*y20*y22,
0,
0,
0,
0,
y8*y13*y14,
y3*y9*y16,
y3*y12*y18 + y6*y10*y19,
y6*y9*y17,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y2*y3*y15 + 2*y3*y10*y18
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, FS, IKK, L, L_RF, L_RF_C8, L_RF_C8_FS, L_RF_FS, RF, k1, k10, k2, k3, k4, k5, k7, k8, k9, p43_p41]
new_system = 
[
0,
y1*y4*y22,
0,
2*y21*y23,
0,
0,
0,
0,
y8*y13*y14,
y3*y9*y16,
y3*y12*y19 + y6*y10*y20,
y6*y9*y18,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y2*y3*y15 + 2*y3*y10*y19
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, FS, IKK, L, L_RF, L_RF_C8, L_RF_C8_FS, L_RF_FL, L_RF_FS, RF, k1, k10, k2, k3, k4, k5, k7, k8, k9, p43_p41]
new_system = 
[
0,
y1*y4*y23,
0,
2*y22*y24,
0,
0,
0,
0,
y8*y14*y15,
y3*y9*y17,
y3*y13*y20 + y6*y10*y21,
y5*y9*y18,
y6*y9*y19,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y2*y3*y16 + 2*y3*y10*y20
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, FS, IKK, L, L_RF, L_RF_C8, L_RF_C8_FS, L_RF_FL, L_RF_FS, RF, k1, k10, k2, k3, k4, k5, k6, k7, k8, k9, p43_p41]
new_system = 
[
0,
y1*y4*y24,
0,
2*y23*y25,
0,
0,
0,
0,
y8*y14*y15,
y3*y9*y17,
y3*y13*y20 + y6*y10*y22,
y5*y9*y18,
y6*y9*y19,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y2*y3*y16 + 2*y3*y10*y20
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, FS, IKK, L, L_RF, L_RF_C8, L_RF_C8_FS, L_RF_FL, L_RF_FL_FL, L_RF_FS, RF, k1, k10, k2, k3, k4, k5, k6, k7, k8, k9, p43_p41]
new_system = 
[
0,
y1*y4*y25,
0,
2*y24*y26,
0,
0,
0,
0,
y8*y15*y16,
y3*y9*y18,
y3*y14*y21 + y6*y10*y23,
y5*y9*y19,
y5*y12*y22,
y6*y9*y20,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y2*y3*y17 + 2*y3*y10*y21
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, FS, IKK, L, L_RF, L_RF_C8, L_RF_C8_FS, L_RF_FL, L_RF_FL_FL, L_RF_FL_FS, L_RF_FS, RF, k1, k10, k2, k3, k4, k5, k6, k7, k8, k9, p43_p41]
new_system = 
[
0,
y1*y4*y26,
0,
2*y25*y27,
0,
0,
0,
0,
y8*y16*y17,
y3*y9*y19,
y3*y15*y22 + y6*y10*y24,
y5*y9*y20,
y5*y12*y23,
y5*y15*y23 + y6*y12*y24,
y6*y9*y21,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y2*y3*y18 + 2*y3*y10*y22
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, FS, IKK, L, L_RF, L_RF_C8, L_RF_C8_FS, L_RF_FL, L_RF_FL_FL, L_RF_FL_FS, L_RF_FS, L_RF_FS_FS, RF, k1, k10, k2, k3, k4, k5, k6, k7, k8, k9, p43_p41]
new_system = 
[
0,
y1*y4*y27,
0,
2*y26*y28,
0,
0,
0,
0,
y8*y17*y18,
y3*y9*y20,
y3*y15*y23 + y6*y10*y25,
y5*y9*y21,
y5*y12*y24,
y5*y15*y24 + y6*y12*y25,
y6*y9*y22,
y6*y15*y25,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y2*y3*y19 + 2*y3*y10*y23
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, FS, IKK, L, L_RF, L_RF_C8, L_RF_C8_FS, L_RF_FL, L_RF_FL_FL, L_RF_FL_FS, L_RF_FS, L_RF_FS_FS, NF_kB_IkB, RF, k1, k10, k2, k3, k4, k5, k6, k7, k8, k9, p43_p41]
new_system = 
[
0,
y1*y4*y28,
0,
2*y27*y29,
0,
0,
0,
0,
y8*y18*y19,
y3*y9*y21,
y3*y15*y24 + y6*y10*y26,
y5*y9*y22,
y5*y12*y25,
y5*y15*y25 + y6*y12*y26,
y6*y9*y23,
y6*y15*y26,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y2*y3*y20 + 2*y3*y10*y24
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, FS, IKK, L, L_RF, L_RF_C8, L_RF_C8_FS, L_RF_FL, L_RF_FL_FL, L_RF_FL_FS, L_RF_FS, L_RF_FS_FS, NF_kB_IkB, RF, k1, k10, k13, k2, k3, k4, k5, k6, k7, k8, k9, p43_p41]
new_system = 
[
0,
y1*y4*y29,
0,
2*y28*y30,
0,
0,
0,
0,
y8*y18*y19,
y3*y9*y22,
y3*y15*y25 + y6*y10*y27,
y5*y9*y23,
y5*y12*y26,
y5*y15*y26 + y6*y12*y27,
y6*y9*y24,
y6*y15*y27,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y2*y3*y20 + 2*y3*y10*y25
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, FS, IKK, L, L_RF, L_RF_C8, L_RF_C8_FS, L_RF_FL, L_RF_FL_FL, L_RF_FL_FS, L_RF_FS, L_RF_FS_FS, NF_kB_IkB, RF, k1, k10, k13, k14, k2, k3, k4, k5, k6, k7, k8, k9, p43_p41]
new_system = 
[
0,
y1*y4*y30,
0,
2*y29*y31,
0,
0,
0,
0,
y8*y18*y19,
y3*y9*y23,
y3*y15*y26 + y6*y10*y28,
y5*y9*y24,
y5*y12*y27,
y5*y15*y27 + y6*y12*y28,
y6*y9*y25,
y6*y15*y28,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y2*y3*y20 + 2*y3*y10*y26
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, FS, IKK, L, L_RF, L_RF_C8, L_RF_C8_FS, L_RF_FL, L_RF_FL_FL, L_RF_FL_FS, L_RF_FS, L_RF_FS_FS, NF_kB_IkB, RF, k1, k10, k13, k14, k2, k3, k4, k5, k6, k7, k8, k9, p43_FLIP, p43_p41]
new_system = 
[
0,
y1*y4*y30,
0,
2*y29*y32,
0,
0,
0,
0,
y8*y18*y19,
y3*y9*y23,
y3*y15*y26 + y6*y10*y28,
y5*y9*y24,
y5*y12*y27,
y5*y15*y27 + y6*y12*y28,
y6*y9*y25,
y6*y15*y28,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y3*y12*y26 + y5*y10*y27,
y2*y3*y20 + 2*y3*y10*y26
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, FS, IKK, L, L_RF, L_RF_C8, L_RF_C8_FS, L_RF_FL, L_RF_FL_FL, L_RF_FL_FS, L_RF_FS, L_RF_FS_FS, NF_kB_IkB, RF, k1, k10, k13, k14, k2, k3, k4, k5, k6, k7, k8, k9, p43_FLIP, p43_FLIP_IKK_star, p43_p41]
new_system = 
[
0,
y1*y4*y30,
0,
2*y29*y33,
0,
0,
0,
0,
y8*y18*y19,
y3*y9*y23,
y3*y15*y26 + y6*y10*y28,
y5*y9*y24,
y5*y12*y27,
y5*y15*y27 + y6*y12*y28,
y6*y9*y25,
y6*y15*y28,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y3*y12*y26 + y5*y10*y27,
y7*y21*y31,
y2*y3*y20 + 2*y3*y10*y26
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, FS, IKK, L, L_RF, L_RF_C8, L_RF_C8_FS, L_RF_FL, L_RF_FL_FL, L_RF_FL_FS, L_RF_FS, L_RF_FS_FS, NF_kB_IkB, NF_kB_IkB_P, RF, k1, k10, k13, k14, k2, k3, k4, k5, k6, k7, k8, k9, p43_FLIP, p43_FLIP_IKK_star, p43_p41]
new_system = 
[
0,
y1*y4*y31,
0,
2*y30*y34,
0,
0,
0,
0,
y8*y19*y20,
y3*y9*y24,
y3*y15*y27 + y6*y10*y29,
y5*y9*y25,
y5*y12*y28,
y5*y15*y28 + y6*y12*y29,
y6*y9*y26,
y6*y15*y29,
0,
y17*y23*y33,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y3*y12*y27 + y5*y10*y28,
y7*y22*y32,
y2*y3*y21 + 2*y3*y10*y27
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, FS, IKK, L, L_RF, L_RF_C8, L_RF_C8_FS, L_RF_FL, L_RF_FL_FL, L_RF_FL_FS, L_RF_FS, L_RF_FS_FS, NF_kB_IkB, NF_kB_IkB_P, RF, k1, k10, k13, k14, k15, k2, k3, k4, k5, k6, k7, k8, k9, p43_FLIP, p43_FLIP_IKK_star, p43_p41]
new_system = 
[
0,
y1*y4*y32,
0,
2*y31*y35,
0,
0,
0,
0,
y8*y19*y20,
y3*y9*y25,
y3*y15*y28 + y6*y10*y30,
y5*y9*y26,
y5*y12*y29,
y5*y15*y29 + y6*y12*y30,
y6*y9*y27,
y6*y15*y30,
0,
y17*y23*y34,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y3*y12*y28 + y5*y10*y29,
y7*y22*y33,
y2*y3*y21 + 2*y3*y10*y28
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, FS, IKK, L, L_RF, L_RF_C8, L_RF_C8_FS, L_RF_FL, L_RF_FL_FL, L_RF_FL_FS, L_RF_FS, L_RF_FS_FS, NF_kB_IkB, NF_kB_IkB_P, NF_kB_star, RF, k1, k10, k13, k14, k15, k2, k3, k4, k5, k6, k7, k8, k9, p43_FLIP, p43_FLIP_IKK_star, p43_p41]
new_system = 
[
0,
y1*y4*y33,
0,
2*y32*y36,
0,
0,
0,
0,
y8*y20*y21,
y3*y9*y26,
y3*y15*y29 + y6*y10*y31,
y5*y9*y27,
y5*y12*y30,
y5*y15*y30 + y6*y12*y31,
y6*y9*y28,
y6*y15*y31,
0,
y17*y24*y35,
y18*y25,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y3*y12*y29 + y5*y10*y30,
y7*y23*y34,
y2*y3*y22 + 2*y3*y10*y29
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, FS, IKK, L, L_RF, L_RF_C8, L_RF_C8_FS, L_RF_FL, L_RF_FL_FL, L_RF_FL_FS, L_RF_FS, L_RF_FS_FS, NF_kB_IkB, NF_kB_IkB_P, NF_kB_star, RF, k1, k10, k11, k13, k14, k15, k2, k3, k4, k5, k6, k7, k8, k9, p43_FLIP, p43_FLIP_IKK_star, p43_p41]
new_system = 
[
0,
y1*y4*y34,
0,
2*y33*y37,
0,
0,
0,
0,
y8*y20*y21,
y3*y9*y27,
y3*y15*y30 + y6*y10*y32,
y5*y9*y28,
y5*y12*y31,
y5*y15*y31 + y6*y12*y32,
y6*y9*y29,
y6*y15*y32,
0,
y17*y25*y36,
y18*y26,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y3*y12*y30 + y5*y10*y31,
y7*y24*y35,
y2*y3*y22 + 2*y3*y10*y30
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, FS, IKK, L, L_RF, L_RF_C8, L_RF_C8_FS, L_RF_FL, L_RF_FL_FL, L_RF_FL_FS, L_RF_FS, L_RF_FS_FS, NF_kB_IkB, NF_kB_IkB_P, NF_kB_star, RF, k1, k10, k11, k12, k13, k14, k15, k2, k3, k4, k5, k6, k7, k8, k9, p43_FLIP, p43_FLIP_IKK_star, p43_p41]
new_system = 
[
0,
y1*y4*y35,
0,
2*y34*y38,
0,
0,
0,
0,
y8*y20*y21,
y3*y9*y28,
y3*y15*y31 + y6*y10*y33,
y5*y9*y29,
y5*y12*y32,
y5*y15*y32 + y6*y12*y33,
y6*y9*y30,
y6*y15*y33,
0,
y17*y26*y37,
y18*y27,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y3*y12*y31 + y5*y10*y32,
y7*y25*y36,
y2*y3*y22 + 2*y3*y10*y31
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, FS, IKK, L, L_RF, L_RF_C8, L_RF_C8_FS, L_RF_FL, L_RF_FL_FL, L_RF_FL_FS, L_RF_FS, L_RF_FS_FS, NF_kB_IkB, NF_kB_IkB_P, NF_kB_star, RF, k1, k10, k11, k12, k13, k14, k15, k16, k2, k3, k4, k5, k6, k7, k8, k9, p43_FLIP, p43_FLIP_IKK_star, p43_p41]
new_system = 
[
0,
y1*y4*y36,
0,
2*y35*y39,
0,
0,
0,
0,
y8*y20*y21,
y3*y9*y29,
y3*y15*y32 + y6*y10*y34,
y5*y9*y30,
y5*y12*y33,
y5*y15*y33 + y6*y12*y34,
y6*y9*y31,
y6*y15*y34,
0,
y17*y26*y38,
y18*y27,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y3*y12*y32 + y5*y10*y33,
y7*y25*y37,
y2*y3*y22 + 2*y3*y10*y32
]


new_vars = fmpq_mpoly[C3, C3_star, C8, C8_star, FL, FS, IKK, L, L_RF, L_RF_C8, L_RF_C8_FS, L_RF_FL, L_RF_FL_FL, L_RF_FL_FS, L_RF_FS, L_RF_FS_FS, NF_kB_IkB, NF_kB_IkB_P, NF_kB_star, RF, k1, k10, k11, k12, k13, k14, k15, k16, k17, k2, k3, k4, k5, k6, k7, k8, k9, p43_FLIP, p43_FLIP_IKK_star, p43_p41]
new_system = 
[
0,
y1*y4*y37,
0,
2*y36*y40,
0,
0,
0,
0,
y8*y20*y21,
y3*y9*y30,
y3*y15*y33 + y6*y10*y35,
y5*y9*y31,
y5*y12*y34,
y5*y15*y34 + y6*y12*y35,
y6*y9*y32,
y6*y15*y35,
0,
y17*y26*y39,
y18*y27,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y3*y12*y33 + y5*y10*y34,
y7*y25*y38,
y2*y3*y22 + 2*y3*y10*y33
]


