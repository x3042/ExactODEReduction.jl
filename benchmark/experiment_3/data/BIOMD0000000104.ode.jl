Original system:

[
species_2 => 0,
species_1 => species_0*species_2,
species_4 => -species_1*species_2 + species_1*species_5,
species_0 => 0,
species_5 => 0
]

Reductions:

new_vars = fmpq_mpoly[species_0]
new_system = 
[
0
]

new_vars = fmpq_mpoly[species_0, species_2]
new_system = 
[
0,
0
]

new_vars = fmpq_mpoly[species_0, species_1, species_2]
new_system = 
[
0,
y1*y3,
0
]

new_vars = fmpq_mpoly[species_0, species_1, species_2, species_5]
new_system = 
[
0,
y1*y3,
0,
0
]


