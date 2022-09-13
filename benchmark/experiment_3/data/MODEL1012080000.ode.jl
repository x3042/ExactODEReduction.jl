Original system:

[
k9 => 0,
k7 => 0,
k12 => 0,
k11 => 0,
DAG => G_a*PIP2*k3,
G => G_a*k6,
k19 => 0,
HRP2 => GRK56*HR*k18 + Hbarr2RP2*k24,
k2 => 0,
k0 => 0,
k16 => 0,
Hbarr2RP1 => HRP1*barr2*k12,
GRK56 => 0,
k20 => 0,
k22 => 0,
k5 => 0,
k18 => 0,
k10 => 0,
HRbarr2 => HR*barr2*k19,
k4 => 0,
k21 => 0,
k17 => 0,
HRP1 => GRK23*HR*k10 + Hbarr1RP1*k13 + Hbarr2RP1*k14,
k13 => 0,
k8 => 0,
k6 => 0,
GRK23 => 0,
k23 => 0,
Hbarr1RP1 => HRP1*barr1*k11,
Hbarr2RP2 => HRP2*barr2*k20,
barr2 => HRbarr2*k23 + Hbarr2RP1*k14 + Hbarr2RP1*k16 + Hbarr2RP2*k24,
barr1 => Hbarr1RP1*k13 + Hbarr1RP1*k15,
PKC => PKC_a*k8,
k25 => 0,
k24 => 0,
ERK => GpERK*k9 + bpERK*k25,
k1 => 0,
GpERK => ERK*PKC_a*k5,
PKC_a => DAG*PKC*k4,
bpERK => ERK*HRbarr2*k21 + ERK*Hbarr2RP2*k22,
k14 => 0,
k3 => 0,
PIP2 => DAG*k7,
G_a => G*HR*k2 + G*HRP1*k1 + G*k0,
k15 => 0,
HR => HRP2*k17 + HRbarr2*k23 + Hbarr1RP1*k15 + Hbarr2RP1*k16
]

Reductions:


new_vars = fmpq_mpoly[GRK23]
new_system = 
[
0
]


new_vars = fmpq_mpoly[GRK23, GRK56]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[GRK23, GRK56, k0]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[GRK23, GRK56, k0, k1]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[GRK23, GRK56, k0, k1, k10]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[GRK23, GRK56, k0, k1, k10, k11]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[GRK23, GRK56, k0, k1, k10, k11, k12]
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


new_vars = fmpq_mpoly[GRK23, GRK56, k0, k1, k10, k11, k12, k13]
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


new_vars = fmpq_mpoly[GRK23, GRK56, k0, k1, k10, k11, k12, k13, k14]
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


new_vars = fmpq_mpoly[GRK23, GRK56, k0, k1, k10, k11, k12, k13, k14, k15]
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


new_vars = fmpq_mpoly[GRK23, GRK56, k0, k1, k10, k11, k12, k13, k14, k15, k16]
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


new_vars = fmpq_mpoly[GRK23, GRK56, k0, k1, k10, k11, k12, k13, k14, k15, k16, k17]
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


new_vars = fmpq_mpoly[GRK23, GRK56, k0, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18]
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


new_vars = fmpq_mpoly[GRK23, GRK56, k0, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19]
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


new_vars = fmpq_mpoly[GRK23, GRK56, k0, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2]
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


new_vars = fmpq_mpoly[GRK23, GRK56, k0, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20]
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


new_vars = fmpq_mpoly[GRK23, GRK56, k0, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k23]
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


new_vars = fmpq_mpoly[GRK23, GRK56, k0, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k23, k24]
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


new_vars = fmpq_mpoly[GRK23, GRK56, k0, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k23, k24, k3]
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


new_vars = fmpq_mpoly[GRK23, GRK56, k0, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k23, k24, k3, k6]
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


new_vars = fmpq_mpoly[GRK23, GRK56, k0, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k23, k24, k3, k6, k7]
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


new_vars = fmpq_mpoly[GRK23, GRK56, HR, HRP1, HRP2, HRbarr2, Hbarr1RP1, Hbarr2RP1, Hbarr2RP2, barr1, barr2, k0, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k23, k24, k3, k6, k7]
new_system = 
[
0,
0,
y5*y21 + y6*y26 + y7*y19 + y8*y20,
y1*y3*y14 + y7*y17 + y8*y18,
y2*y3*y22 + y9*y27,
y3*y11*y23,
y4*y10*y15,
y4*y11*y16,
y5*y11*y25,
y7*y17 + y7*y19,
y6*y26 + y8*y18 + y8*y20 + y9*y27,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[G, GRK23, GRK56, G_a, HR, HRP1, HRP2, HRbarr2, Hbarr1RP1, Hbarr2RP1, Hbarr2RP2, barr1, barr2, k0, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k23, k24, k3, k6, k7]
new_system = 
[
y4*y31,
0,
0,
y1*y5*y26 + y1*y6*y15 + y1*y14,
y7*y23 + y8*y28 + y9*y21 + y10*y22,
y2*y5*y16 + y9*y19 + y10*y20,
y3*y5*y24 + y11*y29,
y5*y13*y25,
y6*y12*y17,
y6*y13*y18,
y7*y13*y27,
y9*y19 + y9*y21,
y8*y28 + y10*y20 + y10*y22 + y11*y29,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[DAG, G, GRK23, GRK56, G_a, HR, HRP1, HRP2, HRbarr2, Hbarr1RP1, Hbarr2RP1, Hbarr2RP2, PIP2, barr1, barr2, k0, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k23, k24, k3, k6, k7]
new_system = 
[
y5*y13*y32,
y5*y33,
0,
0,
y2*y6*y28 + y2*y7*y17 + y2*y16,
y8*y25 + y9*y30 + y10*y23 + y11*y24,
y3*y6*y18 + y10*y21 + y11*y22,
y4*y6*y26 + y12*y31,
y6*y15*y27,
y7*y14*y19,
y7*y15*y20,
y8*y15*y29,
y1*y34,
y10*y21 + y10*y23,
y9*y30 + y11*y22 + y11*y24 + y12*y31,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[DAG, G, GRK23, GRK56, G_a, HR, HRP1, HRP2, HRbarr2, Hbarr1RP1, Hbarr2RP1, Hbarr2RP2, PIP2, barr1, barr2, k0, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k21, k23, k24, k3, k6, k7]
new_system = 
[
y5*y13*y33,
y5*y34,
0,
0,
y2*y6*y28 + y2*y7*y17 + y2*y16,
y8*y25 + y9*y31 + y10*y23 + y11*y24,
y3*y6*y18 + y10*y21 + y11*y22,
y4*y6*y26 + y12*y32,
y6*y15*y27,
y7*y14*y19,
y7*y15*y20,
y8*y15*y29,
y1*y35,
y10*y21 + y10*y23,
y9*y31 + y11*y22 + y11*y24 + y12*y32,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[DAG, G, GRK23, GRK56, G_a, HR, HRP1, HRP2, HRbarr2, Hbarr1RP1, Hbarr2RP1, Hbarr2RP2, PIP2, barr1, barr2, k0, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k21, k22, k23, k24, k3, k6, k7]
new_system = 
[
y5*y13*y34,
y5*y35,
0,
0,
y2*y6*y28 + y2*y7*y17 + y2*y16,
y8*y25 + y9*y32 + y10*y23 + y11*y24,
y3*y6*y18 + y10*y21 + y11*y22,
y4*y6*y26 + y12*y33,
y6*y15*y27,
y7*y14*y19,
y7*y15*y20,
y8*y15*y29,
y1*y36,
y10*y21 + y10*y23,
y9*y32 + y11*y22 + y11*y24 + y12*y33,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[DAG, G, GRK23, GRK56, G_a, HR, HRP1, HRP2, HRbarr2, Hbarr1RP1, Hbarr2RP1, Hbarr2RP2, PIP2, barr1, barr2, k0, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k21, k22, k23, k24, k25, k3, k6, k7]
new_system = 
[
y5*y13*y35,
y5*y36,
0,
0,
y2*y6*y28 + y2*y7*y17 + y2*y16,
y8*y25 + y9*y32 + y10*y23 + y11*y24,
y3*y6*y18 + y10*y21 + y11*y22,
y4*y6*y26 + y12*y33,
y6*y15*y27,
y7*y14*y19,
y7*y15*y20,
y8*y15*y29,
y1*y37,
y10*y21 + y10*y23,
y9*y32 + y11*y22 + y11*y24 + y12*y33,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[DAG, G, GRK23, GRK56, G_a, HR, HRP1, HRP2, HRbarr2, Hbarr1RP1, Hbarr2RP1, Hbarr2RP2, PIP2, barr1, barr2, k0, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k21, k22, k23, k24, k25, k3, k4, k6, k7]
new_system = 
[
y5*y13*y35,
y5*y37,
0,
0,
y2*y6*y28 + y2*y7*y17 + y2*y16,
y8*y25 + y9*y32 + y10*y23 + y11*y24,
y3*y6*y18 + y10*y21 + y11*y22,
y4*y6*y26 + y12*y33,
y6*y15*y27,
y7*y14*y19,
y7*y15*y20,
y8*y15*y29,
y1*y38,
y10*y21 + y10*y23,
y9*y32 + y11*y22 + y11*y24 + y12*y33,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[DAG, G, GRK23, GRK56, G_a, HR, HRP1, HRP2, HRbarr2, Hbarr1RP1, Hbarr2RP1, Hbarr2RP2, PIP2, barr1, barr2, k0, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k21, k22, k23, k24, k25, k3, k4, k5, k6, k7]
new_system = 
[
y5*y13*y35,
y5*y38,
0,
0,
y2*y6*y28 + y2*y7*y17 + y2*y16,
y8*y25 + y9*y32 + y10*y23 + y11*y24,
y3*y6*y18 + y10*y21 + y11*y22,
y4*y6*y26 + y12*y33,
y6*y15*y27,
y7*y14*y19,
y7*y15*y20,
y8*y15*y29,
y1*y39,
y10*y21 + y10*y23,
y9*y32 + y11*y22 + y11*y24 + y12*y33,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[DAG, G, GRK23, GRK56, G_a, HR, HRP1, HRP2, HRbarr2, Hbarr1RP1, Hbarr2RP1, Hbarr2RP2, PIP2, barr1, barr2, k0, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k21, k22, k23, k24, k25, k3, k4, k5, k6, k7, k8]
new_system = 
[
y5*y13*y35,
y5*y38,
0,
0,
y2*y6*y28 + y2*y7*y17 + y2*y16,
y8*y25 + y9*y32 + y10*y23 + y11*y24,
y3*y6*y18 + y10*y21 + y11*y22,
y4*y6*y26 + y12*y33,
y6*y15*y27,
y7*y14*y19,
y7*y15*y20,
y8*y15*y29,
y1*y39,
y10*y21 + y10*y23,
y9*y32 + y11*y22 + y11*y24 + y12*y33,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[DAG, G, GRK23, GRK56, G_a, HR, HRP1, HRP2, HRbarr2, Hbarr1RP1, Hbarr2RP1, Hbarr2RP2, PIP2, barr1, barr2, k0, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k21, k22, k23, k24, k25, k3, k4, k5, k6, k7, k8, k9]
new_system = 
[
y5*y13*y35,
y5*y38,
0,
0,
y2*y6*y28 + y2*y7*y17 + y2*y16,
y8*y25 + y9*y32 + y10*y23 + y11*y24,
y3*y6*y18 + y10*y21 + y11*y22,
y4*y6*y26 + y12*y33,
y6*y15*y27,
y7*y14*y19,
y7*y15*y20,
y8*y15*y29,
y1*y39,
y10*y21 + y10*y23,
y9*y32 + y11*y22 + y11*y24 + y12*y33,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[DAG, G, GRK23, GRK56, G_a, HR, HRP1, HRP2, HRbarr2, Hbarr1RP1, Hbarr2RP1, Hbarr2RP2, PIP2, PKC, PKC_a, barr1, barr2, k0, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k21, k22, k23, k24, k25, k3, k4, k5, k6, k7, k8, k9]
new_system = 
[
y5*y13*y37,
y5*y40,
0,
0,
y2*y6*y30 + y2*y7*y19 + y2*y18,
y8*y27 + y9*y34 + y10*y25 + y11*y26,
y3*y6*y20 + y10*y23 + y11*y24,
y4*y6*y28 + y12*y35,
y6*y17*y29,
y7*y16*y21,
y7*y17*y22,
y8*y17*y31,
y1*y41,
y15*y42,
y1*y14*y38,
y10*y23 + y10*y25,
y9*y34 + y11*y24 + y11*y26 + y12*y35,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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


