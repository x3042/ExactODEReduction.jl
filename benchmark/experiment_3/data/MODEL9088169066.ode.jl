Original system:

[
Imidazole => 9//200000000000000000*Im_minus_nNOS_minus_NM_minus_Arginine - 333333333333333//1000000000000000000000000000000000*Imidazole*nNOS_minus_NM_minus_Arginine,
Im_minus_nNOS_minus_NM_minus_Arginine => 416666666666667//10000000000000000000000000000000*Im_minus_nNOS*NM_minus_Arginine - 708783333333333//10000000000000000000000000000*Im_minus_nNOS_minus_NM_minus_Arginine + 333333333333333//1000000000000000000000000000000000*Imidazole*nNOS_minus_NM_minus_Arginine,
NM_minus_Arginine => -416666666666667//10000000000000000000000000000000*Im_minus_nNOS*NM_minus_Arginine + 708333333333333//10000000000000000000000000000*Im_minus_nNOS_minus_NM_minus_Arginine,
Im_minus_nNOS => -416666666666667//10000000000000000000000000000000*Im_minus_nNOS*NM_minus_Arginine + 708333333333333//10000000000000000000000000000*Im_minus_nNOS_minus_NM_minus_Arginine,
nNOS_minus_NM_minus_Arginine => 9//200000000000000000*Im_minus_nNOS_minus_NM_minus_Arginine - 333333333333333//1000000000000000000000000000000000*Imidazole*nNOS_minus_NM_minus_Arginine
]

Reductions:

Interesting
new_vars = fmpq_mpoly[Im_minus_nNOS - NM_minus_Arginine]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[Im_minus_nNOS + Im_minus_nNOS_minus_NM_minus_Arginine + nNOS_minus_NM_minus_Arginine, Im_minus_nNOS_minus_NM_minus_Arginine + NM_minus_Arginine + nNOS_minus_NM_minus_Arginine]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[Im_minus_nNOS + Im_minus_nNOS_minus_NM_minus_Arginine + Imidazole, Im_minus_nNOS + Im_minus_nNOS_minus_NM_minus_Arginine + nNOS_minus_NM_minus_Arginine, Im_minus_nNOS_minus_NM_minus_Arginine + NM_minus_Arginine + nNOS_minus_NM_minus_Arginine]
new_system = 
[
0,
0,
0
]


