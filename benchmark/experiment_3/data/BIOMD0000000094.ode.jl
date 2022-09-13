Original system:

[
STAT1n_STAT1n_star => 1//5000000*STAT1n*STAT1n_star + 1//200*STAT1n_star_STAT1n_star_PPN,
IFNRJ2_star_SOCS1 => 1//50*IFNRJ2_star*SOCS1 + 1//5*IFNRJ2_star_SHP2_SOCS1 + 4//5*IFNRJ2_star_SOCS1_STAT1c,
IFNRJ => 1//50*IFN*RJ + 1//10*IFNR*JAK + 2//5*IFNRJ2,
IFNR => 1//50*IFN*R + 1//20*IFNRJ,
STAT1n_star_STAT1n_star => 1//200*STAT1c_star_STAT1c_star + 1//25*STAT1n_star + 1//5*STAT1n_star_STAT1n_star_PPN,
mRNAn => 0,
IFNRJ2_star_SHP2_STAT1c => 201//2000*IFNRJ2_star_SHP2_SOCS1_STAT1c + 1//1000*IFNRJ2_star_STAT1c*SHP2,
IFNRJ2_star_STAT1c => 1//125*IFNRJ2_star*STAT1c + 1//5*IFNRJ2_star_SHP2_STAT1c + 201//2000*IFNRJ2_star_SOCS1_STAT1c,
STAT1c_STAT1c_star => 1//5000000*STAT1c*STAT1c_star + 3//1000*STAT1c_star_STAT1c_star_PPX,
SINK => -1//2000*SOCS1 - 1//2000*mRNAc,
R => 1//50*IFNR + 1//20*RJ,
RJ => 1//50*IFNRJ + 1//10*JAK*R,
JAK => 1//20*IFNRJ + 1//20*RJ,
SOCS1 => 103//1000*IFNRJ2_star_SHP2_SOCS1 + 103//1000*IFNRJ2_star_SHP2_SOCS1_STAT1c + 1//10*IFNRJ2_star_SOCS1 + 1//10*IFNRJ2_star_SOCS1_STAT1c + 1//100*mRNAc,
STAT1c_star => 2//5*IFNRJ2_star_STAT1c + 1//2*IFNRJ2_star_STAT1c_star + 1//5*STAT1c_STAT1c_star + 1//5*STAT1c_star_PPX + 1//5*STAT1c_star_STAT1c_star,
STAT1c_star_STAT1c_star_PPX => 1//1000*PPX*STAT1c_star_STAT1c_star,
PPX => 203//1000*STAT1c_star_PPX + 203//1000*STAT1c_star_STAT1c_star_PPX,
IFNRJ2_star_SHP2 => 1//1000*IFNRJ2_star*SHP2 + 201//2000*IFNRJ2_star_SHP2_SOCS1,
IFNRJ2_star => 1//200*IFNRJ2 + 1//5*IFNRJ2_star_SHP2 + 201//2000*IFNRJ2_star_SOCS1 + 6//5*IFNRJ2_star_STAT1c + 1//2*IFNRJ2_star_STAT1c_star,
mRNAc => 1//1000*mRNAn,
IFNRJ2_star_SHP2_SOCS1_STAT1c => 1//125*IFNRJ2_star_SHP2_SOCS1*STAT1c + 1//50*IFNRJ2_star_SHP2_STAT1c*SOCS1 + 1//1000*IFNRJ2_star_SOCS1_STAT1c*SHP2,
IFNRJ2 => 2//25*IFNRJ + 3//1000*IFNRJ2_star_SHP2 + 3//1000*IFNRJ2_star_SHP2_SOCS1 + 3//1000*IFNRJ2_star_SHP2_SOCS1_STAT1c + 3//1000*IFNRJ2_star_SHP2_STAT1c,
IFN => 0,
IFNRJ2_star_SOCS1_STAT1c => 1//5*IFNRJ2_star_SHP2_SOCS1_STAT1c + 1//125*IFNRJ2_star_SOCS1*STAT1c + 1//50*IFNRJ2_star_STAT1c*SOCS1,
STAT1n_star_PPN => 1//1000*PPN*STAT1n_star,
STAT1c_star_STAT1c_star => 1//25*STAT1c_star + 1//5*STAT1c_star_STAT1c_star_PPX,
STAT1n => 1//5*STAT1n_STAT1n_star + 1//200*STAT1n_star_PPN,
STAT1n_star => 1//5*STAT1n_STAT1n_star + 1//5*STAT1n_star_PPN + 1//5*STAT1n_star_STAT1n_star,
STAT1c_star_PPX => 1//1000*PPX*STAT1c_star,
PPN => 41//200*STAT1n_star_PPN + 41//200*STAT1n_star_STAT1n_star_PPN,
IFNRJ2_star_STAT1c_star => 1//200*IFNRJ2_star*STAT1c_star,
IFNRJ2_star_SHP2_SOCS1 => 1//50*IFNRJ2_star_SHP2*SOCS1 + 4//5*IFNRJ2_star_SHP2_SOCS1_STAT1c + 1//1000*IFNRJ2_star_SOCS1*SHP2,
SHP2 => 203//1000*IFNRJ2_star_SHP2 + 203//1000*IFNRJ2_star_SHP2_SOCS1 + 203//1000*IFNRJ2_star_SHP2_SOCS1_STAT1c + 203//1000*IFNRJ2_star_SHP2_STAT1c,
STAT1n_star_STAT1n_star_PPN => 1//1000*PPN*STAT1n_star_STAT1n_star,
STAT1c => 803//1000*IFNRJ2_star_SHP2_SOCS1_STAT1c + 3//1000*IFNRJ2_star_SHP2_STAT1c + 4//5*IFNRJ2_star_SOCS1_STAT1c + 4//5*IFNRJ2_star_STAT1c + 1//5*STAT1c_STAT1c_star + 3//1000*STAT1c_star_PPX + 1//20*STAT1n
]

Reductions:


new_vars = fmpq_mpoly[IFN]
new_system = 
[
0
]


new_vars = fmpq_mpoly[IFN, mRNAn]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[IFN, mRNAc, mRNAn]
new_system = 
[
0,
1//1000*y3,
0
]


new_vars = fmpq_mpoly[IFN, IFNR, IFNRJ, IFNRJ2, IFNRJ2_star, IFNRJ2_star_SHP2, IFNRJ2_star_SHP2_SOCS1, IFNRJ2_star_SHP2_SOCS1_STAT1c, IFNRJ2_star_SHP2_STAT1c, IFNRJ2_star_SOCS1, IFNRJ2_star_SOCS1_STAT1c, IFNRJ2_star_STAT1c, IFNRJ2_star_STAT1c_star, JAK, PPN, PPX, R, RJ, SHP2, SOCS1, STAT1c, STAT1c_STAT1c_star, STAT1c_star, STAT1c_star_PPX, STAT1c_star_STAT1c_star, STAT1c_star_STAT1c_star_PPX, STAT1n, STAT1n_STAT1n_star, STAT1n_star, STAT1n_star_PPN, STAT1n_star_STAT1n_star, STAT1n_star_STAT1n_star_PPN, mRNAc, mRNAn]
new_system = 
[
0,
1//50*y1*y17 + 1//20*y3,
1//50*y1*y18 + 1//10*y2*y14 + 2//5*y4,
2//25*y3 + 3//1000*y6 + 3//1000*y7 + 3//1000*y8 + 3//1000*y9,
1//200*y4 + 1//5*y6 + 201//2000*y10 + 6//5*y12 + 1//2*y13,
1//1000*y5*y19 + 201//2000*y7,
1//50*y6*y20 + 4//5*y8 + 1//1000*y10*y19,
1//125*y7*y21 + 1//50*y9*y20 + 1//1000*y11*y19,
201//2000*y8 + 1//1000*y12*y19,
1//50*y5*y20 + 1//5*y7 + 4//5*y11,
1//5*y8 + 1//125*y10*y21 + 1//50*y12*y20,
1//125*y5*y21 + 1//5*y9 + 201//2000*y11,
1//200*y5*y23,
1//20*y3 + 1//20*y18,
41//200*y30 + 41//200*y32,
203//1000*y24 + 203//1000*y26,
1//50*y2 + 1//20*y18,
1//50*y3 + 1//10*y14*y17,
203//1000*y6 + 203//1000*y7 + 203//1000*y8 + 203//1000*y9,
103//1000*y7 + 103//1000*y8 + 1//10*y10 + 1//10*y11 + 1//100*y33,
803//1000*y8 + 3//1000*y9 + 4//5*y11 + 4//5*y12 + 1//5*y22 + 3//1000*y24 + 1//20*y27,
1//5000000*y21*y23 + 3//1000*y26,
2//5*y12 + 1//2*y13 + 1//5*y22 + 1//5*y24 + 1//5*y25,
1//1000*y16*y23,
1//25*y23 + 1//5*y26,
1//1000*y16*y25,
1//5*y28 + 1//200*y30,
1//5000000*y27*y29 + 1//200*y32,
1//5*y28 + 1//5*y30 + 1//5*y31,
1//1000*y15*y29,
1//200*y25 + 1//25*y29 + 1//5*y32,
1//1000*y15*y31,
1//1000*y34,
0
]


