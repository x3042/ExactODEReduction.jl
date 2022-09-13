Original system:

[
N => 0,
source => 0,
sdelta => 0,
V_NI => N*T_i*np*sdelta,
T => lambda*source,
delta1 => 0,
SINK => -T*delta1 - T_i*sdelta - V_I*c - V_NI*c,
np => 0,
T_i => T*V_I*k,
c => 0,
lambda => 0,
V_I => -N*T_i*np*sdelta + N*T_i*sdelta,
k => 0
]

Reductions:


new_vars = fmpq_mpoly[N]
new_system = 
[
0
]


new_vars = fmpq_mpoly[N, c]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[N, c, delta1]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[N, c, delta1, k]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[N, c, delta1, k, lambda]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[N, c, delta1, k, lambda, np]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[N, c, delta1, k, lambda, np, sdelta]
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


new_vars = fmpq_mpoly[N, c, delta1, k, lambda, np, sdelta, source]
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


new_vars = fmpq_mpoly[N, T, c, delta1, k, lambda, np, sdelta, source]
new_system = 
[
0,
y6*y9,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[N, T, T_i, V_I, c, delta1, k, lambda, np, sdelta, source]
new_system = 
[
0,
y8*y11,
y2*y4*y7,
-y1*y3*y9*y10 + y1*y3*y10,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[N, T, T_i, V_I, V_NI, c, delta1, k, lambda, np, sdelta, source]
new_system = 
[
0,
y9*y12,
y2*y4*y8,
-y1*y3*y10*y11 + y1*y3*y11,
y1*y3*y10*y11,
0,
0,
0,
0,
0,
0,
0
]


