Original system:

[
Imidazole => 27//200000000000000000*Im_minus_nNOS_minus_L_minus_Arginine - 3//4000000000000000000*Imidazole*nNOS_minus_L_minus_Arginine,
Im_minus_nNOS_minus_L_minus_Arginine => 416666666666667//1000000000000000000000000000000*Im_minus_nNOS*L_minus_Arginine - 208468333333333//1000000000000000000000000000*Im_minus_nNOS_minus_L_minus_Arginine + 3//4000000000000000000*Imidazole*nNOS_minus_L_minus_Arginine,
L_minus_Arginine => -416666666666667//1000000000000000000000000000000*Im_minus_nNOS*L_minus_Arginine + 208333333333333//1000000000000000000000000000*Im_minus_nNOS_minus_L_minus_Arginine,
Im_minus_nNOS => -416666666666667//1000000000000000000000000000000*Im_minus_nNOS*L_minus_Arginine + 208333333333333//1000000000000000000000000000*Im_minus_nNOS_minus_L_minus_Arginine,
nNOS_minus_L_minus_Arginine => 27//200000000000000000*Im_minus_nNOS_minus_L_minus_Arginine - 3//4000000000000000000*Imidazole*nNOS_minus_L_minus_Arginine
]

Reductions:

Interesting
new_vars = fmpq_mpoly[Im_minus_nNOS - L_minus_Arginine]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[Im_minus_nNOS + Im_minus_nNOS_minus_L_minus_Arginine + nNOS_minus_L_minus_Arginine, Im_minus_nNOS_minus_L_minus_Arginine + L_minus_Arginine + nNOS_minus_L_minus_Arginine]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[Im_minus_nNOS + Im_minus_nNOS_minus_L_minus_Arginine + Imidazole, Im_minus_nNOS + Im_minus_nNOS_minus_L_minus_Arginine + nNOS_minus_L_minus_Arginine, Im_minus_nNOS_minus_L_minus_Arginine + L_minus_Arginine + nNOS_minus_L_minus_Arginine]
new_system = 
[
0,
0,
0
]


