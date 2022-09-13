Original system:

[
DNA1_101 => DNA1101*Kon_P1,
DNA1110 => DNA0110*Kon_NG1*S1 + DNA1010*Kon_G1*S1 + DNA1100*Kon_G1*S1 + DNA1111*Koff_NG1 + DNA11_10*Koff_P1 + DNA1_110*Koff_P1,
DNA0000 => DNA0001*Koff_NG1 + DNA0010*Koff_G1 + DNA0100*Koff_G1 + DNA1000*Koff_NG1,
DNA1011 => DNA0011*Kon_NG1*S1 + DNA1001*Kon_G1*S1 + DNA1010*Kon_NG1*S1 + DNA101_1*Koff_P1 + DNA1111*Koff_G1,
DNA1100 => DNA0100*Kon_NG1*S1 + DNA1000*Kon_G1*S1 + DNA1101*Koff_NG1 + DNA1110*Koff_G1 + DNA1_100*Koff_P1,
Koff_P1 => 0,
DNA11_10 => DNA1110*Kon_P1 + DNA1_1_10*Koff_P1,
DNA001_1 => DNA0011*Kon_P1,
DNA11_1_1 => DNA111_1*Kon_P1 + DNA11_11*Kon_P1 + DNA1_1_1_1*Koff_P1,
S1 => DNA0001*Koff_NG1 + DNA0010*Koff_G1 + DNA0011*Koff_G1 + DNA0011*Koff_NG1 + DNA0100*Koff_G1 + DNA0101*Koff_G1 + DNA0101*Koff_NG1 + 2*DNA0110*Koff_G1 + 2*DNA0111*Koff_G1 + DNA0111*Koff_NG1 + DNA1000*Koff_NG1 + 2*DNA1001*Koff_NG1 + DNA1010*Koff_G1 + DNA1010*Koff_NG1 + DNA1011*Koff_G1 + 2*DNA1011*Koff_NG1 + DNA1100*Koff_G1 + DNA1100*Koff_NG1 + DNA1101*Koff_G1 + 2*DNA1101*Koff_NG1 + 2*DNA1110*Koff_G1 + DNA1110*Koff_NG1 + 2*DNA1111*Koff_G1 + 2*DNA1111*Koff_NG1,
DNA01_1_1 => DNA011_1*Kon_P1 + DNA01_11*Kon_P1,
DNA1_11_1 => DNA111_1*Kon_P1 + DNA1_111*Kon_P1 + DNA1_1_1_1*Koff_P1,
DNA1111 => DNA0111*Kon_NG1*S1 + DNA1011*Kon_G1*S1 + DNA1101*Kon_G1*S1 + DNA1110*Kon_NG1*S1 + DNA111_1*Koff_P1 + DNA11_11*Koff_P1 + DNA1_111*Koff_P1,
DNA0101 => DNA0001*Kon_G1*S1 + DNA0100*Kon_NG1*S1 + DNA0111*Koff_G1 + DNA1101*Koff_NG1,
DNA0100 => DNA0000*Kon_G1*S1 + DNA0101*Koff_NG1 + DNA0110*Koff_G1 + DNA1100*Koff_NG1,
DNA1_1_11 => DNA11_11*Kon_P1 + DNA1_111*Kon_P1 + DNA1_1_1_1*Koff_P1,
DNA0010 => DNA0000*Kon_G1*S1 + DNA0011*Koff_NG1 + DNA0110*Koff_G1 + DNA1010*Koff_NG1,
DNA1_1_1_1 => DNA11_1_1*Kon_P1 + DNA1_11_1*Kon_P1 + DNA1_1_11*Kon_P1,
DNA0011 => DNA0001*Kon_G1*S1 + DNA0010*Kon_NG1*S1 + DNA001_1*Koff_P1 + DNA0111*Koff_G1 + DNA1011*Koff_NG1,
DNA1_1_10 => DNA11_10*Kon_P1 + DNA1_110*Kon_P1,
DNA1010 => DNA0010*Kon_NG1*S1 + DNA1000*Kon_G1*S1 + DNA1011*Koff_NG1 + DNA1110*Koff_G1,
DNA0001 => DNA0000*Kon_NG1*S1 + DNA0011*Koff_G1 + DNA0101*Koff_G1 + DNA1001*Koff_NG1,
DNA1001 => DNA0001*Kon_NG1*S1 + DNA1000*Kon_NG1*S1 + DNA1011*Koff_G1 + DNA1101*Koff_G1,
Kon_NG1 => 0,
DNA1_111 => DNA1111*Kon_P1 + DNA1_11_1*Koff_P1 + DNA1_1_11*Koff_P1,
DNA0111 => DNA0011*Kon_G1*S1 + DNA0101*Kon_G1*S1 + DNA0110*Kon_NG1*S1 + DNA011_1*Koff_P1 + DNA01_11*Koff_P1 + DNA1111*Koff_NG1,
DNA1000 => DNA0000*Kon_NG1*S1 + DNA1001*Koff_NG1 + DNA1010*Koff_G1 + DNA1100*Koff_G1,
DNA1101 => DNA0101*Kon_NG1*S1 + DNA1001*Kon_G1*S1 + DNA1100*Kon_NG1*S1 + DNA1111*Koff_G1 + DNA1_101*Koff_P1,
Kon_G1 => 0,
DNA01_10 => DNA0110*Kon_P1,
Koff_G1 => 0,
DNA011_1 => DNA0111*Kon_P1 + DNA01_1_1*Koff_P1,
DNA0110 => DNA0010*Kon_G1*S1 + DNA0100*Kon_G1*S1 + DNA0111*Koff_NG1 + DNA01_10*Koff_P1 + DNA1110*Koff_NG1,
DNA01_11 => DNA0111*Kon_P1 + DNA01_1_1*Koff_P1,
DNA111_1 => DNA1111*Kon_P1 + DNA11_1_1*Koff_P1 + DNA1_11_1*Koff_P1,
DNA11_11 => DNA1111*Kon_P1 + DNA11_1_1*Koff_P1 + DNA1_1_11*Koff_P1,
DNA1_100 => DNA1100*Kon_P1,
Koff_NG1 => 0,
DNA101_1 => DNA1011*Kon_P1,
DNA1_110 => DNA1110*Kon_P1 + DNA1_1_10*Koff_P1,
Kon_P1 => 0
]

Reductions:


new_vars = fmpq_mpoly[Koff_G1]
new_system = 
[
0
]


new_vars = fmpq_mpoly[Koff_G1, Koff_NG1]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[Koff_G1, Koff_NG1, Koff_P1]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[Koff_G1, Koff_NG1, Koff_P1, Kon_G1]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Koff_G1, Koff_NG1, Koff_P1, Kon_G1, Kon_NG1]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Koff_G1, Koff_NG1, Koff_P1, Kon_G1, Kon_NG1, Kon_P1]
new_system = 
[
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[DNA0000, DNA0001 + DNA1000, DNA0010 + DNA0100, DNA0011 + DNA1100, DNA001_1 + DNA1_100, DNA0101 + DNA1010, DNA0110, DNA0111 + DNA1110, DNA011_1 + DNA01_11 + DNA11_10 + DNA1_110, DNA01_10, DNA01_1_1 + DNA1_1_10, DNA1001, DNA1011 + DNA1101, DNA101_1 + DNA1_101, DNA1111, DNA111_1 + DNA11_11 + DNA1_111, DNA11_1_1 + DNA1_11_1 + DNA1_1_11, DNA1_1_1_1, Koff_G1, Koff_NG1, Koff_P1, Kon_G1, Kon_NG1, Kon_P1, S1]
new_system = 
[
y2*y20 + y3*y19,
2*y1*y23*y25 + y4*y19 + y6*y19 + 2*y12*y20,
2*y1*y22*y25 + y4*y20 + y6*y20 + 2*y7*y19,
y2*y22*y25 + y3*y23*y25 + y5*y21 + y8*y19 + y13*y20,
y4*y24,
y2*y22*y25 + y3*y23*y25 + y8*y19 + y13*y20,
y3*y22*y25 + y8*y20 + y10*y21,
y4*y22*y25 + y6*y22*y25 + 2*y7*y23*y25 + y9*y21 + 2*y15*y20,
2*y8*y24 + 2*y11*y21,
y7*y24,
y9*y24,
y2*y23*y25 + y13*y19,
y4*y23*y25 + y6*y23*y25 + 2*y12*y22*y25 + y14*y21 + 2*y15*y19,
y13*y24,
y8*y23*y25 + y13*y22*y25 + y16*y21,
3*y15*y24 + 2*y17*y21,
2*y16*y24 + 3*y18*y21,
y17*y24,
0,
0,
0,
0,
0,
0,
y2*y20 + y3*y19 + y4*y19 + y4*y20 + y6*y19 + y6*y20 + 2*y7*y19 + 2*y8*y19 + y8*y20 + 2*y12*y20 + y13*y19 + 2*y13*y20 + 2*y15*y19 + 2*y15*y20
]

Interesting
new_vars = fmpq_mpoly[DNA0000, DNA0001, DNA0010, DNA0011, DNA001_1, DNA0100, DNA0101, DNA0110, DNA0111, DNA011_1 + DNA01_11, DNA01_10, DNA01_1_1, DNA1000, DNA1001, DNA1010, DNA1011, DNA101_1, DNA1100, DNA1101, DNA1110, DNA1111, DNA111_1 + DNA11_11 + DNA1_111, DNA11_10 + DNA1_110, DNA11_1_1 + DNA1_11_1 + DNA1_1_11, DNA1_100, DNA1_101, DNA1_1_10, DNA1_1_1_1, Koff_G1, Koff_NG1, Koff_P1, Kon_G1, Kon_NG1, Kon_P1, S1]
new_system = 
[
y2*y30 + y3*y29 + y6*y29 + y13*y30,
y1*y33*y35 + y4*y29 + y7*y29 + y14*y30,
y1*y32*y35 + y4*y30 + y8*y29 + y15*y30,
y2*y32*y35 + y3*y33*y35 + y5*y31 + y9*y29 + y16*y30,
y4*y34,
y1*y32*y35 + y7*y30 + y8*y29 + y18*y30,
y2*y32*y35 + y6*y33*y35 + y9*y29 + y19*y30,
y3*y32*y35 + y6*y32*y35 + y9*y30 + y11*y31 + y20*y30,
y4*y32*y35 + y7*y32*y35 + y8*y33*y35 + y10*y31 + y21*y30,
2*y9*y34 + 2*y12*y31,
y8*y34,
y10*y34,
y1*y33*y35 + y14*y30 + y15*y29 + y18*y29,
y2*y33*y35 + y13*y33*y35 + y16*y29 + y19*y29,
y3*y33*y35 + y13*y32*y35 + y16*y30 + y20*y29,
y4*y33*y35 + y14*y32*y35 + y15*y33*y35 + y17*y31 + y21*y29,
y16*y34,
y6*y33*y35 + y13*y32*y35 + y19*y30 + y20*y29 + y25*y31,
y7*y33*y35 + y14*y32*y35 + y18*y33*y35 + y21*y29 + y26*y31,
y8*y33*y35 + y15*y32*y35 + y18*y32*y35 + y21*y30 + y23*y31,
y9*y33*y35 + y16*y32*y35 + y19*y32*y35 + y20*y33*y35 + y22*y31,
3*y21*y34 + 2*y24*y31,
2*y20*y34 + 2*y27*y31,
2*y22*y34 + 3*y28*y31,
y18*y34,
y19*y34,
y23*y34,
y24*y34,
0,
0,
0,
0,
0,
0,
y2*y30 + y3*y29 + y4*y29 + y4*y30 + y6*y29 + y7*y29 + y7*y30 + 2*y8*y29 + 2*y9*y29 + y9*y30 + y13*y30 + 2*y14*y30 + y15*y29 + y15*y30 + y16*y29 + 2*y16*y30 + y18*y29 + y18*y30 + y19*y29 + 2*y19*y30 + 2*y20*y29 + y20*y30 + 2*y21*y29 + 2*y21*y30
]

Interesting
new_vars = fmpq_mpoly[DNA0000, DNA0001, DNA0010, DNA0011, DNA001_1, DNA0100, DNA0101, DNA0110, DNA0111, DNA011_1, DNA01_10, DNA01_11, DNA01_1_1, DNA1000, DNA1001, DNA1010, DNA1011, DNA101_1, DNA1100, DNA1101, DNA1110, DNA1111, DNA111_1 + DNA11_11 + DNA1_111, DNA11_10 + DNA1_110, DNA11_1_1 + DNA1_11_1 + DNA1_1_11, DNA1_100, DNA1_101, DNA1_1_10, DNA1_1_1_1, Koff_G1, Koff_NG1, Koff_P1, Kon_G1, Kon_NG1, Kon_P1, S1]
new_system = 
[
y2*y31 + y3*y30 + y6*y30 + y14*y31,
y1*y34*y36 + y4*y30 + y7*y30 + y15*y31,
y1*y33*y36 + y4*y31 + y8*y30 + y16*y31,
y2*y33*y36 + y3*y34*y36 + y5*y32 + y9*y30 + y17*y31,
y4*y35,
y1*y33*y36 + y7*y31 + y8*y30 + y19*y31,
y2*y33*y36 + y6*y34*y36 + y9*y30 + y20*y31,
y3*y33*y36 + y6*y33*y36 + y9*y31 + y11*y32 + y21*y31,
y4*y33*y36 + y7*y33*y36 + y8*y34*y36 + y10*y32 + y12*y32 + y22*y31,
y9*y35 + y13*y32,
y8*y35,
y9*y35 + y13*y32,
y10*y35 + y12*y35,
y1*y34*y36 + y15*y31 + y16*y30 + y19*y30,
y2*y34*y36 + y14*y34*y36 + y17*y30 + y20*y30,
y3*y34*y36 + y14*y33*y36 + y17*y31 + y21*y30,
y4*y34*y36 + y15*y33*y36 + y16*y34*y36 + y18*y32 + y22*y30,
y17*y35,
y6*y34*y36 + y14*y33*y36 + y20*y31 + y21*y30 + y26*y32,
y7*y34*y36 + y15*y33*y36 + y19*y34*y36 + y22*y30 + y27*y32,
y8*y34*y36 + y16*y33*y36 + y19*y33*y36 + y22*y31 + y24*y32,
y9*y34*y36 + y17*y33*y36 + y20*y33*y36 + y21*y34*y36 + y23*y32,
3*y22*y35 + 2*y25*y32,
2*y21*y35 + 2*y28*y32,
2*y23*y35 + 3*y29*y32,
y19*y35,
y20*y35,
y24*y35,
y25*y35,
0,
0,
0,
0,
0,
0,
y2*y31 + y3*y30 + y4*y30 + y4*y31 + y6*y30 + y7*y30 + y7*y31 + 2*y8*y30 + 2*y9*y30 + y9*y31 + y14*y31 + 2*y15*y31 + y16*y30 + y16*y31 + y17*y30 + 2*y17*y31 + y19*y30 + y19*y31 + y20*y30 + 2*y20*y31 + 2*y21*y30 + y21*y31 + 2*y22*y30 + 2*y22*y31
]

Interesting
new_vars = fmpq_mpoly[DNA0000, DNA0001, DNA0010, DNA0011, DNA001_1, DNA0100, DNA0101, DNA0110, DNA0111, DNA011_1, DNA01_10, DNA01_11, DNA01_1_1, DNA1000, DNA1001, DNA1010, DNA1011, DNA101_1, DNA1100, DNA1101, DNA1110, DNA1111, DNA111_1 + DNA1_111, DNA11_10 + DNA1_110, DNA11_11, DNA11_1_1 + DNA1_1_11, DNA1_100, DNA1_101, DNA1_11_1, DNA1_1_10, DNA1_1_1_1, Koff_G1, Koff_NG1, Koff_P1, Kon_G1, Kon_NG1, Kon_P1, S1]
new_system = 
[
y2*y33 + y3*y32 + y6*y32 + y14*y33,
y1*y36*y38 + y4*y32 + y7*y32 + y15*y33,
y1*y35*y38 + y4*y33 + y8*y32 + y16*y33,
y2*y35*y38 + y3*y36*y38 + y5*y34 + y9*y32 + y17*y33,
y4*y37,
y1*y35*y38 + y7*y33 + y8*y32 + y19*y33,
y2*y35*y38 + y6*y36*y38 + y9*y32 + y20*y33,
y3*y35*y38 + y6*y35*y38 + y9*y33 + y11*y34 + y21*y33,
y4*y35*y38 + y7*y35*y38 + y8*y36*y38 + y10*y34 + y12*y34 + y22*y33,
y9*y37 + y13*y34,
y8*y37,
y9*y37 + y13*y34,
y10*y37 + y12*y37,
y1*y36*y38 + y15*y33 + y16*y32 + y19*y32,
y2*y36*y38 + y14*y36*y38 + y17*y32 + y20*y32,
y3*y36*y38 + y14*y35*y38 + y17*y33 + y21*y32,
y4*y36*y38 + y15*y35*y38 + y16*y36*y38 + y18*y34 + y22*y32,
y17*y37,
y6*y36*y38 + y14*y35*y38 + y20*y33 + y21*y32 + y27*y34,
y7*y36*y38 + y15*y35*y38 + y19*y36*y38 + y22*y32 + y28*y34,
y8*y36*y38 + y16*y35*y38 + y19*y35*y38 + y22*y33 + y24*y34,
y9*y36*y38 + y17*y35*y38 + y20*y35*y38 + y21*y36*y38 + y23*y34 + y25*y34,
2*y22*y37 + y26*y34 + 2*y29*y34,
2*y21*y37 + 2*y30*y34,
y22*y37 + y26*y34,
y23*y37 + 2*y25*y37 + 2*y31*y34,
y19*y37,
y20*y37,
y23*y37 + y31*y34,
y24*y37,
y26*y37 + y29*y37,
0,
0,
0,
0,
0,
0,
y2*y33 + y3*y32 + y4*y32 + y4*y33 + y6*y32 + y7*y32 + y7*y33 + 2*y8*y32 + 2*y9*y32 + y9*y33 + y14*y33 + 2*y15*y33 + y16*y32 + y16*y33 + y17*y32 + 2*y17*y33 + y19*y32 + y19*y33 + y20*y32 + 2*y20*y33 + 2*y21*y32 + y21*y33 + 2*y22*y32 + 2*y22*y33
]

Interesting
new_vars = fmpq_mpoly[DNA0000, DNA0001, DNA0010, DNA0011, DNA001_1, DNA0100, DNA0101, DNA0110, DNA0111, DNA011_1, DNA01_10, DNA01_11, DNA01_1_1, DNA1000, DNA1001, DNA1010, DNA1011, DNA101_1, DNA1100, DNA1101, DNA1110, DNA1111, DNA111_1 + DNA1_111, DNA11_10, DNA11_11, DNA11_1_1 + DNA1_1_11, DNA1_100, DNA1_101, DNA1_110, DNA1_11_1, DNA1_1_10, DNA1_1_1_1, Koff_G1, Koff_NG1, Koff_P1, Kon_G1, Kon_NG1, Kon_P1, S1]
new_system = 
[
y2*y34 + y3*y33 + y6*y33 + y14*y34,
y1*y37*y39 + y4*y33 + y7*y33 + y15*y34,
y1*y36*y39 + y4*y34 + y8*y33 + y16*y34,
y2*y36*y39 + y3*y37*y39 + y5*y35 + y9*y33 + y17*y34,
y4*y38,
y1*y36*y39 + y7*y34 + y8*y33 + y19*y34,
y2*y36*y39 + y6*y37*y39 + y9*y33 + y20*y34,
y3*y36*y39 + y6*y36*y39 + y9*y34 + y11*y35 + y21*y34,
y4*y36*y39 + y7*y36*y39 + y8*y37*y39 + y10*y35 + y12*y35 + y22*y34,
y9*y38 + y13*y35,
y8*y38,
y9*y38 + y13*y35,
y10*y38 + y12*y38,
y1*y37*y39 + y15*y34 + y16*y33 + y19*y33,
y2*y37*y39 + y14*y37*y39 + y17*y33 + y20*y33,
y3*y37*y39 + y14*y36*y39 + y17*y34 + y21*y33,
y4*y37*y39 + y15*y36*y39 + y16*y37*y39 + y18*y35 + y22*y33,
y17*y38,
y6*y37*y39 + y14*y36*y39 + y20*y34 + y21*y33 + y27*y35,
y7*y37*y39 + y15*y36*y39 + y19*y37*y39 + y22*y33 + y28*y35,
y8*y37*y39 + y16*y36*y39 + y19*y36*y39 + y22*y34 + y24*y35 + y29*y35,
y9*y37*y39 + y17*y36*y39 + y20*y36*y39 + y21*y37*y39 + y23*y35 + y25*y35,
2*y22*y38 + y26*y35 + 2*y30*y35,
y21*y38 + y31*y35,
y22*y38 + y26*y35,
y23*y38 + 2*y25*y38 + 2*y32*y35,
y19*y38,
y20*y38,
y21*y38 + y31*y35,
y23*y38 + y32*y35,
y24*y38 + y29*y38,
y26*y38 + y30*y38,
0,
0,
0,
0,
0,
0,
y2*y34 + y3*y33 + y4*y33 + y4*y34 + y6*y33 + y7*y33 + y7*y34 + 2*y8*y33 + 2*y9*y33 + y9*y34 + y14*y34 + 2*y15*y34 + y16*y33 + y16*y34 + y17*y33 + 2*y17*y34 + y19*y33 + y19*y34 + y20*y33 + 2*y20*y34 + 2*y21*y33 + y21*y34 + 2*y22*y33 + 2*y22*y34
]


