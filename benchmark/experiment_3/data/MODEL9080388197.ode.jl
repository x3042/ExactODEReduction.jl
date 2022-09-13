Original system:

[
PKC_slash_PKC_minus_DAG => 3//5000000000000000*DAG*PKC_slash_PKC_minus_cytosolic + 1//500000000000*PKC_slash_PKC_minus_DAG_minus_AA,
DAG => 0,
AA => 0,
PKC_slash_PKC_minus_Ca => 3//5000000000000*Ca*PKC_slash_PKC_minus_cytosolic + 1//10000000000000*PKC_slash_PKC_minus_Ca_minus_AA_star_ + 21587//2500000000000000*PKC_slash_PKC_minus_Ca_minus_DAG + 17513//5000000000000000*PKC_slash_PKC_minus_Ca_minus_memb_star_,
PKC_slash_PKC_minus_Ca_minus_DAG => 39999//5000000000000000000*DAG*PKC_slash_PKC_minus_Ca + 1//10000000000000*PKC_slash_PKC_minus_DAG_minus_memb_star_,
PKC_slash_PKC_minus_AA_star_ => 3//25000000000000000*AA*PKC_slash_PKC_minus_cytosolic,
PKC_slash_PKC_minus_basal_star_ => 1//1000000000000*PKC_slash_PKC_minus_cytosolic,
PKC_slash_PKC_minus_DAG_minus_AA => 9//500000000000000*AA*PKC_slash_PKC_minus_DAG + 1//5000000000000*PKC_slash_PKC_minus_DAG_minus_AA_star_,
PKC_slash_PKC_minus_DAG_minus_memb_star_ => 1//1000000000000*PKC_slash_PKC_minus_Ca_minus_DAG,
PKC_slash_PKC_minus_cytosolic => 1//10000000000000*PKC_slash_PKC_minus_AA_star_ + 1//2000000000000*PKC_slash_PKC_minus_Ca + 1//10000000000000*PKC_slash_PKC_minus_DAG + 1//20000000000*PKC_slash_PKC_minus_basal_star_,
PKC_slash_PKC_minus_Ca_minus_memb_star_ => 2541//2000000000000000*PKC_slash_PKC_minus_Ca,
PKC_slash_PKC_minus_DAG_minus_AA_star_ => 1//500000000000*PKC_slash_PKC_minus_DAG_minus_AA,
Ca => 0,
PKC_slash_PKC_minus_Ca_minus_AA_star_ => 3//2500000000000000*AA*PKC_slash_PKC_minus_Ca
]

Reductions:


new_vars = fmpq_mpoly[AA]
new_system = 
[
0
]


new_vars = fmpq_mpoly[AA, Ca]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[AA, Ca, DAG]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[AA, Ca, DAG, PKC_slash_PKC_minus_AA_star_ + 500*PKC_slash_PKC_minus_basal_star_, PKC_slash_PKC_minus_Ca, 500*PKC_slash_PKC_minus_Ca_minus_AA_star_ + 17513*PKC_slash_PKC_minus_Ca_minus_memb_star_, PKC_slash_PKC_minus_Ca_minus_DAG, PKC_slash_PKC_minus_DAG, PKC_slash_PKC_minus_DAG_minus_AA, PKC_slash_PKC_minus_DAG_minus_AA_star_, PKC_slash_PKC_minus_DAG_minus_memb_star_, PKC_slash_PKC_minus_cytosolic]
new_system = 
[
0,
0,
0,
3//25000000000000000*y1*y12 + 1//2000000000*y12,
3//5000000000000*y2*y12 + 1//5000000000000000*y6 + 21587//2500000000000000*y7,
3//5000000000000*y1*y5 + 44500533//2000000000000000*y5,
39999//5000000000000000000*y3*y5 + 1//10000000000000*y11,
3//5000000000000000*y3*y12 + 1//500000000000*y9,
9//500000000000000*y1*y8 + 1//5000000000000*y10,
1//500000000000*y9,
1//1000000000000*y7,
1//10000000000000*y4 + 1//2000000000000*y5 + 1//10000000000000*y8
]

Interesting
new_vars = fmpq_mpoly[AA, Ca, DAG, PKC_slash_PKC_minus_AA_star_, PKC_slash_PKC_minus_Ca, 500*PKC_slash_PKC_minus_Ca_minus_AA_star_ + 17513*PKC_slash_PKC_minus_Ca_minus_memb_star_, PKC_slash_PKC_minus_Ca_minus_DAG, PKC_slash_PKC_minus_DAG, PKC_slash_PKC_minus_DAG_minus_AA, PKC_slash_PKC_minus_DAG_minus_AA_star_, PKC_slash_PKC_minus_DAG_minus_memb_star_, PKC_slash_PKC_minus_basal_star_, PKC_slash_PKC_minus_cytosolic]
new_system = 
[
0,
0,
0,
3//25000000000000000*y1*y13,
3//5000000000000*y2*y13 + 1//5000000000000000*y6 + 21587//2500000000000000*y7,
3//5000000000000*y1*y5 + 44500533//2000000000000000*y5,
39999//5000000000000000000*y3*y5 + 1//10000000000000*y11,
3//5000000000000000*y3*y13 + 1//500000000000*y9,
9//500000000000000*y1*y8 + 1//5000000000000*y10,
1//500000000000*y9,
1//1000000000000*y7,
1//1000000000000*y13,
1//10000000000000*y4 + 1//2000000000000*y5 + 1//10000000000000*y8 + 1//20000000000*y12
]


