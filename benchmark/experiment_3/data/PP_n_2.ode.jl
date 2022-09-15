Original system:

[
kOffE => 0,
S6 => -S0*S6*kOnE*pkOnE - S1*S6*kOnF*pkOnF + S10*kOffF*pkOffF + S15*kCatF*pkCatF + S3*kCatE*pkCatE + S9*kOffE*pkOffE,
S17 => S1*S15*kOnF*pkOnF + S1*S16*kOnF*pkOnF - 2*S17*kCatF*pkCatF - 2*S17*kOffF*pkOffF,
kOffF => 0,
S10 => -S0*S10*kOnE*pkOnE + S1*S6*kOnF*pkOnF - S10*kCatF*pkCatF - S10*kOffF*pkOffF + S14*kOffE*pkOffE + S17*kCatF*pkCatF,
pkOnE => 0,
pkCatE => 0,
S2 => -2*S0*S2*kOnE*pkOnE + S10*kCatF*pkCatF + S11*kCatF*pkCatF + S3*kOffE*pkOffE + S4*kOffE*pkOffE,
S9 => S0*S6*kOnE*pkOnE - S1*S9*kOnF*pkOnF + S14*kOffF*pkOffF + S5*kCatE*pkCatE - S9*kCatE*pkCatE - S9*kOffE*pkOffE,
kOnF => 0,
S13 => -2*S1*S13*kOnF*pkOnF + S15*kOffF*pkOffF + S16*kOffF*pkOffF + S8*kCatE*pkCatE + S9*kCatE*pkCatE,
S16 => S1*S13*kOnF*pkOnF - S1*S16*kOnF*pkOnF + S14*kCatE*pkCatE - S16*kCatF*pkCatF - S16*kOffF*pkOffF + S17*kOffF*pkOffF,
pkOffF => 0,
S1 => -2*S1*S13*kOnF*pkOnF - S1*S15*kOnF*pkOnF - S1*S16*kOnF*pkOnF - S1*S6*kOnF*pkOnF - S1*S7*kOnF*pkOnF - S1*S8*kOnF*pkOnF - S1*S9*kOnF*pkOnF + S10*kCatF*pkCatF + S10*kOffF*pkOffF + S11*kCatF*pkCatF + S11*kOffF*pkOffF + S12*kCatF*pkCatF + S12*kOffF*pkOffF + S14*kCatF*pkCatF + S14*kOffF*pkOffF + S15*kCatF*pkCatF + S15*kOffF*pkOffF + S16*kCatF*pkCatF + S16*kOffF*pkOffF + 2*S17*kCatF*pkCatF + 2*S17*kOffF*pkOffF,
pkOnF => 0,
S15 => S1*S13*kOnF*pkOnF - S1*S15*kOnF*pkOnF + S12*kCatE*pkCatE - S15*kCatF*pkCatF - S15*kOffF*pkOffF + S17*kOffF*pkOffF,
kCatE => 0,
S4 => S0*S2*kOnE*pkOnE - S0*S4*kOnE*pkOnE + S14*kCatF*pkCatF - S4*kCatE*pkCatE - S4*kOffE*pkOffE + S5*kOffE*pkOffE,
S11 => -S0*S11*kOnE*pkOnE + S1*S7*kOnF*pkOnF - S11*kCatF*pkCatF - S11*kOffF*pkOffF + S12*kOffE*pkOffE + S17*kCatF*pkCatF,
pkCatF => 0,
S7 => -S0*S7*kOnE*pkOnE - S1*S7*kOnF*pkOnF + S11*kOffF*pkOffF + S16*kCatF*pkCatF + S4*kCatE*pkCatE + S8*kOffE*pkOffE,
pkOffE => 0,
S12 => S0*S11*kOnE*pkOnE + S1*S8*kOnF*pkOnF - S12*kCatE*pkCatE - S12*kCatF*pkCatF - S12*kOffE*pkOffE - S12*kOffF*pkOffF,
S5 => S0*S3*kOnE*pkOnE + S0*S4*kOnE*pkOnE - 2*S5*kCatE*pkCatE - 2*S5*kOffE*pkOffE,
kOnE => 0,
S0 => -S0*S10*kOnE*pkOnE - S0*S11*kOnE*pkOnE - 2*S0*S2*kOnE*pkOnE - S0*S3*kOnE*pkOnE - S0*S4*kOnE*pkOnE - S0*S6*kOnE*pkOnE - S0*S7*kOnE*pkOnE + S12*kCatE*pkCatE + S12*kOffE*pkOffE + S14*kCatE*pkCatE + S14*kOffE*pkOffE + S3*kCatE*pkCatE + S3*kOffE*pkOffE + S4*kCatE*pkCatE + S4*kOffE*pkOffE + 2*S5*kCatE*pkCatE + 2*S5*kOffE*pkOffE + S8*kCatE*pkCatE + S8*kOffE*pkOffE + S9*kCatE*pkCatE + S9*kOffE*pkOffE,
S14 => S0*S10*kOnE*pkOnE + S1*S9*kOnF*pkOnF - S14*kCatE*pkCatE - S14*kCatF*pkCatF - S14*kOffE*pkOffE - S14*kOffF*pkOffF,
S8 => S0*S7*kOnE*pkOnE - S1*S8*kOnF*pkOnF + S12*kOffF*pkOffF + S5*kCatE*pkCatE - S8*kCatE*pkCatE - S8*kOffE*pkOffE,
kCatF => 0,
S3 => S0*S2*kOnE*pkOnE - S0*S3*kOnE*pkOnE + S12*kCatF*pkCatF - S3*kCatE*pkCatE - S3*kOffE*pkOffE + S5*kOffE*pkOffE
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
new_vars = fmpq_mpoly[S0 + S12 + S14 + S3 + S4 + 2*S5 + S8 + S9, S1 + S10 + S11 + S12 + S14 + S15 + S16 + 2*S17, S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S2 + S3 + S4 + S5 + S6 + S7 + S8 + S9, kCatE, kCatF, kOffE, kOffF, kOnE, kOnF, pkCatE]
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
0,
0
]

Interesting
new_vars = fmpq_mpoly[S0 + S12 + S14 + S3 + S4 + 2*S5 + S8 + S9, S1 + S10 + S11 + S12 + S14 + S15 + S16 + 2*S17, S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S2 + S3 + S4 + S5 + S6 + S7 + S8 + S9, kCatE, kCatF, kOffE, kOffF, kOnE, kOnF, pkCatE, pkCatF]
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
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[S0 + S12 + S14 + S3 + S4 + 2*S5 + S8 + S9, S1 + S10 + S11 + S12 + S14 + S15 + S16 + 2*S17, S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S2 + S3 + S4 + S5 + S6 + S7 + S8 + S9, kCatE, kCatF, kOffE, kOffF, kOnE, kOnF, pkCatE, pkCatF, pkOffE]
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
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[S0 + S12 + S14 + S3 + S4 + 2*S5 + S8 + S9, S1 + S10 + S11 + S12 + S14 + S15 + S16 + 2*S17, S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S2 + S3 + S4 + S5 + S6 + S7 + S8 + S9, kCatE, kCatF, kOffE, kOffF, kOnE, kOnF, pkCatE, pkCatF, pkOffE, pkOffF]
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
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[S0 + S12 + S14 + S3 + S4 + 2*S5 + S8 + S9, S1 + S10 + S11 + S12 + S14 + S15 + S16 + 2*S17, S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S2 + S3 + S4 + S5 + S6 + S7 + S8 + S9, kCatE, kCatF, kOffE, kOffF, kOnE, kOnF, pkCatE, pkCatF, pkOffE, pkOffF, pkOnE]
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
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[S0 + S12 + S14 + S3 + S4 + 2*S5 + S8 + S9, S1 + S10 + S11 + S12 + S14 + S15 + S16 + 2*S17, S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S2 + S3 + S4 + S5 + S6 + S7 + S8 + S9, kCatE, kCatF, kOffE, kOffF, kOnE, kOnF, pkCatE, pkCatF, pkOffE, pkOffF, pkOnE, pkOnF]
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
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[S0, S1, S10 + S11 + 2*S2 + S3 + S4 + S6 + S7, S10 + S11 + S12 + S14 + S15 + S16 + 2*S17, S12 + S14 + S3 + S4 + 2*S5 + S8 + S9, 2*S13 + S15 + S16 + S6 + S7 + S8 + S9, kCatE, kCatF, kOffE, kOffF, kOnE, kOnF, pkCatE, pkCatF, pkOffE, pkOffF, pkOnE, pkOnF]
new_system = 
[
-y1*y3*y11*y17 + y5*y7*y13 + y5*y9*y15,
-y2*y6*y12*y18 + y4*y8*y14 + y4*y10*y16,
-y1*y3*y11*y17 + y4*y8*y14 + y5*y9*y15,
y2*y6*y12*y18 - y4*y8*y14 - y4*y10*y16,
y1*y3*y11*y17 - y5*y7*y13 - y5*y9*y15,
-y2*y6*y12*y18 + y4*y10*y16 + y5*y7*y13,
0,
0,
0,
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
new_vars = fmpq_mpoly[S0, S1, S10 + S11, S12 + S14, S13, S15 + S16, S17, S2, S3 + S4, S5, S6 + S7, S8 + S9, kCatE, kCatF, kOffE, kOffF, kOnE, kOnF, pkCatE, pkCatF, pkOffE, pkOffF, pkOnE, pkOnF]
new_system = 
[
-y1*y3*y17*y23 - 2*y1*y8*y17*y23 - y1*y9*y17*y23 - y1*y11*y17*y23 + y4*y13*y19 + y4*y15*y21 + y9*y13*y19 + y9*y15*y21 + 2*y10*y13*y19 + 2*y10*y15*y21 + y12*y13*y19 + y12*y15*y21,
-2*y2*y5*y18*y24 - y2*y6*y18*y24 - y2*y11*y18*y24 - y2*y12*y18*y24 + y3*y14*y20 + y3*y16*y22 + y4*y14*y20 + y4*y16*y22 + y6*y14*y20 + y6*y16*y22 + 2*y7*y14*y20 + 2*y7*y16*y22,
-y1*y3*y17*y23 + y2*y11*y18*y24 - y3*y14*y20 - y3*y16*y22 + y4*y15*y21 + 2*y7*y14*y20,
y1*y3*y17*y23 + y2*y12*y18*y24 - y4*y13*y19 - y4*y14*y20 - y4*y15*y21 - y4*y16*y22,
-2*y2*y5*y18*y24 + y6*y16*y22 + y12*y13*y19,
2*y2*y5*y18*y24 - y2*y6*y18*y24 + y4*y13*y19 - y6*y14*y20 - y6*y16*y22 + 2*y7*y16*y22,
y2*y6*y18*y24 - 2*y7*y14*y20 - 2*y7*y16*y22,
-2*y1*y8*y17*y23 + y3*y14*y20 + y9*y15*y21,
2*y1*y8*y17*y23 - y1*y9*y17*y23 + y4*y14*y20 - y9*y13*y19 - y9*y15*y21 + 2*y10*y15*y21,
y1*y9*y17*y23 - 2*y10*y13*y19 - 2*y10*y15*y21,
-y1*y11*y17*y23 - y2*y11*y18*y24 + y3*y16*y22 + y6*y14*y20 + y9*y13*y19 + y12*y15*y21,
y1*y11*y17*y23 - y2*y12*y18*y24 + y4*y16*y22 + 2*y10*y13*y19 - y12*y13*y19 - y12*y15*y21,
0,
0,
0,
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
new_vars = fmpq_mpoly[S0, S1, S10 + S11, S10 + S14 + S16, S10 + S3 + S6, S12 + S14, S12 + S3 + S8, S13, S15 + S16, S17, S2, S3 + S4, S5, S6 + S7, S8 + S9, kCatE, kCatF, kOffE, kOffF, kOnE, kOnF, pkCatE, pkCatF, pkOffE, pkOffF, pkOnE, pkOnF]
new_system = 
[
-y1*y3*y20*y26 - 2*y1*y11*y20*y26 - y1*y12*y20*y26 - y1*y14*y20*y26 + y6*y16*y22 + y6*y18*y24 + y12*y16*y22 + y12*y18*y24 + 2*y13*y16*y22 + 2*y13*y18*y24 + y15*y16*y22 + y15*y18*y24,
-2*y2*y8*y21*y27 - y2*y9*y21*y27 - y2*y14*y21*y27 - y2*y15*y21*y27 + y3*y17*y23 + y3*y19*y25 + y6*y17*y23 + y6*y19*y25 + y9*y17*y23 + y9*y19*y25 + 2*y10*y17*y23 + 2*y10*y19*y25,
-y1*y3*y20*y26 + y2*y14*y21*y27 - y3*y17*y23 - y3*y19*y25 + y6*y18*y24 + 2*y10*y17*y23,
-y2*y4*y21*y27 + y2*y5*y21*y27 + y2*y6*y21*y27 - y2*y7*y21*y27 + y2*y8*y21*y27 + y2*y15*y21*y27 - y4*y17*y23 - y4*y19*y25 + y10*y17*y23 + y10*y19*y25,
-y1*y5*y20*y26 + y1*y11*y20*y26 - y4*y17*y23 + y6*y17*y23 + y6*y18*y24 - y7*y18*y24 + y9*y17*y23 + y10*y17*y23 + y13*y18*y24 + y15*y18*y24,
y1*y3*y20*y26 + y2*y15*y21*y27 - y6*y16*y22 - y6*y17*y23 - y6*y18*y24 - y6*y19*y25,
y1*y3*y20*y26 - y1*y5*y20*y26 + y1*y11*y20*y26 + y1*y14*y20*y26 - y7*y16*y22 - y7*y18*y24 + y13*y16*y22 + y13*y18*y24,
-2*y2*y8*y21*y27 + y9*y19*y25 + y15*y16*y22,
2*y2*y8*y21*y27 - y2*y9*y21*y27 + y6*y16*y22 - y9*y17*y23 - y9*y19*y25 + 2*y10*y19*y25,
y2*y9*y21*y27 - 2*y10*y17*y23 - 2*y10*y19*y25,
-2*y1*y11*y20*y26 + y3*y17*y23 + y12*y18*y24,
2*y1*y11*y20*y26 - y1*y12*y20*y26 + y6*y17*y23 - y12*y16*y22 - y12*y18*y24 + 2*y13*y18*y24,
y1*y12*y20*y26 - 2*y13*y16*y22 - 2*y13*y18*y24,
-y1*y14*y20*y26 - y2*y14*y21*y27 + y3*y19*y25 + y9*y17*y23 + y12*y16*y22 + y15*y18*y24,
y1*y14*y20*y26 - y2*y15*y21*y27 + y6*y19*y25 + 2*y13*y16*y22 - y15*y16*y22 - y15*y18*y24,
0,
0,
0,
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


