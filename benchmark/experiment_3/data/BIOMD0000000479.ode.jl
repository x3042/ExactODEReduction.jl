Original system:

[
LRGabg => 1//50*Gabg*LR + 1//200*L*RGabg,
R => 100*RRGSm,
z1 => GaGTPEffector*ka,
RRGSmGabg => 1//200*Gabg*RRGSm + 1//10*RGSc*RGabg,
LRRGSmGabg => 1//50*Gabg*LRRGSm + 1//200*L*RRGSmGabg + 1//10*LRGabg*RGSc,
RGSc => 1//200*RGSm + 51//20*RGSmGaGTP + 3//10*RGSmGaGTPEffectorOFF,
RGSmGaGTP => 60*GaGTP*RGSc + 500*GaGTP*RGSm,
RGabg => 1//200*Gabg*R + 1//10*RRGSmGabg,
GaGDP => 1000*GaGDPP,
LRRGSmGaGTP => 100*GaGTP*LRRGSm,
GaGTPEffector => 10*Effector*GaGTP,
Gabg => 1000*GaGDP*Gbg,
LRRGSm => 1//200*L*RRGSm + 1//10*LR*RGSc + 5//2*LRRGSmGaGTP + 3//10*LRRGSmGaGTPEffectorOFF + 40*LRRGSmGabg,
P => 1000*GaGDPP,
RGSm => 100*LRRGSm + 1//2000*RGSc + 100*RRGSm + 1//10*RRGSmGabg,
Effector => 1//200*GaGTPEffectorOFF + 3//10*LRRGSmGaGTPEffectorOFF + 3//10*RGSmGaGTPEffectorOFF,
RRGSmGaGTP => 1//2*GaGTP*RRGSm,
ka => 0,
GaGDPP => 1//200*GaGTP + 1//200*GaGTPEffectorOFF + 5//2*LRRGSmGaGTP + 3//10*LRRGSmGaGTPEffectorOFF + 5//2*RGSmGaGTP + 3//10*RGSmGaGTPEffectorOFF + 1//2*RRGSmGaGTP,
LR => 1//400*L*R + 50*LRGabg + 100*LRRGSm,
RGSmGaGTPEffectorOFF => 1//10000*GaGTPEffectorOFF*RGSc + 50*GaGTPEffectorOFF*RGSm,
z3 => ka*z2,
z2 => ka*z1,
GaGTPEffectorOFF => GaGTPEffector,
Gbg => 1//5*Gabg + 50*LRGabg + 40*LRRGSmGabg,
GaGTP => 1//5*Gabg + 50*LRGabg + 40*LRRGSmGabg + 1//20*RGSmGaGTP,
L => 0,
LRRGSmGaGTPEffectorOFF => 50*GaGTPEffectorOFF*LRRGSm,
RRGSm => 1//10*R*RGSc + 1//2*RRGSmGaGTP
]

Reductions:


new_vars = fmpq_mpoly[L]
new_system = 
[
0
]


new_vars = fmpq_mpoly[Effector, GaGDP, GaGDPP, GaGTP, GaGTPEffector, GaGTPEffectorOFF, Gabg, Gbg, L, LR, LRGabg, LRRGSm, LRRGSmGaGTP, LRRGSmGaGTPEffectorOFF, LRRGSmGabg, R, RGSc, RGSm, RGSmGaGTP, RGSmGaGTPEffectorOFF, RGabg, RRGSm, RRGSmGaGTP, RRGSmGabg]
new_system = 
[
1//200*y6 + 3//10*y14 + 3//10*y20,
1000*y3,
1//200*y4 + 1//200*y6 + 5//2*y13 + 3//10*y14 + 5//2*y19 + 3//10*y20 + 1//2*y23,
1//5*y7 + 50*y11 + 40*y15 + 1//20*y19,
10*y1*y4,
y5,
1000*y2*y8,
1//5*y7 + 50*y11 + 40*y15,
0,
1//400*y9*y16 + 50*y11 + 100*y12,
1//50*y7*y10 + 1//200*y9*y21,
1//200*y9*y22 + 1//10*y10*y17 + 5//2*y13 + 3//10*y14 + 40*y15,
100*y4*y12,
50*y6*y12,
1//50*y7*y12 + 1//200*y9*y24 + 1//10*y11*y17,
100*y22,
1//200*y18 + 51//20*y19 + 3//10*y20,
100*y12 + 1//2000*y17 + 100*y22 + 1//10*y24,
60*y4*y17 + 500*y4*y18,
1//10000*y6*y17 + 50*y6*y18,
1//200*y7*y16 + 1//10*y24,
1//10*y16*y17 + 1//2*y23,
1//2*y4*y22,
1//200*y7*y22 + 1//10*y17*y21
]


new_vars = fmpq_mpoly[Effector, GaGDP, GaGDPP, GaGTP, GaGTPEffector, GaGTPEffectorOFF, Gabg, Gbg, L, LR, LRGabg, LRRGSm, LRRGSmGaGTP, LRRGSmGaGTPEffectorOFF, LRRGSmGabg, P, R, RGSc, RGSm, RGSmGaGTP, RGSmGaGTPEffectorOFF, RGabg, RRGSm, RRGSmGaGTP, RRGSmGabg]
new_system = 
[
1//200*y6 + 3//10*y14 + 3//10*y21,
1000*y3,
1//200*y4 + 1//200*y6 + 5//2*y13 + 3//10*y14 + 5//2*y20 + 3//10*y21 + 1//2*y24,
1//5*y7 + 50*y11 + 40*y15 + 1//20*y20,
10*y1*y4,
y5,
1000*y2*y8,
1//5*y7 + 50*y11 + 40*y15,
0,
1//400*y9*y17 + 50*y11 + 100*y12,
1//50*y7*y10 + 1//200*y9*y22,
1//200*y9*y23 + 1//10*y10*y18 + 5//2*y13 + 3//10*y14 + 40*y15,
100*y4*y12,
50*y6*y12,
1//50*y7*y12 + 1//200*y9*y25 + 1//10*y11*y18,
1000*y3,
100*y23,
1//200*y19 + 51//20*y20 + 3//10*y21,
100*y12 + 1//2000*y18 + 100*y23 + 1//10*y25,
60*y4*y18 + 500*y4*y19,
1//10000*y6*y18 + 50*y6*y19,
1//200*y7*y17 + 1//10*y25,
1//10*y17*y18 + 1//2*y24,
1//2*y4*y23,
1//200*y7*y23 + 1//10*y18*y22
]


new_vars = fmpq_mpoly[Effector, GaGDP, GaGDPP, GaGTP, GaGTPEffector, GaGTPEffectorOFF, Gabg, Gbg, L, LR, LRGabg, LRRGSm, LRRGSmGaGTP, LRRGSmGaGTPEffectorOFF, LRRGSmGabg, P, R, RGSc, RGSm, RGSmGaGTP, RGSmGaGTPEffectorOFF, RGabg, RRGSm, RRGSmGaGTP, RRGSmGabg, ka]
new_system = 
[
1//200*y6 + 3//10*y14 + 3//10*y21,
1000*y3,
1//200*y4 + 1//200*y6 + 5//2*y13 + 3//10*y14 + 5//2*y20 + 3//10*y21 + 1//2*y24,
1//5*y7 + 50*y11 + 40*y15 + 1//20*y20,
10*y1*y4,
y5,
1000*y2*y8,
1//5*y7 + 50*y11 + 40*y15,
0,
1//400*y9*y17 + 50*y11 + 100*y12,
1//50*y7*y10 + 1//200*y9*y22,
1//200*y9*y23 + 1//10*y10*y18 + 5//2*y13 + 3//10*y14 + 40*y15,
100*y4*y12,
50*y6*y12,
1//50*y7*y12 + 1//200*y9*y25 + 1//10*y11*y18,
1000*y3,
100*y23,
1//200*y19 + 51//20*y20 + 3//10*y21,
100*y12 + 1//2000*y18 + 100*y23 + 1//10*y25,
60*y4*y18 + 500*y4*y19,
1//10000*y6*y18 + 50*y6*y19,
1//200*y7*y17 + 1//10*y25,
1//10*y17*y18 + 1//2*y24,
1//2*y4*y23,
1//200*y7*y23 + 1//10*y18*y22,
0
]


new_vars = fmpq_mpoly[Effector, GaGDP, GaGDPP, GaGTP, GaGTPEffector, GaGTPEffectorOFF, Gabg, Gbg, L, LR, LRGabg, LRRGSm, LRRGSmGaGTP, LRRGSmGaGTPEffectorOFF, LRRGSmGabg, P, R, RGSc, RGSm, RGSmGaGTP, RGSmGaGTPEffectorOFF, RGabg, RRGSm, RRGSmGaGTP, RRGSmGabg, ka, z1]
new_system = 
[
1//200*y6 + 3//10*y14 + 3//10*y21,
1000*y3,
1//200*y4 + 1//200*y6 + 5//2*y13 + 3//10*y14 + 5//2*y20 + 3//10*y21 + 1//2*y24,
1//5*y7 + 50*y11 + 40*y15 + 1//20*y20,
10*y1*y4,
y5,
1000*y2*y8,
1//5*y7 + 50*y11 + 40*y15,
0,
1//400*y9*y17 + 50*y11 + 100*y12,
1//50*y7*y10 + 1//200*y9*y22,
1//200*y9*y23 + 1//10*y10*y18 + 5//2*y13 + 3//10*y14 + 40*y15,
100*y4*y12,
50*y6*y12,
1//50*y7*y12 + 1//200*y9*y25 + 1//10*y11*y18,
1000*y3,
100*y23,
1//200*y19 + 51//20*y20 + 3//10*y21,
100*y12 + 1//2000*y18 + 100*y23 + 1//10*y25,
60*y4*y18 + 500*y4*y19,
1//10000*y6*y18 + 50*y6*y19,
1//200*y7*y17 + 1//10*y25,
1//10*y17*y18 + 1//2*y24,
1//2*y4*y23,
1//200*y7*y23 + 1//10*y18*y22,
0,
y5*y26
]


new_vars = fmpq_mpoly[Effector, GaGDP, GaGDPP, GaGTP, GaGTPEffector, GaGTPEffectorOFF, Gabg, Gbg, L, LR, LRGabg, LRRGSm, LRRGSmGaGTP, LRRGSmGaGTPEffectorOFF, LRRGSmGabg, P, R, RGSc, RGSm, RGSmGaGTP, RGSmGaGTPEffectorOFF, RGabg, RRGSm, RRGSmGaGTP, RRGSmGabg, ka, z1, z2]
new_system = 
[
1//200*y6 + 3//10*y14 + 3//10*y21,
1000*y3,
1//200*y4 + 1//200*y6 + 5//2*y13 + 3//10*y14 + 5//2*y20 + 3//10*y21 + 1//2*y24,
1//5*y7 + 50*y11 + 40*y15 + 1//20*y20,
10*y1*y4,
y5,
1000*y2*y8,
1//5*y7 + 50*y11 + 40*y15,
0,
1//400*y9*y17 + 50*y11 + 100*y12,
1//50*y7*y10 + 1//200*y9*y22,
1//200*y9*y23 + 1//10*y10*y18 + 5//2*y13 + 3//10*y14 + 40*y15,
100*y4*y12,
50*y6*y12,
1//50*y7*y12 + 1//200*y9*y25 + 1//10*y11*y18,
1000*y3,
100*y23,
1//200*y19 + 51//20*y20 + 3//10*y21,
100*y12 + 1//2000*y18 + 100*y23 + 1//10*y25,
60*y4*y18 + 500*y4*y19,
1//10000*y6*y18 + 50*y6*y19,
1//200*y7*y17 + 1//10*y25,
1//10*y17*y18 + 1//2*y24,
1//2*y4*y23,
1//200*y7*y23 + 1//10*y18*y22,
0,
y5*y26,
y26*y27
]


