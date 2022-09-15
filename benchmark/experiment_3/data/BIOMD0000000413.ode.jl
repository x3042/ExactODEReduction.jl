Original system:

[
auxinTIR1VENUS => VENUS*auxinTIR1*la,
sdelta => 0,
ka => 0,
VENUS => auxinTIR1VENUS*ld + sdelta*source,
la => 0,
lm => 0,
TIR1 => auxinTIR1*kd,
SINK => -VENUS*lambda - auxin*mu,
auxin => alpha_tr*source + auxinTIR1*kd,
ld => 0,
mu => 0,
lambda => 0,
kd => 0,
source => 0,
alpha_tr => 0,
auxinTIR1 => TIR1*auxin*ka + auxinTIR1VENUS*ld + auxinTIR1VENUS*lm
]

Reductions:


new_vars = fmpq_mpoly[alpha_tr]
new_system = 
[
0
]


new_vars = fmpq_mpoly[alpha_tr, ka]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[alpha_tr, ka, kd]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[alpha_tr, ka, kd, la]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[alpha_tr, ka, kd, la, lambda]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[alpha_tr, ka, kd, la, lambda, ld]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[alpha_tr, ka, kd, la, lambda, ld, lm]
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


new_vars = fmpq_mpoly[alpha_tr, ka, kd, la, lambda, ld, lm, mu]
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


new_vars = fmpq_mpoly[alpha_tr, ka, kd, la, lambda, ld, lm, mu, sdelta]
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


new_vars = fmpq_mpoly[alpha_tr, ka, kd, la, lambda, ld, lm, mu, sdelta, source]
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
new_vars = fmpq_mpoly[TIR1 - auxin, alpha_tr, ka, kd, la, lambda, ld, lm, mu, sdelta, source]
new_system = 
[
-y2*y11,
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


new_vars = fmpq_mpoly[TIR1, VENUS, alpha_tr, auxin, auxinTIR1, auxinTIR1VENUS, ka, kd, la, lambda, ld, lm, mu, sdelta, source]
new_system = 
[
y5*y8,
y6*y11 + y14*y15,
0,
y3*y15 + y5*y8,
y1*y4*y7 + y6*y11 + y6*y12,
y2*y5*y9,
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


