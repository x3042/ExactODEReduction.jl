Original system:

[
species_1 => 300*source + 27//200*species_6,
species_6 => 549//10000*species_1,
source => 0,
species_3 => 1619//1000000*species_2,
species_4 => 0,
species_2 => 10*species_3*species_4 + 91//5000*species_3 + 99//1000000*species_6
]

Reductions:


new_vars = fmpq_mpoly[source]
new_system = 
[
0
]


new_vars = fmpq_mpoly[source, species_1, species_6]
new_system = 
[
0,
300*y1 + 27//200*y3,
549//10000*y2
]


new_vars = fmpq_mpoly[source, species_1, species_4, species_6]
new_system = 
[
0,
300*y1 + 27//200*y4,
0,
549//10000*y2
]


