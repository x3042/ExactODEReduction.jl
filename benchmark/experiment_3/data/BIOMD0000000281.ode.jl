Original system:

[
ETG => 40000*ETZ*GLP,
DBP => 0,
ETZ => 40000*ETG*TP1,
GAP => 1//10*GPP,
GLP => 10000*ENG*TP1,
DGA => 400*MOB*PID,
ENZ => 10000*ENG*TP1,
DPN => 2000*DHA*DPH + 500*DPH*PYR,
MOD => 6000*DPN*MOX,
ADP => 10000*ENG*TP1 + 40000*ETG*TP1 + 2*PPP,
XSP => 400*PID*XSI,
PPP => 3000*PUE*TP1,
XSI => 22500000*DIH*OXY*XI,
ENG => 3000*ENZ*GLU,
GPP => 40000*ETG*TP1,
PGA => 10000*ADP*DGA,
OXY => 0,
LAC => 500*DPH*PYR,
DPH => 80*AGP*DPN + 10*DPN*LAC + 600000*GAP*MOD,
DHA => 80*AGP*DPN + 1//10*GPP,
PID => 2*PPP,
MOX => 400*MOB*PID,
GLU => 0,
PUE => 2*PPP,
TP1 => 10000*ADP*DGA + 5000*ADP*PGA + 4*DBP*TP2,
DIN => 7500000*DIH*OXY*XI,
AGP => 2000*DHA*DPH,
MOB => 600000*GAP*MOD,
XI => 15000*ADP*XSP + 120*DBP*XSI,
DIH => 80*DIN*PYR,
PYR => 5000*ADP*PGA + 10*DPN*LAC,
TP2 => 15000*ADP*XSP
]

Reductions:

Interesting
new_vars = fmpq_mpoly[ADP - GLP - GPP - PUE]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[ADP - GLP - GPP - PUE, AGP - DPN + LAC]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[ADP - GLP - GPP - PUE, AGP - DPN + LAC, DBP]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[ADP - GLP - GPP - PUE, AGP - DPN + LAC, DBP, DGA - MOX]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[ADP - GLP - GPP - PUE, AGP - DPN + LAC, DBP, DGA - MOX, DIN - 1//3*XSI]
new_system = 
[
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[ADP - GLP - GPP - PUE, AGP - DPN + LAC, DBP, DGA - MOX, DIN - 1//3*XSI, ENZ - GLP]
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
new_vars = fmpq_mpoly[ADP - GLP - GPP - PUE, AGP - DPN + LAC, DBP, DGA - MOX, DIN - 1//3*XSI, ENZ - GLP, ETZ - GPP]
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
new_vars = fmpq_mpoly[ADP - GLP - GPP - PUE, AGP - DPN + LAC, DBP, DGA - MOX, DIN - 1//3*XSI, ENZ - GLP, ETZ - GPP, GLU]
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
new_vars = fmpq_mpoly[ADP - GLP - GPP - PUE, AGP - DPN + LAC, DBP, DGA - MOX, DIN - 1//3*XSI, ENZ - GLP, ETZ - GPP, GLU, OXY]
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
new_vars = fmpq_mpoly[ADP - GLP - GPP - PUE, AGP - DPN + LAC, DBP, DGA - MOX, DIN - 1//3*XSI, ENZ - GLP, ETZ - GPP, GLU, OXY, PID - PUE]
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


