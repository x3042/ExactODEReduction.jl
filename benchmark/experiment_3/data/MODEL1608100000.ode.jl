Original system:

[
mRNA => 5*source,
Protein => 1//10*mRNA,
source => 0,
SINK => -3//100*Protein - 3//100*mRNA
]

Reductions:


new_vars = fmpq_mpoly[source]
new_system = 
[
0
]


new_vars = fmpq_mpoly[mRNA, source]
new_system = 
[
5*y2,
0
]


new_vars = fmpq_mpoly[Protein, mRNA, source]
new_system = 
[
1//10*y2,
5*y3,
0
]


