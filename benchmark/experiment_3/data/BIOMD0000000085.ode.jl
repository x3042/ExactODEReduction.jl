Original system:

[
species_14 => -1620000*species_14*species_3 - 2940*species_14*species_8 - 543//10000000*species_14 + 7//800*species_15 + 11//4*species_16 + 3960000000*species_2*species_4,
species_8 => -623//10*species_1*species_8 + 1//10000*species_12 + 2*species_13 - 2940*species_14*species_8 + 11//4*species_16 - 383//100*species_2*species_8 + 1//10000*species_6 - 1470000*species_8*species_9,
species_12 => 64100*species_0*species_6 + 25*species_11 - 61//250*species_12*species_7 - 9501//10000*species_12 + 383//100*species_2*species_8,
species_5 => -386000*species_0*species_5 + 529000*species_1*species_3 + 32//25*species_10 + 51//1250*species_11 - 132000000*species_4*species_5 - 650419//50000000*species_5 + 903//1000000000*species_6*species_7,
species_1 => -529000*species_1*species_3 - 623//10*species_1*species_8 + 419//50000000*species_5 + 1//10000*species_6,
species_11 => 386000*species_0*species_5 - 31301//1250*species_11 + 61//250*species_12*species_7,
species_15 => 6300000*species_0*species_10 + 1620000*species_14*species_3 - 101947//4000*species_15 + 297//100000*species_16*species_7,
species_13 => 13//1000*species_10 - 111//50000000000*species_13*species_7 - 200227//100000*species_13 + 94700000*species_4*species_6 + 1470000*species_8*species_9,
species_9 => 117//25000*species_10 + 2*species_13 - 853000*species_3*species_9 - 1470000*species_8*species_9,
species_4 => 32//25*species_10 + 227//100000*species_13 + 543//10000000*species_14 - 3960000000*species_2*species_4 - 132000000*species_4*species_5 - 94700000*species_4*species_6,
species_16 => 2940*species_14*species_8 + 25*species_15 - 297//100000*species_16*species_7 - 11//4*species_16,
species_10 => -6300000*species_0*species_10 - 16221//12500*species_10 + 111//50000000000*species_13*species_7 + 239//500*species_15 + 853000*species_3*species_9 + 132000000*species_4*species_5,
species_2 => 1//10000*species_12 + 543//10000000*species_14 - 3960000000*species_2*species_4 - 383//100*species_2*species_8,
species_6 => -64100*species_0*species_6 + 623//10*species_1*species_8 + 19//20*species_12 + 227//100000*species_13 - 94700000*species_4*species_6 + 13//1000*species_5 - 903//1000000000*species_6*species_7 - 1//10000*species_6,
species_0 => -6300000*species_0*species_10 - 386000*species_0*species_5 - 64100*species_0*species_6 + 51//1250*species_11 + 19//20*species_12 + 239//500*species_15,
species_3 => -529000*species_1*species_3 + 117//25000*species_10 - 1620000*species_14*species_3 + 7//800*species_15 - 853000*species_3*species_9 + 419//50000000*species_5,
species_7 => 13//1000*species_10 + 25*species_11 - 61//250*species_12*species_7 - 111//50000000000*species_13*species_7 + 25*species_15 - 297//100000*species_16*species_7 + 13//1000*species_5 - 903//1000000000*species_6*species_7
]

Reductions:

Interesting
new_vars = fmpq_mpoly[species_0 + 2*species_14 + species_15 + species_16 + species_2 - species_3 + species_4 - species_5 - species_6 - species_8 + species_9]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[species_0 + 2*species_14 + species_15 + species_16 + species_2 - species_3 + species_4 - species_5 - species_6 - species_8 + species_9, species_1 + species_14 + species_2 - species_3 - species_8 + species_9]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[species_0 + 2*species_14 + species_15 + species_16 + species_2 - species_3 + species_4 - species_5 - species_6 - species_8 + species_9, species_1 + species_14 + species_2 - species_3 - species_8 + species_9, species_10 + species_13 + species_14 + species_15 + species_16 + species_4 + species_9]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[species_0 + 2*species_14 + species_15 + species_16 + species_2 - species_3 + species_4 - species_5 - species_6 - species_8 + species_9, species_1 + species_14 + species_2 - species_3 - species_8 + species_9, species_10 + species_13 + species_14 + species_15 + species_16 + species_4 + species_9, species_11 - species_13 - species_14 - species_16 + species_3 - species_4 + species_5 + species_7 - species_9]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[species_0 + species_11 + species_12 + species_14 + species_15 + species_16 + species_2, species_1 + species_10 + species_11 + species_12 + species_13 + species_14 + species_15 + species_16 + species_2 + species_5 + species_6 + species_9, species_10 + species_11 + species_15 + species_3 + species_5 + species_7, species_10 + species_13 + species_14 + species_15 + species_16 + species_4 + species_9, species_10 + species_11 + species_12 + species_13 + species_15 + species_16 + species_3 + species_5 + species_6 + species_8]
new_system = 
[
0,
0,
0,
0,
0
]

