Original system:

[
free => 3//20000*bulk - 29//500*free,
bulk => -3//20000*bulk,
lytic => 13//1000*translocate,
bound => -141//1000*bound + 29//500*free,
translocate => 141//1000*bound - 13//1000*translocate
]

Reductions:


new_vars = fmpq_mpoly[bulk]
new_system = 
[
-3//20000*y1
]

Interesting
new_vars = fmpq_mpoly[bound - 58//83*free, bulk]
new_system = 
[
-141//1000*y1 - 87//830000*y2,
-3//20000*y2
]


new_vars = fmpq_mpoly[bound, bulk, free]
new_system = 
[
-141//1000*y1 + 29//500*y3,
-3//20000*y2,
3//20000*y2 - 29//500*y3
]

Interesting
new_vars = fmpq_mpoly[bound, bulk, free, lytic + translocate]
new_system = 
[
-141//1000*y1 + 29//500*y3,
-3//20000*y2,
3//20000*y2 - 29//500*y3,
141//1000*y1
]


