Original system:

[
a1 => 0,
KPPKPase => KPP*KPase*a4 - KPPKPase*d4 - KPPKPase*k4,
a4 => 0,
d4 => 0,
k1 => 0,
KP => KKKPP*k1 - KKPP*KP*a3 - KP*KPase*a2 + KPKKPP*d3 + KPKPase*d2 + KPPKPase*k4,
a3 => 0,
d2 => 0,
k2 => 0,
d1 => 0,
K => -K*KKPP*a1 + KKKPP*d1 + KPKPase*k2,
KKPP => -K*KKPP*a1 + KKKPP*d1 + KKKPP*k1 - KKPP*KP*a3 + KPKKPP*d3 + KPKKPP*k3,
a2 => 0,
KKKPP => K*KKPP*a1 - KKKPP*d1 - KKKPP*k1,
d3 => 0,
KPKKPP => KKPP*KP*a3 - KPKKPP*d3 - KPKKPP*k3,
KPP => KPKKPP*k3 - KPP*KPase*a4 + KPPKPase*d4,
KPKPase => KP*KPase*a2 - KPKPase*d2 - KPKPase*k2,
KPase => -KP*KPase*a2 + KPKPase*d2 + KPKPase*k2 - KPP*KPase*a4 + KPPKPase*d4 + KPPKPase*k4,
k3 => 0,
k4 => 0
]

Reductions:

Interesting
new_vars = fmpq_mpoly[K - KKPP + KP + KPP - KPase]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[K - KKPP + KP + KPP - KPase, KKKPP + KKPP + KPKKPP]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[K + KKKPP + KP + KPKKPP + KPKPase + KPP + KPPKPase, KKKPP + KKPP + KPKKPP, KPKPase + KPPKPase + KPase]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[K + KKKPP + KP + KPKKPP + KPKPase + KPP + KPPKPase, KKKPP + KKPP + KPKKPP, KPKPase + KPPKPase + KPase, a1]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[K + KKKPP + KP + KPKKPP + KPKPase + KPP + KPPKPase, KKKPP + KKPP + KPKKPP, KPKPase + KPPKPase + KPase, a1, a2]
new_system = 
[
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[K + KKKPP + KP + KPKKPP + KPKPase + KPP + KPPKPase, KKKPP + KKPP + KPKKPP, KPKPase + KPPKPase + KPase, a1, a2, a3]
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
new_vars = fmpq_mpoly[K + KKKPP + KP + KPKKPP + KPKPase + KPP + KPPKPase, KKKPP + KKPP + KPKKPP, KPKPase + KPPKPase + KPase, a1, a2, a3, a4]
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
new_vars = fmpq_mpoly[K + KKKPP + KP + KPKKPP + KPKPase + KPP + KPPKPase, KKKPP + KKPP + KPKKPP, KPKPase + KPPKPase + KPase, a1, a2, a3, a4, d1]
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
new_vars = fmpq_mpoly[K + KKKPP + KP + KPKKPP + KPKPase + KPP + KPPKPase, KKKPP + KKPP + KPKKPP, KPKPase + KPPKPase + KPase, a1, a2, a3, a4, d1, d2]
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
new_vars = fmpq_mpoly[K + KKKPP + KP + KPKKPP + KPKPase + KPP + KPPKPase, KKKPP + KKPP + KPKKPP, KPKPase + KPPKPase + KPase, a1, a2, a3, a4, d1, d2, d3]
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
new_vars = fmpq_mpoly[K + KKKPP + KP + KPKKPP + KPKPase + KPP + KPPKPase, KKKPP + KKPP + KPKKPP, KPKPase + KPPKPase + KPase, a1, a2, a3, a4, d1, d2, d3, d4]
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
new_vars = fmpq_mpoly[K + KKKPP + KP + KPKKPP + KPKPase + KPP + KPPKPase, KKKPP + KKPP + KPKKPP, KPKPase + KPPKPase + KPase, a1, a2, a3, a4, d1, d2, d3, d4, k1]
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
new_vars = fmpq_mpoly[K + KKKPP + KP + KPKKPP + KPKPase + KPP + KPPKPase, KKKPP + KKPP + KPKKPP, KPKPase + KPPKPase + KPase, a1, a2, a3, a4, d1, d2, d3, d4, k1, k2]
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
new_vars = fmpq_mpoly[K + KKKPP + KP + KPKKPP + KPKPase + KPP + KPPKPase, KKKPP + KKPP + KPKKPP, KPKPase + KPPKPase + KPase, a1, a2, a3, a4, d1, d2, d3, d4, k1, k2, k3]
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
new_vars = fmpq_mpoly[K + KKKPP + KP + KPKKPP + KPKPase + KPP + KPPKPase, KKKPP + KKPP + KPKKPP, KPKPase + KPPKPase + KPase, a1, a2, a3, a4, d1, d2, d3, d4, k1, k2, k3, k4]
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


