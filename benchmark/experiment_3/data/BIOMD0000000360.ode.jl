Original system:

[
VIIa_TF => -5*VIIa_TF*X - 5*VIIa_TF*Xa - 11//25*VIIa_TF*Xa_TFPI + 770*VIIa_TF_X + 770*VIIa_TF_Xa + 33//500*Xa_TFPI_VIIa_TF,
VIIa_TF_X => 5*VIIa_TF*X - 1190*VIIa_TF_X,
VIIa_TF_Xa_TFPI => 10*TFPI*VIIa_TF_Xa,
Xa_TFPI => 27//500*TFPI*Xa - 11//25*VIIa_TF*Xa_TFPI - 1//50*Xa_TFPI + 33//500*Xa_TFPI_VIIa_TF,
Xa => -27//500*TFPI*Xa - 5*VIIa_TF*Xa + 770*VIIa_TF_Xa + 1//50*Xa_TFPI,
Xa_TFPI_VIIa_TF => 11//25*VIIa_TF*Xa_TFPI - 33//500*Xa_TFPI_VIIa_TF,
TFPI => -10*TFPI*VIIa_TF_Xa - 27//500*TFPI*Xa + 1//50*Xa_TFPI,
VIIa_TF_Xa => -10*TFPI*VIIa_TF_Xa + 5*VIIa_TF*Xa + 420*VIIa_TF_X - 770*VIIa_TF_Xa,
X => -5*VIIa_TF*X + 770*VIIa_TF_X
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


new_vars = fmpq_mpoly[TFPI, VIIa_TF, VIIa_TF_X, VIIa_TF_Xa, X, Xa, Xa_TFPI, Xa_TFPI_VIIa_TF]
new_system = 
[
-10*y1*y4 - 27//500*y1*y6 + 1//50*y7,
-5*y2*y5 - 5*y2*y6 - 11//25*y2*y7 + 770*y3 + 770*y4 + 33//500*y8,
5*y2*y5 - 1190*y3,
-10*y1*y4 + 5*y2*y6 + 420*y3 - 770*y4,
-5*y2*y5 + 770*y3,
-27//500*y1*y6 - 5*y2*y6 + 770*y4 + 1//50*y7,
27//500*y1*y6 - 11//25*y2*y7 - 1//50*y7 + 33//500*y8,
11//25*y2*y7 - 33//500*y8
]


