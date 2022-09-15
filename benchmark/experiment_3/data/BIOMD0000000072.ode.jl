Original system:

[
Ga => 1//100000*G*RL,
Gbg => 1//100000*G*RL,
L => 1//100*RL,
SINK => -1//2500*R - 1//250*RL,
RL => 83//25000000000000000000*L*R,
source => 0,
G => Gbg*Gd,
Gd => 11//100*Ga,
R => 1//100*RL + 4*source
]

Reductions:

Interesting
new_vars = fmpq_mpoly[Ga - Gbg]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[Ga - Gbg, source]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[Ga - Gbg, L - R, source]
new_system = 
[
0,
-4*y3,
0
]

Interesting
new_vars = fmpq_mpoly[Ga - Gbg, L, R, RL, source]
new_system = 
[
0,
1//100*y4,
1//100*y4 + 4*y5,
83//25000000000000000000*y2*y3,
0
]


new_vars = fmpq_mpoly[G, Ga, Gbg, Gd, L, R, RL, source]
new_system = 
[
y3*y4,
1//100000*y1*y7,
1//100000*y1*y7,
11//100*y2,
1//100*y7,
1//100*y7 + 4*y8,
83//25000000000000000000*y5*y6,
0
]


