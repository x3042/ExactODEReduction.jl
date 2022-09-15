Original system:

[
SINK => -33//10000000000*asrna*mrna - 1507//200000000000000000000*asrna - 1397//200000000000000000000*mrna - 2761//1000000000000000000000000*protein,
rib => 33//500000000000000000*mrnarib,
asrna => 2563//200000000000000000000000000000*source,
mrna => 33//500000000000000000*mrnarib + 869//40000000000000000000000000000*source,
source => 0,
mrnarib => 1483477564603419//2000000000000000000000000000*mrna*rib,
protein => 33//500000000000000000*mrnarib
]

Reductions:

Interesting
new_vars = fmpq_mpoly[asrna - 233//395*mrna + 233//395*rib]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[asrna - 233//395*mrna + 233//395*rib, protein - rib]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[asrna - 233//395*mrna + 233//395*rib, protein - rib, source]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[asrna, mrna - rib, protein - rib, source]
new_system = 
[
2563//200000000000000000000000000000*y4,
869//40000000000000000000000000000*y4,
0,
0
]


new_vars = fmpq_mpoly[asrna, mrna, mrnarib, protein, rib, source]
new_system = 
[
2563//200000000000000000000000000000*y6,
33//500000000000000000*y3 + 869//40000000000000000000000000000*y6,
1483477564603419//2000000000000000000000000000*y2*y5,
33//500000000000000000*y3,
33//500000000000000000*y3,
0
]


