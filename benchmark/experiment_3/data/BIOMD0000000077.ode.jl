Original system:

[
SINK => -10*IP3,
R => 5*HR,
EE => 4000*GQ*HRRH,
IP3 => 20000000*EE,
HRRH => 200*EE + 5000*HR,
GQ => 200*EE,
H => 5*HR,
HR => 5//2*H*R + 10*HRRH
]

Reductions:

Interesting
new_vars = fmpq_mpoly[GQ - HRRH + 1000*R]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[GQ - HRRH + 1000*R, H - R]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[EE, GQ, H, HR, HRRH, R]
new_system = 
[
4000*y2*y5,
200*y1,
5*y4,
5//2*y3*y6 + 10*y5,
200*y1 + 5000*y4,
5*y4
]


new_vars = fmpq_mpoly[EE, GQ, H, HR, HRRH, IP3, R]
new_system = 
[
4000*y2*y5,
200*y1,
5*y4,
5//2*y3*y7 + 10*y5,
200*y1 + 5000*y4,
20000000*y1,
5*y4
]


