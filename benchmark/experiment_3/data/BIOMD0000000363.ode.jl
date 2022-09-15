Original system:

[
M => 1//200*II - 1//100*M,
II => -501//100000*II,
P2 => 1//100000*II - 1//40000*P2,
IIa => 1//100*M + 1//40000*P2
]

Reductions:


new_vars = fmpq_mpoly[II]
new_system = 
[
-501//100000*y1
]


new_vars = fmpq_mpoly[II, M]
new_system = 
[
-501//100000*y1,
1//200*y1 - 1//100*y2
]


new_vars = fmpq_mpoly[II, M, P2]
new_system = 
[
-501//100000*y1,
1//200*y1 - 1//100*y2,
1//100000*y1 - 1//40000*y3
]


