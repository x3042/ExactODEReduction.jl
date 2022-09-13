Original system:

[
species_9 => 0,
species_3 => 241033//1000000*species_5 + 46949//250000*species_6 + species_9,
species_6 => 499767//500000*species_1*species_2*species_3,
species_10 => species_1,
species_2 => 49991//200000*species_4 + 46949//250000*species_6 + species_8,
species_8 => 0,
species_4 => 22649//50000000*species_1*species_2,
species_5 => 130837//10000000000*species_1*species_3,
species_1 => 49991//200000*species_4 + 241033//1000000*species_5 + 46949//250000*species_6 + species_7,
species_7 => 0
]

Reductions:

Interesting
new_vars = fmpq_mpoly[species_1, species_2, species_3, 249955*species_4 + 187796*species_6 + 1000000*species_8, 249955*species_4 + 241033*species_5 + 187796*species_6 + 1000000*species_7, 241033*species_5 + 187796*species_6 + 1000000*species_9]
new_system = 
[
1//1000000*y5,
1//1000000*y4,
1//1000000*y6,
23463560883//125000*y1*y2*y3 + 1132246159//10000000*y1*y2,
23463560883//125000*y1*y2*y3 + 1132246159//10000000*y1*y2 + 31536034621//10000000000*y1*y3,
23463560883//125000*y1*y2*y3 + 31536034621//10000000000*y1*y3
]

Interesting
new_vars = fmpq_mpoly[species_1, species_10, species_2, species_3, 249955*species_4 + 187796*species_6 + 1000000*species_8, 249955*species_4 + 241033*species_5 + 187796*species_6 + 1000000*species_7, 241033*species_5 + 187796*species_6 + 1000000*species_9]
new_system = 
[
1//1000000*y6,
y1,
1//1000000*y5,
1//1000000*y7,
23463560883//125000*y1*y3*y4 + 1132246159//10000000*y1*y3,
23463560883//125000*y1*y3*y4 + 1132246159//10000000*y1*y3 + 31536034621//10000000000*y1*y4,
23463560883//125000*y1*y3*y4 + 31536034621//10000000000*y1*y4
]

Interesting
new_vars = fmpq_mpoly[species_1, species_10, species_2, species_3, 249955*species_4 + 187796*species_6 + 1000000*species_8, 249955*species_4 + 241033*species_5 + 187796*species_6, 241033*species_5 + 187796*species_6 + 1000000*species_9, species_7]
new_system = 
[
1//1000000*y6 + y8,
y1,
1//1000000*y5,
1//1000000*y7,
23463560883//125000*y1*y3*y4 + 1132246159//10000000*y1*y3,
23463560883//125000*y1*y3*y4 + 1132246159//10000000*y1*y3 + 31536034621//10000000000*y1*y4,
23463560883//125000*y1*y3*y4 + 31536034621//10000000000*y1*y4,
0
]

Interesting
new_vars = fmpq_mpoly[species_1, species_10, species_2, species_3, 249955*species_4 + 187796*species_6, species_5, 46949*species_6 + 250000*species_9, species_7, species_8]
new_system = 
[
1//1000000*y5 + 241033//1000000*y6 + y8,
y1,
1//1000000*y5 + y9,
241033//1000000*y6 + 1//250000*y7,
23463560883//125000*y1*y3*y4 + 1132246159//10000000*y1*y3,
130837//10000000000*y1*y4,
23463560883//500000*y1*y3*y4,
0,
0
]


