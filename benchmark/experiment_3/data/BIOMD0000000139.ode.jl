Original system:

[
tp2 => 0,
IkBalpha_NFkB => IKK_IkBalpha_NFkB*d1 + IkBalpha*NFkB*a4 + IkBalpha_nuc_NFkB_nuc*k2,
d5 => 0,
a3 => 0,
fr_after_trigger => 0,
tr3 => 0,
IkBalpha_nuc => IkBalpha*tp1 + IkBalpha_nuc_NFkB_nuc*d4,
a5 => 0,
d4 => 0,
r1 => 0,
deg1 => 0,
a7 => 0,
IkBeps => IKK_IkBeps*d3 + IkBeps_NFkB*d6 + 1//2*IkBeps_nuc*tp2 + IkBeps_transcript*tr1,
r4 => 0,
r6 => 0,
deg4 => 0,
k02 => 0,
tr2a => 0,
IKK_IkBeps_NFkB => IKK*IkBeps_NFkB*a9 + IKK_IkBeps*NFkB*a6,
r5 => 0,
NFkB => IKK_IkBalpha_NFkB*d4 + IKK_IkBalpha_NFkB*r4 + IKK_IkBbeta_NFkB*d5 + IKK_IkBbeta_NFkB*r5 + IKK_IkBeps_NFkB*d6 + IKK_IkBeps_NFkB*r6 + IkBalpha_NFkB*d4 + IkBalpha_NFkB*deg4 + IkBbeta_NFkB*d5 + IkBbeta_NFkB*deg4 + IkBeps_NFkB*d6 + IkBeps_NFkB*deg4 + NFkB_nuc*k01,
IKK_IkBeps => IKK*IkBeps*a3 + IKK_IkBeps_NFkB*d6,
IkBalpha_transcript => 2*NFkB_nuc*tr2 + source*tr2a,
NFkB_nuc => IkBalpha_nuc_NFkB_nuc*d4 + IkBbeta_nuc_NFkB_nuc*d5 + IkBeps_nuc_NFkB_nuc*d6 + NFkB*k1,
IkBbeta => IKK_IkBbeta*d2 + IkBbeta_NFkB*d5 + 1//2*IkBbeta_nuc*tp2 + IkBbeta_transcript*tr1,
IkBeps_NFkB => IKK_IkBeps_NFkB*d3 + IkBeps*NFkB*a6 + 1//2*IkBeps_nuc_NFkB_nuc*k2_eps,
r3 => 0,
k01 => 0,
a6 => 0,
IkBbeta_nuc_NFkB_nuc => IkBbeta_nuc*NFkB_nuc*a5,
d2 => 0,
d1 => 0,
tr1 => 0,
tr2 => 0,
IKK => IKK_IkBalpha*d1 + IKK_IkBalpha*r1 + IKK_IkBalpha_NFkB*d1 + IKK_IkBalpha_NFkB*r4 + IKK_IkBbeta*d2 + IKK_IkBbeta*r2 + IKK_IkBbeta_NFkB*d2 + IKK_IkBbeta_NFkB*r5 + IKK_IkBeps*d3 + IKK_IkBeps*r3 + IKK_IkBeps_NFkB*d3 + IKK_IkBeps_NFkB*r6,
IkBeps_transcript => source*tr2e,
SINK => -IKK*k02 - IkBalpha*deg1 - IkBalpha_transcript*tr3 - IkBbeta*deg1 - IkBbeta_transcript*tr3 - IkBeps*deg1 - IkBeps_transcript*tr3,
a1 => 0,
tr2b => 0,
IKK_IkBbeta_NFkB => IKK*IkBbeta_NFkB*a8 + IKK_IkBbeta*NFkB*a5,
IkBeps_nuc => 1//2*IkBeps*tp1 + IkBeps_nuc_NFkB_nuc*d6,
IkBbeta_transcript => source*tr2b,
k2_eps => 0,
IkBalpha_nuc_NFkB_nuc => IkBalpha_nuc*NFkB_nuc*a4,
source => 0,
a2 => 0,
d3 => 0,
d6 => 0,
IKK_IkBalpha => IKK*IkBalpha*a1 + IKK_IkBalpha_NFkB*d4,
a4 => 0,
flag_for_after_trigger => 0,
IkBalpha => IKK_IkBalpha*d1 + IkBalpha_NFkB*d4 + IkBalpha_nuc*tp2 + IkBalpha_transcript*tr1,
IkBbeta_NFkB => IKK_IkBbeta_NFkB*d2 + IkBbeta*NFkB*a5 + 69//10000*IkBbeta_nuc_NFkB_nuc*flag_for_after_trigger + 69//10000*IkBbeta_nuc_NFkB_nuc*fr_after_trigger,
IKK_IkBbeta => IKK*IkBbeta*a2 + IKK_IkBbeta_NFkB*d5,
tp1 => 0,
IKK_IkBalpha_NFkB => IKK*IkBalpha_NFkB*a7 + IKK_IkBalpha*NFkB*a4,
tr2e => 0,
IkBbeta_nuc => 1//2*IkBbeta*tp1 + IkBbeta_nuc_NFkB_nuc*d5,
a9 => 0,
a8 => 0,
k2 => 0,
k1 => 0,
r2 => 0,
IkBeps_nuc_NFkB_nuc => IkBeps_nuc*NFkB_nuc*a6
]

Reductions:


new_vars = fmpq_mpoly[a1]
new_system = 
[
0
]


new_vars = fmpq_mpoly[a1, a2]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[a1, a2, a3]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[a1, a2, a3, a4]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[a1, a2, a3, a4, a5]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7]
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


new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8]
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


new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9]
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


new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1]
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


new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2]
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


new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3]
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


new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4]
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


new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5]
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


new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6]
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


new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg4]
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
new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg4, flag_for_after_trigger + fr_after_trigger]
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
new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg4, flag_for_after_trigger + fr_after_trigger, k01]
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
new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg4, flag_for_after_trigger + fr_after_trigger, k01, k1]
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
new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg4, flag_for_after_trigger + fr_after_trigger, k01, k1, k2]
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
new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg4, flag_for_after_trigger + fr_after_trigger, k01, k1, k2, k2_eps]
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
new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg4, flag_for_after_trigger + fr_after_trigger, k01, k1, k2, k2_eps, r1]
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
new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg4, flag_for_after_trigger + fr_after_trigger, k01, k1, k2, k2_eps, r1, r2]
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
new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg4, flag_for_after_trigger + fr_after_trigger, k01, k1, k2, k2_eps, r1, r2, r3]
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
new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg4, flag_for_after_trigger + fr_after_trigger, k01, k1, k2, k2_eps, r1, r2, r3, r4]
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
new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg4, flag_for_after_trigger + fr_after_trigger, k01, k1, k2, k2_eps, r1, r2, r3, r4, r5]
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
new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg4, flag_for_after_trigger + fr_after_trigger, k01, k1, k2, k2_eps, r1, r2, r3, r4, r5, r6]
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
new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg4, flag_for_after_trigger + fr_after_trigger, k01, k1, k2, k2_eps, r1, r2, r3, r4, r5, r6, source]
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
new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg4, flag_for_after_trigger + fr_after_trigger, k01, k1, k2, k2_eps, r1, r2, r3, r4, r5, r6, source, tp1]
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
new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg4, flag_for_after_trigger + fr_after_trigger, k01, k1, k2, k2_eps, r1, r2, r3, r4, r5, r6, source, tp1, tp2]
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
new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg4, flag_for_after_trigger + fr_after_trigger, k01, k1, k2, k2_eps, r1, r2, r3, r4, r5, r6, source, tp1, tp2, tr1]
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
new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg4, flag_for_after_trigger + fr_after_trigger, k01, k1, k2, k2_eps, r1, r2, r3, r4, r5, r6, source, tp1, tp2, tr1, tr2]
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
new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg4, flag_for_after_trigger + fr_after_trigger, k01, k1, k2, k2_eps, r1, r2, r3, r4, r5, r6, source, tp1, tp2, tr1, tr2, tr2a]
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
new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg4, flag_for_after_trigger + fr_after_trigger, k01, k1, k2, k2_eps, r1, r2, r3, r4, r5, r6, source, tp1, tp2, tr1, tr2, tr2a, tr2b]
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
new_vars = fmpq_mpoly[a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg4, flag_for_after_trigger + fr_after_trigger, k01, k1, k2, k2_eps, r1, r2, r3, r4, r5, r6, source, tp1, tp2, tr1, tr2, tr2a, tr2b, tr2e]
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
new_vars = fmpq_mpoly[IkBbeta_transcript, a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg4, flag_for_after_trigger + fr_after_trigger, k01, k1, k2, k2_eps, r1, r2, r3, r4, r5, r6, source, tp1, tp2, tr1, tr2, tr2a, tr2b, tr2e]
new_system = 
[
y29*y35,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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
new_vars = fmpq_mpoly[IkBbeta_transcript, IkBeps_transcript, a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg4, flag_for_after_trigger + fr_after_trigger, k01, k1, k2, k2_eps, r1, r2, r3, r4, r5, r6, source, tp1, tp2, tr1, tr2, tr2a, tr2b, tr2e]
new_system = 
[
y30*y36,
y30*y37,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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
new_vars = fmpq_mpoly[IKK, IKK_IkBalpha, IKK_IkBalpha_NFkB, IKK_IkBbeta, IKK_IkBbeta_NFkB, IKK_IkBeps, IKK_IkBeps_NFkB, IkBalpha, IkBalpha_NFkB, IkBalpha_nuc, IkBalpha_nuc_NFkB_nuc, IkBalpha_transcript, IkBbeta, IkBbeta_NFkB, IkBbeta_nuc, IkBbeta_nuc_NFkB_nuc, IkBbeta_transcript, IkBeps, IkBeps_NFkB, IkBeps_nuc, IkBeps_nuc_NFkB_nuc, IkBeps_transcript, NFkB, NFkB_nuc, a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg4, flag_for_after_trigger + fr_after_trigger, k01, k1, k2, k2_eps, r1, r2, r3, r4, r5, r6, source, tp1, tp2, tr1, tr2, tr2a, tr2b, tr2e]
new_system = 
[
y2*y34 + y2*y46 + y3*y34 + y3*y49 + y4*y35 + y4*y47 + y5*y35 + y5*y50 + y6*y36 + y6*y48 + y7*y36 + y7*y51,
y1*y8*y25 + y3*y37,
y1*y9*y31 + y2*y23*y28,
y1*y13*y26 + y5*y38,
y1*y14*y32 + y4*y23*y29,
y1*y18*y27 + y7*y39,
y1*y19*y33 + y6*y23*y30,
y2*y34 + y9*y37 + y10*y54 + y12*y55,
y3*y34 + y8*y23*y28 + y11*y44,
y8*y53 + y11*y37,
y10*y24*y28,
2*y24*y56 + y52*y57,
y4*y35 + y14*y38 + 1//2*y15*y54 + y17*y55,
y5*y35 + y13*y23*y29 + 69//10000*y16*y41,
1//2*y13*y53 + y16*y38,
y15*y24*y29,
y52*y58,
y6*y36 + y19*y39 + 1//2*y20*y54 + y22*y55,
y7*y36 + y18*y23*y30 + 1//2*y21*y45,
1//2*y18*y53 + y21*y39,
y20*y24*y30,
y52*y59,
y3*y37 + y3*y49 + y5*y38 + y5*y50 + y7*y39 + y7*y51 + y9*y37 + y9*y40 + y14*y38 + y14*y40 + y19*y39 + y19*y40 + y24*y42,
y11*y37 + y16*y38 + y21*y39 + y23*y43,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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
new_vars = fmpq_mpoly[IKK, IKK_IkBalpha, IKK_IkBalpha_NFkB, IKK_IkBbeta, IKK_IkBbeta_NFkB, IKK_IkBeps, IKK_IkBeps_NFkB, IkBalpha, IkBalpha_NFkB, IkBalpha_nuc, IkBalpha_nuc_NFkB_nuc, IkBalpha_transcript, IkBbeta, IkBbeta_NFkB, IkBbeta_nuc, IkBbeta_nuc_NFkB_nuc, IkBbeta_transcript, IkBeps, IkBeps_NFkB, IkBeps_nuc, IkBeps_nuc_NFkB_nuc, IkBeps_transcript, NFkB, NFkB_nuc, a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg1, deg4, flag_for_after_trigger + fr_after_trigger, k01, k1, k2, k2_eps, r1, r2, r3, r4, r5, r6, source, tp1, tp2, tr1, tr2, tr2a, tr2b, tr2e]
new_system = 
[
y2*y34 + y2*y47 + y3*y34 + y3*y50 + y4*y35 + y4*y48 + y5*y35 + y5*y51 + y6*y36 + y6*y49 + y7*y36 + y7*y52,
y1*y8*y25 + y3*y37,
y1*y9*y31 + y2*y23*y28,
y1*y13*y26 + y5*y38,
y1*y14*y32 + y4*y23*y29,
y1*y18*y27 + y7*y39,
y1*y19*y33 + y6*y23*y30,
y2*y34 + y9*y37 + y10*y55 + y12*y56,
y3*y34 + y8*y23*y28 + y11*y45,
y8*y54 + y11*y37,
y10*y24*y28,
2*y24*y57 + y53*y58,
y4*y35 + y14*y38 + 1//2*y15*y55 + y17*y56,
y5*y35 + y13*y23*y29 + 69//10000*y16*y42,
1//2*y13*y54 + y16*y38,
y15*y24*y29,
y53*y59,
y6*y36 + y19*y39 + 1//2*y20*y55 + y22*y56,
y7*y36 + y18*y23*y30 + 1//2*y21*y46,
1//2*y18*y54 + y21*y39,
y20*y24*y30,
y53*y60,
y3*y37 + y3*y50 + y5*y38 + y5*y51 + y7*y39 + y7*y52 + y9*y37 + y9*y41 + y14*y38 + y14*y41 + y19*y39 + y19*y41 + y24*y43,
y11*y37 + y16*y38 + y21*y39 + y23*y44,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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
new_vars = fmpq_mpoly[IKK, IKK_IkBalpha, IKK_IkBalpha_NFkB, IKK_IkBbeta, IKK_IkBbeta_NFkB, IKK_IkBeps, IKK_IkBeps_NFkB, IkBalpha, IkBalpha_NFkB, IkBalpha_nuc, IkBalpha_nuc_NFkB_nuc, IkBalpha_transcript, IkBbeta, IkBbeta_NFkB, IkBbeta_nuc, IkBbeta_nuc_NFkB_nuc, IkBbeta_transcript, IkBeps, IkBeps_NFkB, IkBeps_nuc, IkBeps_nuc_NFkB_nuc, IkBeps_transcript, NFkB, NFkB_nuc, a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg1, deg4, flag_for_after_trigger + fr_after_trigger, k01, k02, k1, k2, k2_eps, r1, r2, r3, r4, r5, r6, source, tp1, tp2, tr1, tr2, tr2a, tr2b, tr2e]
new_system = 
[
y2*y34 + y2*y48 + y3*y34 + y3*y51 + y4*y35 + y4*y49 + y5*y35 + y5*y52 + y6*y36 + y6*y50 + y7*y36 + y7*y53,
y1*y8*y25 + y3*y37,
y1*y9*y31 + y2*y23*y28,
y1*y13*y26 + y5*y38,
y1*y14*y32 + y4*y23*y29,
y1*y18*y27 + y7*y39,
y1*y19*y33 + y6*y23*y30,
y2*y34 + y9*y37 + y10*y56 + y12*y57,
y3*y34 + y8*y23*y28 + y11*y46,
y8*y55 + y11*y37,
y10*y24*y28,
2*y24*y58 + y54*y59,
y4*y35 + y14*y38 + 1//2*y15*y56 + y17*y57,
y5*y35 + y13*y23*y29 + 69//10000*y16*y42,
1//2*y13*y55 + y16*y38,
y15*y24*y29,
y54*y60,
y6*y36 + y19*y39 + 1//2*y20*y56 + y22*y57,
y7*y36 + y18*y23*y30 + 1//2*y21*y47,
1//2*y18*y55 + y21*y39,
y20*y24*y30,
y54*y61,
y3*y37 + y3*y51 + y5*y38 + y5*y52 + y7*y39 + y7*y53 + y9*y37 + y9*y41 + y14*y38 + y14*y41 + y19*y39 + y19*y41 + y24*y43,
y11*y37 + y16*y38 + y21*y39 + y23*y45,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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
new_vars = fmpq_mpoly[IKK, IKK_IkBalpha, IKK_IkBalpha_NFkB, IKK_IkBbeta, IKK_IkBbeta_NFkB, IKK_IkBeps, IKK_IkBeps_NFkB, IkBalpha, IkBalpha_NFkB, IkBalpha_nuc, IkBalpha_nuc_NFkB_nuc, IkBalpha_transcript, IkBbeta, IkBbeta_NFkB, IkBbeta_nuc, IkBbeta_nuc_NFkB_nuc, IkBbeta_transcript, IkBeps, IkBeps_NFkB, IkBeps_nuc, IkBeps_nuc_NFkB_nuc, IkBeps_transcript, NFkB, NFkB_nuc, a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg1, deg4, flag_for_after_trigger + fr_after_trigger, k01, k02, k1, k2, k2_eps, r1, r2, r3, r4, r5, r6, source, tp1, tp2, tr1, tr2, tr2a, tr2b, tr2e, tr3]
new_system = 
[
y2*y34 + y2*y48 + y3*y34 + y3*y51 + y4*y35 + y4*y49 + y5*y35 + y5*y52 + y6*y36 + y6*y50 + y7*y36 + y7*y53,
y1*y8*y25 + y3*y37,
y1*y9*y31 + y2*y23*y28,
y1*y13*y26 + y5*y38,
y1*y14*y32 + y4*y23*y29,
y1*y18*y27 + y7*y39,
y1*y19*y33 + y6*y23*y30,
y2*y34 + y9*y37 + y10*y56 + y12*y57,
y3*y34 + y8*y23*y28 + y11*y46,
y8*y55 + y11*y37,
y10*y24*y28,
2*y24*y58 + y54*y59,
y4*y35 + y14*y38 + 1//2*y15*y56 + y17*y57,
y5*y35 + y13*y23*y29 + 69//10000*y16*y42,
1//2*y13*y55 + y16*y38,
y15*y24*y29,
y54*y60,
y6*y36 + y19*y39 + 1//2*y20*y56 + y22*y57,
y7*y36 + y18*y23*y30 + 1//2*y21*y47,
1//2*y18*y55 + y21*y39,
y20*y24*y30,
y54*y61,
y3*y37 + y3*y51 + y5*y38 + y5*y52 + y7*y39 + y7*y53 + y9*y37 + y9*y41 + y14*y38 + y14*y41 + y19*y39 + y19*y41 + y24*y43,
y11*y37 + y16*y38 + y21*y39 + y23*y45,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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
new_vars = fmpq_mpoly[IKK, IKK_IkBalpha, IKK_IkBalpha_NFkB, IKK_IkBbeta, IKK_IkBbeta_NFkB, IKK_IkBeps, IKK_IkBeps_NFkB, IkBalpha, IkBalpha_NFkB, IkBalpha_nuc, IkBalpha_nuc_NFkB_nuc, IkBalpha_transcript, IkBbeta, IkBbeta_NFkB, IkBbeta_nuc, IkBbeta_nuc_NFkB_nuc, IkBbeta_transcript, IkBeps, IkBeps_NFkB, IkBeps_nuc, IkBeps_nuc_NFkB_nuc, IkBeps_transcript, NFkB, NFkB_nuc, SINK, a1, a2, a3, a4, a5, a6, a7, a8, a9, d1, d2, d3, d4, d5, d6, deg1, deg4, flag_for_after_trigger + fr_after_trigger, k01, k02, k1, k2, k2_eps, r1, r2, r3, r4, r5, r6, source, tp1, tp2, tr1, tr2, tr2a, tr2b, tr2e, tr3]
new_system = 
[
y2*y35 + y2*y49 + y3*y35 + y3*y52 + y4*y36 + y4*y50 + y5*y36 + y5*y53 + y6*y37 + y6*y51 + y7*y37 + y7*y54,
y1*y8*y26 + y3*y38,
y1*y9*y32 + y2*y23*y29,
y1*y13*y27 + y5*y39,
y1*y14*y33 + y4*y23*y30,
y1*y18*y28 + y7*y40,
y1*y19*y34 + y6*y23*y31,
y2*y35 + y9*y38 + y10*y57 + y12*y58,
y3*y35 + y8*y23*y29 + y11*y47,
y8*y56 + y11*y38,
y10*y24*y29,
2*y24*y59 + y55*y60,
y4*y36 + y14*y39 + 1//2*y15*y57 + y17*y58,
y5*y36 + y13*y23*y30 + 69//10000*y16*y43,
1//2*y13*y56 + y16*y39,
y15*y24*y30,
y55*y61,
y6*y37 + y19*y40 + 1//2*y20*y57 + y22*y58,
y7*y37 + y18*y23*y31 + 1//2*y21*y48,
1//2*y18*y56 + y21*y40,
y20*y24*y31,
y55*y62,
y3*y38 + y3*y52 + y5*y39 + y5*y53 + y7*y40 + y7*y54 + y9*y38 + y9*y42 + y14*y39 + y14*y42 + y19*y40 + y19*y42 + y24*y44,
y11*y38 + y16*y39 + y21*y40 + y23*y46,
-y1*y45 - y8*y41 - y12*y63 - y13*y41 - y17*y63 - y18*y41 - y22*y63,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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


