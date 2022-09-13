Original system:

[
G6Pase => 243073//50000*FOX01,
p1IR_complex => 778161//100000*IR_complex*insulin + 28443//100000*p1p2IR_complex,
GSK3b => 4623//5000*pGSK3b,
p2IR_complex => 993311//100000*IR_complex*pmTOR + 40813//100000*p1p2IR_complex,
X => 73//50000*pX,
AKT => 770619//100000*pAKT,
pmTOR => 2623//6250*mTOR*pAKT,
phi_1 => 99//12500*p1IR_complex,
p1p2IR_complex => 36303//100000*insulin*p2IR_complex + 1//25000*p1IR_complex*pmTOR,
insulin => 40287//25000*p1IR_complex + 40813//100000*p1p2IR_complex,
pS6K => 47//6250*S6K*pmTOR,
S6K => 97749//50000*pS6K*pX,
IR_complex => 40287//25000*p1IR_complex + 1//100000*p2IR_complex + 239//5000*proIR_complex,
phi_4 => 687//12500*G6Pase,
pFOX01 => 229849//50000*FOX01*pAKT,
proIR_complex => 239//5000*IR_complex,
mTOR => 12433//100000*pmTOR,
phi_2 => 1//100000*p2IR_complex,
pAKT => 23//2500*AKT*p1IR_complex,
pGSK3b => 148769//50000*GSK3b*pAKT,
phi_3 => 949//10000*p1p2IR_complex,
pX => 21//20000*X*pmTOR,
FOX01 => 3793//25000*pFOX01
]

Reductions:


new_vars = fmpq_mpoly[AKT, IR_complex, insulin, mTOR, p1IR_complex, p1p2IR_complex, p2IR_complex, pAKT, pmTOR, proIR_complex]
new_system = 
[
770619//100000*y8,
40287//25000*y5 + 1//100000*y7 + 239//5000*y10,
40287//25000*y5 + 40813//100000*y6,
12433//100000*y9,
778161//100000*y2*y3 + 28443//100000*y6,
36303//100000*y3*y7 + 1//25000*y5*y9,
993311//100000*y2*y9 + 40813//100000*y6,
23//2500*y1*y5,
2623//6250*y4*y8,
239//5000*y2
]


new_vars = fmpq_mpoly[AKT, FOX01, IR_complex, insulin, mTOR, p1IR_complex, p1p2IR_complex, p2IR_complex, pAKT, pFOX01, pmTOR, proIR_complex]
new_system = 
[
770619//100000*y9,
3793//25000*y10,
40287//25000*y6 + 1//100000*y8 + 239//5000*y12,
40287//25000*y6 + 40813//100000*y7,
12433//100000*y11,
778161//100000*y3*y4 + 28443//100000*y7,
36303//100000*y4*y8 + 1//25000*y6*y11,
993311//100000*y3*y11 + 40813//100000*y7,
23//2500*y1*y6,
229849//50000*y2*y9,
2623//6250*y5*y9,
239//5000*y3
]


new_vars = fmpq_mpoly[AKT, FOX01, G6Pase, IR_complex, insulin, mTOR, p1IR_complex, p1p2IR_complex, p2IR_complex, pAKT, pFOX01, pmTOR, proIR_complex]
new_system = 
[
770619//100000*y10,
3793//25000*y11,
243073//50000*y2,
40287//25000*y7 + 1//100000*y9 + 239//5000*y13,
40287//25000*y7 + 40813//100000*y8,
12433//100000*y12,
778161//100000*y4*y5 + 28443//100000*y8,
36303//100000*y5*y9 + 1//25000*y7*y12,
993311//100000*y4*y12 + 40813//100000*y8,
23//2500*y1*y7,
229849//50000*y2*y10,
2623//6250*y6*y10,
239//5000*y4
]


new_vars = fmpq_mpoly[AKT, FOX01, G6Pase, GSK3b, IR_complex, insulin, mTOR, p1IR_complex, p1p2IR_complex, p2IR_complex, pAKT, pFOX01, pGSK3b, pmTOR, proIR_complex]
new_system = 
[
770619//100000*y11,
3793//25000*y12,
243073//50000*y2,
4623//5000*y13,
40287//25000*y8 + 1//100000*y10 + 239//5000*y15,
40287//25000*y8 + 40813//100000*y9,
12433//100000*y14,
778161//100000*y5*y6 + 28443//100000*y9,
36303//100000*y6*y10 + 1//25000*y8*y14,
993311//100000*y5*y14 + 40813//100000*y9,
23//2500*y1*y8,
229849//50000*y2*y11,
148769//50000*y4*y11,
2623//6250*y7*y11,
239//5000*y5
]


new_vars = fmpq_mpoly[AKT, FOX01, G6Pase, GSK3b, IR_complex, X, insulin, mTOR, p1IR_complex, p1p2IR_complex, p2IR_complex, pAKT, pFOX01, pGSK3b, pX, pmTOR, proIR_complex]
new_system = 
[
770619//100000*y12,
3793//25000*y13,
243073//50000*y2,
4623//5000*y14,
40287//25000*y9 + 1//100000*y11 + 239//5000*y17,
73//50000*y15,
40287//25000*y9 + 40813//100000*y10,
12433//100000*y16,
778161//100000*y5*y7 + 28443//100000*y10,
36303//100000*y7*y11 + 1//25000*y9*y16,
993311//100000*y5*y16 + 40813//100000*y10,
23//2500*y1*y9,
229849//50000*y2*y12,
148769//50000*y4*y12,
21//20000*y6*y16,
2623//6250*y8*y12,
239//5000*y5
]


new_vars = fmpq_mpoly[AKT, FOX01, G6Pase, GSK3b, IR_complex, S6K, X, insulin, mTOR, p1IR_complex, p1p2IR_complex, p2IR_complex, pAKT, pFOX01, pGSK3b, pS6K, pX, pmTOR, proIR_complex]
new_system = 
[
770619//100000*y13,
3793//25000*y14,
243073//50000*y2,
4623//5000*y15,
40287//25000*y10 + 1//100000*y12 + 239//5000*y19,
97749//50000*y16*y17,
73//50000*y17,
40287//25000*y10 + 40813//100000*y11,
12433//100000*y18,
778161//100000*y5*y8 + 28443//100000*y11,
36303//100000*y8*y12 + 1//25000*y10*y18,
993311//100000*y5*y18 + 40813//100000*y11,
23//2500*y1*y10,
229849//50000*y2*y13,
148769//50000*y4*y13,
47//6250*y6*y18,
21//20000*y7*y18,
2623//6250*y9*y13,
239//5000*y5
]


new_vars = fmpq_mpoly[AKT, FOX01, G6Pase, GSK3b, IR_complex, S6K, X, insulin, mTOR, p1IR_complex, p1p2IR_complex, p2IR_complex, pAKT, pFOX01, pGSK3b, pS6K, pX, phi_1, pmTOR, proIR_complex]
new_system = 
[
770619//100000*y13,
3793//25000*y14,
243073//50000*y2,
4623//5000*y15,
40287//25000*y10 + 1//100000*y12 + 239//5000*y20,
97749//50000*y16*y17,
73//50000*y17,
40287//25000*y10 + 40813//100000*y11,
12433//100000*y19,
778161//100000*y5*y8 + 28443//100000*y11,
36303//100000*y8*y12 + 1//25000*y10*y19,
993311//100000*y5*y19 + 40813//100000*y11,
23//2500*y1*y10,
229849//50000*y2*y13,
148769//50000*y4*y13,
47//6250*y6*y19,
21//20000*y7*y19,
99//12500*y10,
2623//6250*y9*y13,
239//5000*y5
]


new_vars = fmpq_mpoly[AKT, FOX01, G6Pase, GSK3b, IR_complex, S6K, X, insulin, mTOR, p1IR_complex, p1p2IR_complex, p2IR_complex, pAKT, pFOX01, pGSK3b, pS6K, pX, phi_1, phi_2, pmTOR, proIR_complex]
new_system = 
[
770619//100000*y13,
3793//25000*y14,
243073//50000*y2,
4623//5000*y15,
40287//25000*y10 + 1//100000*y12 + 239//5000*y21,
97749//50000*y16*y17,
73//50000*y17,
40287//25000*y10 + 40813//100000*y11,
12433//100000*y20,
778161//100000*y5*y8 + 28443//100000*y11,
36303//100000*y8*y12 + 1//25000*y10*y20,
993311//100000*y5*y20 + 40813//100000*y11,
23//2500*y1*y10,
229849//50000*y2*y13,
148769//50000*y4*y13,
47//6250*y6*y20,
21//20000*y7*y20,
99//12500*y10,
1//100000*y12,
2623//6250*y9*y13,
239//5000*y5
]


new_vars = fmpq_mpoly[AKT, FOX01, G6Pase, GSK3b, IR_complex, S6K, X, insulin, mTOR, p1IR_complex, p1p2IR_complex, p2IR_complex, pAKT, pFOX01, pGSK3b, pS6K, pX, phi_1, phi_2, phi_3, pmTOR, proIR_complex]
new_system = 
[
770619//100000*y13,
3793//25000*y14,
243073//50000*y2,
4623//5000*y15,
40287//25000*y10 + 1//100000*y12 + 239//5000*y22,
97749//50000*y16*y17,
73//50000*y17,
40287//25000*y10 + 40813//100000*y11,
12433//100000*y21,
778161//100000*y5*y8 + 28443//100000*y11,
36303//100000*y8*y12 + 1//25000*y10*y21,
993311//100000*y5*y21 + 40813//100000*y11,
23//2500*y1*y10,
229849//50000*y2*y13,
148769//50000*y4*y13,
47//6250*y6*y21,
21//20000*y7*y21,
99//12500*y10,
1//100000*y12,
949//10000*y11,
2623//6250*y9*y13,
239//5000*y5
]


