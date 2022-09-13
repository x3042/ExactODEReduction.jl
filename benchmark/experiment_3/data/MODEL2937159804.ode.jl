Original system:

[
J10_k => 0,
LexAUnbindingAuto_k => 0,
g_mL => 0,
mLexA => -bLexA*fluxL*g_mL + fluxL*g_mL,
RecA => fluxR*g_R*mRecA,
fluxR => 0,
mRecA => -bRecA*fluxR*g_mR + fluxR*g_mR,
fluxL => 0,
g_R => 0,
RecADegradation_k => 0,
degradation => J10_k*LexA*RecA + LexA*LexADegradation_k + RecA*RecADegradation_k + mLexA*mLexADegradation_k + mRecA*mRecADegradation_k,
c_R => 0,
bLexA => LexA*c_L,
LexA => LexAUnbindingAuto_k*bLexA + LexAUnbindingRecAPromoter_k*bRecA + fluxL*g_L*mLexA,
c_L => 0,
LexAUnbindingRecAPromoter_k => 0,
LexADegradation_k => 0,
mRecADegradation_k => 0,
bRecA => LexA*c_R,
g_L => 0,
g_mR => 0,
mLexADegradation_k => 0
]

Reductions:


new_vars = fmpq_mpoly[J10_k]
new_system = 
[
0
]


new_vars = fmpq_mpoly[J10_k, LexAUnbindingAuto_k]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[J10_k, LexAUnbindingAuto_k, LexAUnbindingRecAPromoter_k]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[J10_k, LexAUnbindingAuto_k, LexAUnbindingRecAPromoter_k, c_L]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[J10_k, LexAUnbindingAuto_k, LexAUnbindingRecAPromoter_k, c_L, c_R]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[J10_k, LexAUnbindingAuto_k, LexAUnbindingRecAPromoter_k, c_L, c_R, fluxL]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[J10_k, LexAUnbindingAuto_k, LexAUnbindingRecAPromoter_k, c_L, c_R, fluxL, g_L]
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


new_vars = fmpq_mpoly[J10_k, LexAUnbindingAuto_k, LexAUnbindingRecAPromoter_k, c_L, c_R, fluxL, g_L, g_mL]
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


new_vars = fmpq_mpoly[J10_k, LexA, LexAUnbindingAuto_k, LexAUnbindingRecAPromoter_k, bLexA, bRecA, c_L, c_R, fluxL, g_L, g_mL, mLexA]
new_system = 
[
0,
y3*y5 + y4*y6 + y9*y10*y12,
0,
0,
y2*y7,
y2*y8,
0,
0,
0,
0,
0,
-y5*y9*y11 + y9*y11
]


new_vars = fmpq_mpoly[J10_k, LexA, LexADegradation_k, LexAUnbindingAuto_k, LexAUnbindingRecAPromoter_k, bLexA, bRecA, c_L, c_R, fluxL, g_L, g_mL, mLexA]
new_system = 
[
0,
y4*y6 + y5*y7 + y10*y11*y13,
0,
0,
0,
y2*y8,
y2*y9,
0,
0,
0,
0,
0,
-y6*y10*y12 + y10*y12
]


new_vars = fmpq_mpoly[J10_k, LexA, LexADegradation_k, LexAUnbindingAuto_k, LexAUnbindingRecAPromoter_k, bLexA, bRecA, c_L, c_R, fluxL, fluxR, g_L, g_mL, mLexA]
new_system = 
[
0,
y4*y6 + y5*y7 + y10*y12*y14,
0,
0,
0,
y2*y8,
y2*y9,
0,
0,
0,
0,
0,
0,
-y6*y10*y13 + y10*y13
]


new_vars = fmpq_mpoly[J10_k, LexA, LexADegradation_k, LexAUnbindingAuto_k, LexAUnbindingRecAPromoter_k, bLexA, bRecA, c_L, c_R, fluxL, fluxR, g_L, g_R, g_mL, mLexA]
new_system = 
[
0,
y4*y6 + y5*y7 + y10*y12*y15,
0,
0,
0,
y2*y8,
y2*y9,
0,
0,
0,
0,
0,
0,
0,
-y6*y10*y14 + y10*y14
]


new_vars = fmpq_mpoly[J10_k, LexA, LexADegradation_k, LexAUnbindingAuto_k, LexAUnbindingRecAPromoter_k, bLexA, bRecA, c_L, c_R, fluxL, fluxR, g_L, g_R, g_mL, g_mR, mLexA]
new_system = 
[
0,
y4*y6 + y5*y7 + y10*y12*y16,
0,
0,
0,
y2*y8,
y2*y9,
0,
0,
0,
0,
0,
0,
0,
0,
-y6*y10*y14 + y10*y14
]


new_vars = fmpq_mpoly[J10_k, LexA, LexADegradation_k, LexAUnbindingAuto_k, LexAUnbindingRecAPromoter_k, bLexA, bRecA, c_L, c_R, fluxL, fluxR, g_L, g_R, g_mL, g_mR, mLexA, mRecA]
new_system = 
[
0,
y4*y6 + y5*y7 + y10*y12*y16,
0,
0,
0,
y2*y8,
y2*y9,
0,
0,
0,
0,
0,
0,
0,
0,
-y6*y10*y14 + y10*y14,
-y7*y11*y15 + y11*y15
]


new_vars = fmpq_mpoly[J10_k, LexA, LexADegradation_k, LexAUnbindingAuto_k, LexAUnbindingRecAPromoter_k, RecA, bLexA, bRecA, c_L, c_R, fluxL, fluxR, g_L, g_R, g_mL, g_mR, mLexA, mRecA]
new_system = 
[
0,
y4*y7 + y5*y8 + y11*y13*y17,
0,
0,
0,
y12*y14*y18,
y2*y9,
y2*y10,
0,
0,
0,
0,
0,
0,
0,
0,
-y7*y11*y15 + y11*y15,
-y8*y12*y16 + y12*y16
]


new_vars = fmpq_mpoly[J10_k, LexA, LexADegradation_k, LexAUnbindingAuto_k, LexAUnbindingRecAPromoter_k, RecA, RecADegradation_k, bLexA, bRecA, c_L, c_R, fluxL, fluxR, g_L, g_R, g_mL, g_mR, mLexA, mRecA]
new_system = 
[
0,
y4*y8 + y5*y9 + y12*y14*y18,
0,
0,
0,
y13*y15*y19,
0,
y2*y10,
y2*y11,
0,
0,
0,
0,
0,
0,
0,
0,
-y8*y12*y16 + y12*y16,
-y9*y13*y17 + y13*y17
]


new_vars = fmpq_mpoly[J10_k, LexA, LexADegradation_k, LexAUnbindingAuto_k, LexAUnbindingRecAPromoter_k, RecA, RecADegradation_k, bLexA, bRecA, c_L, c_R, fluxL, fluxR, g_L, g_R, g_mL, g_mR, mLexA, mLexADegradation_k, mRecA]
new_system = 
[
0,
y4*y8 + y5*y9 + y12*y14*y18,
0,
0,
0,
y13*y15*y20,
0,
y2*y10,
y2*y11,
0,
0,
0,
0,
0,
0,
0,
0,
-y8*y12*y16 + y12*y16,
0,
-y9*y13*y17 + y13*y17
]


new_vars = fmpq_mpoly[J10_k, LexA, LexADegradation_k, LexAUnbindingAuto_k, LexAUnbindingRecAPromoter_k, RecA, RecADegradation_k, bLexA, bRecA, c_L, c_R, fluxL, fluxR, g_L, g_R, g_mL, g_mR, mLexA, mLexADegradation_k, mRecA, mRecADegradation_k]
new_system = 
[
0,
y4*y8 + y5*y9 + y12*y14*y18,
0,
0,
0,
y13*y15*y20,
0,
y2*y10,
y2*y11,
0,
0,
0,
0,
0,
0,
0,
0,
-y8*y12*y16 + y12*y16,
0,
-y9*y13*y17 + y13*y17,
0
]


