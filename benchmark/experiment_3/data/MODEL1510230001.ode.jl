Original system:

[
TFn => TFc*k_TF_translocation + 3//1000*TFn_B*k_TF_binding_0,
k_Pol_TFn_B_binding_strong_0 => 0,
k_mCherry_transcription => 0,
k_TFcomplex_CP_binding_0 => 0,
k_PolDTF_binding_0 => 0,
k_TF_binding => 0,
k_TF_degrade_strong => 0,
k_TF_translation => 0,
CP => 3//1000*Pol_TFn_B_CP*k_TFcomplex_CP_binding_0 + Pol_TFn_B_CP*k_mCherry_transcription,
k_MRNA_degrade => 0,
MmCherryc => Pol_TFn_B_CP*k_mCherry_transcription,
Pol_DTF => 3//1000*DTF*Pol*k_PolDTF_binding,
TFn_B => 3//1000*B*TFn*k_TF_binding + 3//1000*Pol_TFn_B*k_Pol_TFn_B_binding_strong_0 + Pol_TFn_B_CP*k_mCherry_transcription,
k_Pol_TFn_B_binding_strong => 0,
k_TF_binding_0 => 0,
B => 3//1000*TFn_B*k_TF_binding_0,
k_TFcomplex_CP_binding => 0,
k__mCherry_translation => 0,
DTF => 3//1000*Pol_DTF*k_PolDTF_binding_0 + Pol_DTF*k_TF_transcription,
TFc => 1//25*MTFc*k_TF_translation,
k_TF_transcription => 0,
mCherryc => 1//25*MmCherryc*k__mCherry_translation,
k_protein_degrade => 0,
Pol => 3//1000*Pol_DTF*k_PolDTF_binding_0 + Pol_DTF*k_TF_transcription + 3//1000*Pol_TFn_B*k_Pol_TFn_B_binding_strong_0 + Pol_TFn_B_CP*k_mCherry_transcription,
Pol_TFn_B => 3//1000*Pol*TFn_B*k_Pol_TFn_B_binding_strong + 3//1000*Pol_TFn_B_CP*k_TFcomplex_CP_binding_0,
MTFc => Pol_DTF*k_TF_transcription,
Pol_TFn_B_CP => 3//1000*CP*Pol_TFn_B*k_TFcomplex_CP_binding,
k_PolDTF_binding => 0,
k_TF_translocation => 0
]

Reductions:


new_vars = fmpq_mpoly[k_PolDTF_binding]
new_system = 
[
0
]


new_vars = fmpq_mpoly[k_PolDTF_binding, k_PolDTF_binding_0]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_transcription]
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


new_vars = fmpq_mpoly[k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_transcription, k_TF_translation]
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


new_vars = fmpq_mpoly[k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_transcription, k_TF_translation, k_TF_translocation]
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


new_vars = fmpq_mpoly[k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_transcription, k_TF_translation, k_TF_translocation, k_TFcomplex_CP_binding]
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


new_vars = fmpq_mpoly[k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_transcription, k_TF_translation, k_TF_translocation, k_TFcomplex_CP_binding, k_TFcomplex_CP_binding_0]
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


new_vars = fmpq_mpoly[k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_transcription, k_TF_translation, k_TF_translocation, k_TFcomplex_CP_binding, k_TFcomplex_CP_binding_0, k_mCherry_transcription]
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


new_vars = fmpq_mpoly[B, CP, DTF, MTFc, Pol, Pol_DTF, Pol_TFn_B, Pol_TFn_B_CP, TFc, TFn, TFn_B, k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_transcription, k_TF_translation, k_TF_translocation, k_TFcomplex_CP_binding, k_TFcomplex_CP_binding_0, k_mCherry_transcription]
new_system = 
[
3//1000*y11*y17,
3//1000*y8*y22 + y8*y23,
3//1000*y6*y13 + y6*y18,
y6*y18,
3//1000*y6*y13 + y6*y18 + 3//1000*y7*y15 + y8*y23,
3//1000*y3*y5*y12,
3//1000*y5*y11*y14 + 3//1000*y8*y22,
3//1000*y2*y7*y21,
1//25*y4*y19,
y9*y20 + 3//1000*y11*y17,
3//1000*y1*y10*y16 + 3//1000*y7*y15 + y8*y23,
0,
0,
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


new_vars = fmpq_mpoly[B, CP, DTF, MTFc, MmCherryc, Pol, Pol_DTF, Pol_TFn_B, Pol_TFn_B_CP, TFc, TFn, TFn_B, k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_transcription, k_TF_translation, k_TF_translocation, k_TFcomplex_CP_binding, k_TFcomplex_CP_binding_0, k_mCherry_transcription]
new_system = 
[
3//1000*y12*y18,
3//1000*y9*y23 + y9*y24,
3//1000*y7*y14 + y7*y19,
y7*y19,
y9*y24,
3//1000*y7*y14 + y7*y19 + 3//1000*y8*y16 + y9*y24,
3//1000*y3*y6*y13,
3//1000*y6*y12*y15 + 3//1000*y9*y23,
3//1000*y2*y8*y22,
1//25*y4*y20,
y10*y21 + 3//1000*y12*y18,
3//1000*y1*y11*y17 + 3//1000*y8*y16 + y9*y24,
0,
0,
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


new_vars = fmpq_mpoly[B, CP, DTF, MTFc, MmCherryc, Pol, Pol_DTF, Pol_TFn_B, Pol_TFn_B_CP, TFc, TFn, TFn_B, k_MRNA_degrade, k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_transcription, k_TF_translation, k_TF_translocation, k_TFcomplex_CP_binding, k_TFcomplex_CP_binding_0, k_mCherry_transcription]
new_system = 
[
3//1000*y12*y19,
3//1000*y9*y24 + y9*y25,
3//1000*y7*y15 + y7*y20,
y7*y20,
y9*y25,
3//1000*y7*y15 + y7*y20 + 3//1000*y8*y17 + y9*y25,
3//1000*y3*y6*y14,
3//1000*y6*y12*y16 + 3//1000*y9*y24,
3//1000*y2*y8*y23,
1//25*y4*y21,
y10*y22 + 3//1000*y12*y19,
3//1000*y1*y11*y18 + 3//1000*y8*y17 + y9*y25,
0,
0,
0,
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


new_vars = fmpq_mpoly[B, CP, DTF, MTFc, MmCherryc, Pol, Pol_DTF, Pol_TFn_B, Pol_TFn_B_CP, TFc, TFn, TFn_B, k_MRNA_degrade, k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_degrade_strong, k_TF_transcription, k_TF_translation, k_TF_translocation, k_TFcomplex_CP_binding, k_TFcomplex_CP_binding_0, k_mCherry_transcription]
new_system = 
[
3//1000*y12*y19,
3//1000*y9*y25 + y9*y26,
3//1000*y7*y15 + y7*y21,
y7*y21,
y9*y26,
3//1000*y7*y15 + y7*y21 + 3//1000*y8*y17 + y9*y26,
3//1000*y3*y6*y14,
3//1000*y6*y12*y16 + 3//1000*y9*y25,
3//1000*y2*y8*y24,
1//25*y4*y22,
y10*y23 + 3//1000*y12*y19,
3//1000*y1*y11*y18 + 3//1000*y8*y17 + y9*y26,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[B, CP, DTF, MTFc, MmCherryc, Pol, Pol_DTF, Pol_TFn_B, Pol_TFn_B_CP, TFc, TFn, TFn_B, k_MRNA_degrade, k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_degrade_strong, k_TF_transcription, k_TF_translation, k_TF_translocation, k_TFcomplex_CP_binding, k_TFcomplex_CP_binding_0, k__mCherry_translation, k_mCherry_transcription]
new_system = 
[
3//1000*y12*y19,
3//1000*y9*y25 + y9*y27,
3//1000*y7*y15 + y7*y21,
y7*y21,
y9*y27,
3//1000*y7*y15 + y7*y21 + 3//1000*y8*y17 + y9*y27,
3//1000*y3*y6*y14,
3//1000*y6*y12*y16 + 3//1000*y9*y25,
3//1000*y2*y8*y24,
1//25*y4*y22,
y10*y23 + 3//1000*y12*y19,
3//1000*y1*y11*y18 + 3//1000*y8*y17 + y9*y27,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[B, CP, DTF, MTFc, MmCherryc, Pol, Pol_DTF, Pol_TFn_B, Pol_TFn_B_CP, TFc, TFn, TFn_B, k_MRNA_degrade, k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_degrade_strong, k_TF_transcription, k_TF_translation, k_TF_translocation, k_TFcomplex_CP_binding, k_TFcomplex_CP_binding_0, k__mCherry_translation, k_mCherry_transcription, k_protein_degrade]
new_system = 
[
3//1000*y12*y19,
3//1000*y9*y25 + y9*y27,
3//1000*y7*y15 + y7*y21,
y7*y21,
y9*y27,
3//1000*y7*y15 + y7*y21 + 3//1000*y8*y17 + y9*y27,
3//1000*y3*y6*y14,
3//1000*y6*y12*y16 + 3//1000*y9*y25,
3//1000*y2*y8*y24,
1//25*y4*y22,
y10*y23 + 3//1000*y12*y19,
3//1000*y1*y11*y18 + 3//1000*y8*y17 + y9*y27,
0,
0,
0,
0,
0,
0,
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


