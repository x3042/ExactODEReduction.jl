Original system:

[
species_1 => parameter_1*source,
species_2 => parameter_2*source,
SINK => -parameter_5*species_1 - parameter_5*species_2,
parameter_4 => 0,
species_3 => parameter_4*species_1*species_5,
parameter_3 => 0,
parameter_5 => 0,
parameter_2 => 0,
species_4 => parameter_4*species_2*species_5,
species_5 => parameter_3*species_3 + parameter_3*species_4,
parameter_1 => 0,
source => 0
]

Reductions:

Interesting
new_vars = fmpq_mpoly[parameter_1 + parameter_2]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[parameter_1 + parameter_2, parameter_5]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[parameter_1 + parameter_2, parameter_5, source]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[parameter_1 + parameter_2, parameter_5, source, species_1 + species_2]
new_system = 
[
0,
0,
0,
y1*y3
]

Interesting
new_vars = fmpq_mpoly[SINK, parameter_1 + parameter_2, parameter_5, source, species_1 + species_2]
new_system = 
[
-y3*y5,
0,
0,
0,
y2*y4
]

Interesting
new_vars = fmpq_mpoly[SINK, parameter_1, parameter_2, parameter_5, source, species_1 + species_2]
new_system = 
[
-y4*y6,
0,
0,
0,
0,
y2*y5 + y3*y5
]

Interesting
new_vars = fmpq_mpoly[SINK, parameter_1, parameter_2, parameter_3, parameter_5, source, species_1 + species_2]
new_system = 
[
-y5*y7,
0,
0,
0,
0,
0,
y2*y6 + y3*y6
]

Interesting
new_vars = fmpq_mpoly[SINK, parameter_1, parameter_2, parameter_3, parameter_4, parameter_5, source, species_1 + species_2]
new_system = 
[
-y6*y8,
0,
0,
0,
0,
0,
0,
y2*y7 + y3*y7
]


new_vars = fmpq_mpoly[SINK, parameter_1, parameter_2, parameter_3, parameter_4, parameter_5, source, species_1, species_2]
new_system = 
[
-y6*y8 - y6*y9,
0,
0,
0,
0,
0,
0,
y2*y7,
y3*y7
]

Interesting
new_vars = fmpq_mpoly[SINK, parameter_1, parameter_2, parameter_3, parameter_4, parameter_5, source, species_1, species_2, species_3 + species_4, species_5]
new_system = 
[
-y6*y8 - y6*y9,
0,
0,
0,
0,
0,
0,
y2*y7,
y3*y7,
y5*y8*y11 + y5*y9*y11,
y4*y10
]


