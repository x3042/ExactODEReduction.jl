Original system:

[
R => 0,
L => 0,
RGSinertGaGTP => 50*RGS*inertGaGTP,
inertGaGTP => GaGTPEffector,
ka => 0,
GaGTP => 1//5*Gabg + 50*RGabgL,
RGSGaGTP => 500*GaGTP*RGS,
RGabgL => 1//50*Gabg*RL + 1//200*L*RGabg,
z1 => GaGTPEffector*ka,
RGabg => 1//200*Gabg*R,
Effector => GaGTPEffector,
GaGDPP => 1//200*GaGTP + 5//2*RGSGaGTP + 3//10*RGSinertGaGTP + 1//200*inertGaGTP,
RGS => 5//2*RGSGaGTP + 3//10*RGSinertGaGTP,
GaGDP => 1000*GaGDPP,
RL => 1//400*L*R + 50*RGabgL,
GaGTPEffector => 10*Effector*GaGTP,
Gbg => 1//5*Gabg + 50*RGabgL,
Gabg => 1000*GaGDP*Gbg,
P => 1000*GaGDPP,
z2 => ka*z1,
z3 => ka*z2
]

Reductions:

Interesting
new_vars = fmpq_mpoly[Effector - inertGaGTP]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[Effector - inertGaGTP, GaGTP - Gbg]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[Effector - inertGaGTP, GaGTP - Gbg, L]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Effector - inertGaGTP, GaGTP - Gbg, L, R]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Effector, GaGDP, GaGDPP, GaGTP, GaGTPEffector, Gabg, Gbg, L, R, RGS, 25*RGSGaGTP + 3*RGSinertGaGTP, RGabg, RGabgL, RL, inertGaGTP]
new_system = 
[
y5,
1000*y3,
1//200*y4 + 1//10*y11 + 1//200*y15,
1//5*y6 + 50*y13,
10*y1*y4,
1000*y2*y7,
1//5*y6 + 50*y13,
0,
0,
1//10*y11,
12500*y4*y10 + 150*y10*y15,
1//200*y6*y9,
1//50*y6*y14 + 1//200*y8*y12,
1//400*y8*y9 + 50*y13,
y5
]

Interesting
new_vars = fmpq_mpoly[Effector, GaGDP, GaGDPP, GaGTP, GaGTPEffector, Gabg, Gbg, L, P, R, RGS, 25*RGSGaGTP + 3*RGSinertGaGTP, RGabg, RGabgL, RL, inertGaGTP]
new_system = 
[
y5,
1000*y3,
1//200*y4 + 1//10*y12 + 1//200*y16,
1//5*y6 + 50*y14,
10*y1*y4,
1000*y2*y7,
1//5*y6 + 50*y14,
0,
1000*y3,
0,
1//10*y12,
12500*y4*y11 + 150*y11*y16,
1//200*y6*y10,
1//50*y6*y15 + 1//200*y8*y13,
1//400*y8*y10 + 50*y14,
y5
]


new_vars = fmpq_mpoly[Effector, GaGDP, GaGDPP, GaGTP, GaGTPEffector, Gabg, Gbg, L, P, R, RGS, RGSGaGTP, RGSinertGaGTP, RGabg, RGabgL, RL, inertGaGTP]
new_system = 
[
y5,
1000*y3,
1//200*y4 + 5//2*y12 + 3//10*y13 + 1//200*y17,
1//5*y6 + 50*y15,
10*y1*y4,
1000*y2*y7,
1//5*y6 + 50*y15,
0,
1000*y3,
0,
5//2*y12 + 3//10*y13,
500*y4*y11,
50*y11*y17,
1//200*y6*y10,
1//50*y6*y16 + 1//200*y8*y14,
1//400*y8*y10 + 50*y15,
y5
]


new_vars = fmpq_mpoly[Effector, GaGDP, GaGDPP, GaGTP, GaGTPEffector, Gabg, Gbg, L, P, R, RGS, RGSGaGTP, RGSinertGaGTP, RGabg, RGabgL, RL, inertGaGTP, ka]
new_system = 
[
y5,
1000*y3,
1//200*y4 + 5//2*y12 + 3//10*y13 + 1//200*y17,
1//5*y6 + 50*y15,
10*y1*y4,
1000*y2*y7,
1//5*y6 + 50*y15,
0,
1000*y3,
0,
5//2*y12 + 3//10*y13,
500*y4*y11,
50*y11*y17,
1//200*y6*y10,
1//50*y6*y16 + 1//200*y8*y14,
1//400*y8*y10 + 50*y15,
y5,
0
]


new_vars = fmpq_mpoly[Effector, GaGDP, GaGDPP, GaGTP, GaGTPEffector, Gabg, Gbg, L, P, R, RGS, RGSGaGTP, RGSinertGaGTP, RGabg, RGabgL, RL, inertGaGTP, ka, z1]
new_system = 
[
y5,
1000*y3,
1//200*y4 + 5//2*y12 + 3//10*y13 + 1//200*y17,
1//5*y6 + 50*y15,
10*y1*y4,
1000*y2*y7,
1//5*y6 + 50*y15,
0,
1000*y3,
0,
5//2*y12 + 3//10*y13,
500*y4*y11,
50*y11*y17,
1//200*y6*y10,
1//50*y6*y16 + 1//200*y8*y14,
1//400*y8*y10 + 50*y15,
y5,
0,
y5*y18
]


new_vars = fmpq_mpoly[Effector, GaGDP, GaGDPP, GaGTP, GaGTPEffector, Gabg, Gbg, L, P, R, RGS, RGSGaGTP, RGSinertGaGTP, RGabg, RGabgL, RL, inertGaGTP, ka, z1, z2]
new_system = 
[
y5,
1000*y3,
1//200*y4 + 5//2*y12 + 3//10*y13 + 1//200*y17,
1//5*y6 + 50*y15,
10*y1*y4,
1000*y2*y7,
1//5*y6 + 50*y15,
0,
1000*y3,
0,
5//2*y12 + 3//10*y13,
500*y4*y11,
50*y11*y17,
1//200*y6*y10,
1//50*y6*y16 + 1//200*y8*y14,
1//400*y8*y10 + 50*y15,
y5,
0,
y5*y18,
y18*y19
]


