Original system:

[
VIIa_TF => -5*VIIa_TF*X - 5*VIIa_TF*Xa - 11//25*VIIa_TF*Xa_TFPI + 770*VIIa_TF_X + 770*VIIa_TF_Xa,
VIIa_TF_X => 5*VIIa_TF*X - 20*VIIa_TF_X*Xa_TFPI - 1190*VIIa_TF_X,
VIIa_TF_Xa_TFPI => 6*TFPI*VIIa_TF_Xa + 20*VIIa_TF_X*Xa_TFPI - 1//50*VIIa_TF_Xa_TFPI,
Xa_TFPI => 27//500*TFPI*Xa - 11//25*VIIa_TF*Xa_TFPI - 20*VIIa_TF_X*Xa_TFPI - 1//50*Xa_TFPI,
Xa => -27//500*TFPI*Xa - 5*VIIa_TF*Xa + 770*VIIa_TF_Xa + 1//50*Xa_TFPI,
Xa_TFPI_VIIa_TF => 11//25*VIIa_TF*Xa_TFPI,
TFPI => -6*TFPI*VIIa_TF_Xa - 27//500*TFPI*Xa + 1//50*VIIa_TF_Xa_TFPI + 1//50*Xa_TFPI,
VIIa_TF_Xa => -6*TFPI*VIIa_TF_Xa + 5*VIIa_TF*Xa + 420*VIIa_TF_X - 770*VIIa_TF_Xa + 1//50*VIIa_TF_Xa_TFPI,
X => -5*VIIa_TF*X + 20*VIIa_TF_X*Xa_TFPI + 770*VIIa_TF_X
]

Reductions:

Interesting
new_vars = fmpq_mpoly[TFPI - VIIa_TF_X - VIIa_TF_Xa - X - Xa]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[TFPI - VIIa_TF_X - VIIa_TF_Xa - X - Xa, VIIa_TF - X - Xa - Xa_TFPI]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[TFPI, VIIa_TF, VIIa_TF_X, VIIa_TF_Xa, VIIa_TF_Xa_TFPI, X, Xa, Xa_TFPI]
new_system = 
[
-6*y1*y4 - 27//500*y1*y7 + 1//50*y5 + 1//50*y8,
-5*y2*y6 - 5*y2*y7 - 11//25*y2*y8 + 770*y3 + 770*y4,
5*y2*y6 - 20*y3*y8 - 1190*y3,
-6*y1*y4 + 5*y2*y7 + 420*y3 - 770*y4 + 1//50*y5,
6*y1*y4 + 20*y3*y8 - 1//50*y5,
-5*y2*y6 + 20*y3*y8 + 770*y3,
-27//500*y1*y7 - 5*y2*y7 + 770*y4 + 1//50*y8,
27//500*y1*y7 - 11//25*y2*y8 - 20*y3*y8 - 1//50*y8
]


