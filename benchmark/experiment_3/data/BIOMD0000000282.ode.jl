Original system:

[
e => a*k4*p - e*k1*x + k4_prime*p*x,
k1 => 0,
k4_prime => 0,
p2 => a*k4*p,
p1 => k4_prime*p*x,
x => -e*k1*x - k4_prime*p*x,
a => 0,
k4 => 0,
p => -a*k4*p + e*k1*x - k4_prime*p*x
]

Reductions:


new_vars = fmpq_mpoly[a]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[a, e + p]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[a, e + p, k1]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[a, e + p, k1, k4]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[a, e + p, k1, k4, k4_prime]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[a, e, k1, k4, k4_prime, p, x]
new_system = 
[
0,
y1*y4*y6 - y2*y3*y7 + y5*y6*y7,
0,
0,
0,
-y1*y4*y6 + y2*y3*y7 - y5*y6*y7,
-y2*y3*y7 - y5*y6*y7
]


new_vars = fmpq_mpoly[a, e, k1, k4, k4_prime, p, p1, x]
new_system = 
[
0,
y1*y4*y6 - y2*y3*y8 + y5*y6*y8,
0,
0,
0,
-y1*y4*y6 + y2*y3*y8 - y5*y6*y8,
y5*y6*y8,
-y2*y3*y8 - y5*y6*y8
]


