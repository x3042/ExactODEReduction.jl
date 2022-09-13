Original system:

[
Kimp_Smad4c => 0,
Kimp_Smad2c => 0,
TGF_beta => 21//20000*LRC_Cave*kr_Cave + 21//20000*LRC_EE*kr_EE + 21//20000*T2R_EE*kr_EE,
T1R_Surf => 21//20000*LRC_Cave*kr_Cave + 21//20000*LRC_EE*kr_EE + 21//20000*T1R_Cave*kr_Cave + 21//20000*T1R_EE*kr_EE + 21//20000*source*v_T1R,
T2R_Surf => 21//20000*LRC_Cave*kr_Cave + 21//20000*LRC_EE*kr_EE + 21//20000*T2R_Cave*kr_Cave + 21//20000*T2R_EE*kr_EE + 21//20000*source*v_T2R,
Smad2n => 7//20000*Kdiss_Smads_Complex_n*Smads_Complex_n + 21//20000*Kimp_Smad2c*Smad2c,
LRC_Cave => 21//20000*LRC_Surf*ki_Cave,
Kcd => 0,
Kexp_Smad4n => 0,
ki_Cave => 0,
kr_EE => 0,
k_Smads_Complex_c => 0,
Smads_Complex_n => 21//20000*Kimp_Smads_Complex_c*Smads_Complex_c,
T2R_Cave => 21//20000*T2R_Surf*ki_Cave,
T2R_EE => 21//20000*T2R_Surf*ki_EE,
Kexp_Smad2n => 0,
LRC_Surf => 21//20000*T1R_Surf*T2R_Surf*TGF_beta*k_LRC,
Klid => 0,
Smad2c => 7//20000*Kexp_Smad2n*Smad2n,
SINK => -21//20000*Kcd*LRC_EE - 21//20000*Kdeg_T1R_EE*T1R_EE - 21//20000*Kdeg_T2R_EE*T2R_EE,
T1R_EE => 21//20000*T1R_Surf*ki_EE,
source => 0,
Smad4c => 7//20000*Kexp_Smad4n*Smad4n,
Kdiss_Smads_Complex_n => 0,
Smad4n => 7//20000*Kdiss_Smads_Complex_n*Smads_Complex_n + 21//20000*Kimp_Smad4c*Smad4c,
Kimp_Smads_Complex_c => 0,
LRC_EE => 21//20000*LRC_Surf*ki_EE,
k_LRC => 0,
kr_Cave => 0,
ki_EE => 0,
v_T2R => 0,
Kdeg_T1R_EE => 0,
Kdeg_T2R_EE => 0,
Smads_Complex_c => 21//20000*LRC_EE*Smad2c*Smad4c*k_Smads_Complex_c,
T1R_Cave => 21//20000*T1R_Surf*ki_Cave,
v_T1R => 0
]

Reductions:


new_vars = fmpq_mpoly[Kcd]
new_system = 
[
0
]


new_vars = fmpq_mpoly[Kcd, Kdeg_T1R_EE]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[Kcd, Kdeg_T1R_EE, Kdeg_T2R_EE]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[Kcd, Kdeg_T1R_EE, Kdeg_T2R_EE, Kdiss_Smads_Complex_n]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Kcd, Kdeg_T1R_EE, Kdeg_T2R_EE, Kdiss_Smads_Complex_n, Kexp_Smad2n]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Kcd, Kdeg_T1R_EE, Kdeg_T2R_EE, Kdiss_Smads_Complex_n, Kexp_Smad2n, Kexp_Smad4n]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Kcd, Kdeg_T1R_EE, Kdeg_T2R_EE, Kdiss_Smads_Complex_n, Kexp_Smad2n, Kexp_Smad4n, Kimp_Smad2c]
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


new_vars = fmpq_mpoly[Kcd, Kdeg_T1R_EE, Kdeg_T2R_EE, Kdiss_Smads_Complex_n, Kexp_Smad2n, Kexp_Smad4n, Kimp_Smad2c, Kimp_Smad4c]
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


new_vars = fmpq_mpoly[Kcd, Kdeg_T1R_EE, Kdeg_T2R_EE, Kdiss_Smads_Complex_n, Kexp_Smad2n, Kexp_Smad4n, Kimp_Smad2c, Kimp_Smad4c, Kimp_Smads_Complex_c]
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


new_vars = fmpq_mpoly[Kcd, Kdeg_T1R_EE, Kdeg_T2R_EE, Kdiss_Smads_Complex_n, Kexp_Smad2n, Kexp_Smad4n, Kimp_Smad2c, Kimp_Smad4c, Kimp_Smads_Complex_c, Klid]
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


new_vars = fmpq_mpoly[Kcd, Kdeg_T1R_EE, Kdeg_T2R_EE, Kdiss_Smads_Complex_n, Kexp_Smad2n, Kexp_Smad4n, Kimp_Smad2c, Kimp_Smad4c, Kimp_Smads_Complex_c, Klid, k_LRC]
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


new_vars = fmpq_mpoly[Kcd, Kdeg_T1R_EE, Kdeg_T2R_EE, Kdiss_Smads_Complex_n, Kexp_Smad2n, Kexp_Smad4n, Kimp_Smad2c, Kimp_Smad4c, Kimp_Smads_Complex_c, Klid, k_LRC, ki_Cave]
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


new_vars = fmpq_mpoly[Kcd, Kdeg_T1R_EE, Kdeg_T2R_EE, Kdiss_Smads_Complex_n, Kexp_Smad2n, Kexp_Smad4n, Kimp_Smad2c, Kimp_Smad4c, Kimp_Smads_Complex_c, Klid, k_LRC, ki_Cave, ki_EE]
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


new_vars = fmpq_mpoly[Kcd, Kdeg_T1R_EE, Kdeg_T2R_EE, Kdiss_Smads_Complex_n, Kexp_Smad2n, Kexp_Smad4n, Kimp_Smad2c, Kimp_Smad4c, Kimp_Smads_Complex_c, Klid, k_LRC, ki_Cave, ki_EE, kr_Cave]
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


new_vars = fmpq_mpoly[Kcd, Kdeg_T1R_EE, Kdeg_T2R_EE, Kdiss_Smads_Complex_n, Kexp_Smad2n, Kexp_Smad4n, Kimp_Smad2c, Kimp_Smad4c, Kimp_Smads_Complex_c, Klid, k_LRC, ki_Cave, ki_EE, kr_Cave, kr_EE]
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


new_vars = fmpq_mpoly[Kcd, Kdeg_T1R_EE, Kdeg_T2R_EE, Kdiss_Smads_Complex_n, Kexp_Smad2n, Kexp_Smad4n, Kimp_Smad2c, Kimp_Smad4c, Kimp_Smads_Complex_c, Klid, k_LRC, ki_Cave, ki_EE, kr_Cave, kr_EE, source]
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


new_vars = fmpq_mpoly[Kcd, Kdeg_T1R_EE, Kdeg_T2R_EE, Kdiss_Smads_Complex_n, Kexp_Smad2n, Kexp_Smad4n, Kimp_Smad2c, Kimp_Smad4c, Kimp_Smads_Complex_c, Klid, k_LRC, ki_Cave, ki_EE, kr_Cave, kr_EE, source, v_T1R]
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


new_vars = fmpq_mpoly[Kcd, Kdeg_T1R_EE, Kdeg_T2R_EE, Kdiss_Smads_Complex_n, Kexp_Smad2n, Kexp_Smad4n, Kimp_Smad2c, Kimp_Smad4c, Kimp_Smads_Complex_c, Klid, k_LRC, ki_Cave, ki_EE, kr_Cave, kr_EE, source, v_T1R, v_T2R]
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
new_vars = fmpq_mpoly[Kcd, Kdeg_T1R_EE, Kdeg_T2R_EE, Kdiss_Smads_Complex_n, Kexp_Smad2n, Kexp_Smad4n, Kimp_Smad2c, Kimp_Smad4c, Kimp_Smads_Complex_c, Klid, T1R_Cave - T2R_Cave, T1R_EE - T2R_EE, T1R_Surf - T2R_Surf, k_LRC, ki_Cave, ki_EE, kr_Cave, kr_EE, source, v_T1R, v_T2R]
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
21//20000*y13*y15,
21//20000*y13*y16,
21//20000*y11*y17 + 21//20000*y12*y18 + 21//20000*y19*y20 - 21//20000*y19*y21,
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
new_vars = fmpq_mpoly[Kcd, Kdeg_T1R_EE, Kdeg_T2R_EE, Kdiss_Smads_Complex_n, Kexp_Smad2n, Kexp_Smad4n, Kimp_Smad2c, Kimp_Smad4c, Kimp_Smads_Complex_c, Klid, LRC_Cave, LRC_EE + T2R_EE, LRC_EE + T1R_EE, LRC_Surf, T1R_Cave, T1R_Surf, T2R_Cave, T2R_Surf, TGF_beta, k_LRC, ki_Cave, ki_EE, kr_Cave, kr_EE, source, v_T1R, v_T2R]
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
21//20000*y14*y21,
21//20000*y14*y22 + 21//20000*y18*y22,
21//20000*y14*y22 + 21//20000*y16*y22,
21//20000*y16*y18*y19*y20,
21//20000*y16*y21,
21//20000*y11*y23 + 21//20000*y13*y24 + 21//20000*y15*y23 + 21//20000*y25*y26,
21//20000*y18*y21,
21//20000*y11*y23 + 21//20000*y12*y24 + 21//20000*y17*y23 + 21//20000*y25*y27,
21//20000*y11*y23 + 21//20000*y12*y24,
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Kcd, Kdeg_T1R_EE, Kdeg_T2R_EE, Kdiss_Smads_Complex_n, Kexp_Smad2n, Kexp_Smad4n, Kimp_Smad2c, Kimp_Smad4c, Kimp_Smads_Complex_c, Klid, LRC_Cave, LRC_EE, LRC_Surf, T1R_Cave, T1R_EE, T1R_Surf, T2R_Cave, T2R_EE, T2R_Surf, TGF_beta, k_LRC, ki_Cave, ki_EE, kr_Cave, kr_EE, source, v_T1R, v_T2R]
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
21//20000*y13*y22,
21//20000*y13*y23,
21//20000*y16*y19*y20*y21,
21//20000*y16*y22,
21//20000*y16*y23,
21//20000*y11*y24 + 21//20000*y12*y25 + 21//20000*y14*y24 + 21//20000*y15*y25 + 21//20000*y26*y27,
21//20000*y19*y22,
21//20000*y19*y23,
21//20000*y11*y24 + 21//20000*y12*y25 + 21//20000*y17*y24 + 21//20000*y18*y25 + 21//20000*y26*y28,
21//20000*y11*y24 + 21//20000*y12*y25 + 21//20000*y18*y25,
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Kcd, Kdeg_T1R_EE, Kdeg_T2R_EE, Kdiss_Smads_Complex_n, Kexp_Smad2n, Kexp_Smad4n, Kimp_Smad2c, Kimp_Smad4c, Kimp_Smads_Complex_c, Klid, LRC_Cave, LRC_EE, LRC_Surf, SINK, T1R_Cave, T1R_EE, T1R_Surf, T2R_Cave, T2R_EE, T2R_Surf, TGF_beta, k_LRC, ki_Cave, ki_EE, kr_Cave, kr_EE, source, v_T1R, v_T2R]
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
21//20000*y13*y23,
21//20000*y13*y24,
21//20000*y17*y20*y21*y22,
-21//20000*y1*y12 - 21//20000*y2*y16 - 21//20000*y3*y19,
21//20000*y17*y23,
21//20000*y17*y24,
21//20000*y11*y25 + 21//20000*y12*y26 + 21//20000*y15*y25 + 21//20000*y16*y26 + 21//20000*y27*y28,
21//20000*y20*y23,
21//20000*y20*y24,
21//20000*y11*y25 + 21//20000*y12*y26 + 21//20000*y18*y25 + 21//20000*y19*y26 + 21//20000*y27*y29,
21//20000*y11*y25 + 21//20000*y12*y26 + 21//20000*y19*y26,
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Kcd, Kdeg_T1R_EE, Kdeg_T2R_EE, Kdiss_Smads_Complex_n, Kexp_Smad2n, Kexp_Smad4n, Kimp_Smad2c, Kimp_Smad4c, Kimp_Smads_Complex_c, Klid, LRC_Cave, LRC_EE, LRC_Surf, SINK, T1R_Cave, T1R_EE, T1R_Surf, T2R_Cave, T2R_EE, T2R_Surf, TGF_beta, k_LRC, k_Smads_Complex_c, ki_Cave, ki_EE, kr_Cave, kr_EE, source, v_T1R, v_T2R]
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
21//20000*y13*y24,
21//20000*y13*y25,
21//20000*y17*y20*y21*y22,
-21//20000*y1*y12 - 21//20000*y2*y16 - 21//20000*y3*y19,
21//20000*y17*y24,
21//20000*y17*y25,
21//20000*y11*y26 + 21//20000*y12*y27 + 21//20000*y15*y26 + 21//20000*y16*y27 + 21//20000*y28*y29,
21//20000*y20*y24,
21//20000*y20*y25,
21//20000*y11*y26 + 21//20000*y12*y27 + 21//20000*y18*y26 + 21//20000*y19*y27 + 21//20000*y28*y30,
21//20000*y11*y26 + 21//20000*y12*y27 + 21//20000*y19*y27,
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


