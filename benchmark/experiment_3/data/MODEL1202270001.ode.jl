Original system:

[
P => -1//100*P*T + 21//50*TP,
T => -1//100*N*T - 1//100*P*T - 1//50*T*x + 21//50*TN + 21//50*TP + 21//10000*Tx + 21//10000*xT,
TP => 1//100*P*T - 21//50*TP,
xT => 1//100*T*x - 21//10000*xT,
x => -1//50*T*x - 1//100*Tx*x + 21//10000*Tx + 21//10000*xT + 21//10000*xTx,
xTx => 1//100*Tx*x - 21//10000*xTx,
N => -1//100*N*T + 21//50*TN,
TN => 1//100*N*T - 21//50*TN,
Tx => 1//100*T*x - 1//100*Tx*x - 21//10000*Tx + 21//10000*xTx
]

Reductions:

Interesting
new_vars = fmpq_mpoly[N + TN]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[N + TN, P + TP]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[N + TN, P + TP, T + TN + TP - x - xTx]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[N + TN, P + TP, T + TN + TP + Tx + xT + xTx, Tx + x + xT + 2*xTx]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[N + TN, N + P, P + TP, T, Tx, x, xT, xTx]
new_system = 
[
0,
21//50*y1 - 1//100*y2*y4 - 21//50*y2 + 21//50*y3,
0,
21//50*y1 - 1//100*y2*y4 - 21//50*y2 + 21//50*y3 - 1//50*y4*y6 + 21//10000*y5 + 21//10000*y7,
1//100*y4*y6 - 1//100*y5*y6 - 21//10000*y5 + 21//10000*y8,
-1//50*y4*y6 - 1//100*y5*y6 + 21//10000*y5 + 21//10000*y7 + 21//10000*y8,
1//100*y4*y6 - 21//10000*y7,
1//100*y5*y6 - 21//10000*y8
]


