Original system:

[
Imidazole => 19//200000000000000000*Im_minus_nNOS_minus_NOH_minus_Arginine - 116666666666667//1000000000000000000000000000000000*Imidazole*nNOS_minus_NOH_minus_Arginine,
Im_minus_nNOS_minus_NOH_minus_Arginine => 416666666666667//10000000000000000000000000000000*Im_minus_nNOS*NOH_minus_Arginine - 22519//200000000000000000*Im_minus_nNOS_minus_NOH_minus_Arginine + 116666666666667//1000000000000000000000000000000000*Imidazole*nNOS_minus_NOH_minus_Arginine,
NOH_minus_Arginine => -416666666666667//10000000000000000000000000000000*Im_minus_nNOS*NOH_minus_Arginine + 9//80000000000000*Im_minus_nNOS_minus_NOH_minus_Arginine,
Im_minus_nNOS => -416666666666667//10000000000000000000000000000000*Im_minus_nNOS*NOH_minus_Arginine + 9//80000000000000*Im_minus_nNOS_minus_NOH_minus_Arginine,
nNOS_minus_NOH_minus_Arginine => 19//200000000000000000*Im_minus_nNOS_minus_NOH_minus_Arginine - 116666666666667//1000000000000000000000000000000000*Imidazole*nNOS_minus_NOH_minus_Arginine
]

Reductions:

Interesting
new_vars = fmpq_mpoly[Im_minus_nNOS - NOH_minus_Arginine]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[Im_minus_nNOS + Im_minus_nNOS_minus_NOH_minus_Arginine + nNOS_minus_NOH_minus_Arginine, Im_minus_nNOS_minus_NOH_minus_Arginine + NOH_minus_Arginine + nNOS_minus_NOH_minus_Arginine]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[Im_minus_nNOS + Im_minus_nNOS_minus_NOH_minus_Arginine + Imidazole, Im_minus_nNOS + Im_minus_nNOS_minus_NOH_minus_Arginine + nNOS_minus_NOH_minus_Arginine, Im_minus_nNOS_minus_NOH_minus_Arginine + NOH_minus_Arginine + nNOS_minus_NOH_minus_Arginine]
new_system = 
[
0,
0,
0
]


