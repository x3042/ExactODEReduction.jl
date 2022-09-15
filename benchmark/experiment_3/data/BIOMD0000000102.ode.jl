Original system:

[
k25 => 0,
k26 => 0,
C3_star => AC9*C3*k3 + AC9_star*C3*k7 + C3*C9*k2 + C3*C9_star*k6 + C3_starX*k15b,
C3 => k22prod*source,
k13 => 0,
k19 => 0,
k15b => 0,
k4 => 0,
A => AC9*kb1 + AC9X*k13b + AC9_star*k8b + AC9_starX*k14b + k16prod*source,
k9b => 0,
C9 => AC9*kb1 + C9X*k9b + k17prod*source,
C9_star => AC9_star*k8b + C3_star*C9*k4 + C9_starX*k11b,
k13b => 0,
X => AC9X*k10b + AC9_starX*k12b + C3_starX*k15b + C9X*k9b + C9_starX*k11b + k18prod*source,
k3 => 0,
k6 => 0,
kb1 => 0,
source => 0,
k28 => 0,
k1 => 0,
k14b => 0,
k17 => 0,
C9X => AC9X*k13b + C9*X*k9,
C9_starX => AC9_starX*k14b + C9_star*X*k11,
k14 => 0,
k8b => 0,
k9 => 0,
C3_starX => C3_star*X*k15,
AC9_starX => A*C9_starX*k14 + AC9_star*X*k12,
k27 => 0,
k8 => 0,
AC9 => A*C9*k1 + AC9X*k10b,
SINK => -AC9*k21 - AC9X*k20 - AC9_star*k27 - AC9_starX*k28 - C3_star*k23 - C3_starX*k24 - C9X*k19 - C9_star*k26 - C9_starX*k25,
k22prod => 0,
k12 => 0,
k16prod => 0,
k2 => 0,
k20 => 0,
k18 => 0,
k10 => 0,
k23 => 0,
k17prod => 0,
k22 => 0,
AC9_star => A*C9_star*k8 + AC9*C3_star*k5 + AC9_starX*k12b,
k7 => 0,
k16 => 0,
k18prod => 0,
k21 => 0,
k5 => 0,
k11b => 0,
k15 => 0,
k10b => 0,
k11 => 0,
AC9X => A*C9X*k13 + AC9*X*k10,
k12b => 0,
k24 => 0
]

Reductions:


new_vars = fmpq_mpoly[k1]
new_system = 
[
0
]


new_vars = fmpq_mpoly[k1, k10]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[k1, k10, k10b]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[k1, k10, k10b, k11]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b, k12]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b, k12, k12b]
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


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b, k12, k12b, k13]
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


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b]
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


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14]
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


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b]
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


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15]
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


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b]
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


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod]
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


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod]
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


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod]
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
0,
0
]


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k2]
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
0,
0,
0
]


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k2, k22prod]
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
0,
0,
0,
0
]


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k2, k22prod, k3]
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
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k2, k22prod, k3, k4]
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
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k2, k22prod, k3, k4, k5]
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
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k2, k22prod, k3, k4, k5, k6]
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
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k2, k22prod, k3, k4, k5, k6, k7]
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


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k2, k22prod, k3, k4, k5, k6, k7, k8]
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


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k2, k22prod, k3, k4, k5, k6, k7, k8, k8b]
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


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k2, k22prod, k3, k4, k5, k6, k7, k8, k8b, k9]
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


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k2, k22prod, k3, k4, k5, k6, k7, k8, k8b, k9, k9b]
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


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k2, k22prod, k3, k4, k5, k6, k7, k8, k8b, k9, k9b, kb1]
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


new_vars = fmpq_mpoly[k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k2, k22prod, k3, k4, k5, k6, k7, k8, k8b, k9, k9b, kb1, source]
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


new_vars = fmpq_mpoly[C3, k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k2, k22prod, k3, k4, k5, k6, k7, k8, k8b, k9, k9b, kb1, source]
new_system = 
[
y19*y30,
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


new_vars = fmpq_mpoly[A, AC9, AC9X, AC9_star, AC9_starX, C3, C3_star, C3_starX, C9, C9X, C9_star, C9_starX, X, k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k2, k22prod, k3, k4, k5, k6, k7, k8, k8b, k9, k9b, kb1, source]
new_system = 
[
y2*y41 + y3*y22 + y4*y38 + y5*y24 + y27*y42,
y1*y9*y14 + y3*y16,
y1*y10*y21 + y2*y13*y15,
y1*y11*y37 + y2*y7*y34 + y5*y20,
y1*y12*y23 + y4*y13*y19,
y31*y42,
y2*y6*y32 + y4*y6*y36 + y6*y9*y30 + y6*y11*y35 + y8*y26,
y7*y13*y25,
y2*y41 + y10*y40 + y28*y42,
y3*y22 + y9*y13*y39,
y4*y38 + y7*y9*y33 + y12*y18,
y5*y24 + y11*y13*y17,
y3*y16 + y5*y20 + y8*y26 + y10*y40 + y12*y18 + y29*y42,
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


new_vars = fmpq_mpoly[A, AC9, AC9X, AC9_star, AC9_starX, C3, C3_star, C3_starX, C9, C9X, C9_star, C9_starX, X, k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k19, k2, k22prod, k3, k4, k5, k6, k7, k8, k8b, k9, k9b, kb1, source]
new_system = 
[
y2*y42 + y3*y22 + y4*y39 + y5*y24 + y27*y43,
y1*y9*y14 + y3*y16,
y1*y10*y21 + y2*y13*y15,
y1*y11*y38 + y2*y7*y35 + y5*y20,
y1*y12*y23 + y4*y13*y19,
y32*y43,
y2*y6*y33 + y4*y6*y37 + y6*y9*y31 + y6*y11*y36 + y8*y26,
y7*y13*y25,
y2*y42 + y10*y41 + y28*y43,
y3*y22 + y9*y13*y40,
y4*y39 + y7*y9*y34 + y12*y18,
y5*y24 + y11*y13*y17,
y3*y16 + y5*y20 + y8*y26 + y10*y41 + y12*y18 + y29*y43,
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
0,
0
]


new_vars = fmpq_mpoly[A, AC9, AC9X, AC9_star, AC9_starX, C3, C3_star, C3_starX, C9, C9X, C9_star, C9_starX, X, k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k19, k2, k20, k22prod, k3, k4, k5, k6, k7, k8, k8b, k9, k9b, kb1, source]
new_system = 
[
y2*y43 + y3*y22 + y4*y40 + y5*y24 + y27*y44,
y1*y9*y14 + y3*y16,
y1*y10*y21 + y2*y13*y15,
y1*y11*y39 + y2*y7*y36 + y5*y20,
y1*y12*y23 + y4*y13*y19,
y33*y44,
y2*y6*y34 + y4*y6*y38 + y6*y9*y31 + y6*y11*y37 + y8*y26,
y7*y13*y25,
y2*y43 + y10*y42 + y28*y44,
y3*y22 + y9*y13*y41,
y4*y40 + y7*y9*y35 + y12*y18,
y5*y24 + y11*y13*y17,
y3*y16 + y5*y20 + y8*y26 + y10*y42 + y12*y18 + y29*y44,
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
0,
0,
0
]


new_vars = fmpq_mpoly[A, AC9, AC9X, AC9_star, AC9_starX, C3, C3_star, C3_starX, C9, C9X, C9_star, C9_starX, X, k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k19, k2, k20, k21, k22prod, k3, k4, k5, k6, k7, k8, k8b, k9, k9b, kb1, source]
new_system = 
[
y2*y44 + y3*y22 + y4*y41 + y5*y24 + y27*y45,
y1*y9*y14 + y3*y16,
y1*y10*y21 + y2*y13*y15,
y1*y11*y40 + y2*y7*y37 + y5*y20,
y1*y12*y23 + y4*y13*y19,
y34*y45,
y2*y6*y35 + y4*y6*y39 + y6*y9*y31 + y6*y11*y38 + y8*y26,
y7*y13*y25,
y2*y44 + y10*y43 + y28*y45,
y3*y22 + y9*y13*y42,
y4*y41 + y7*y9*y36 + y12*y18,
y5*y24 + y11*y13*y17,
y3*y16 + y5*y20 + y8*y26 + y10*y43 + y12*y18 + y29*y45,
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
0,
0,
0,
0
]


new_vars = fmpq_mpoly[A, AC9, AC9X, AC9_star, AC9_starX, C3, C3_star, C3_starX, C9, C9X, C9_star, C9_starX, X, k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k19, k2, k20, k21, k22prod, k23, k3, k4, k5, k6, k7, k8, k8b, k9, k9b, kb1, source]
new_system = 
[
y2*y45 + y3*y22 + y4*y42 + y5*y24 + y27*y46,
y1*y9*y14 + y3*y16,
y1*y10*y21 + y2*y13*y15,
y1*y11*y41 + y2*y7*y38 + y5*y20,
y1*y12*y23 + y4*y13*y19,
y34*y46,
y2*y6*y36 + y4*y6*y40 + y6*y9*y31 + y6*y11*y39 + y8*y26,
y7*y13*y25,
y2*y45 + y10*y44 + y28*y46,
y3*y22 + y9*y13*y43,
y4*y42 + y7*y9*y37 + y12*y18,
y5*y24 + y11*y13*y17,
y3*y16 + y5*y20 + y8*y26 + y10*y44 + y12*y18 + y29*y46,
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
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[A, AC9, AC9X, AC9_star, AC9_starX, C3, C3_star, C3_starX, C9, C9X, C9_star, C9_starX, X, k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k19, k2, k20, k21, k22prod, k23, k24, k3, k4, k5, k6, k7, k8, k8b, k9, k9b, kb1, source]
new_system = 
[
y2*y46 + y3*y22 + y4*y43 + y5*y24 + y27*y47,
y1*y9*y14 + y3*y16,
y1*y10*y21 + y2*y13*y15,
y1*y11*y42 + y2*y7*y39 + y5*y20,
y1*y12*y23 + y4*y13*y19,
y34*y47,
y2*y6*y37 + y4*y6*y41 + y6*y9*y31 + y6*y11*y40 + y8*y26,
y7*y13*y25,
y2*y46 + y10*y45 + y28*y47,
y3*y22 + y9*y13*y44,
y4*y43 + y7*y9*y38 + y12*y18,
y5*y24 + y11*y13*y17,
y3*y16 + y5*y20 + y8*y26 + y10*y45 + y12*y18 + y29*y47,
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
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[A, AC9, AC9X, AC9_star, AC9_starX, C3, C3_star, C3_starX, C9, C9X, C9_star, C9_starX, X, k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k19, k2, k20, k21, k22prod, k23, k24, k25, k3, k4, k5, k6, k7, k8, k8b, k9, k9b, kb1, source]
new_system = 
[
y2*y47 + y3*y22 + y4*y44 + y5*y24 + y27*y48,
y1*y9*y14 + y3*y16,
y1*y10*y21 + y2*y13*y15,
y1*y11*y43 + y2*y7*y40 + y5*y20,
y1*y12*y23 + y4*y13*y19,
y34*y48,
y2*y6*y38 + y4*y6*y42 + y6*y9*y31 + y6*y11*y41 + y8*y26,
y7*y13*y25,
y2*y47 + y10*y46 + y28*y48,
y3*y22 + y9*y13*y45,
y4*y44 + y7*y9*y39 + y12*y18,
y5*y24 + y11*y13*y17,
y3*y16 + y5*y20 + y8*y26 + y10*y46 + y12*y18 + y29*y48,
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
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[A, AC9, AC9X, AC9_star, AC9_starX, C3, C3_star, C3_starX, C9, C9X, C9_star, C9_starX, X, k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k19, k2, k20, k21, k22prod, k23, k24, k25, k26, k3, k4, k5, k6, k7, k8, k8b, k9, k9b, kb1, source]
new_system = 
[
y2*y48 + y3*y22 + y4*y45 + y5*y24 + y27*y49,
y1*y9*y14 + y3*y16,
y1*y10*y21 + y2*y13*y15,
y1*y11*y44 + y2*y7*y41 + y5*y20,
y1*y12*y23 + y4*y13*y19,
y34*y49,
y2*y6*y39 + y4*y6*y43 + y6*y9*y31 + y6*y11*y42 + y8*y26,
y7*y13*y25,
y2*y48 + y10*y47 + y28*y49,
y3*y22 + y9*y13*y46,
y4*y45 + y7*y9*y40 + y12*y18,
y5*y24 + y11*y13*y17,
y3*y16 + y5*y20 + y8*y26 + y10*y47 + y12*y18 + y29*y49,
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
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[A, AC9, AC9X, AC9_star, AC9_starX, C3, C3_star, C3_starX, C9, C9X, C9_star, C9_starX, X, k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k19, k2, k20, k21, k22prod, k23, k24, k25, k26, k27, k3, k4, k5, k6, k7, k8, k8b, k9, k9b, kb1, source]
new_system = 
[
y2*y49 + y3*y22 + y4*y46 + y5*y24 + y27*y50,
y1*y9*y14 + y3*y16,
y1*y10*y21 + y2*y13*y15,
y1*y11*y45 + y2*y7*y42 + y5*y20,
y1*y12*y23 + y4*y13*y19,
y34*y50,
y2*y6*y40 + y4*y6*y44 + y6*y9*y31 + y6*y11*y43 + y8*y26,
y7*y13*y25,
y2*y49 + y10*y48 + y28*y50,
y3*y22 + y9*y13*y47,
y4*y46 + y7*y9*y41 + y12*y18,
y5*y24 + y11*y13*y17,
y3*y16 + y5*y20 + y8*y26 + y10*y48 + y12*y18 + y29*y50,
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


new_vars = fmpq_mpoly[A, AC9, AC9X, AC9_star, AC9_starX, C3, C3_star, C3_starX, C9, C9X, C9_star, C9_starX, X, k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k19, k2, k20, k21, k22prod, k23, k24, k25, k26, k27, k28, k3, k4, k5, k6, k7, k8, k8b, k9, k9b, kb1, source]
new_system = 
[
y2*y50 + y3*y22 + y4*y47 + y5*y24 + y27*y51,
y1*y9*y14 + y3*y16,
y1*y10*y21 + y2*y13*y15,
y1*y11*y46 + y2*y7*y43 + y5*y20,
y1*y12*y23 + y4*y13*y19,
y34*y51,
y2*y6*y41 + y4*y6*y45 + y6*y9*y31 + y6*y11*y44 + y8*y26,
y7*y13*y25,
y2*y50 + y10*y49 + y28*y51,
y3*y22 + y9*y13*y48,
y4*y47 + y7*y9*y42 + y12*y18,
y5*y24 + y11*y13*y17,
y3*y16 + y5*y20 + y8*y26 + y10*y49 + y12*y18 + y29*y51,
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


new_vars = fmpq_mpoly[A, AC9, AC9X, AC9_star, AC9_starX, C3, C3_star, C3_starX, C9, C9X, C9_star, C9_starX, SINK, X, k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16prod, k17prod, k18prod, k19, k2, k20, k21, k22prod, k23, k24, k25, k26, k27, k28, k3, k4, k5, k6, k7, k8, k8b, k9, k9b, kb1, source]
new_system = 
[
y2*y51 + y3*y23 + y4*y48 + y5*y25 + y28*y52,
y1*y9*y15 + y3*y17,
y1*y10*y22 + y2*y14*y16,
y1*y11*y47 + y2*y7*y44 + y5*y21,
y1*y12*y24 + y4*y14*y20,
y35*y52,
y2*y6*y42 + y4*y6*y46 + y6*y9*y32 + y6*y11*y45 + y8*y27,
y7*y14*y26,
y2*y51 + y10*y50 + y29*y52,
y3*y23 + y9*y14*y49,
y4*y48 + y7*y9*y43 + y12*y19,
y5*y25 + y11*y14*y18,
-y2*y34 - y3*y33 - y4*y40 - y5*y41 - y7*y36 - y8*y37 - y10*y31 - y11*y39 - y12*y38,
y3*y17 + y5*y21 + y8*y27 + y10*y50 + y12*y19 + y30*y52,
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


new_vars = fmpq_mpoly[A, AC9, AC9X, AC9_star, AC9_starX, C3, C3_star, C3_starX, C9, C9X, C9_star, C9_starX, SINK, X, k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16, k16prod, k17prod, k18prod, k19, k2, k20, k21, k22prod, k23, k24, k25, k26, k27, k28, k3, k4, k5, k6, k7, k8, k8b, k9, k9b, kb1, source]
new_system = 
[
y2*y52 + y3*y23 + y4*y49 + y5*y25 + y29*y53,
y1*y9*y15 + y3*y17,
y1*y10*y22 + y2*y14*y16,
y1*y11*y48 + y2*y7*y45 + y5*y21,
y1*y12*y24 + y4*y14*y20,
y36*y53,
y2*y6*y43 + y4*y6*y47 + y6*y9*y33 + y6*y11*y46 + y8*y27,
y7*y14*y26,
y2*y52 + y10*y51 + y30*y53,
y3*y23 + y9*y14*y50,
y4*y49 + y7*y9*y44 + y12*y19,
y5*y25 + y11*y14*y18,
-y2*y35 - y3*y34 - y4*y41 - y5*y42 - y7*y37 - y8*y38 - y10*y32 - y11*y40 - y12*y39,
y3*y17 + y5*y21 + y8*y27 + y10*y51 + y12*y19 + y31*y53,
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


new_vars = fmpq_mpoly[A, AC9, AC9X, AC9_star, AC9_starX, C3, C3_star, C3_starX, C9, C9X, C9_star, C9_starX, SINK, X, k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16, k16prod, k17, k17prod, k18prod, k19, k2, k20, k21, k22prod, k23, k24, k25, k26, k27, k28, k3, k4, k5, k6, k7, k8, k8b, k9, k9b, kb1, source]
new_system = 
[
y2*y53 + y3*y23 + y4*y50 + y5*y25 + y29*y54,
y1*y9*y15 + y3*y17,
y1*y10*y22 + y2*y14*y16,
y1*y11*y49 + y2*y7*y46 + y5*y21,
y1*y12*y24 + y4*y14*y20,
y37*y54,
y2*y6*y44 + y4*y6*y48 + y6*y9*y34 + y6*y11*y47 + y8*y27,
y7*y14*y26,
y2*y53 + y10*y52 + y31*y54,
y3*y23 + y9*y14*y51,
y4*y50 + y7*y9*y45 + y12*y19,
y5*y25 + y11*y14*y18,
-y2*y36 - y3*y35 - y4*y42 - y5*y43 - y7*y38 - y8*y39 - y10*y33 - y11*y41 - y12*y40,
y3*y17 + y5*y21 + y8*y27 + y10*y52 + y12*y19 + y32*y54,
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


new_vars = fmpq_mpoly[A, AC9, AC9X, AC9_star, AC9_starX, C3, C3_star, C3_starX, C9, C9X, C9_star, C9_starX, SINK, X, k1, k10, k10b, k11, k11b, k12, k12b, k13, k13b, k14, k14b, k15, k15b, k16, k16prod, k17, k17prod, k18, k18prod, k19, k2, k20, k21, k22prod, k23, k24, k25, k26, k27, k28, k3, k4, k5, k6, k7, k8, k8b, k9, k9b, kb1, source]
new_system = 
[
y2*y54 + y3*y23 + y4*y51 + y5*y25 + y29*y55,
y1*y9*y15 + y3*y17,
y1*y10*y22 + y2*y14*y16,
y1*y11*y50 + y2*y7*y47 + y5*y21,
y1*y12*y24 + y4*y14*y20,
y38*y55,
y2*y6*y45 + y4*y6*y49 + y6*y9*y35 + y6*y11*y48 + y8*y27,
y7*y14*y26,
y2*y54 + y10*y53 + y31*y55,
y3*y23 + y9*y14*y52,
y4*y51 + y7*y9*y46 + y12*y19,
y5*y25 + y11*y14*y18,
-y2*y37 - y3*y36 - y4*y43 - y5*y44 - y7*y39 - y8*y40 - y10*y34 - y11*y42 - y12*y41,
y3*y17 + y5*y21 + y8*y27 + y10*y53 + y12*y19 + y33*y55,
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


