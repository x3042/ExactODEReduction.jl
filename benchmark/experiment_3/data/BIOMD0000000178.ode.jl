Original system:

[
free => 3//20000*bulk - 29//500*free,
bulk => -3//20000*bulk,
lytic => 13//1000*translocate,
bound => -141//1000*bound + 29//500*free,
translocate => 141//1000*bound - 13//1000*translocate
]

Reductions:

Interesting
new_vars = fmpq_mpoly[bulk - 1157//3*free]
new_system = 
[
-29//500*y1
]

Interesting
new_vars = fmpq_mpoly[bound - 1160//2817*free, bulk - 1157//3*free]
new_system = 
[
-141//1000*y1 - 29//469500*y2,
-29//500*y2
]


new_vars = fmpq_mpoly[bound, bulk, free]
new_system = 
[
-141//1000*y1 + 29//500*y3,
-3//20000*y2,
3//20000*y2 - 29//500*y3
]


new_vars = fmpq_mpoly[bound, bulk, free, translocate]
new_system = 
[
-141//1000*y1 + 29//500*y3,
-3//20000*y2,
3//20000*y2 - 29//500*y3,
141//1000*y1 - 13//1000*y4
]


