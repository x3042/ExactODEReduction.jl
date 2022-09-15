Original system:

[
Xa_TFPI_VIIa_TF => 11//25*VIIa_TF*Xa_TFPI - 33//500*Xa_TFPI_VIIa_TF,
Xa_TFPI => 27//500*TFPI*Xa - 11//25*VIIa_TF*Xa_TFPI - 1//50*Xa_TFPI + 33//500*Xa_TFPI_VIIa_TF,
TFPI => -27//500*TFPI*Xa + 1//50*Xa_TFPI,
Xa => -27//500*TFPI*Xa - 5*VIIa_TF*Xa + 770*VIIa_TF_Xa + 1//50*Xa_TFPI,
X => -5*VIIa_TF*X + 770*VIIa_TF_X,
VIIa_TF => -5*VIIa_TF*X - 5*VIIa_TF*Xa - 11//25*VIIa_TF*Xa_TFPI + 770*VIIa_TF_X + 770*VIIa_TF_Xa + 33//500*Xa_TFPI_VIIa_TF,
VIIa_TF_X => 5*VIIa_TF*X - 1190*VIIa_TF_X,
VIIa_TF_Xa => 5*VIIa_TF*Xa + 420*VIIa_TF_X - 770*VIIa_TF_Xa
]

Reductions:

Interesting
new_vars = fmpq_mpoly[TFPI + Xa_TFPI + Xa_TFPI_VIIa_TF]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[TFPI + Xa_TFPI + Xa_TFPI_VIIa_TF, VIIa_TF - X - Xa - Xa_TFPI]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[TFPI + Xa_TFPI + Xa_TFPI_VIIa_TF, VIIa_TF + VIIa_TF_X + VIIa_TF_Xa + Xa_TFPI_VIIa_TF, VIIa_TF_X + VIIa_TF_Xa + X + Xa + Xa_TFPI + Xa_TFPI_VIIa_TF]
new_system = 
[
0,
0,
0
]


