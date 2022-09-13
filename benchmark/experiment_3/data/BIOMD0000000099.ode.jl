Original system:

[
parameter_1 => 0,
parameter_4 => 0,
parameter_10 => 0,
parameter_6 => 0,
parameter_13 => 0,
SINK => -parameter_1*species_4 - parameter_11*species_0 - parameter_3*species_2,
species_5 => parameter_12*species_0,
species_1 => parameter_8*species_4,
parameter_5 => 0,
parameter_2 => 0,
source => 0,
parameter_12 => 0,
parameter_11 => 0,
species_4 => parameter_0*species_6,
parameter_8 => 0,
species_6 => parameter_4*species_5,
parameter_3 => 0,
species_2 => parameter_2*species_1,
parameter_7 => 0,
parameter_9 => 0,
species_3 => parameter_6*source,
species_0 => parameter_10*species_4,
parameter_0 => 0
]

Reductions:


new_vars = fmpq_mpoly[parameter_0]
new_system = 
[
0
]


new_vars = fmpq_mpoly[parameter_0, parameter_1]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[parameter_0, parameter_1, parameter_10]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[parameter_0, parameter_1, parameter_10, parameter_11]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[parameter_0, parameter_1, parameter_10, parameter_11, parameter_12]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[parameter_0, parameter_1, parameter_10, parameter_11, parameter_12, parameter_2]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[parameter_0, parameter_1, parameter_10, parameter_11, parameter_12, parameter_2, parameter_3]
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


new_vars = fmpq_mpoly[parameter_0, parameter_1, parameter_10, parameter_11, parameter_12, parameter_2, parameter_3, parameter_4]
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


new_vars = fmpq_mpoly[parameter_0, parameter_1, parameter_10, parameter_11, parameter_12, parameter_2, parameter_3, parameter_4, parameter_8]
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


new_vars = fmpq_mpoly[parameter_0, parameter_1, parameter_10, parameter_11, parameter_12, parameter_2, parameter_3, parameter_4, parameter_8, species_0, species_4, species_5, species_6]
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
y3*y11,
y1*y13,
y5*y10,
y8*y12
]


new_vars = fmpq_mpoly[parameter_0, parameter_1, parameter_10, parameter_11, parameter_12, parameter_2, parameter_3, parameter_4, parameter_8, species_0, species_1, species_4, species_5, species_6]
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
y3*y12,
y9*y12,
y1*y14,
y5*y10,
y8*y13
]


new_vars = fmpq_mpoly[parameter_0, parameter_1, parameter_10, parameter_11, parameter_12, parameter_2, parameter_3, parameter_4, parameter_8, species_0, species_1, species_2, species_4, species_5, species_6]
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
y3*y13,
y9*y13,
y6*y11,
y1*y15,
y5*y10,
y8*y14
]


new_vars = fmpq_mpoly[SINK, parameter_0, parameter_1, parameter_10, parameter_11, parameter_12, parameter_2, parameter_3, parameter_4, parameter_8, species_0, species_1, species_2, species_4, species_5, species_6]
new_system = 
[
-y3*y14 - y5*y11 - y8*y13,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y4*y14,
y10*y14,
y7*y12,
y2*y16,
y6*y11,
y9*y15
]


new_vars = fmpq_mpoly[SINK, parameter_0, parameter_1, parameter_10, parameter_11, parameter_12, parameter_13, parameter_2, parameter_3, parameter_4, parameter_8, species_0, species_1, species_2, species_4, species_5, species_6]
new_system = 
[
-y3*y15 - y5*y12 - y9*y14,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y4*y15,
y11*y15,
y8*y13,
y2*y17,
y6*y12,
y10*y16
]


new_vars = fmpq_mpoly[SINK, parameter_0, parameter_1, parameter_10, parameter_11, parameter_12, parameter_13, parameter_2, parameter_3, parameter_4, parameter_5, parameter_8, species_0, species_1, species_2, species_4, species_5, species_6]
new_system = 
[
-y3*y16 - y5*y13 - y9*y15,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y4*y16,
y12*y16,
y8*y14,
y2*y18,
y6*y13,
y10*y17
]


new_vars = fmpq_mpoly[SINK, parameter_0, parameter_1, parameter_10, parameter_11, parameter_12, parameter_13, parameter_2, parameter_3, parameter_4, parameter_5, parameter_6, parameter_8, species_0, species_1, species_2, species_4, species_5, species_6]
new_system = 
[
-y3*y17 - y5*y14 - y9*y16,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y4*y17,
y13*y17,
y8*y15,
y2*y19,
y6*y14,
y10*y18
]


new_vars = fmpq_mpoly[SINK, parameter_0, parameter_1, parameter_10, parameter_11, parameter_12, parameter_13, parameter_2, parameter_3, parameter_4, parameter_5, parameter_6, parameter_7, parameter_8, species_0, species_1, species_2, species_4, species_5, species_6]
new_system = 
[
-y3*y18 - y5*y15 - y9*y17,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y4*y18,
y14*y18,
y8*y16,
y2*y20,
y6*y15,
y10*y19
]


new_vars = fmpq_mpoly[SINK, parameter_0, parameter_1, parameter_10, parameter_11, parameter_12, parameter_13, parameter_2, parameter_3, parameter_4, parameter_5, parameter_6, parameter_7, parameter_8, parameter_9, species_0, species_1, species_2, species_4, species_5, species_6]
new_system = 
[
-y3*y19 - y5*y16 - y9*y18,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y4*y19,
y14*y19,
y8*y17,
y2*y21,
y6*y16,
y10*y20
]


new_vars = fmpq_mpoly[SINK, parameter_0, parameter_1, parameter_10, parameter_11, parameter_12, parameter_13, parameter_2, parameter_3, parameter_4, parameter_5, parameter_6, parameter_7, parameter_8, parameter_9, source, species_0, species_1, species_2, species_4, species_5, species_6]
new_system = 
[
-y3*y20 - y5*y17 - y9*y19,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y4*y20,
y14*y20,
y8*y18,
y2*y22,
y6*y17,
y10*y21
]


