Original system:

[
E4P => 31//1000*HeP,
UDP => II*v_15,
v_15 => 0,
ATP => 279//1000*ADP*Pi,
CO2 => 0,
HeP => 1//25000*GG*Pi + 8*TP,
Pi => 1//250*ATP*HeP + 207//10000*ATP*PGA + 31//10*E4P*TP + 1//2*Pic*TP + 8*TP,
S7P => 31//10*E4P*TP,
sD => 0,
EE => 0,
II => 0,
RuBP => 31//1000*ATP*Ru5P,
TP => 207//10000*ATP*PGA,
Suc => EE*phi + II*v_15 + SucV*sD,
Pic => 3*II*v_15 + 31//10*TPc,
Ru5P => 31//100*S7P + 31//5*TP*TPGA,
HePc => -2*II*v_15 + 31//10*TPc,
SucV => Suc*sD,
UTP => -II*v_15 + 151//20000*Pic*UDP,
GG => 1//500*ATP*HeP,
PGA => 3//250*CO2*RuBP,
TPc => 1//2*Pic*TP,
r => 0,
ADP => 1//500*ATP*HeP + 207//10000*ATP*PGA + 31//1000*ATP*Ru5P,
TPGA => 31//1000*HeP + 31//100*S7P,
phi => 0
]

Reductions:

Interesting
new_vars = fmpq_mpoly[ADP - GG - RuBP - TP]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[ADP - GG - RuBP - TP, CO2]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[ADP - GG - RuBP - TP, CO2, II]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[ADP - GG - RuBP - TP, CO2, II, v_15]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[ADP, ATP, CO2, E4P, GG, HeP, II, PGA, Pi, Pic, Ru5P, RuBP, S7P, TP, TPGA, TPc, v_15]
new_system = 
[
1//500*y2*y6 + 207//10000*y2*y8 + 31//1000*y2*y11,
279//1000*y1*y9,
0,
31//1000*y6,
1//500*y2*y6,
1//25000*y5*y9 + 8*y14,
0,
3//250*y3*y12,
1//250*y2*y6 + 207//10000*y2*y8 + 31//10*y4*y14 + 1//2*y10*y14 + 8*y14,
3*y7*y17 + 31//10*y16,
31//100*y13 + 31//5*y14*y15,
31//1000*y2*y11,
31//10*y4*y14,
207//10000*y2*y8,
31//1000*y6 + 31//100*y13,
1//2*y10*y14,
0
]


new_vars = fmpq_mpoly[ADP, ATP, CO2, E4P, EE, GG, HeP, II, PGA, Pi, Pic, Ru5P, RuBP, S7P, TP, TPGA, TPc, v_15]
new_system = 
[
1//500*y2*y7 + 207//10000*y2*y9 + 31//1000*y2*y12,
279//1000*y1*y10,
0,
31//1000*y7,
0,
1//500*y2*y7,
1//25000*y6*y10 + 8*y15,
0,
3//250*y3*y13,
1//250*y2*y7 + 207//10000*y2*y9 + 31//10*y4*y15 + 1//2*y11*y15 + 8*y15,
3*y8*y18 + 31//10*y17,
31//100*y14 + 31//5*y15*y16,
31//1000*y2*y12,
31//10*y4*y15,
207//10000*y2*y9,
31//1000*y7 + 31//100*y14,
1//2*y11*y15,
0
]


new_vars = fmpq_mpoly[ADP, ATP, CO2, E4P, EE, GG, HeP, HePc, II, PGA, Pi, Pic, Ru5P, RuBP, S7P, TP, TPGA, TPc, v_15]
new_system = 
[
1//500*y2*y7 + 207//10000*y2*y10 + 31//1000*y2*y13,
279//1000*y1*y11,
0,
31//1000*y7,
0,
1//500*y2*y7,
1//25000*y6*y11 + 8*y16,
-2*y9*y19 + 31//10*y18,
0,
3//250*y3*y14,
1//250*y2*y7 + 207//10000*y2*y10 + 31//10*y4*y16 + 1//2*y12*y16 + 8*y16,
3*y9*y19 + 31//10*y18,
31//100*y15 + 31//5*y16*y17,
31//1000*y2*y13,
31//10*y4*y16,
207//10000*y2*y10,
31//1000*y7 + 31//100*y15,
1//2*y12*y16,
0
]


new_vars = fmpq_mpoly[ADP, ATP, CO2, E4P, EE, GG, HeP, HePc, II, PGA, Pi, Pic, Ru5P, RuBP, S7P, TP, TPGA, TPc, phi, v_15]
new_system = 
[
1//500*y2*y7 + 207//10000*y2*y10 + 31//1000*y2*y13,
279//1000*y1*y11,
0,
31//1000*y7,
0,
1//500*y2*y7,
1//25000*y6*y11 + 8*y16,
-2*y9*y20 + 31//10*y18,
0,
3//250*y3*y14,
1//250*y2*y7 + 207//10000*y2*y10 + 31//10*y4*y16 + 1//2*y12*y16 + 8*y16,
3*y9*y20 + 31//10*y18,
31//100*y15 + 31//5*y16*y17,
31//1000*y2*y13,
31//10*y4*y16,
207//10000*y2*y10,
31//1000*y7 + 31//100*y15,
1//2*y12*y16,
0,
0
]


new_vars = fmpq_mpoly[ADP, ATP, CO2, E4P, EE, GG, HeP, HePc, II, PGA, Pi, Pic, Ru5P, RuBP, S7P, TP, TPGA, TPc, phi, sD, v_15]
new_system = 
[
1//500*y2*y7 + 207//10000*y2*y10 + 31//1000*y2*y13,
279//1000*y1*y11,
0,
31//1000*y7,
0,
1//500*y2*y7,
1//25000*y6*y11 + 8*y16,
-2*y9*y21 + 31//10*y18,
0,
3//250*y3*y14,
1//250*y2*y7 + 207//10000*y2*y10 + 31//10*y4*y16 + 1//2*y12*y16 + 8*y16,
3*y9*y21 + 31//10*y18,
31//100*y15 + 31//5*y16*y17,
31//1000*y2*y13,
31//10*y4*y16,
207//10000*y2*y10,
31//1000*y7 + 31//100*y15,
1//2*y12*y16,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[ADP, ATP, CO2, E4P, EE, GG, HeP, HePc, II, PGA, Pi, Pic, Ru5P, RuBP, S7P, Suc + SucV, TP, TPGA, TPc, phi, sD, v_15]
new_system = 
[
1//500*y2*y7 + 207//10000*y2*y10 + 31//1000*y2*y13,
279//1000*y1*y11,
0,
31//1000*y7,
0,
1//500*y2*y7,
1//25000*y6*y11 + 8*y17,
-2*y9*y22 + 31//10*y19,
0,
3//250*y3*y14,
1//250*y2*y7 + 207//10000*y2*y10 + 31//10*y4*y17 + 1//2*y12*y17 + 8*y17,
3*y9*y22 + 31//10*y19,
31//100*y15 + 31//5*y17*y18,
31//1000*y2*y13,
31//10*y4*y17,
y5*y20 + y9*y22 + y16*y21,
207//10000*y2*y10,
31//1000*y7 + 31//100*y15,
1//2*y12*y17,
0,
0,
0
]


new_vars = fmpq_mpoly[ADP, ATP, CO2, E4P, EE, GG, HeP, HePc, II, PGA, Pi, Pic, Ru5P, RuBP, S7P, Suc, SucV, TP, TPGA, TPc, phi, sD, v_15]
new_system = 
[
1//500*y2*y7 + 207//10000*y2*y10 + 31//1000*y2*y13,
279//1000*y1*y11,
0,
31//1000*y7,
0,
1//500*y2*y7,
1//25000*y6*y11 + 8*y18,
-2*y9*y23 + 31//10*y20,
0,
3//250*y3*y14,
1//250*y2*y7 + 207//10000*y2*y10 + 31//10*y4*y18 + 1//2*y12*y18 + 8*y18,
3*y9*y23 + 31//10*y20,
31//100*y15 + 31//5*y18*y19,
31//1000*y2*y13,
31//10*y4*y18,
y5*y21 + y9*y23 + y17*y22,
y16*y22,
207//10000*y2*y10,
31//1000*y7 + 31//100*y15,
1//2*y12*y18,
0,
0,
0
]


new_vars = fmpq_mpoly[ADP, ATP, CO2, E4P, EE, GG, HeP, HePc, II, PGA, Pi, Pic, Ru5P, RuBP, S7P, Suc, SucV, TP, TPGA, TPc, UDP, phi, sD, v_15]
new_system = 
[
1//500*y2*y7 + 207//10000*y2*y10 + 31//1000*y2*y13,
279//1000*y1*y11,
0,
31//1000*y7,
0,
1//500*y2*y7,
1//25000*y6*y11 + 8*y18,
-2*y9*y24 + 31//10*y20,
0,
3//250*y3*y14,
1//250*y2*y7 + 207//10000*y2*y10 + 31//10*y4*y18 + 1//2*y12*y18 + 8*y18,
3*y9*y24 + 31//10*y20,
31//100*y15 + 31//5*y18*y19,
31//1000*y2*y13,
31//10*y4*y18,
y5*y22 + y9*y24 + y17*y23,
y16*y23,
207//10000*y2*y10,
31//1000*y7 + 31//100*y15,
1//2*y12*y18,
y9*y24,
0,
0,
0
]


new_vars = fmpq_mpoly[ADP, ATP, CO2, E4P, EE, GG, HeP, HePc, II, PGA, Pi, Pic, Ru5P, RuBP, S7P, Suc, SucV, TP, TPGA, TPc, UDP, UTP, phi, sD, v_15]
new_system = 
[
1//500*y2*y7 + 207//10000*y2*y10 + 31//1000*y2*y13,
279//1000*y1*y11,
0,
31//1000*y7,
0,
1//500*y2*y7,
1//25000*y6*y11 + 8*y18,
-2*y9*y25 + 31//10*y20,
0,
3//250*y3*y14,
1//250*y2*y7 + 207//10000*y2*y10 + 31//10*y4*y18 + 1//2*y12*y18 + 8*y18,
3*y9*y25 + 31//10*y20,
31//100*y15 + 31//5*y18*y19,
31//1000*y2*y13,
31//10*y4*y18,
y5*y23 + y9*y25 + y17*y24,
y16*y24,
207//10000*y2*y10,
31//1000*y7 + 31//100*y15,
1//2*y12*y18,
y9*y25,
-y9*y25 + 151//20000*y12*y21,
0,
0,
0
]


