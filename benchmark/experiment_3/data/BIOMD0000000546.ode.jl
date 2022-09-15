Original system:

[
beta_a => 0,
c_V => 0,
s1 => -854340000*I*beta_a + 580000*I*rho_E,
s4 => -580000*I*rho_E,
s3 => -1473*I*c_V,
s6 => 1473*I*c_V,
I => 0,
rho_E => 0,
s2 => 854340000*I*beta_a
]

Reductions:


new_vars = fmpq_mpoly[I]
new_system = 
[
0
]


new_vars = fmpq_mpoly[I, beta_a]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[I, beta_a, c_V]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[I, beta_a, c_V, rho_E]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[I, beta_a, c_V, rho_E, s1]
new_system = 
[
0,
0,
0,
0,
-854340000*y1*y2 + 580000*y1*y4
]


new_vars = fmpq_mpoly[I, beta_a, c_V, rho_E, s1, s2]
new_system = 
[
0,
0,
0,
0,
-854340000*y1*y2 + 580000*y1*y4,
854340000*y1*y2
]


new_vars = fmpq_mpoly[I, beta_a, c_V, rho_E, s1, s2, s3]
new_system = 
[
0,
0,
0,
0,
-854340000*y1*y2 + 580000*y1*y4,
854340000*y1*y2,
-1473*y1*y3
]


new_vars = fmpq_mpoly[I, beta_a, c_V, rho_E, s1, s2, s3, s4]
new_system = 
[
0,
0,
0,
0,
-854340000*y1*y2 + 580000*y1*y4,
854340000*y1*y2,
-1473*y1*y3,
-580000*y1*y4
]


