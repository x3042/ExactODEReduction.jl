Original system:

[
NOdegrade => 112166666666667//100000000000000000000000000000000*sNO,
num_5prime_GMP => 129//20000000000000000000*PDE_slash_kenz_slash_kenz_cplx,
NO_GC => 166666666666667//10000000000000000000000000000000000*GC*sNO + 49//800000000000000000*NO_GC_slash_kenz_slash_kenz_cplx,
cGMP => 49//4000000000000000000*NO_GC_slash_kenz_slash_kenz_cplx + 129//5000000000000000000*PDE_slash_kenz_slash_kenz_cplx + 833333333333333//1000000000000000000000000000000000*cGMP_dot_PKG,
GTP => 49//1000000000000000000*NO_GC_slash_kenz_slash_kenz_cplx,
Gsub_star_ => 9//20000000000000000000*PP2A_Gsub_star_ + 3//2500000000000000000*cGMP_dot_PKG_slash_kenz_slash_kenz_cplx,
PDE => 129//4000000000000000000*PDE_slash_kenz_slash_kenz_cplx,
NO_GC_slash_kenz_slash_kenz_cplx => 136111666666667//100000000000000000000000000000000*GTP*NO_GC,
sNO => 416666666666667//100000000000000000000000000000000000*NO_GC,
PP2A_Gsub_star_ => 166666666666667//100000000000000000000000000000000*Gsub_star_*PP2A,
PDE_slash_kenz_slash_kenz_cplx => 129//8000000000000000000*PDE*cGMP,
Gsub => 166666666666667//1000000000000000000000000000000000000*Gsub_star_ + 3//625000000000000000*cGMP_dot_PKG_slash_kenz_slash_kenz_cplx,
PKG => 833333333333333//1000000000000000000000000000000000*cGMP_dot_PKG,
cGMP_dot_PKG => 166666666666667//10000000000000000000000000000000*PKG*cGMP + 3//500000000000000000*cGMP_dot_PKG_slash_kenz_slash_kenz_cplx,
GC => 0,
PP2A => 9//20000000000000000000*PP2A_Gsub_star_,
cGMP_dot_PKG_slash_kenz_slash_kenz_cplx => 3//100000000000000000*Gsub*cGMP_dot_PKG
]

Reductions:


new_vars = fmpq_mpoly[GC]
new_system = 
[
0
]


new_vars = fmpq_mpoly[GC, GTP, NO_GC, NO_GC_slash_kenz_slash_kenz_cplx, sNO]
new_system = 
[
0,
49//1000000000000000000*y4,
166666666666667//10000000000000000000000000000000000*y1*y5 + 49//800000000000000000*y4,
136111666666667//100000000000000000000000000000000*y2*y3,
416666666666667//100000000000000000000000000000000000*y3
]

Interesting
new_vars = fmpq_mpoly[GC, GTP, NO_GC, NO_GC_slash_kenz_slash_kenz_cplx, PDE + 5//4*PKG - 5//4*cGMP, sNO]
new_system = 
[
0,
49//1000000000000000000*y4,
166666666666667//10000000000000000000000000000000000*y1*y6 + 49//800000000000000000*y4,
136111666666667//100000000000000000000000000000000*y2*y3,
-49//3200000000000000000*y4,
416666666666667//100000000000000000000000000000000000*y3
]


new_vars = fmpq_mpoly[GC, GTP, Gsub, Gsub_star_, NO_GC, NO_GC_slash_kenz_slash_kenz_cplx, PDE, PDE_slash_kenz_slash_kenz_cplx, PKG, PP2A, PP2A_Gsub_star_, cGMP, cGMP_dot_PKG, cGMP_dot_PKG_slash_kenz_slash_kenz_cplx, sNO]
new_system = 
[
0,
49//1000000000000000000*y6,
166666666666667//1000000000000000000000000000000000000*y4 + 3//625000000000000000*y14,
9//20000000000000000000*y11 + 3//2500000000000000000*y14,
166666666666667//10000000000000000000000000000000000*y1*y15 + 49//800000000000000000*y6,
136111666666667//100000000000000000000000000000000*y2*y5,
129//4000000000000000000*y8,
129//8000000000000000000*y7*y12,
833333333333333//1000000000000000000000000000000000*y13,
9//20000000000000000000*y11,
166666666666667//100000000000000000000000000000000*y4*y10,
49//4000000000000000000*y6 + 129//5000000000000000000*y8 + 833333333333333//1000000000000000000000000000000000*y13,
166666666666667//10000000000000000000000000000000*y9*y12 + 3//500000000000000000*y14,
3//100000000000000000*y3*y13,
416666666666667//100000000000000000000000000000000000*y5
]


new_vars = fmpq_mpoly[GC, GTP, Gsub, Gsub_star_, NO_GC, NO_GC_slash_kenz_slash_kenz_cplx, NOdegrade, PDE, PDE_slash_kenz_slash_kenz_cplx, PKG, PP2A, PP2A_Gsub_star_, cGMP, cGMP_dot_PKG, cGMP_dot_PKG_slash_kenz_slash_kenz_cplx, sNO]
new_system = 
[
0,
49//1000000000000000000*y6,
166666666666667//1000000000000000000000000000000000000*y4 + 3//625000000000000000*y15,
9//20000000000000000000*y12 + 3//2500000000000000000*y15,
166666666666667//10000000000000000000000000000000000*y1*y16 + 49//800000000000000000*y6,
136111666666667//100000000000000000000000000000000*y2*y5,
112166666666667//100000000000000000000000000000000*y16,
129//4000000000000000000*y9,
129//8000000000000000000*y8*y13,
833333333333333//1000000000000000000000000000000000*y14,
9//20000000000000000000*y12,
166666666666667//100000000000000000000000000000000*y4*y11,
49//4000000000000000000*y6 + 129//5000000000000000000*y9 + 833333333333333//1000000000000000000000000000000000*y14,
166666666666667//10000000000000000000000000000000*y10*y13 + 3//500000000000000000*y15,
3//100000000000000000*y3*y14,
416666666666667//100000000000000000000000000000000000*y5
]


