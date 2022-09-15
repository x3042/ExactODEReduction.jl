Original system:

[
S2 => -2*S0*S2*kOnE + S10*kCatF + S11*kCatF + S3*kOffE + S4*kOffE,
S15 => S1*S13*kOnF - S1*S15*kOnF + S12*kCatE - S15*kCatF - S15*kOffF + S17*kOffF,
S5 => S0*S3*kOnE + S0*S4*kOnE - 2*S5*kCatE - 2*S5*kOffE,
kOnE => 0,
S3 => S0*S2*kOnE - S0*S3*kOnE + S12*kCatF - S3*kCatE - S3*kOffE + S5*kOffE,
kCatE => 0,
S8 => S0*S7*kOnE - S1*S8*kOnF + S12*kOffF + S5*kCatE - S8*kCatE - S8*kOffE,
S11 => -S0*S11*kOnE + S1*S7*kOnF - S11*kCatF - S11*kOffF + S12*kOffE + S17*kCatF,
S16 => S1*S13*kOnF - S1*S16*kOnF + S14*kCatE - S16*kCatF - S16*kOffF + S17*kOffF,
S1 => -2*S1*S13*kOnF - S1*S15*kOnF - S1*S16*kOnF - S1*S6*kOnF - S1*S7*kOnF - S1*S8*kOnF - S1*S9*kOnF + S10*kCatF + S10*kOffF + S11*kCatF + S11*kOffF + S12*kCatF + S12*kOffF + S14*kCatF + S14*kOffF + S15*kCatF + S15*kOffF + S16*kCatF + S16*kOffF + 2*S17*kCatF + 2*S17*kOffF,
kOnF => 0,
kOffF => 0,
S7 => -S0*S7*kOnE - S1*S7*kOnF + S11*kOffF + S16*kCatF + S4*kCatE + S8*kOffE,
S14 => S0*S10*kOnE + S1*S9*kOnF - S14*kCatE - S14*kCatF - S14*kOffE - S14*kOffF,
kCatF => 0,
S9 => S0*S6*kOnE - S1*S9*kOnF + S14*kOffF + S5*kCatE - S9*kCatE - S9*kOffE,
S17 => S1*S15*kOnF + S1*S16*kOnF - 2*S17*kCatF - 2*S17*kOffF,
S13 => -2*S1*S13*kOnF + S15*kOffF + S16*kOffF + S8*kCatE + S9*kCatE,
S10 => -S0*S10*kOnE + S1*S6*kOnF - S10*kCatF - S10*kOffF + S14*kOffE + S17*kCatF,
S4 => S0*S2*kOnE - S0*S4*kOnE + S14*kCatF - S4*kCatE - S4*kOffE + S5*kOffE,
S6 => -S0*S6*kOnE - S1*S6*kOnF + S10*kOffF + S15*kCatF + S3*kCatE + S9*kOffE,
S0 => -S0*S10*kOnE - S0*S11*kOnE - 2*S0*S2*kOnE - S0*S3*kOnE - S0*S4*kOnE - S0*S6*kOnE - S0*S7*kOnE + S12*kCatE + S12*kOffE + S14*kCatE + S14*kOffE + S3*kCatE + S3*kOffE + S4*kCatE + S4*kOffE + 2*S5*kCatE + 2*S5*kOffE + S8*kCatE + S8*kOffE + S9*kCatE + S9*kOffE,
S12 => S0*S11*kOnE + S1*S8*kOnF - S12*kCatE - S12*kCatF - S12*kOffE - S12*kOffF,
kOffE => 0
]

Reductions:

Interesting
new_vars = fmpq_mpoly[S0 + S12 + S14 + S3 + S4 + 2*S5 + S8 + S9]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[S0 + S12 + S14 + S3 + S4 + 2*S5 + S8 + S9, S1 - S13 + S17 - S2 - S3 - S4 - S5 - S6 - S7 - S8 - S9]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[S0 + S12 + S14 + S3 + S4 + 2*S5 + S8 + S9, S1 + S10 + S11 + S12 + S14 + S15 + S16 + 2*S17, S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S2 + S3 + S4 + S5 + S6 + S7 + S8 + S9]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[S0 + S12 + S14 + S3 + S4 + 2*S5 + S8 + S9, S1 + S10 + S11 + S12 + S14 + S15 + S16 + 2*S17, S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S2 + S3 + S4 + S5 + S6 + S7 + S8 + S9, kCatE]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[S0 + S12 + S14 + S3 + S4 + 2*S5 + S8 + S9, S1 + S10 + S11 + S12 + S14 + S15 + S16 + 2*S17, S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S2 + S3 + S4 + S5 + S6 + S7 + S8 + S9, kCatE, kCatF]
new_system = 
[
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[S0 + S12 + S14 + S3 + S4 + 2*S5 + S8 + S9, S1 + S10 + S11 + S12 + S14 + S15 + S16 + 2*S17, S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S2 + S3 + S4 + S5 + S6 + S7 + S8 + S9, kCatE, kCatF, kOffE]
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
new_vars = fmpq_mpoly[S0 + S12 + S14 + S3 + S4 + 2*S5 + S8 + S9, S1 + S10 + S11 + S12 + S14 + S15 + S16 + 2*S17, S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S2 + S3 + S4 + S5 + S6 + S7 + S8 + S9, kCatE, kCatF, kOffE, kOffF]
new_system = 
[
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[S0 + S12 + S14 + S3 + S4 + 2*S5 + S8 + S9, S1 + S10 + S11 + S12 + S14 + S15 + S16 + 2*S17, S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S2 + S3 + S4 + S5 + S6 + S7 + S8 + S9, kCatE, kCatF, kOffE, kOffF, kOnE]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[S0 + S12 + S14 + S3 + S4 + 2*S5 + S8 + S9, S1 + S10 + S11 + S12 + S14 + S15 + S16 + 2*S17, S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S2 + S3 + S4 + S5 + S6 + S7 + S8 + S9, kCatE, kCatF, kOffE, kOffF, kOnE, kOnF]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[S0, S1, S10 + S11 + 2*S2 + S3 + S4 + S6 + S7, S10 + S11 + S12 + S14 + S15 + S16 + 2*S17, S12 + S14 + S3 + S4 + 2*S5 + S8 + S9, 2*S13 + S15 + S16 + S6 + S7 + S8 + S9, kCatE, kCatF, kOffE, kOffF, kOnE, kOnF]
new_system = 
[
-y1*y3*y11 + y5*y7 + y5*y9,
-y2*y6*y12 + y4*y8 + y4*y10,
-y1*y3*y11 + y4*y8 + y5*y9,
y2*y6*y12 - y4*y8 - y4*y10,
y1*y3*y11 - y5*y7 - y5*y9,
-y2*y6*y12 + y4*y10 + y5*y7,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[S0, S1, S10 + S11, S12 + S14, S13, S15 + S16, S17, S2, S3 + S4, S5, S6 + S7, S8 + S9, kCatE, kCatF, kOffE, kOffF, kOnE, kOnF]
new_system = 
[
-y1*y3*y17 - 2*y1*y8*y17 - y1*y9*y17 - y1*y11*y17 + y4*y13 + y4*y15 + y9*y13 + y9*y15 + 2*y10*y13 + 2*y10*y15 + y12*y13 + y12*y15,
-2*y2*y5*y18 - y2*y6*y18 - y2*y11*y18 - y2*y12*y18 + y3*y14 + y3*y16 + y4*y14 + y4*y16 + y6*y14 + y6*y16 + 2*y7*y14 + 2*y7*y16,
-y1*y3*y17 + y2*y11*y18 - y3*y14 - y3*y16 + y4*y15 + 2*y7*y14,
y1*y3*y17 + y2*y12*y18 - y4*y13 - y4*y14 - y4*y15 - y4*y16,
-2*y2*y5*y18 + y6*y16 + y12*y13,
2*y2*y5*y18 - y2*y6*y18 + y4*y13 - y6*y14 - y6*y16 + 2*y7*y16,
y2*y6*y18 - 2*y7*y14 - 2*y7*y16,
-2*y1*y8*y17 + y3*y14 + y9*y15,
2*y1*y8*y17 - y1*y9*y17 + y4*y14 - y9*y13 - y9*y15 + 2*y10*y15,
y1*y9*y17 - 2*y10*y13 - 2*y10*y15,
-y1*y11*y17 - y2*y11*y18 + y3*y16 + y6*y14 + y9*y13 + y12*y15,
y1*y11*y17 - y2*y12*y18 + y4*y16 + 2*y10*y13 - y12*y13 - y12*y15,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[S0, S1, S10 + S11, S10 + S14 + S16, S10 + S3 + S6, S12 + S14, S12 + S3 + S8, S13, S15 + S16, S17, S2, S3 + S4, S5, S6 + S7, S8 + S9, kCatE, kCatF, kOffE, kOffF, kOnE, kOnF]
new_system = 
[
-y1*y3*y20 - 2*y1*y11*y20 - y1*y12*y20 - y1*y14*y20 + y6*y16 + y6*y18 + y12*y16 + y12*y18 + 2*y13*y16 + 2*y13*y18 + y15*y16 + y15*y18,
-2*y2*y8*y21 - y2*y9*y21 - y2*y14*y21 - y2*y15*y21 + y3*y17 + y3*y19 + y6*y17 + y6*y19 + y9*y17 + y9*y19 + 2*y10*y17 + 2*y10*y19,
-y1*y3*y20 + y2*y14*y21 - y3*y17 - y3*y19 + y6*y18 + 2*y10*y17,
-y2*y4*y21 + y2*y5*y21 + y2*y6*y21 - y2*y7*y21 + y2*y8*y21 + y2*y15*y21 - y4*y17 - y4*y19 + y10*y17 + y10*y19,
-y1*y5*y20 + y1*y11*y20 - y4*y17 + y6*y17 + y6*y18 - y7*y18 + y9*y17 + y10*y17 + y13*y18 + y15*y18,
y1*y3*y20 + y2*y15*y21 - y6*y16 - y6*y17 - y6*y18 - y6*y19,
y1*y3*y20 - y1*y5*y20 + y1*y11*y20 + y1*y14*y20 - y7*y16 - y7*y18 + y13*y16 + y13*y18,
-2*y2*y8*y21 + y9*y19 + y15*y16,
2*y2*y8*y21 - y2*y9*y21 + y6*y16 - y9*y17 - y9*y19 + 2*y10*y19,
y2*y9*y21 - 2*y10*y17 - 2*y10*y19,
-2*y1*y11*y20 + y3*y17 + y12*y18,
2*y1*y11*y20 - y1*y12*y20 + y6*y17 - y12*y16 - y12*y18 + 2*y13*y18,
y1*y12*y20 - 2*y13*y16 - 2*y13*y18,
-y1*y14*y20 - y2*y14*y21 + y3*y19 + y9*y17 + y12*y16 + y15*y18,
y1*y14*y20 - y2*y15*y21 + y6*y19 + 2*y13*y16 - y15*y16 - y15*y18,
0,
0,
0,
0,
0,
0
]


