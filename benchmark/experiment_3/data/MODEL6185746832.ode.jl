Original system:

[
KKPPKKPase => KKPP*KKPase*a6 - KKPPKKPase*d6 - KKPPKKPase*k6,
KK => -KK*KKKS*a3 + KKPKKPase*k4 + KK_KKKS*d3,
KKPase => -KKP*KKPase*a4 + KKPKKPase*d4 + KKPKKPase*k4 - KKPP*KKPase*a6 + KKPPKKPase*d6 + KKPPKKPase*k6,
KK_KKKS => KK*KKKS*a3 - KK_KKKS*d3 - KK_KKKS*k3,
a1 => 0,
KKK => -E1Aux*KKK*a1 + KKKE1Aux*d1 + KKKSE2*k2,
KKPP => KKPKKKS*k5 - KKPP*KKPase*a6 + KKPPKKPase*d6,
KKPKKKS => KKKS*KKP*a5 - KKPKKKS*d5 - KKPKKKS*k5,
a6 => 0,
E1Aux => -E1Aux*KKK*a1 + KKKE1Aux*d1 + KKKE1Aux*k1,
k6 => 0,
d5 => 0,
k5 => 0,
KKPKKPase => KKP*KKPase*a4 - KKPKKPase*d4 - KKPKKPase*k4,
a3 => 0,
d3 => 0,
d2 => 0,
a4 => 0,
KKP => -KKKS*KKP*a5 - KKP*KKPase*a4 + KKPKKKS*d5 + KKPKKPase*d4 + KKPPKKPase*k6 + KK_KKKS*k3,
KKKE1Aux => E1Aux*KKK*a1 - KKKE1Aux*d1 - KKKE1Aux*k1,
d4 => 0,
d1 => 0,
a2 => 0,
d6 => 0,
k2 => 0,
KKKSE2 => E2*KKKS*a2 - KKKSE2*d2 - KKKSE2*k2,
E2 => -E2*KKKS*a2 + KKKSE2*d2 + KKKSE2*k2,
a5 => 0,
k4 => 0,
KKKS => -E2*KKKS*a2 - KK*KKKS*a3 + KKKE1Aux*k1 - KKKS*KKP*a5 + KKKSE2*d2 + KKPKKKS*d5 + KKPKKKS*k5 + KK_KKKS*d3 + KK_KKKS*k3,
k1 => 0,
k3 => 0
]

Reductions:

Interesting
new_vars = fmpq_mpoly[E1Aux + KKKE1Aux]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[E1Aux + KKKE1Aux, E2 + KKKSE2]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[E1Aux + KKKE1Aux, E2 + KKKSE2, KK + KKP + KKPKKKS + KKPP - KKPase + KK_KKKS]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[E1Aux + KKKE1Aux, E2 + KKKSE2, KK + KKP + KKPKKKS + KKPP - KKPase + KK_KKKS, KKK + KKKE1Aux + KKKS + KKKSE2 + KKPKKKS + KK_KKKS]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[E1Aux + KKKE1Aux, E2 + KKKSE2, KK + KKP + KKPKKKS + KKPKKPase + KKPP + KKPPKKPase + KK_KKKS, KKK + KKKE1Aux + KKKS + KKKSE2 + KKPKKKS + KK_KKKS, KKPKKPase + KKPPKKPase + KKPase]
new_system = 
[
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[E1Aux + KKKE1Aux, E2 + KKKSE2, KK + KKP + KKPKKKS + KKPKKPase + KKPP + KKPPKKPase + KK_KKKS, KKK + KKKE1Aux + KKKS + KKKSE2 + KKPKKKS + KK_KKKS, KKPKKPase + KKPPKKPase + KKPase, a1]
new_system = 
[
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[E1Aux + KKKE1Aux, E2 + KKKSE2, KK + KKP + KKPKKKS + KKPKKPase + KKPP + KKPPKKPase + KK_KKKS, KKK + KKKE1Aux + KKKS + KKKSE2 + KKPKKKS + KK_KKKS, KKPKKPase + KKPPKKPase + KKPase, a1, a2]
new_system = 
[
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[E1Aux + KKKE1Aux, E2 + KKKSE2, KK + KKP + KKPKKKS + KKPKKPase + KKPP + KKPPKKPase + KK_KKKS, KKK + KKKE1Aux + KKKS + KKKSE2 + KKPKKKS + KK_KKKS, KKPKKPase + KKPPKKPase + KKPase, a1, a2, a3]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[E1Aux + KKKE1Aux, E2 + KKKSE2, KK + KKP + KKPKKKS + KKPKKPase + KKPP + KKPPKKPase + KK_KKKS, KKK + KKKE1Aux + KKKS + KKKSE2 + KKPKKKS + KK_KKKS, KKPKKPase + KKPPKKPase + KKPase, a1, a2, a3, a4]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[E1Aux + KKKE1Aux, E2 + KKKSE2, KK + KKP + KKPKKKS + KKPKKPase + KKPP + KKPPKKPase + KK_KKKS, KKK + KKKE1Aux + KKKS + KKKSE2 + KKPKKKS + KK_KKKS, KKPKKPase + KKPPKKPase + KKPase, a1, a2, a3, a4, a5]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[E1Aux + KKKE1Aux, E2 + KKKSE2, KK + KKP + KKPKKKS + KKPKKPase + KKPP + KKPPKKPase + KK_KKKS, KKK + KKKE1Aux + KKKS + KKKSE2 + KKPKKKS + KK_KKKS, KKPKKPase + KKPPKKPase + KKPase, a1, a2, a3, a4, a5, a6]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[E1Aux + KKKE1Aux, E2 + KKKSE2, KK + KKP + KKPKKKS + KKPKKPase + KKPP + KKPPKKPase + KK_KKKS, KKK + KKKE1Aux + KKKS + KKKSE2 + KKPKKKS + KK_KKKS, KKPKKPase + KKPPKKPase + KKPase, a1, a2, a3, a4, a5, a6, d1]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[E1Aux + KKKE1Aux, E2 + KKKSE2, KK + KKP + KKPKKKS + KKPKKPase + KKPP + KKPPKKPase + KK_KKKS, KKK + KKKE1Aux + KKKS + KKKSE2 + KKPKKKS + KK_KKKS, KKPKKPase + KKPPKKPase + KKPase, a1, a2, a3, a4, a5, a6, d1, d2]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[E1Aux + KKKE1Aux, E2 + KKKSE2, KK + KKP + KKPKKKS + KKPKKPase + KKPP + KKPPKKPase + KK_KKKS, KKK + KKKE1Aux + KKKS + KKKSE2 + KKPKKKS + KK_KKKS, KKPKKPase + KKPPKKPase + KKPase, a1, a2, a3, a4, a5, a6, d1, d2, d3]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[E1Aux + KKKE1Aux, E2 + KKKSE2, KK + KKP + KKPKKKS + KKPKKPase + KKPP + KKPPKKPase + KK_KKKS, KKK + KKKE1Aux + KKKS + KKKSE2 + KKPKKKS + KK_KKKS, KKPKKPase + KKPPKKPase + KKPase, a1, a2, a3, a4, a5, a6, d1, d2, d3, d4]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[E1Aux + KKKE1Aux, E2 + KKKSE2, KK + KKP + KKPKKKS + KKPKKPase + KKPP + KKPPKKPase + KK_KKKS, KKK + KKKE1Aux + KKKS + KKKSE2 + KKPKKKS + KK_KKKS, KKPKKPase + KKPPKKPase + KKPase, a1, a2, a3, a4, a5, a6, d1, d2, d3, d4, d5]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[E1Aux + KKKE1Aux, E2 + KKKSE2, KK + KKP + KKPKKKS + KKPKKPase + KKPP + KKPPKKPase + KK_KKKS, KKK + KKKE1Aux + KKKS + KKKSE2 + KKPKKKS + KK_KKKS, KKPKKPase + KKPPKKPase + KKPase, a1, a2, a3, a4, a5, a6, d1, d2, d3, d4, d5, d6]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[E1Aux + KKKE1Aux, E2 + KKKSE2, KK + KKP + KKPKKKS + KKPKKPase + KKPP + KKPPKKPase + KK_KKKS, KKK + KKKE1Aux + KKKS + KKKSE2 + KKPKKKS + KK_KKKS, KKPKKPase + KKPPKKPase + KKPase, a1, a2, a3, a4, a5, a6, d1, d2, d3, d4, d5, d6, k1]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[E1Aux + KKKE1Aux, E2 + KKKSE2, KK + KKP + KKPKKKS + KKPKKPase + KKPP + KKPPKKPase + KK_KKKS, KKK + KKKE1Aux + KKKS + KKKSE2 + KKPKKKS + KK_KKKS, KKPKKPase + KKPPKKPase + KKPase, a1, a2, a3, a4, a5, a6, d1, d2, d3, d4, d5, d6, k1, k2]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[E1Aux + KKKE1Aux, E2 + KKKSE2, KK + KKP + KKPKKKS + KKPKKPase + KKPP + KKPPKKPase + KK_KKKS, KKK + KKKE1Aux + KKKS + KKKSE2 + KKPKKKS + KK_KKKS, KKPKKPase + KKPPKKPase + KKPase, a1, a2, a3, a4, a5, a6, d1, d2, d3, d4, d5, d6, k1, k2, k3]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[E1Aux + KKKE1Aux, E2 + KKKSE2, KK + KKP + KKPKKKS + KKPKKPase + KKPP + KKPPKKPase + KK_KKKS, KKK + KKKE1Aux + KKKS + KKKSE2 + KKPKKKS + KK_KKKS, KKPKKPase + KKPPKKPase + KKPase, a1, a2, a3, a4, a5, a6, d1, d2, d3, d4, d5, d6, k1, k2, k3, k4]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[E1Aux + KKKE1Aux, E2 + KKKSE2, KK + KKP + KKPKKKS + KKPKKPase + KKPP + KKPPKKPase + KK_KKKS, KKK + KKKE1Aux + KKKS + KKKSE2 + KKPKKKS + KK_KKKS, KKPKKPase + KKPPKKPase + KKPase, a1, a2, a3, a4, a5, a6, d1, d2, d3, d4, d5, d6, k1, k2, k3, k4, k5]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[E1Aux + KKKE1Aux, E2 + KKKSE2, KK + KKP + KKPKKKS + KKPKKPase + KKPP + KKPPKKPase + KK_KKKS, KKK + KKKE1Aux + KKKS + KKKSE2 + KKPKKKS + KK_KKKS, KKPKKPase + KKPPKKPase + KKPase, a1, a2, a3, a4, a5, a6, d1, d2, d3, d4, d5, d6, k1, k2, k3, k4, k5, k6]
new_system = 
[
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]


