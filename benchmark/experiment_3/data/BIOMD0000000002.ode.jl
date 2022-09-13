Original system:

[
kf_14 => 0,
kf_3 => 0,
kf_10 => 0,
L => -1//10000000000000000*A*L*kf_3 - 1//10000000000000000*AL*L*kf_4 + 1//10000000000000000*AL*kr_3 - 1//10000000000000000*B*L*kf_0 - 1//10000000000000000*BL*L*kf_1 + 1//10000000000000000*BL*kr_0 + 1//10000000000000000*BLL*kr_1 - 1//10000000000000000*DL*L*kf_13 + 1//10000000000000000*DL*kr_12 + 1//10000000000000000*DLL*kr_13 - 1//10000000000000000*I*L*kf_7 - 1//10000000000000000*IL*L*kf_8 + 1//10000000000000000*IL*kr_7 + 1//10000000000000000*ILL*kr_8 - 1//10000000000000000*L*kf_12*sD + 1//10000000000000000*kr_4*sALL,
kr_5 => 0,
I => 1//10000000000000000*A*kf_9 - 1//10000000000000000*I*L*kf_7 - 1//10000000000000000*I*kf_14 - 1//10000000000000000*I*kr_9 + 1//10000000000000000*IL*kr_7 + 1//10000000000000000*kr_14*sD,
kr_16 => 0,
BL => 1//10000000000000000*AL*kr_6 + 1//10000000000000000*B*L*kf_0 - 1//10000000000000000*BL*L*kf_1 - 1//10000000000000000*BL*kf_6 - 1//10000000000000000*BL*kr_0 + 1//10000000000000000*BLL*kr_1,
kr_0 => 0,
kr_7 => 0,
DL => -1//10000000000000000*DL*L*kf_13 - 1//10000000000000000*DL*kr_12 - 1//10000000000000000*DL*kr_15 + 1//10000000000000000*DLL*kr_13 + 1//10000000000000000*IL*kf_15 + 1//10000000000000000*L*kf_12*sD,
AL => 1//10000000000000000*A*L*kf_3 - 1//10000000000000000*AL*L*kf_4 - 1//10000000000000000*AL*kf_10 - 1//10000000000000000*AL*kr_3 - 1//10000000000000000*AL*kr_6 + 1//10000000000000000*BL*kf_6 + 1//10000000000000000*IL*kr_10 + 1//10000000000000000*kr_4*sALL,
ILL => 1//10000000000000000*DLL*kr_16 + 1//10000000000000000*IL*L*kf_8 - 1//10000000000000000*ILL*kf_16 - 1//10000000000000000*ILL*kr_11 - 1//10000000000000000*ILL*kr_8 + 1//10000000000000000*kf_11*sALL,
kr_12 => 0,
kr_3 => 0,
kr_1 => 0,
kf_9 => 0,
kr_4 => 0,
kf_0 => 0,
kr_6 => 0,
kf_5 => 0,
DLL => 1//10000000000000000*DL*L*kf_13 - 1//10000000000000000*DLL*kr_13 - 1//10000000000000000*DLL*kr_16 + 1//10000000000000000*ILL*kf_16,
kf_2 => 0,
A => -1//10000000000000000*A*L*kf_3 - 1//10000000000000000*A*kf_9 - 1//10000000000000000*A*kr_5 + 1//10000000000000000*AL*kr_3 + 1//10000000000000000*B*kf_5 + 1//10000000000000000*I*kr_9,
kf_1 => 0,
kf_11 => 0,
kr_11 => 0,
kr_9 => 0,
sD => 1//10000000000000000*DL*kr_12 + 1//10000000000000000*I*kf_14 - 1//10000000000000000*L*kf_12*sD - 1//10000000000000000*kr_14*sD,
BLL => 1//10000000000000000*BL*L*kf_1 - 1//10000000000000000*BLL*kf_2 - 1//10000000000000000*BLL*kr_1 + 1//10000000000000000*kr_2*sALL,
kf_16 => 0,
kr_14 => 0,
kf_7 => 0,
kr_13 => 0,
kr_2 => 0,
kf_6 => 0,
kf_13 => 0,
sALL => 1//10000000000000000*AL*L*kf_4 + 1//10000000000000000*BLL*kf_2 + 1//10000000000000000*ILL*kr_11 - 1//10000000000000000*kf_11*sALL - 1//10000000000000000*kr_2*sALL - 1//10000000000000000*kr_4*sALL,
kr_15 => 0,
kf_4 => 0,
B => 1//10000000000000000*A*kr_5 - 1//10000000000000000*B*L*kf_0 - 1//10000000000000000*B*kf_5 + 1//10000000000000000*BL*kr_0,
kf_15 => 0,
kf_12 => 0,
kf_8 => 0,
kr_10 => 0,
kr_8 => 0,
IL => 1//10000000000000000*AL*kf_10 + 1//10000000000000000*DL*kr_15 + 1//10000000000000000*I*L*kf_7 - 1//10000000000000000*IL*L*kf_8 - 1//10000000000000000*IL*kf_15 - 1//10000000000000000*IL*kr_10 - 1//10000000000000000*IL*kr_7 + 1//10000000000000000*ILL*kr_8
]

Reductions:

Interesting
new_vars = fmpq_mpoly[A + B - BLL - DLL + I - ILL - L - sALL + sD]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10]
new_system = 
[
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11]
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
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12]
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
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13]
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
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14]
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
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15]
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
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16]
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
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2]
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
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2, kf_3]
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
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2, kf_3, kf_4]
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
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2, kf_3, kf_4, kf_5]
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
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2, kf_3, kf_4, kf_5, kf_6]
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
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2, kf_3, kf_4, kf_5, kf_6, kf_7]
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
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2, kf_3, kf_4, kf_5, kf_6, kf_7, kf_8]
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
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2, kf_3, kf_4, kf_5, kf_6, kf_7, kf_8, kf_9]
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
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2, kf_3, kf_4, kf_5, kf_6, kf_7, kf_8, kf_9, kr_0]
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
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2, kf_3, kf_4, kf_5, kf_6, kf_7, kf_8, kf_9, kr_0, kr_1]
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
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2, kf_3, kf_4, kf_5, kf_6, kf_7, kf_8, kf_9, kr_0, kr_1, kr_10]
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
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2, kf_3, kf_4, kf_5, kf_6, kf_7, kf_8, kf_9, kr_0, kr_1, kr_10, kr_11]
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

Interesting
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2, kf_3, kf_4, kf_5, kf_6, kf_7, kf_8, kf_9, kr_0, kr_1, kr_10, kr_11, kr_12]
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
0,
0
]

Interesting
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2, kf_3, kf_4, kf_5, kf_6, kf_7, kf_8, kf_9, kr_0, kr_1, kr_10, kr_11, kr_12, kr_13]
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
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2, kf_3, kf_4, kf_5, kf_6, kf_7, kf_8, kf_9, kr_0, kr_1, kr_10, kr_11, kr_12, kr_13, kr_14]
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
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2, kf_3, kf_4, kf_5, kf_6, kf_7, kf_8, kf_9, kr_0, kr_1, kr_10, kr_11, kr_12, kr_13, kr_14, kr_15]
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
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2, kf_3, kf_4, kf_5, kf_6, kf_7, kf_8, kf_9, kr_0, kr_1, kr_10, kr_11, kr_12, kr_13, kr_14, kr_15, kr_16]
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
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2, kf_3, kf_4, kf_5, kf_6, kf_7, kf_8, kf_9, kr_0, kr_1, kr_10, kr_11, kr_12, kr_13, kr_14, kr_15, kr_16, kr_2]
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
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2, kf_3, kf_4, kf_5, kf_6, kf_7, kf_8, kf_9, kr_0, kr_1, kr_10, kr_11, kr_12, kr_13, kr_14, kr_15, kr_16, kr_2, kr_3]
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
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2, kf_3, kf_4, kf_5, kf_6, kf_7, kf_8, kf_9, kr_0, kr_1, kr_10, kr_11, kr_12, kr_13, kr_14, kr_15, kr_16, kr_2, kr_3, kr_4]
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
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2, kf_3, kf_4, kf_5, kf_6, kf_7, kf_8, kf_9, kr_0, kr_1, kr_10, kr_11, kr_12, kr_13, kr_14, kr_15, kr_16, kr_2, kr_3, kr_4, kr_5]
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
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2, kf_3, kf_4, kf_5, kf_6, kf_7, kf_8, kf_9, kr_0, kr_1, kr_10, kr_11, kr_12, kr_13, kr_14, kr_15, kr_16, kr_2, kr_3, kr_4, kr_5, kr_6]
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
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2, kf_3, kf_4, kf_5, kf_6, kf_7, kf_8, kf_9, kr_0, kr_1, kr_10, kr_11, kr_12, kr_13, kr_14, kr_15, kr_16, kr_2, kr_3, kr_4, kr_5, kr_6, kr_7]
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
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2, kf_3, kf_4, kf_5, kf_6, kf_7, kf_8, kf_9, kr_0, kr_1, kr_10, kr_11, kr_12, kr_13, kr_14, kr_15, kr_16, kr_2, kr_3, kr_4, kr_5, kr_6, kr_7, kr_8]
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
new_vars = fmpq_mpoly[A + AL + B + BL + BLL + DL + DLL + I + IL + ILL + sALL + sD, AL + BL + 2*BLL + DL + 2*DLL + IL + 2*ILL + L + 2*sALL, kf_0, kf_1, kf_10, kf_11, kf_12, kf_13, kf_14, kf_15, kf_16, kf_2, kf_3, kf_4, kf_5, kf_6, kf_7, kf_8, kf_9, kr_0, kr_1, kr_10, kr_11, kr_12, kr_13, kr_14, kr_15, kr_16, kr_2, kr_3, kr_4, kr_5, kr_6, kr_7, kr_8, kr_9]
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


