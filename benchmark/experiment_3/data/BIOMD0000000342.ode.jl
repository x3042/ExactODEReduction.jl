Original system:

[
Smad2c => 1//1000000000000*Smad2n*kexp_Smad2,
LRC_surf => 23//10000000000000*T1R_surf*T2R_surf*TGF_beta_ex*ka_LRC,
kr => 0,
kdeg_T2R => 0,
kdeg_LRC => 0,
kimp_Smad2 => 0,
Smad2n => 1//1000000000000*PSmad2n*kdepho_Smad2 + 23//10000000000000*Smad2c*kimp_Smad2,
klid => 0,
PSmad2_Smad4_n => 23//10000000000000*PSmad2_Smad4_c*kimp_Smads + 1//1000000000000*PSmad2n*Smad4n*kon_Smads,
ka_LRC => 0,
PSmad2_PSmad2_c => 23//5000000000000*PSmad2c*kon_Smads,
T2R_endo => 23//10000000000000*LRC_endo*kdiss_LRC + 23//10000000000000*T2R_surf*ki,
kdeg_T1R => 0,
KD_ns => 0,
LRC_endo => 23//10000000000000*LRC_surf*ki,
kon_Smads => 0,
kexp_Smad2 => 0,
TGF_beta_ex => 1//500000000*KD_ns*TGF_beta_ns*kon_ns,
PSmad2_PSmad2_n => 23//10000000000000*PSmad2_PSmad2_c*kimp_Smads + 1//500000000000*PSmad2n*kon_Smads,
T2R_surf => 23//10000000000000*I*k_T2R + 23//10000000000000*T2R_endo*kr,
I => 0,
kdeg_TGF_beta => 0,
TGF_beta_endo => 23//10000000000000*LRC_endo*kdiss_LRC,
PSmad2n => 1//500000000000*PSmad2_PSmad2_n*koff_Smads + 1//1000000000000*PSmad2_Smad4_n*koff_Smads + 23//10000000000000*PSmad2c*kimp_Smad2,
koff_Smads => 0,
Smad4n => 1//1000000000000*PSmad2_Smad4_n*koff_Smads + 23//10000000000000*Smad4c*kimp_Smad4,
k_T1R => 0,
PSmad2_Smad4_c => 23//10000000000000*PSmad2c*Smad4c*kon_Smads,
kdepho_Smad2 => 0,
T1R_surf => 23//10000000000000*I*k_T1R + 23//10000000000000*T1R_endo*kr,
k_T2R => 0,
kimp_Smads => 0,
PSmad2c => 23//10000000000000*LRC_endo*Smad2c*kpho_Smad2 + 23//5000000000000*PSmad2_PSmad2_c*koff_Smads + 23//10000000000000*PSmad2_Smad4_c*koff_Smads + 1//1000000000000*PSmad2n*kexp_Smad2,
Smad4c => 23//10000000000000*PSmad2_Smad4_c*koff_Smads + 1//1000000000000*Smad4n*kexp_Smad4,
kdiss_LRC => 0,
kon_ns => 0,
TGF_beta_ns => 1//500000000*TGF_beta_ex*kon_ns,
ki => 0,
T1R_endo => 23//10000000000000*LRC_endo*kdiss_LRC + 23//10000000000000*T1R_surf*ki,
kexp_Smad4 => 0,
kpho_Smad2 => 0,
kimp_Smad4 => 0
]

Reductions:


new_vars = fmpq_mpoly[I]
new_system = 
[
0
]


new_vars = fmpq_mpoly[I, KD_ns]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[I, KD_ns, k_T1R]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[I, KD_ns, k_T1R, k_T2R]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[I, KD_ns, k_T1R, k_T2R, ka_LRC]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[I, KD_ns, k_T1R, k_T2R, ka_LRC, kdiss_LRC]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[I, KD_ns, k_T1R, k_T2R, ka_LRC, kdiss_LRC, ki]
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


new_vars = fmpq_mpoly[I, KD_ns, k_T1R, k_T2R, ka_LRC, kdiss_LRC, ki, kon_ns]
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


new_vars = fmpq_mpoly[I, KD_ns, k_T1R, k_T2R, ka_LRC, kdiss_LRC, ki, kon_ns, kr]
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
new_vars = fmpq_mpoly[I, KD_ns, T1R_endo - T2R_endo, T1R_surf - T2R_surf, k_T1R, k_T2R, ka_LRC, kdiss_LRC, ki, kon_ns, kr]
new_system = 
[
0,
0,
23//10000000000000*y4*y9,
23//10000000000000*y1*y5 - 23//10000000000000*y1*y6 + 23//10000000000000*y3*y11,
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[I, KD_ns, T1R_endo - T2R_endo, T1R_surf - T2R_surf, TGF_beta_ex, TGF_beta_ns, k_T1R, k_T2R, ka_LRC, kdiss_LRC, ki, kon_ns, kr]
new_system = 
[
0,
0,
23//10000000000000*y4*y11,
23//10000000000000*y1*y7 - 23//10000000000000*y1*y8 + 23//10000000000000*y3*y13,
1//500000000*y2*y6*y12,
1//500000000*y5*y12,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[I, KD_ns, LRC_endo, LRC_surf, T1R_endo, T1R_surf, T2R_endo, T2R_surf, TGF_beta_ex, TGF_beta_ns, k_T1R, k_T2R, ka_LRC, kdiss_LRC, ki, kon_ns, kr]
new_system = 
[
0,
0,
23//10000000000000*y4*y15,
23//10000000000000*y6*y8*y9*y13,
23//10000000000000*y3*y14 + 23//10000000000000*y6*y15,
23//10000000000000*y1*y11 + 23//10000000000000*y5*y17,
23//10000000000000*y3*y14 + 23//10000000000000*y8*y15,
23//10000000000000*y1*y12 + 23//10000000000000*y7*y17,
1//500000000*y2*y10*y16,
1//500000000*y9*y16,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[I, KD_ns, LRC_endo, LRC_surf, T1R_endo, T1R_surf, T2R_endo, T2R_surf, TGF_beta_ex, TGF_beta_ns, k_T1R, k_T2R, ka_LRC, kdepho_Smad2, kdiss_LRC, ki, kon_ns, kr]
new_system = 
[
0,
0,
23//10000000000000*y4*y16,
23//10000000000000*y6*y8*y9*y13,
23//10000000000000*y3*y15 + 23//10000000000000*y6*y16,
23//10000000000000*y1*y11 + 23//10000000000000*y5*y18,
23//10000000000000*y3*y15 + 23//10000000000000*y8*y16,
23//10000000000000*y1*y12 + 23//10000000000000*y7*y18,
1//500000000*y2*y10*y17,
1//500000000*y9*y17,
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[I, KD_ns, LRC_endo, LRC_surf, T1R_endo, T1R_surf, T2R_endo, T2R_surf, TGF_beta_ex, TGF_beta_ns, k_T1R, k_T2R, ka_LRC, kdepho_Smad2, kdiss_LRC, kexp_Smad2, ki, kon_ns, kr]
new_system = 
[
0,
0,
23//10000000000000*y4*y17,
23//10000000000000*y6*y8*y9*y13,
23//10000000000000*y3*y15 + 23//10000000000000*y6*y17,
23//10000000000000*y1*y11 + 23//10000000000000*y5*y19,
23//10000000000000*y3*y15 + 23//10000000000000*y8*y17,
23//10000000000000*y1*y12 + 23//10000000000000*y7*y19,
1//500000000*y2*y10*y18,
1//500000000*y9*y18,
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


new_vars = fmpq_mpoly[I, KD_ns, LRC_endo, LRC_surf, T1R_endo, T1R_surf, T2R_endo, T2R_surf, TGF_beta_ex, TGF_beta_ns, k_T1R, k_T2R, ka_LRC, kdepho_Smad2, kdiss_LRC, kexp_Smad2, kexp_Smad4, ki, kon_ns, kr]
new_system = 
[
0,
0,
23//10000000000000*y4*y18,
23//10000000000000*y6*y8*y9*y13,
23//10000000000000*y3*y15 + 23//10000000000000*y6*y18,
23//10000000000000*y1*y11 + 23//10000000000000*y5*y20,
23//10000000000000*y3*y15 + 23//10000000000000*y8*y18,
23//10000000000000*y1*y12 + 23//10000000000000*y7*y20,
1//500000000*y2*y10*y19,
1//500000000*y9*y19,
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


new_vars = fmpq_mpoly[I, KD_ns, LRC_endo, LRC_surf, T1R_endo, T1R_surf, T2R_endo, T2R_surf, TGF_beta_ex, TGF_beta_ns, k_T1R, k_T2R, ka_LRC, kdepho_Smad2, kdiss_LRC, kexp_Smad2, kexp_Smad4, ki, kimp_Smad2, kon_ns, kr]
new_system = 
[
0,
0,
23//10000000000000*y4*y18,
23//10000000000000*y6*y8*y9*y13,
23//10000000000000*y3*y15 + 23//10000000000000*y6*y18,
23//10000000000000*y1*y11 + 23//10000000000000*y5*y21,
23//10000000000000*y3*y15 + 23//10000000000000*y8*y18,
23//10000000000000*y1*y12 + 23//10000000000000*y7*y21,
1//500000000*y2*y10*y20,
1//500000000*y9*y20,
0,
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


new_vars = fmpq_mpoly[I, KD_ns, LRC_endo, LRC_surf, T1R_endo, T1R_surf, T2R_endo, T2R_surf, TGF_beta_ex, TGF_beta_ns, k_T1R, k_T2R, ka_LRC, kdepho_Smad2, kdiss_LRC, kexp_Smad2, kexp_Smad4, ki, kimp_Smad2, kimp_Smad4, kon_ns, kr]
new_system = 
[
0,
0,
23//10000000000000*y4*y18,
23//10000000000000*y6*y8*y9*y13,
23//10000000000000*y3*y15 + 23//10000000000000*y6*y18,
23//10000000000000*y1*y11 + 23//10000000000000*y5*y22,
23//10000000000000*y3*y15 + 23//10000000000000*y8*y18,
23//10000000000000*y1*y12 + 23//10000000000000*y7*y22,
1//500000000*y2*y10*y21,
1//500000000*y9*y21,
0,
0,
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


new_vars = fmpq_mpoly[I, KD_ns, LRC_endo, LRC_surf, T1R_endo, T1R_surf, T2R_endo, T2R_surf, TGF_beta_ex, TGF_beta_ns, k_T1R, k_T2R, ka_LRC, kdepho_Smad2, kdiss_LRC, kexp_Smad2, kexp_Smad4, ki, kimp_Smad2, kimp_Smad4, kimp_Smads, kon_ns, kr]
new_system = 
[
0,
0,
23//10000000000000*y4*y18,
23//10000000000000*y6*y8*y9*y13,
23//10000000000000*y3*y15 + 23//10000000000000*y6*y18,
23//10000000000000*y1*y11 + 23//10000000000000*y5*y23,
23//10000000000000*y3*y15 + 23//10000000000000*y8*y18,
23//10000000000000*y1*y12 + 23//10000000000000*y7*y23,
1//500000000*y2*y10*y22,
1//500000000*y9*y22,
0,
0,
0,
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


new_vars = fmpq_mpoly[I, KD_ns, LRC_endo, LRC_surf, T1R_endo, T1R_surf, T2R_endo, T2R_surf, TGF_beta_ex, TGF_beta_ns, k_T1R, k_T2R, ka_LRC, kdepho_Smad2, kdiss_LRC, kexp_Smad2, kexp_Smad4, ki, kimp_Smad2, kimp_Smad4, kimp_Smads, koff_Smads, kon_ns, kr]
new_system = 
[
0,
0,
23//10000000000000*y4*y18,
23//10000000000000*y6*y8*y9*y13,
23//10000000000000*y3*y15 + 23//10000000000000*y6*y18,
23//10000000000000*y1*y11 + 23//10000000000000*y5*y24,
23//10000000000000*y3*y15 + 23//10000000000000*y8*y18,
23//10000000000000*y1*y12 + 23//10000000000000*y7*y24,
1//500000000*y2*y10*y23,
1//500000000*y9*y23,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[I, KD_ns, LRC_endo, LRC_surf, T1R_endo, T1R_surf, T2R_endo, T2R_surf, TGF_beta_ex, TGF_beta_ns, k_T1R, k_T2R, ka_LRC, kdepho_Smad2, kdiss_LRC, kexp_Smad2, kexp_Smad4, ki, kimp_Smad2, kimp_Smad4, kimp_Smads, koff_Smads, kon_Smads, kon_ns, kr]
new_system = 
[
0,
0,
23//10000000000000*y4*y18,
23//10000000000000*y6*y8*y9*y13,
23//10000000000000*y3*y15 + 23//10000000000000*y6*y18,
23//10000000000000*y1*y11 + 23//10000000000000*y5*y25,
23//10000000000000*y3*y15 + 23//10000000000000*y8*y18,
23//10000000000000*y1*y12 + 23//10000000000000*y7*y25,
1//500000000*y2*y10*y24,
1//500000000*y9*y24,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[I, KD_ns, LRC_endo, LRC_surf, T1R_endo, T1R_surf, T2R_endo, T2R_surf, TGF_beta_ex, TGF_beta_ns, k_T1R, k_T2R, ka_LRC, kdepho_Smad2, kdiss_LRC, kexp_Smad2, kexp_Smad4, ki, kimp_Smad2, kimp_Smad4, kimp_Smads, koff_Smads, kon_Smads, kon_ns, kpho_Smad2, kr]
new_system = 
[
0,
0,
23//10000000000000*y4*y18,
23//10000000000000*y6*y8*y9*y13,
23//10000000000000*y3*y15 + 23//10000000000000*y6*y18,
23//10000000000000*y1*y11 + 23//10000000000000*y5*y26,
23//10000000000000*y3*y15 + 23//10000000000000*y8*y18,
23//10000000000000*y1*y12 + 23//10000000000000*y7*y26,
1//500000000*y2*y10*y24,
1//500000000*y9*y24,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[I, KD_ns, LRC_endo, LRC_surf, PSmad2_PSmad2_c, PSmad2_PSmad2_n, PSmad2_Smad4_c, PSmad2_Smad4_n, PSmad2c, PSmad2n, Smad2c, Smad2n, Smad4c, Smad4n, T1R_endo, T1R_surf, T2R_endo, T2R_surf, TGF_beta_ex, TGF_beta_ns, k_T1R, k_T2R, ka_LRC, kdepho_Smad2, kdiss_LRC, kexp_Smad2, kexp_Smad4, ki, kimp_Smad2, kimp_Smad4, kimp_Smads, koff_Smads, kon_Smads, kon_ns, kpho_Smad2, kr]
new_system = 
[
0,
0,
23//10000000000000*y4*y28,
23//10000000000000*y16*y18*y19*y23,
23//5000000000000*y9*y33,
23//10000000000000*y5*y31 + 1//500000000000*y10*y33,
23//10000000000000*y9*y13*y33,
23//10000000000000*y7*y31 + 1//1000000000000*y10*y14*y33,
23//10000000000000*y3*y11*y35 + 23//5000000000000*y5*y32 + 23//10000000000000*y7*y32 + 1//1000000000000*y10*y26,
1//500000000000*y6*y32 + 1//1000000000000*y8*y32 + 23//10000000000000*y9*y29,
1//1000000000000*y12*y26,
1//1000000000000*y10*y24 + 23//10000000000000*y11*y29,
23//10000000000000*y7*y32 + 1//1000000000000*y14*y27,
1//1000000000000*y8*y32 + 23//10000000000000*y13*y30,
23//10000000000000*y3*y25 + 23//10000000000000*y16*y28,
23//10000000000000*y1*y21 + 23//10000000000000*y15*y36,
23//10000000000000*y3*y25 + 23//10000000000000*y18*y28,
23//10000000000000*y1*y22 + 23//10000000000000*y17*y36,
1//500000000*y2*y20*y34,
1//500000000*y19*y34,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[I, KD_ns, LRC_endo, LRC_surf, PSmad2_PSmad2_c, PSmad2_PSmad2_n, PSmad2_Smad4_c, PSmad2_Smad4_n, PSmad2c, PSmad2n, Smad2c, Smad2n, Smad4c, Smad4n, T1R_endo, T1R_surf, T2R_endo, T2R_surf, TGF_beta_endo, TGF_beta_ex, TGF_beta_ns, k_T1R, k_T2R, ka_LRC, kdepho_Smad2, kdiss_LRC, kexp_Smad2, kexp_Smad4, ki, kimp_Smad2, kimp_Smad4, kimp_Smads, koff_Smads, kon_Smads, kon_ns, kpho_Smad2, kr]
new_system = 
[
0,
0,
23//10000000000000*y4*y29,
23//10000000000000*y16*y18*y20*y24,
23//5000000000000*y9*y34,
23//10000000000000*y5*y32 + 1//500000000000*y10*y34,
23//10000000000000*y9*y13*y34,
23//10000000000000*y7*y32 + 1//1000000000000*y10*y14*y34,
23//10000000000000*y3*y11*y36 + 23//5000000000000*y5*y33 + 23//10000000000000*y7*y33 + 1//1000000000000*y10*y27,
1//500000000000*y6*y33 + 1//1000000000000*y8*y33 + 23//10000000000000*y9*y30,
1//1000000000000*y12*y27,
1//1000000000000*y10*y25 + 23//10000000000000*y11*y30,
23//10000000000000*y7*y33 + 1//1000000000000*y14*y28,
1//1000000000000*y8*y33 + 23//10000000000000*y13*y31,
23//10000000000000*y3*y26 + 23//10000000000000*y16*y29,
23//10000000000000*y1*y22 + 23//10000000000000*y15*y37,
23//10000000000000*y3*y26 + 23//10000000000000*y18*y29,
23//10000000000000*y1*y23 + 23//10000000000000*y17*y37,
23//10000000000000*y3*y26,
1//500000000*y2*y21*y35,
1//500000000*y20*y35,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[I, KD_ns, LRC_endo, LRC_surf, PSmad2_PSmad2_c, PSmad2_PSmad2_n, PSmad2_Smad4_c, PSmad2_Smad4_n, PSmad2c, PSmad2n, Smad2c, Smad2n, Smad4c, Smad4n, T1R_endo, T1R_surf, T2R_endo, T2R_surf, TGF_beta_endo, TGF_beta_ex, TGF_beta_ns, k_T1R, k_T2R, ka_LRC, kdeg_LRC, kdepho_Smad2, kdiss_LRC, kexp_Smad2, kexp_Smad4, ki, kimp_Smad2, kimp_Smad4, kimp_Smads, koff_Smads, kon_Smads, kon_ns, kpho_Smad2, kr]
new_system = 
[
0,
0,
23//10000000000000*y4*y30,
23//10000000000000*y16*y18*y20*y24,
23//5000000000000*y9*y35,
23//10000000000000*y5*y33 + 1//500000000000*y10*y35,
23//10000000000000*y9*y13*y35,
23//10000000000000*y7*y33 + 1//1000000000000*y10*y14*y35,
23//10000000000000*y3*y11*y37 + 23//5000000000000*y5*y34 + 23//10000000000000*y7*y34 + 1//1000000000000*y10*y28,
1//500000000000*y6*y34 + 1//1000000000000*y8*y34 + 23//10000000000000*y9*y31,
1//1000000000000*y12*y28,
1//1000000000000*y10*y26 + 23//10000000000000*y11*y31,
23//10000000000000*y7*y34 + 1//1000000000000*y14*y29,
1//1000000000000*y8*y34 + 23//10000000000000*y13*y32,
23//10000000000000*y3*y27 + 23//10000000000000*y16*y30,
23//10000000000000*y1*y22 + 23//10000000000000*y15*y38,
23//10000000000000*y3*y27 + 23//10000000000000*y18*y30,
23//10000000000000*y1*y23 + 23//10000000000000*y17*y38,
23//10000000000000*y3*y27,
1//500000000*y2*y21*y36,
1//500000000*y20*y36,
0,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[I, KD_ns, LRC_endo, LRC_surf, PSmad2_PSmad2_c, PSmad2_PSmad2_n, PSmad2_Smad4_c, PSmad2_Smad4_n, PSmad2c, PSmad2n, Smad2c, Smad2n, Smad4c, Smad4n, T1R_endo, T1R_surf, T2R_endo, T2R_surf, TGF_beta_endo, TGF_beta_ex, TGF_beta_ns, k_T1R, k_T2R, ka_LRC, kdeg_LRC, kdeg_T1R, kdepho_Smad2, kdiss_LRC, kexp_Smad2, kexp_Smad4, ki, kimp_Smad2, kimp_Smad4, kimp_Smads, koff_Smads, kon_Smads, kon_ns, kpho_Smad2, kr]
new_system = 
[
0,
0,
23//10000000000000*y4*y31,
23//10000000000000*y16*y18*y20*y24,
23//5000000000000*y9*y36,
23//10000000000000*y5*y34 + 1//500000000000*y10*y36,
23//10000000000000*y9*y13*y36,
23//10000000000000*y7*y34 + 1//1000000000000*y10*y14*y36,
23//10000000000000*y3*y11*y38 + 23//5000000000000*y5*y35 + 23//10000000000000*y7*y35 + 1//1000000000000*y10*y29,
1//500000000000*y6*y35 + 1//1000000000000*y8*y35 + 23//10000000000000*y9*y32,
1//1000000000000*y12*y29,
1//1000000000000*y10*y27 + 23//10000000000000*y11*y32,
23//10000000000000*y7*y35 + 1//1000000000000*y14*y30,
1//1000000000000*y8*y35 + 23//10000000000000*y13*y33,
23//10000000000000*y3*y28 + 23//10000000000000*y16*y31,
23//10000000000000*y1*y22 + 23//10000000000000*y15*y39,
23//10000000000000*y3*y28 + 23//10000000000000*y18*y31,
23//10000000000000*y1*y23 + 23//10000000000000*y17*y39,
23//10000000000000*y3*y28,
1//500000000*y2*y21*y37,
1//500000000*y20*y37,
0,
0,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[I, KD_ns, LRC_endo, LRC_surf, PSmad2_PSmad2_c, PSmad2_PSmad2_n, PSmad2_Smad4_c, PSmad2_Smad4_n, PSmad2c, PSmad2n, Smad2c, Smad2n, Smad4c, Smad4n, T1R_endo, T1R_surf, T2R_endo, T2R_surf, TGF_beta_endo, TGF_beta_ex, TGF_beta_ns, k_T1R, k_T2R, ka_LRC, kdeg_LRC, kdeg_T1R, kdeg_T2R, kdepho_Smad2, kdiss_LRC, kexp_Smad2, kexp_Smad4, ki, kimp_Smad2, kimp_Smad4, kimp_Smads, koff_Smads, kon_Smads, kon_ns, kpho_Smad2, kr]
new_system = 
[
0,
0,
23//10000000000000*y4*y32,
23//10000000000000*y16*y18*y20*y24,
23//5000000000000*y9*y37,
23//10000000000000*y5*y35 + 1//500000000000*y10*y37,
23//10000000000000*y9*y13*y37,
23//10000000000000*y7*y35 + 1//1000000000000*y10*y14*y37,
23//10000000000000*y3*y11*y39 + 23//5000000000000*y5*y36 + 23//10000000000000*y7*y36 + 1//1000000000000*y10*y30,
1//500000000000*y6*y36 + 1//1000000000000*y8*y36 + 23//10000000000000*y9*y33,
1//1000000000000*y12*y30,
1//1000000000000*y10*y28 + 23//10000000000000*y11*y33,
23//10000000000000*y7*y36 + 1//1000000000000*y14*y31,
1//1000000000000*y8*y36 + 23//10000000000000*y13*y34,
23//10000000000000*y3*y29 + 23//10000000000000*y16*y32,
23//10000000000000*y1*y22 + 23//10000000000000*y15*y40,
23//10000000000000*y3*y29 + 23//10000000000000*y18*y32,
23//10000000000000*y1*y23 + 23//10000000000000*y17*y40,
23//10000000000000*y3*y29,
1//500000000*y2*y21*y38,
1//500000000*y20*y38,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[I, KD_ns, LRC_endo, LRC_surf, PSmad2_PSmad2_c, PSmad2_PSmad2_n, PSmad2_Smad4_c, PSmad2_Smad4_n, PSmad2c, PSmad2n, Smad2c, Smad2n, Smad4c, Smad4n, T1R_endo, T1R_surf, T2R_endo, T2R_surf, TGF_beta_endo, TGF_beta_ex, TGF_beta_ns, k_T1R, k_T2R, ka_LRC, kdeg_LRC, kdeg_T1R, kdeg_T2R, kdeg_TGF_beta, kdepho_Smad2, kdiss_LRC, kexp_Smad2, kexp_Smad4, ki, kimp_Smad2, kimp_Smad4, kimp_Smads, koff_Smads, kon_Smads, kon_ns, kpho_Smad2, kr]
new_system = 
[
0,
0,
23//10000000000000*y4*y33,
23//10000000000000*y16*y18*y20*y24,
23//5000000000000*y9*y38,
23//10000000000000*y5*y36 + 1//500000000000*y10*y38,
23//10000000000000*y9*y13*y38,
23//10000000000000*y7*y36 + 1//1000000000000*y10*y14*y38,
23//10000000000000*y3*y11*y40 + 23//5000000000000*y5*y37 + 23//10000000000000*y7*y37 + 1//1000000000000*y10*y31,
1//500000000000*y6*y37 + 1//1000000000000*y8*y37 + 23//10000000000000*y9*y34,
1//1000000000000*y12*y31,
1//1000000000000*y10*y29 + 23//10000000000000*y11*y34,
23//10000000000000*y7*y37 + 1//1000000000000*y14*y32,
1//1000000000000*y8*y37 + 23//10000000000000*y13*y35,
23//10000000000000*y3*y30 + 23//10000000000000*y16*y33,
23//10000000000000*y1*y22 + 23//10000000000000*y15*y41,
23//10000000000000*y3*y30 + 23//10000000000000*y18*y33,
23//10000000000000*y1*y23 + 23//10000000000000*y17*y41,
23//10000000000000*y3*y30,
1//500000000*y2*y21*y39,
1//500000000*y20*y39,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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


