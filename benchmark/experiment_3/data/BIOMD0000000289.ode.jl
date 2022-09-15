Original system:

[
RRRR => AA*EE*pi1 + AA*beta,
SINK => -AA*b1 - AA*muAA - EE*muE - G*muG - G*v - RRRR*muRRRR,
muG => 0,
b1 => 0,
lambdaE => 0,
muE => 0,
pi1 => 0,
E => -EE*muE,
G => EE*gamma,
f => 0,
gamma => 0,
v => 0,
muAA => 0,
AA => G*f*v,
AA_im => -G*f*v,
muRRRR => 0,
beta => 0,
sigma1 => 0,
EE => AA*lambdaE + EE*muE
]

Reductions:


new_vars = fmpq_mpoly[f]
new_system = 
[
0
]


new_vars = fmpq_mpoly[f, gamma]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[f, gamma, lambdaE]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[f, gamma, lambdaE, muE]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[f, gamma, lambdaE, muE, v]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AA, EE, G, f, gamma, lambdaE, muE, v]
new_system = 
[
y3*y4*y8,
y1*y6 + y2*y7,
y2*y5,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AA, AA_im, EE, G, f, gamma, lambdaE, muE, v]
new_system = 
[
y4*y5*y9,
-y4*y5*y9,
y1*y7 + y3*y8,
y3*y6,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AA, AA_im, E, EE, G, f, gamma, lambdaE, muE, v]
new_system = 
[
y5*y6*y10,
-y5*y6*y10,
-y4*y9,
y1*y8 + y4*y9,
y4*y7,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AA, AA_im, E, EE, G, beta, f, gamma, lambdaE, muE, v]
new_system = 
[
y5*y7*y11,
-y5*y7*y11,
-y4*y10,
y1*y9 + y4*y10,
y4*y8,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AA, AA_im, E, EE, G, beta, f, gamma, lambdaE, muE, pi1, v]
new_system = 
[
y5*y7*y12,
-y5*y7*y12,
-y4*y10,
y1*y9 + y4*y10,
y4*y8,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AA, AA_im, E, EE, G, RRRR, beta, f, gamma, lambdaE, muE, pi1, v]
new_system = 
[
y5*y8*y13,
-y5*y8*y13,
-y4*y11,
y1*y10 + y4*y11,
y4*y9,
y1*y4*y12 + y1*y7,
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[AA, AA_im, E, EE, G, RRRR, b1 + muAA, beta, f, gamma, lambdaE, muE, pi1, v]
new_system = 
[
y5*y9*y14,
-y5*y9*y14,
-y4*y12,
y1*y11 + y4*y12,
y4*y10,
y1*y4*y13 + y1*y8,
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
new_vars = fmpq_mpoly[AA, AA_im, E, EE, G, RRRR, b1 + muAA, beta, f, gamma, lambdaE, muE, muG, pi1, v]
new_system = 
[
y5*y9*y15,
-y5*y9*y15,
-y4*y12,
y1*y11 + y4*y12,
y4*y10,
y1*y4*y14 + y1*y8,
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
new_vars = fmpq_mpoly[AA, AA_im, E, EE, G, RRRR, b1 + muAA, beta, f, gamma, lambdaE, muE, muG, muRRRR, pi1, v]
new_system = 
[
y5*y9*y16,
-y5*y9*y16,
-y4*y12,
y1*y11 + y4*y12,
y4*y10,
y1*y4*y15 + y1*y8,
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
new_vars = fmpq_mpoly[AA, AA_im, E, EE, G, RRRR, SINK, b1 + muAA, beta, f, gamma, lambdaE, muE, muG, muRRRR, pi1, v]
new_system = 
[
y5*y10*y17,
-y5*y10*y17,
-y4*y13,
y1*y12 + y4*y13,
y4*y11,
y1*y4*y16 + y1*y9,
-y1*y8 - y4*y13 - y5*y14 - y5*y17 - y6*y15,
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


new_vars = fmpq_mpoly[AA, AA_im, E, EE, G, RRRR, SINK, b1, beta, f, gamma, lambdaE, muAA, muE, muG, muRRRR, pi1, v]
new_system = 
[
y5*y10*y18,
-y5*y10*y18,
-y4*y14,
y1*y12 + y4*y14,
y4*y11,
y1*y4*y17 + y1*y9,
-y1*y8 - y1*y13 - y4*y14 - y5*y15 - y5*y18 - y6*y16,
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


