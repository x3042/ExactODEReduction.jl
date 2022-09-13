Original system:

[
k_TF_binding_0 => 0,
Pol_TFn_B => 3//1000*Pol*TFn_B*k_Pol_TFn_B_binding_strong + 3//1000*Pol_TFn_B_CP2*k_TFcomplex_CP_binding_0,
k_TFcomplex_CP_binding_0 => 0,
Pol_TFn_B_CP2 => 3//1000*CP*Pol_TFn_B*k_TFcomplex_CP_binding,
k_TF_transcription => 0,
k_TF_binding => 0,
k_protein_degrade => 0,
MetTF_BTF => 3//1000*BTF*MetTF*k_MetTF_binding,
BTF => 3//1000*MetTF_BTF*k_MetTF_binding_0,
Pol_DTF => 3//1000*DTF*Pol*k_PolDTF_binding,
MetTF => 3//1000*MetTF_BTF*k_MetTF_binding_0 + 3//1000*Met_MetTF*k_MetTF_sequestration_0,
Met_MetTF => 3//1000*Met*MetTF*k_MetTF_sequestration,
TFc => 1//25*MTFc*k_TF_translation,
k_Pol_TFn_B_binding_strong => 0,
k_PolDTF_binding => 0,
k__mCherry_translation => 0,
B => 3//1000*TFn_B*k_TF_binding_0,
k_MetTF_binding => 0,
k_MetTF_sequestration_0 => 0,
k_Pol_TFn_B_binding_strong_0 => 0,
k_mCherry_transcription => 0,
MTFc => MetTF_BTF*Pol_DTF*k_TF_transcription,
k_TFcomplex_CP_binding => 0,
Met => 3//1000*Met_MetTF*k_MetTF_sequestration_0,
MmCherryc => Pol_TFn_B_CP2*k_mCherry_transcription,
TFn_B => 3//1000*B*TFn*k_TF_binding + 3//1000*Pol_TFn_B*k_Pol_TFn_B_binding_strong_0 + Pol_TFn_B_CP2*k_mCherry_transcription,
k_TF_translocation => 0,
k_MetTF_binding_0 => 0,
k_MRNA_degrade => 0,
k_PolDTF_binding_0 => 0,
DTF => MetTF_BTF*Pol_DTF*k_TF_transcription + 3//1000*Pol_DTF*k_PolDTF_binding_0,
CP => 3//1000*Pol_TFn_B_CP2*k_TFcomplex_CP_binding_0 + Pol_TFn_B_CP2*k_mCherry_transcription,
TFn => TFc*k_TF_translocation + 3//1000*TFn_B*k_TF_binding_0,
mCherryc => 1//25*MmCherryc*k__mCherry_translation,
k_TF_translation => 0,
k_TF_degrade_strong => 0,
Pol => MetTF_BTF*Pol_DTF*k_TF_transcription + 3//1000*Pol_DTF*k_PolDTF_binding_0 + 3//1000*Pol_TFn_B*k_Pol_TFn_B_binding_strong_0 + Pol_TFn_B_CP2*k_mCherry_transcription,
k_MetTF_sequestration => 0
]

Reductions:

Interesting
new_vars = fmpq_mpoly[BTF + Met - MetTF]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[BTF + Met - MetTF, k_MetTF_binding]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[BTF + Met - MetTF, k_MetTF_binding, k_MetTF_binding_0]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[BTF + Met - MetTF, k_MetTF_binding, k_MetTF_binding_0, k_MetTF_sequestration]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[BTF + Met - MetTF, k_MetTF_binding, k_MetTF_binding_0, k_MetTF_sequestration, k_MetTF_sequestration_0]
new_system = 
[
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[BTF + Met - MetTF, k_MetTF_binding, k_MetTF_binding_0, k_MetTF_sequestration, k_MetTF_sequestration_0, k_PolDTF_binding]
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
new_vars = fmpq_mpoly[BTF + Met - MetTF, k_MetTF_binding, k_MetTF_binding_0, k_MetTF_sequestration, k_MetTF_sequestration_0, k_PolDTF_binding, k_PolDTF_binding_0]
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
new_vars = fmpq_mpoly[BTF + Met - MetTF, k_MetTF_binding, k_MetTF_binding_0, k_MetTF_sequestration, k_MetTF_sequestration_0, k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong]
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
new_vars = fmpq_mpoly[BTF + Met - MetTF, k_MetTF_binding, k_MetTF_binding_0, k_MetTF_sequestration, k_MetTF_sequestration_0, k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0]
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
new_vars = fmpq_mpoly[BTF + Met - MetTF, k_MetTF_binding, k_MetTF_binding_0, k_MetTF_sequestration, k_MetTF_sequestration_0, k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding]
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
new_vars = fmpq_mpoly[BTF + Met - MetTF, k_MetTF_binding, k_MetTF_binding_0, k_MetTF_sequestration, k_MetTF_sequestration_0, k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0]
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
new_vars = fmpq_mpoly[BTF + Met - MetTF, k_MetTF_binding, k_MetTF_binding_0, k_MetTF_sequestration, k_MetTF_sequestration_0, k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_transcription]
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
new_vars = fmpq_mpoly[BTF + Met - MetTF, k_MetTF_binding, k_MetTF_binding_0, k_MetTF_sequestration, k_MetTF_sequestration_0, k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_transcription, k_TF_translation]
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
new_vars = fmpq_mpoly[BTF + Met - MetTF, k_MetTF_binding, k_MetTF_binding_0, k_MetTF_sequestration, k_MetTF_sequestration_0, k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_transcription, k_TF_translation, k_TF_translocation]
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
new_vars = fmpq_mpoly[BTF + Met - MetTF, k_MetTF_binding, k_MetTF_binding_0, k_MetTF_sequestration, k_MetTF_sequestration_0, k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_transcription, k_TF_translation, k_TF_translocation, k_TFcomplex_CP_binding]
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
new_vars = fmpq_mpoly[BTF + Met - MetTF, k_MetTF_binding, k_MetTF_binding_0, k_MetTF_sequestration, k_MetTF_sequestration_0, k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_transcription, k_TF_translation, k_TF_translocation, k_TFcomplex_CP_binding, k_TFcomplex_CP_binding_0]
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
new_vars = fmpq_mpoly[BTF + Met - MetTF, k_MetTF_binding, k_MetTF_binding_0, k_MetTF_sequestration, k_MetTF_sequestration_0, k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_transcription, k_TF_translation, k_TF_translocation, k_TFcomplex_CP_binding, k_TFcomplex_CP_binding_0, k_mCherry_transcription]
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


new_vars = fmpq_mpoly[BTF, Met, MetTF, MetTF_BTF, Met_MetTF, k_MetTF_binding, k_MetTF_binding_0, k_MetTF_sequestration, k_MetTF_sequestration_0, k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_transcription, k_TF_translation, k_TF_translocation, k_TFcomplex_CP_binding, k_TFcomplex_CP_binding_0, k_mCherry_transcription]
new_system = 
[
3//1000*y4*y7,
3//1000*y5*y9,
3//1000*y4*y7 + 3//1000*y5*y9,
3//1000*y1*y3*y6,
3//1000*y2*y3*y8,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[B, BTF, CP, DTF, MTFc, Met, MetTF, MetTF_BTF, Met_MetTF, Pol, Pol_DTF, Pol_TFn_B, Pol_TFn_B_CP2, TFc, TFn, TFn_B, k_MetTF_binding, k_MetTF_binding_0, k_MetTF_sequestration, k_MetTF_sequestration_0, k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_transcription, k_TF_translation, k_TF_translocation, k_TFcomplex_CP_binding, k_TFcomplex_CP_binding_0, k_mCherry_transcription]
new_system = 
[
3//1000*y16*y26,
3//1000*y8*y18,
3//1000*y13*y31 + y13*y32,
y8*y11*y27 + 3//1000*y11*y22,
y8*y11*y27,
3//1000*y9*y20,
3//1000*y8*y18 + 3//1000*y9*y20,
3//1000*y2*y7*y17,
3//1000*y6*y7*y19,
y8*y11*y27 + 3//1000*y11*y22 + 3//1000*y12*y24 + y13*y32,
3//1000*y4*y10*y21,
3//1000*y10*y16*y23 + 3//1000*y13*y31,
3//1000*y3*y12*y30,
1//25*y5*y28,
y14*y29 + 3//1000*y16*y26,
3//1000*y1*y15*y25 + 3//1000*y12*y24 + y13*y32,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[B, BTF, CP, DTF, MTFc, Met, MetTF, MetTF_BTF, Met_MetTF, MmCherryc, Pol, Pol_DTF, Pol_TFn_B, Pol_TFn_B_CP2, TFc, TFn, TFn_B, k_MetTF_binding, k_MetTF_binding_0, k_MetTF_sequestration, k_MetTF_sequestration_0, k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_transcription, k_TF_translation, k_TF_translocation, k_TFcomplex_CP_binding, k_TFcomplex_CP_binding_0, k_mCherry_transcription]
new_system = 
[
3//1000*y17*y27,
3//1000*y8*y19,
3//1000*y14*y32 + y14*y33,
y8*y12*y28 + 3//1000*y12*y23,
y8*y12*y28,
3//1000*y9*y21,
3//1000*y8*y19 + 3//1000*y9*y21,
3//1000*y2*y7*y18,
3//1000*y6*y7*y20,
y14*y33,
y8*y12*y28 + 3//1000*y12*y23 + 3//1000*y13*y25 + y14*y33,
3//1000*y4*y11*y22,
3//1000*y11*y17*y24 + 3//1000*y14*y32,
3//1000*y3*y13*y31,
1//25*y5*y29,
y15*y30 + 3//1000*y17*y27,
3//1000*y1*y16*y26 + 3//1000*y13*y25 + y14*y33,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[B, BTF, CP, DTF, MTFc, Met, MetTF, MetTF_BTF, Met_MetTF, MmCherryc, Pol, Pol_DTF, Pol_TFn_B, Pol_TFn_B_CP2, TFc, TFn, TFn_B, k_MRNA_degrade, k_MetTF_binding, k_MetTF_binding_0, k_MetTF_sequestration, k_MetTF_sequestration_0, k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_transcription, k_TF_translation, k_TF_translocation, k_TFcomplex_CP_binding, k_TFcomplex_CP_binding_0, k_mCherry_transcription]
new_system = 
[
3//1000*y17*y28,
3//1000*y8*y20,
3//1000*y14*y33 + y14*y34,
y8*y12*y29 + 3//1000*y12*y24,
y8*y12*y29,
3//1000*y9*y22,
3//1000*y8*y20 + 3//1000*y9*y22,
3//1000*y2*y7*y19,
3//1000*y6*y7*y21,
y14*y34,
y8*y12*y29 + 3//1000*y12*y24 + 3//1000*y13*y26 + y14*y34,
3//1000*y4*y11*y23,
3//1000*y11*y17*y25 + 3//1000*y14*y33,
3//1000*y3*y13*y32,
1//25*y5*y30,
y15*y31 + 3//1000*y17*y28,
3//1000*y1*y16*y27 + 3//1000*y13*y26 + y14*y34,
0,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[B, BTF, CP, DTF, MTFc, Met, MetTF, MetTF_BTF, Met_MetTF, MmCherryc, Pol, Pol_DTF, Pol_TFn_B, Pol_TFn_B_CP2, TFc, TFn, TFn_B, k_MRNA_degrade, k_MetTF_binding, k_MetTF_binding_0, k_MetTF_sequestration, k_MetTF_sequestration_0, k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_degrade_strong, k_TF_transcription, k_TF_translation, k_TF_translocation, k_TFcomplex_CP_binding, k_TFcomplex_CP_binding_0, k_mCherry_transcription]
new_system = 
[
3//1000*y17*y28,
3//1000*y8*y20,
3//1000*y14*y34 + y14*y35,
y8*y12*y30 + 3//1000*y12*y24,
y8*y12*y30,
3//1000*y9*y22,
3//1000*y8*y20 + 3//1000*y9*y22,
3//1000*y2*y7*y19,
3//1000*y6*y7*y21,
y14*y35,
y8*y12*y30 + 3//1000*y12*y24 + 3//1000*y13*y26 + y14*y35,
3//1000*y4*y11*y23,
3//1000*y11*y17*y25 + 3//1000*y14*y34,
3//1000*y3*y13*y33,
1//25*y5*y31,
y15*y32 + 3//1000*y17*y28,
3//1000*y1*y16*y27 + 3//1000*y13*y26 + y14*y35,
0,
0,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[B, BTF, CP, DTF, MTFc, Met, MetTF, MetTF_BTF, Met_MetTF, MmCherryc, Pol, Pol_DTF, Pol_TFn_B, Pol_TFn_B_CP2, TFc, TFn, TFn_B, k_MRNA_degrade, k_MetTF_binding, k_MetTF_binding_0, k_MetTF_sequestration, k_MetTF_sequestration_0, k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_degrade_strong, k_TF_transcription, k_TF_translation, k_TF_translocation, k_TFcomplex_CP_binding, k_TFcomplex_CP_binding_0, k__mCherry_translation, k_mCherry_transcription]
new_system = 
[
3//1000*y17*y28,
3//1000*y8*y20,
3//1000*y14*y34 + y14*y36,
y8*y12*y30 + 3//1000*y12*y24,
y8*y12*y30,
3//1000*y9*y22,
3//1000*y8*y20 + 3//1000*y9*y22,
3//1000*y2*y7*y19,
3//1000*y6*y7*y21,
y14*y36,
y8*y12*y30 + 3//1000*y12*y24 + 3//1000*y13*y26 + y14*y36,
3//1000*y4*y11*y23,
3//1000*y11*y17*y25 + 3//1000*y14*y34,
3//1000*y3*y13*y33,
1//25*y5*y31,
y15*y32 + 3//1000*y17*y28,
3//1000*y1*y16*y27 + 3//1000*y13*y26 + y14*y36,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[B, BTF, CP, DTF, MTFc, Met, MetTF, MetTF_BTF, Met_MetTF, MmCherryc, Pol, Pol_DTF, Pol_TFn_B, Pol_TFn_B_CP2, TFc, TFn, TFn_B, k_MRNA_degrade, k_MetTF_binding, k_MetTF_binding_0, k_MetTF_sequestration, k_MetTF_sequestration_0, k_PolDTF_binding, k_PolDTF_binding_0, k_Pol_TFn_B_binding_strong, k_Pol_TFn_B_binding_strong_0, k_TF_binding, k_TF_binding_0, k_TF_degrade_strong, k_TF_transcription, k_TF_translation, k_TF_translocation, k_TFcomplex_CP_binding, k_TFcomplex_CP_binding_0, k__mCherry_translation, k_mCherry_transcription, k_protein_degrade]
new_system = 
[
3//1000*y17*y28,
3//1000*y8*y20,
3//1000*y14*y34 + y14*y36,
y8*y12*y30 + 3//1000*y12*y24,
y8*y12*y30,
3//1000*y9*y22,
3//1000*y8*y20 + 3//1000*y9*y22,
3//1000*y2*y7*y19,
3//1000*y6*y7*y21,
y14*y36,
y8*y12*y30 + 3//1000*y12*y24 + 3//1000*y13*y26 + y14*y36,
3//1000*y4*y11*y23,
3//1000*y11*y17*y25 + 3//1000*y14*y34,
3//1000*y3*y13*y33,
1//25*y5*y31,
y15*y32 + 3//1000*y17*y28,
3//1000*y1*y16*y27 + 3//1000*y13*y26 + y14*y36,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
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


