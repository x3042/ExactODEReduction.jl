Original system:

[
lytic => 13//1000*translocate,
bound => -141//1000*bound + 29//500*free,
translocate => 141//1000*bound - 13//1000*translocate,
free => -29//500*free
]

Reductions:

Interesting
new_vars = fmpq_mpoly[bound - 58//83*free]
new_system = 
[
-141//1000*y1
]


new_vars = fmpq_mpoly[bound, free]
new_system = 
[
-141//1000*y1 + 29//500*y2,
-29//500*y2
]

Interesting
new_vars = fmpq_mpoly[bound, free, lytic + translocate]
new_system = 
[
-141//1000*y1 + 29//500*y2,
-29//500*y2,
141//1000*y1
]


