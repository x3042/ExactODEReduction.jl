Original system:

[
k2 => 0,
k4 => 0,
species_0000017 => 0,
k1 => 0,
k11 => 0,
I => 0,
species_0000008 => 2*k5*species_0000001*species_0000006 + 2*k6*species_0000002*species_0000006,
k7 => 0,
source => 0,
k19 => 0,
species_0000016 => 0,
species_0000007 => k17*species_0000011,
k10 => 0,
species_0000001 => 1//100*I*k10 + k1*source,
k3 => 0,
SINK => -1//100*I*k10 - k12*species_0000009 - k13b*species_0000002 - 2*k19*species_0000007 - k2*species_0000001*species_0000002 - k9*species_0000008,
k6 => 0,
species_0000006 => 1//100*k10*source - k3*species_0000001*species_0000002 + k3*species_0000001*species_0000016,
k17 => 0,
k18 => 0,
k13b => 0,
k13a => 0,
k5 => 0,
k9 => 0,
k12 => 0,
species_0000002 => k13a*source*species_0000016 + k3*species_0000001*species_0000016,
species_0000009 => k18*species_0000007 + k4*species_0000001*species_0000007,
species_0000011 => 1//100*k10*source + k11*species_0000008 + k18*species_0000007
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13a]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13a, k13b]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13a, k13b, k17]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13a, k13b, k17, k18]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13a, k13b, k17, k18, k19]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13a, k13b, k17, k18, k19, k2]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13a, k13b, k17, k18, k19, k2, k3]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13a, k13b, k17, k18, k19, k2, k3, k4]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13a, k13b, k17, k18, k19, k2, k3, k4, k5]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13a, k13b, k17, k18, k19, k2, k3, k4, k5, k6]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13a, k13b, k17, k18, k19, k2, k3, k4, k5, k6, k9]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13a, k13b, k17, k18, k19, k2, k3, k4, k5, k6, k9, source]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13a, k13b, k17, k18, k19, k2, k3, k4, k5, k6, k9, source, species_0000016]
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


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13a, k13b, k17, k18, k19, k2, k3, k4, k5, k6, k9, source, species_0000001, species_0000016]
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
1//100*y1*y3 + y2*y17,
0
]


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13a, k13b, k17, k18, k19, k2, k3, k4, k5, k6, k9, source, species_0000001, species_0000002, species_0000016]
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
1//100*y1*y3 + y2*y17,
y6*y17*y20 + y12*y18*y20,
0
]


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13a, k13b, k17, k18, k19, k2, k3, k4, k5, k6, k9, source, species_0000001, species_0000002, species_0000006, species_0000016]
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
1//100*y1*y3 + y2*y17,
y6*y17*y21 + y12*y18*y21,
1//100*y3*y17 - y12*y18*y19 + y12*y18*y21,
0
]


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13a, k13b, k17, k18, k19, k2, k3, k4, k5, k6, k9, source, species_0000001, species_0000002, species_0000006, species_0000008, species_0000016]
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
1//100*y1*y3 + y2*y17,
y6*y17*y22 + y12*y18*y22,
1//100*y3*y17 - y12*y18*y19 + y12*y18*y22,
2*y14*y18*y20 + 2*y15*y19*y20,
0
]


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13a, k13b, k17, k18, k19, k2, k3, k4, k5, k6, k9, source, species_0000001, species_0000002, species_0000006, species_0000007, species_0000008, species_0000011, species_0000016]
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
1//100*y1*y3 + y2*y17,
y6*y17*y24 + y12*y18*y24,
1//100*y3*y17 - y12*y18*y19 + y12*y18*y24,
y8*y23,
2*y14*y18*y20 + 2*y15*y19*y20,
1//100*y3*y17 + y4*y22 + y9*y21,
0
]


new_vars = fmpq_mpoly[I, k1, k10, k11, k12, k13a, k13b, k17, k18, k19, k2, k3, k4, k5, k6, k9, source, species_0000001, species_0000002, species_0000006, species_0000007, species_0000008, species_0000009, species_0000011, species_0000016]
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
1//100*y1*y3 + y2*y17,
y6*y17*y25 + y12*y18*y25,
1//100*y3*y17 - y12*y18*y19 + y12*y18*y25,
y8*y24,
2*y14*y18*y20 + 2*y15*y19*y20,
y9*y21 + y13*y18*y21,
1//100*y3*y17 + y4*y22 + y9*y21,
0
]


new_vars = fmpq_mpoly[I, SINK, k1, k10, k11, k12, k13a, k13b, k17, k18, k19, k2, k3, k4, k5, k6, k9, source, species_0000001, species_0000002, species_0000006, species_0000007, species_0000008, species_0000009, species_0000011, species_0000016]
new_system = 
[
0,
-1//100*y1*y4 - y6*y24 - y8*y20 - 2*y11*y22 - y12*y19*y20 - y17*y23,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
1//100*y1*y4 + y3*y18,
y7*y18*y26 + y13*y19*y26,
1//100*y4*y18 - y13*y19*y20 + y13*y19*y26,
y9*y25,
2*y15*y19*y21 + 2*y16*y20*y21,
y10*y22 + y14*y19*y22,
1//100*y4*y18 + y5*y23 + y10*y22,
0
]


new_vars = fmpq_mpoly[I, SINK, k1, k10, k11, k12, k13a, k13b, k17, k18, k19, k2, k3, k4, k5, k6, k7, k9, source, species_0000001, species_0000002, species_0000006, species_0000007, species_0000008, species_0000009, species_0000011, species_0000016]
new_system = 
[
0,
-1//100*y1*y4 - y6*y25 - y8*y21 - 2*y11*y23 - y12*y20*y21 - y18*y24,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
1//100*y1*y4 + y3*y19,
y7*y19*y27 + y13*y20*y27,
1//100*y4*y19 - y13*y20*y21 + y13*y20*y27,
y9*y26,
2*y15*y20*y22 + 2*y16*y21*y22,
y10*y23 + y14*y20*y23,
1//100*y4*y19 + y5*y24 + y10*y23,
0
]


