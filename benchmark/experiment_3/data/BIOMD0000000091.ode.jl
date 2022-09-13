Original system:

[
MCom => Hsp90*MisP*k3,
ADP => ATP*Hsp90*k17 + ATP*MCom*k5 + ATP*MisP*k6 + ATP*k19,
k6 => 0,
k13 => 0,
k7 => 0,
k19 => 0,
k16 => 0,
NatP => ATP*MCom*k5 + I*k1,
k15 => 0,
k14 => 0,
k17 => 0,
k3 => 0,
HCom => HSF1*Hsp90*k8,
AggP => -1//2*I*k7 + 1//2*MisP*k7,
MisP => I*k7 + MCom*k4 + NatP*ROS*k2,
k2 => 0,
k21 => 0,
k11 => 0,
X => source,
HSETriH => HSE*TriH*k14,
Hsp90 => ATP*MCom*k5 + HCom*k9 + HSETriH*k16 + MCom*k4,
SINK => -ROS*k21,
source => -I*k1 - I*k20 - source,
HSF1 => 2*DiH*k13 + HCom*k9 + I*k10 + TriH*k12,
TriH => DiH*HSF1*k11 + HSETriH*k15,
I => 0,
k12 => 0,
k20 => 0,
k18 => 0,
k1 => 0,
ROS => I*k20,
k10 => 0,
k8 => 0,
k9 => 0,
k5 => 0,
k4 => 0,
ATP => ADP*k18,
DiH => 1//2*HSF1*k10 - 1//2*I*k10 + TriH*k12,
HSE => HSETriH*k15
]

Reductions:


new_vars = fmpq_mpoly[I]
new_system = 
[
0
]


new_vars = fmpq_mpoly[I, k1]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[I, k1, k10]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[I, k1, k10, k11]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[I, k1, k10, k11, k12]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13, k14]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13, k14, k15]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13, k14, k15, k16]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13, k14, k15, k16, k17]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k3]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k3, k4]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k3, k4, k5]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k3, k4, k5, k6]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k3, k4, k5, k6, k7]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k3, k4, k5, k6, k7, k8]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k3, k4, k5, k6, k7, k8, k9]
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


new_vars = fmpq_mpoly[I, ROS, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k3, k4, k5, k6, k7, k8, k9]
new_system = 
[
0,
y1*y15,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[ADP, ATP, DiH, HCom, HSE, HSETriH, HSF1, Hsp90, I, MCom, MisP, NatP, ROS, TriH, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k3, k4, k5, k6, k7, k8, k9]
new_system = 
[
y2*y8*y23 + y2*y10*y30 + y2*y11*y31 + y2*y25,
y1*y24,
1//2*y7*y16 - 1//2*y9*y16 + y14*y18,
y7*y8*y33,
y6*y21,
y5*y14*y20,
2*y3*y19 + y4*y34 + y9*y16 + y14*y18,
y2*y10*y30 + y4*y34 + y6*y22 + y10*y29,
0,
y8*y11*y28,
y9*y32 + y10*y29 + y12*y13*y26,
y2*y10*y30 + y9*y15,
y9*y27,
y3*y7*y17 + y6*y21,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[ADP, ATP, AggP, DiH, HCom, HSE, HSETriH, HSF1, Hsp90, I, MCom, MisP, NatP, ROS, TriH, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k3, k4, k5, k6, k7, k8, k9]
new_system = 
[
y2*y9*y24 + y2*y11*y31 + y2*y12*y32 + y2*y26,
y1*y25,
-1//2*y10*y33 + 1//2*y12*y33,
1//2*y8*y17 - 1//2*y10*y17 + y15*y19,
y8*y9*y34,
y7*y22,
y6*y15*y21,
2*y4*y20 + y5*y35 + y10*y17 + y15*y19,
y2*y11*y31 + y5*y35 + y7*y23 + y11*y30,
0,
y9*y12*y29,
y10*y33 + y11*y30 + y13*y14*y27,
y2*y11*y31 + y10*y16,
y10*y28,
y4*y8*y18 + y7*y22,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[ADP, ATP, AggP, DiH, HCom, HSE, HSETriH, HSF1, Hsp90, I, MCom, MisP, NatP, ROS, TriH, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k21, k3, k4, k5, k6, k7, k8, k9]
new_system = 
[
y2*y9*y24 + y2*y11*y32 + y2*y12*y33 + y2*y26,
y1*y25,
-1//2*y10*y34 + 1//2*y12*y34,
1//2*y8*y17 - 1//2*y10*y17 + y15*y19,
y8*y9*y35,
y7*y22,
y6*y15*y21,
2*y4*y20 + y5*y36 + y10*y17 + y15*y19,
y2*y11*y32 + y5*y36 + y7*y23 + y11*y31,
0,
y9*y12*y30,
y10*y34 + y11*y31 + y13*y14*y27,
y2*y11*y32 + y10*y16,
y10*y28,
y4*y8*y18 + y7*y22,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[ADP, ATP, AggP, DiH, HCom, HSE, HSETriH, HSF1, Hsp90, I, MCom, MisP, NatP, ROS, SINK, TriH, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k21, k3, k4, k5, k6, k7, k8, k9]
new_system = 
[
y2*y9*y25 + y2*y11*y33 + y2*y12*y34 + y2*y27,
y1*y26,
-1//2*y10*y35 + 1//2*y12*y35,
1//2*y8*y18 - 1//2*y10*y18 + y16*y20,
y8*y9*y36,
y7*y23,
y6*y16*y22,
2*y4*y21 + y5*y37 + y10*y18 + y16*y20,
y2*y11*y33 + y5*y37 + y7*y24 + y11*y32,
0,
y9*y12*y31,
y10*y35 + y11*y32 + y13*y14*y28,
y2*y11*y33 + y10*y17,
y10*y29,
-y14*y30,
y4*y8*y19 + y7*y23,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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
new_vars = fmpq_mpoly[ADP, ATP, AggP, DiH, HCom, HSE, HSETriH, HSF1, Hsp90, I, MCom, MisP, NatP, ROS, SINK, TriH, X + source, k1, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k2, k20, k21, k3, k4, k5, k6, k7, k8, k9]
new_system = 
[
y2*y9*y26 + y2*y11*y34 + y2*y12*y35 + y2*y28,
y1*y27,
-1//2*y10*y36 + 1//2*y12*y36,
1//2*y8*y19 - 1//2*y10*y19 + y16*y21,
y8*y9*y37,
y7*y24,
y6*y16*y23,
2*y4*y22 + y5*y38 + y10*y19 + y16*y21,
y2*y11*y34 + y5*y38 + y7*y25 + y11*y33,
0,
y9*y12*y32,
y10*y36 + y11*y33 + y13*y14*y29,
y2*y11*y34 + y10*y18,
y10*y30,
-y14*y31,
y4*y8*y20 + y7*y24,
-y10*y18 - y10*y30,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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


