Original system:

[
First_ERK2_phosphorylation_by_ppMEK => 0,
pERK2 => ERK2*First_ERK2_phosphorylation_by_ppMEK*ppMEK1 + ERK2*First_ERK2_phosphorylation_by_ppMEK*ppMEK2 + First_ERK_dephosphorylation*ppERK2 - Second_ERK2_phosphorylation_by_ppMEK*pERK2*ppMEK1 - Second_ERK2_phosphorylation_by_ppMEK*pERK2*ppMEK2 - Second_ERK_dephosphorylation*pERK2,
pSOS_dephosphorylation => 0,
pMEK2 => First_MEK2_phosphorylation_by_pRaf*MEK2*pRaf + First_MEK_dephosphorylation*ppMEK2 - Second_MEK2_phosphorylation_by_pRaf*pMEK2*pRaf - Second_MEK_dephosphorylation*pMEK2,
ppERK2 => -First_ERK_dephosphorylation*ppERK2 + Second_ERK2_phosphorylation_by_ppMEK*pERK2*ppMEK1 + Second_ERK2_phosphorylation_by_ppMEK*pERK2*ppMEK2,
ppERK_neg_feedback_on_mSOS => 0,
SHP1 => -SHP1*SHP1_activation_by_pEpoR*pEpoR + actSHP1*actSHP1_deactivation,
Delay04_mSHP1 => Delay03_mSHP1*SHP1_delay - Delay04_mSHP1*SHP1_delay,
JAK2_phosphorylation_by_Epo => 0,
Delay06_mSHP1 => Delay05_mSHP1*SHP1_delay - Delay06_mSHP1*SHP1_delay,
mSOS_induced_Raf_phosphorylation => 0,
Epo => 0,
pERK1 => ERK1*First_ERK1_phosphorylation_by_ppMEK*ppMEK1 + ERK1*First_ERK1_phosphorylation_by_ppMEK*ppMEK2 + First_ERK_dephosphorylation*ppERK1 - Second_ERK1_phosphorylation_by_ppMEK*pERK1*ppMEK1 - Second_ERK1_phosphorylation_by_ppMEK*pERK1*ppMEK2 - Second_ERK_dephosphorylation*pERK1,
First_ERK_dephosphorylation => 0,
Second_MEK2_phosphorylation_by_pRaf => 0,
EpoR => -EpoR*EpoR_phosphorylation_by_pJAK2*pJAK2 + actSHP1*pEpoR*pEpoR_dephosphorylation_by_actSHP1,
pRaf_dephosphorylation => 0,
SHP1_delay => 0,
pEpoR => EpoR*EpoR_phosphorylation_by_pJAK2*pJAK2 - actSHP1*pEpoR*pEpoR_dephosphorylation_by_actSHP1,
Delay07_mSHP1 => Delay06_mSHP1*SHP1_delay - Delay07_mSHP1*SHP1_delay,
pJAK2_dephosphorylation_by_actSHP1 => 0,
Delay01_mSHP1 => -Delay01_mSHP1*SHP1_delay + SHP1_delay*mSHP1,
First_MEK1_phosphorylation_by_pRaf => 0,
SHP1_activation_by_pEpoR => 0,
mSOS_release_from_membrane => 0,
ppMEK2 => -First_MEK_dephosphorylation*ppMEK2 + Second_MEK2_phosphorylation_by_pRaf*pMEK2*pRaf,
pEpoR_dephosphorylation_by_actSHP1 => 0,
Second_ERK2_phosphorylation_by_ppMEK => 0,
ppERK1 => -First_ERK_dephosphorylation*ppERK1 + Second_ERK1_phosphorylation_by_ppMEK*pERK1*ppMEK1 + Second_ERK1_phosphorylation_by_ppMEK*pERK1*ppMEK2,
Delay03_mSHP1 => Delay02_mSHP1*SHP1_delay - Delay03_mSHP1*SHP1_delay,
Second_MEK_dephosphorylation => 0,
pJAK2 => Epo*JAK2*JAK2_phosphorylation_by_Epo - actSHP1*pJAK2*pJAK2_dephosphorylation_by_actSHP1,
mSHP1 => SHP1*SHP1_activation_by_pEpoR*pEpoR - SHP1_delay*mSHP1,
actSHP1 => Delay08_mSHP1*SHP1_delay - actSHP1*actSHP1_deactivation,
EpoR_phosphorylation_by_pJAK2 => 0,
JAK2 => -Epo*JAK2*JAK2_phosphorylation_by_Epo + actSHP1*pJAK2*pJAK2_dephosphorylation_by_actSHP1,
MEK2 => -First_MEK2_phosphorylation_by_pRaf*MEK2*pRaf + Second_MEK_dephosphorylation*pMEK2,
ERK2 => -ERK2*First_ERK2_phosphorylation_by_ppMEK*ppMEK1 - ERK2*First_ERK2_phosphorylation_by_ppMEK*ppMEK2 + Second_ERK_dephosphorylation*pERK2,
First_MEK2_phosphorylation_by_pRaf => 0,
First_MEK_dephosphorylation => 0,
Second_ERK1_phosphorylation_by_ppMEK => 0,
actSHP1_deactivation => 0,
MEK1 => -First_MEK1_phosphorylation_by_pRaf*MEK1*pRaf + Second_MEK_dephosphorylation*pMEK1,
SOS => -SOS*SOS_recruitment_by_pEpoR*pEpoR + mSOS*mSOS_release_from_membrane + pSOS*pSOS_dephosphorylation,
Second_MEK1_phosphorylation_by_pRaf => 0,
Delay02_mSHP1 => Delay01_mSHP1*SHP1_delay - Delay02_mSHP1*SHP1_delay,
Raf => -Raf*mSOS*mSOS_induced_Raf_phosphorylation + pRaf*pRaf_dephosphorylation,
Second_ERK_dephosphorylation => 0,
ppMEK1 => -First_MEK_dephosphorylation*ppMEK1 + Second_MEK1_phosphorylation_by_pRaf*pMEK1*pRaf,
mSOS => SOS*SOS_recruitment_by_pEpoR*pEpoR - mSOS*mSOS_release_from_membrane - mSOS*ppERK1*ppERK_neg_feedback_on_mSOS - mSOS*ppERK2*ppERK_neg_feedback_on_mSOS,
SOS_recruitment_by_pEpoR => 0,
Delay08_mSHP1 => Delay07_mSHP1*SHP1_delay - Delay08_mSHP1*SHP1_delay,
pMEK1 => First_MEK1_phosphorylation_by_pRaf*MEK1*pRaf + First_MEK_dephosphorylation*ppMEK1 - Second_MEK1_phosphorylation_by_pRaf*pMEK1*pRaf - Second_MEK_dephosphorylation*pMEK1,
pSOS => mSOS*ppERK1*ppERK_neg_feedback_on_mSOS + mSOS*ppERK2*ppERK_neg_feedback_on_mSOS - pSOS*pSOS_dephosphorylation,
pRaf => Raf*mSOS*mSOS_induced_Raf_phosphorylation - pRaf*pRaf_dephosphorylation,
First_ERK1_phosphorylation_by_ppMEK => 0,
ERK1 => -ERK1*First_ERK1_phosphorylation_by_ppMEK*ppMEK1 - ERK1*First_ERK1_phosphorylation_by_ppMEK*ppMEK2 + Second_ERK_dephosphorylation*pERK1,
Delay05_mSHP1 => Delay04_mSHP1*SHP1_delay - Delay05_mSHP1*SHP1_delay
]

Reductions:

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1 + Delay02_mSHP1 + Delay03_mSHP1 + Delay04_mSHP1 + Delay05_mSHP1 + Delay06_mSHP1 + Delay07_mSHP1 + Delay08_mSHP1 + SHP1 + actSHP1 + mSHP1]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1 + Delay02_mSHP1 + Delay03_mSHP1 + Delay04_mSHP1 + Delay05_mSHP1 + Delay06_mSHP1 + Delay07_mSHP1 + Delay08_mSHP1 + SHP1 + actSHP1 + mSHP1, Epo]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1 + Delay02_mSHP1 + Delay03_mSHP1 + Delay04_mSHP1 + Delay05_mSHP1 + Delay06_mSHP1 + Delay07_mSHP1 + Delay08_mSHP1 + SHP1 + actSHP1 + mSHP1, Epo, EpoR + pEpoR]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1 + Delay02_mSHP1 + Delay03_mSHP1 + Delay04_mSHP1 + Delay05_mSHP1 + Delay06_mSHP1 + Delay07_mSHP1 + Delay08_mSHP1 + SHP1 + actSHP1 + mSHP1, Epo, EpoR + pEpoR, EpoR_phosphorylation_by_pJAK2]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1 + Delay02_mSHP1 + Delay03_mSHP1 + Delay04_mSHP1 + Delay05_mSHP1 + Delay06_mSHP1 + Delay07_mSHP1 + Delay08_mSHP1 + SHP1 + actSHP1 + mSHP1, Epo, EpoR + pEpoR, EpoR_phosphorylation_by_pJAK2, JAK2 + pJAK2]
new_system = 
[
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1 + Delay02_mSHP1 + Delay03_mSHP1 + Delay04_mSHP1 + Delay05_mSHP1 + Delay06_mSHP1 + Delay07_mSHP1 + Delay08_mSHP1 + SHP1 + actSHP1 + mSHP1, Epo, EpoR + pEpoR, EpoR_phosphorylation_by_pJAK2, JAK2 + pJAK2, JAK2_phosphorylation_by_Epo]
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
new_vars = fmpq_mpoly[Delay01_mSHP1 + Delay02_mSHP1 + Delay03_mSHP1 + Delay04_mSHP1 + Delay05_mSHP1 + Delay06_mSHP1 + Delay07_mSHP1 + Delay08_mSHP1 + SHP1 + actSHP1 + mSHP1, Epo, EpoR + pEpoR, EpoR_phosphorylation_by_pJAK2, JAK2 + pJAK2, JAK2_phosphorylation_by_Epo, SHP1_activation_by_pEpoR]
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
new_vars = fmpq_mpoly[Delay01_mSHP1 + Delay02_mSHP1 + Delay03_mSHP1 + Delay04_mSHP1 + Delay05_mSHP1 + Delay06_mSHP1 + Delay07_mSHP1 + Delay08_mSHP1 + SHP1 + actSHP1 + mSHP1, Epo, EpoR + pEpoR, EpoR_phosphorylation_by_pJAK2, JAK2 + pJAK2, JAK2_phosphorylation_by_Epo, SHP1_activation_by_pEpoR, SHP1_delay]
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
new_vars = fmpq_mpoly[Delay01_mSHP1 + Delay02_mSHP1 + Delay03_mSHP1 + Delay04_mSHP1 + Delay05_mSHP1 + Delay06_mSHP1 + Delay07_mSHP1 + Delay08_mSHP1 + SHP1 + actSHP1 + mSHP1, Epo, EpoR + pEpoR, EpoR_phosphorylation_by_pJAK2, JAK2 + pJAK2, JAK2_phosphorylation_by_Epo, SHP1_activation_by_pEpoR, SHP1_delay, actSHP1_deactivation]
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
new_vars = fmpq_mpoly[Delay01_mSHP1 + Delay02_mSHP1 + Delay03_mSHP1 + Delay04_mSHP1 + Delay05_mSHP1 + Delay06_mSHP1 + Delay07_mSHP1 + Delay08_mSHP1 + SHP1 + actSHP1 + mSHP1, Epo, EpoR + pEpoR, EpoR_phosphorylation_by_pJAK2, JAK2 + pJAK2, JAK2_phosphorylation_by_Epo, SHP1_activation_by_pEpoR, SHP1_delay, actSHP1_deactivation, pEpoR_dephosphorylation_by_actSHP1]
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
new_vars = fmpq_mpoly[Delay01_mSHP1 + Delay02_mSHP1 + Delay03_mSHP1 + Delay04_mSHP1 + Delay05_mSHP1 + Delay06_mSHP1 + Delay07_mSHP1 + Delay08_mSHP1 + SHP1 + actSHP1 + mSHP1, Epo, EpoR + pEpoR, EpoR_phosphorylation_by_pJAK2, JAK2 + pJAK2, JAK2_phosphorylation_by_Epo, SHP1_activation_by_pEpoR, SHP1_delay, actSHP1_deactivation, pEpoR_dephosphorylation_by_actSHP1, pJAK2_dephosphorylation_by_actSHP1]
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


new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, JAK2, JAK2_phosphorylation_by_Epo, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, actSHP1, actSHP1_deactivation, mSHP1, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1]
new_system = 
[
-y1*y16 + y16*y19,
y1*y16 - y2*y16,
y2*y16 - y3*y16,
y3*y16 - y4*y16,
y4*y16 - y5*y16,
y5*y16 - y6*y16,
y6*y16 - y7*y16,
y7*y16 - y8*y16,
0,
-y10*y11*y22 + y17*y20*y21,
0,
-y9*y12*y13 + y17*y22*y23,
0,
-y14*y15*y20 + y17*y18,
0,
0,
y8*y16 - y17*y18,
0,
y14*y15*y20 - y16*y19,
y10*y11*y22 - y17*y20*y21,
0,
y9*y12*y13 - y17*y22*y23,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, ERK1 + pERK1 + ppERK1, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, JAK2, JAK2_phosphorylation_by_Epo, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, actSHP1, actSHP1_deactivation, mSHP1, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1]
new_system = 
[
-y1*y17 + y17*y20,
y1*y17 - y2*y17,
y2*y17 - y3*y17,
y3*y17 - y4*y17,
y4*y17 - y5*y17,
y5*y17 - y6*y17,
y6*y17 - y7*y17,
y7*y17 - y8*y17,
0,
0,
-y11*y12*y23 + y18*y21*y22,
0,
-y10*y13*y14 + y18*y23*y24,
0,
-y15*y16*y21 + y18*y19,
0,
0,
y8*y17 - y18*y19,
0,
y15*y16*y21 - y17*y20,
y11*y12*y23 - y18*y21*y22,
0,
y10*y13*y14 - y18*y23*y24,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, ERK1 + pERK1 + ppERK1, ERK2 + pERK2 + ppERK2, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, JAK2, JAK2_phosphorylation_by_Epo, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, actSHP1, actSHP1_deactivation, mSHP1, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1]
new_system = 
[
-y1*y18 + y18*y21,
y1*y18 - y2*y18,
y2*y18 - y3*y18,
y3*y18 - y4*y18,
y4*y18 - y5*y18,
y5*y18 - y6*y18,
y6*y18 - y7*y18,
y7*y18 - y8*y18,
0,
0,
0,
-y12*y13*y24 + y19*y22*y23,
0,
-y11*y14*y15 + y19*y24*y25,
0,
-y16*y17*y22 + y19*y20,
0,
0,
y8*y18 - y19*y20,
0,
y16*y17*y22 - y18*y21,
y12*y13*y24 - y19*y22*y23,
0,
y11*y14*y15 - y19*y24*y25,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, ERK1 + pERK1 + ppERK1, ERK2 + pERK2 + ppERK2, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, First_ERK1_phosphorylation_by_ppMEK, JAK2, JAK2_phosphorylation_by_Epo, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, actSHP1, actSHP1_deactivation, mSHP1, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1]
new_system = 
[
-y1*y19 + y19*y22,
y1*y19 - y2*y19,
y2*y19 - y3*y19,
y3*y19 - y4*y19,
y4*y19 - y5*y19,
y5*y19 - y6*y19,
y6*y19 - y7*y19,
y7*y19 - y8*y19,
0,
0,
0,
-y12*y13*y25 + y20*y23*y24,
0,
0,
-y11*y15*y16 + y20*y25*y26,
0,
-y17*y18*y23 + y20*y21,
0,
0,
y8*y19 - y20*y21,
0,
y17*y18*y23 - y19*y22,
y12*y13*y25 - y20*y23*y24,
0,
y11*y15*y16 - y20*y25*y26,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, ERK1 + pERK1 + ppERK1, ERK2 + pERK2 + ppERK2, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, First_ERK1_phosphorylation_by_ppMEK, First_ERK2_phosphorylation_by_ppMEK, JAK2, JAK2_phosphorylation_by_Epo, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, actSHP1, actSHP1_deactivation, mSHP1, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1]
new_system = 
[
-y1*y20 + y20*y23,
y1*y20 - y2*y20,
y2*y20 - y3*y20,
y3*y20 - y4*y20,
y4*y20 - y5*y20,
y5*y20 - y6*y20,
y6*y20 - y7*y20,
y7*y20 - y8*y20,
0,
0,
0,
-y12*y13*y26 + y21*y24*y25,
0,
0,
0,
-y11*y16*y17 + y21*y26*y27,
0,
-y18*y19*y24 + y21*y22,
0,
0,
y8*y20 - y21*y22,
0,
y18*y19*y24 - y20*y23,
y12*y13*y26 - y21*y24*y25,
0,
y11*y16*y17 - y21*y26*y27,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, ERK1 + pERK1 + ppERK1, ERK2 + pERK2 + ppERK2, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, First_ERK1_phosphorylation_by_ppMEK, First_ERK2_phosphorylation_by_ppMEK, First_ERK_dephosphorylation, JAK2, JAK2_phosphorylation_by_Epo, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, actSHP1, actSHP1_deactivation, mSHP1, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1]
new_system = 
[
-y1*y21 + y21*y24,
y1*y21 - y2*y21,
y2*y21 - y3*y21,
y3*y21 - y4*y21,
y4*y21 - y5*y21,
y5*y21 - y6*y21,
y6*y21 - y7*y21,
y7*y21 - y8*y21,
0,
0,
0,
-y12*y13*y27 + y22*y25*y26,
0,
0,
0,
0,
-y11*y17*y18 + y22*y27*y28,
0,
-y19*y20*y25 + y22*y23,
0,
0,
y8*y21 - y22*y23,
0,
y19*y20*y25 - y21*y24,
y12*y13*y27 - y22*y25*y26,
0,
y11*y17*y18 - y22*y27*y28,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, ERK1 + pERK1 + ppERK1, ERK2 + pERK2 + ppERK2, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, First_ERK1_phosphorylation_by_ppMEK, First_ERK2_phosphorylation_by_ppMEK, First_ERK_dephosphorylation, First_MEK1_phosphorylation_by_pRaf, JAK2, JAK2_phosphorylation_by_Epo, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, actSHP1, actSHP1_deactivation, mSHP1, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1]
new_system = 
[
-y1*y22 + y22*y25,
y1*y22 - y2*y22,
y2*y22 - y3*y22,
y3*y22 - y4*y22,
y4*y22 - y5*y22,
y5*y22 - y6*y22,
y6*y22 - y7*y22,
y7*y22 - y8*y22,
0,
0,
0,
-y12*y13*y28 + y23*y26*y27,
0,
0,
0,
0,
0,
-y11*y18*y19 + y23*y28*y29,
0,
-y20*y21*y26 + y23*y24,
0,
0,
y8*y22 - y23*y24,
0,
y20*y21*y26 - y22*y25,
y12*y13*y28 - y23*y26*y27,
0,
y11*y18*y19 - y23*y28*y29,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, ERK1 + pERK1 + ppERK1, ERK2 + pERK2 + ppERK2, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, First_ERK1_phosphorylation_by_ppMEK, First_ERK2_phosphorylation_by_ppMEK, First_ERK_dephosphorylation, First_MEK1_phosphorylation_by_pRaf, First_MEK2_phosphorylation_by_pRaf, JAK2, JAK2_phosphorylation_by_Epo, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, actSHP1, actSHP1_deactivation, mSHP1, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1]
new_system = 
[
-y1*y23 + y23*y26,
y1*y23 - y2*y23,
y2*y23 - y3*y23,
y3*y23 - y4*y23,
y4*y23 - y5*y23,
y5*y23 - y6*y23,
y6*y23 - y7*y23,
y7*y23 - y8*y23,
0,
0,
0,
-y12*y13*y29 + y24*y27*y28,
0,
0,
0,
0,
0,
0,
-y11*y19*y20 + y24*y29*y30,
0,
-y21*y22*y27 + y24*y25,
0,
0,
y8*y23 - y24*y25,
0,
y21*y22*y27 - y23*y26,
y12*y13*y29 - y24*y27*y28,
0,
y11*y19*y20 - y24*y29*y30,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, ERK1 + pERK1 + ppERK1, ERK2 + pERK2 + ppERK2, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, First_ERK1_phosphorylation_by_ppMEK, First_ERK2_phosphorylation_by_ppMEK, First_ERK_dephosphorylation, First_MEK1_phosphorylation_by_pRaf, First_MEK2_phosphorylation_by_pRaf, First_MEK_dephosphorylation, JAK2, JAK2_phosphorylation_by_Epo, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, actSHP1, actSHP1_deactivation, mSHP1, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1]
new_system = 
[
-y1*y24 + y24*y27,
y1*y24 - y2*y24,
y2*y24 - y3*y24,
y3*y24 - y4*y24,
y4*y24 - y5*y24,
y5*y24 - y6*y24,
y6*y24 - y7*y24,
y7*y24 - y8*y24,
0,
0,
0,
-y12*y13*y30 + y25*y28*y29,
0,
0,
0,
0,
0,
0,
0,
-y11*y20*y21 + y25*y30*y31,
0,
-y22*y23*y28 + y25*y26,
0,
0,
y8*y24 - y25*y26,
0,
y22*y23*y28 - y24*y27,
y12*y13*y30 - y25*y28*y29,
0,
y11*y20*y21 - y25*y30*y31,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, ERK1 + pERK1 + ppERK1, ERK2 + pERK2 + ppERK2, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, First_ERK1_phosphorylation_by_ppMEK, First_ERK2_phosphorylation_by_ppMEK, First_ERK_dephosphorylation, First_MEK1_phosphorylation_by_pRaf, First_MEK2_phosphorylation_by_pRaf, First_MEK_dephosphorylation, JAK2, JAK2_phosphorylation_by_Epo, MEK1 + pMEK1 + ppMEK1, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, actSHP1, actSHP1_deactivation, mSHP1, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1]
new_system = 
[
-y1*y25 + y25*y28,
y1*y25 - y2*y25,
y2*y25 - y3*y25,
y3*y25 - y4*y25,
y4*y25 - y5*y25,
y5*y25 - y6*y25,
y6*y25 - y7*y25,
y7*y25 - y8*y25,
0,
0,
0,
-y12*y13*y31 + y26*y29*y30,
0,
0,
0,
0,
0,
0,
0,
-y11*y20*y21 + y26*y31*y32,
0,
0,
-y23*y24*y29 + y26*y27,
0,
0,
y8*y25 - y26*y27,
0,
y23*y24*y29 - y25*y28,
y12*y13*y31 - y26*y29*y30,
0,
y11*y20*y21 - y26*y31*y32,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, ERK1 + pERK1 + ppERK1, ERK2 + pERK2 + ppERK2, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, First_ERK1_phosphorylation_by_ppMEK, First_ERK2_phosphorylation_by_ppMEK, First_ERK_dephosphorylation, First_MEK1_phosphorylation_by_pRaf, First_MEK2_phosphorylation_by_pRaf, First_MEK_dephosphorylation, JAK2, JAK2_phosphorylation_by_Epo, MEK1 + pMEK1 + ppMEK1, MEK2 + pMEK2 + ppMEK2, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, actSHP1, actSHP1_deactivation, mSHP1, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1]
new_system = 
[
-y1*y26 + y26*y29,
y1*y26 - y2*y26,
y2*y26 - y3*y26,
y3*y26 - y4*y26,
y4*y26 - y5*y26,
y5*y26 - y6*y26,
y6*y26 - y7*y26,
y7*y26 - y8*y26,
0,
0,
0,
-y12*y13*y32 + y27*y30*y31,
0,
0,
0,
0,
0,
0,
0,
-y11*y20*y21 + y27*y32*y33,
0,
0,
0,
-y24*y25*y30 + y27*y28,
0,
0,
y8*y26 - y27*y28,
0,
y24*y25*y30 - y26*y29,
y12*y13*y32 - y27*y30*y31,
0,
y11*y20*y21 - y27*y32*y33,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, ERK1 + pERK1 + ppERK1, ERK2 + pERK2 + ppERK2, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, First_ERK1_phosphorylation_by_ppMEK, First_ERK2_phosphorylation_by_ppMEK, First_ERK_dephosphorylation, First_MEK1_phosphorylation_by_pRaf, First_MEK2_phosphorylation_by_pRaf, First_MEK_dephosphorylation, JAK2, JAK2_phosphorylation_by_Epo, MEK1 + pMEK1 + ppMEK1, MEK2 + pMEK2 + ppMEK2, Raf + pRaf, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, actSHP1, actSHP1_deactivation, mSHP1, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1]
new_system = 
[
-y1*y27 + y27*y30,
y1*y27 - y2*y27,
y2*y27 - y3*y27,
y3*y27 - y4*y27,
y4*y27 - y5*y27,
y5*y27 - y6*y27,
y6*y27 - y7*y27,
y7*y27 - y8*y27,
0,
0,
0,
-y12*y13*y33 + y28*y31*y32,
0,
0,
0,
0,
0,
0,
0,
-y11*y20*y21 + y28*y33*y34,
0,
0,
0,
0,
-y25*y26*y31 + y28*y29,
0,
0,
y8*y27 - y28*y29,
0,
y25*y26*y31 - y27*y30,
y12*y13*y33 - y28*y31*y32,
0,
y11*y20*y21 - y28*y33*y34,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, ERK1 + pERK1 + ppERK1, ERK2 + pERK2 + ppERK2, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, First_ERK1_phosphorylation_by_ppMEK, First_ERK2_phosphorylation_by_ppMEK, First_ERK_dephosphorylation, First_MEK1_phosphorylation_by_pRaf, First_MEK2_phosphorylation_by_pRaf, First_MEK_dephosphorylation, JAK2, JAK2_phosphorylation_by_Epo, MEK1 + pMEK1 + ppMEK1, MEK2 + pMEK2 + ppMEK2, Raf + pRaf, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, SOS + mSOS + pSOS, actSHP1, actSHP1_deactivation, mSHP1, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1]
new_system = 
[
-y1*y27 + y27*y31,
y1*y27 - y2*y27,
y2*y27 - y3*y27,
y3*y27 - y4*y27,
y4*y27 - y5*y27,
y5*y27 - y6*y27,
y6*y27 - y7*y27,
y7*y27 - y8*y27,
0,
0,
0,
-y12*y13*y34 + y29*y32*y33,
0,
0,
0,
0,
0,
0,
0,
-y11*y20*y21 + y29*y34*y35,
0,
0,
0,
0,
-y25*y26*y32 + y29*y30,
0,
0,
0,
y8*y27 - y29*y30,
0,
y25*y26*y32 - y27*y31,
y12*y13*y34 - y29*y32*y33,
0,
y11*y20*y21 - y29*y34*y35,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, ERK1 + pERK1 + ppERK1, ERK2 + pERK2 + ppERK2, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, First_ERK1_phosphorylation_by_ppMEK, First_ERK2_phosphorylation_by_ppMEK, First_ERK_dephosphorylation, First_MEK1_phosphorylation_by_pRaf, First_MEK2_phosphorylation_by_pRaf, First_MEK_dephosphorylation, JAK2, JAK2_phosphorylation_by_Epo, MEK1 + pMEK1 + ppMEK1, MEK2 + pMEK2 + ppMEK2, Raf + pRaf, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, SOS + mSOS + pSOS, SOS_recruitment_by_pEpoR, actSHP1, actSHP1_deactivation, mSHP1, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1]
new_system = 
[
-y1*y27 + y27*y32,
y1*y27 - y2*y27,
y2*y27 - y3*y27,
y3*y27 - y4*y27,
y4*y27 - y5*y27,
y5*y27 - y6*y27,
y6*y27 - y7*y27,
y7*y27 - y8*y27,
0,
0,
0,
-y12*y13*y35 + y30*y33*y34,
0,
0,
0,
0,
0,
0,
0,
-y11*y20*y21 + y30*y35*y36,
0,
0,
0,
0,
-y25*y26*y33 + y30*y31,
0,
0,
0,
0,
y8*y27 - y30*y31,
0,
y25*y26*y33 - y27*y32,
y12*y13*y35 - y30*y33*y34,
0,
y11*y20*y21 - y30*y35*y36,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, ERK1 + pERK1 + ppERK1, ERK2 + pERK2 + ppERK2, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, First_ERK1_phosphorylation_by_ppMEK, First_ERK2_phosphorylation_by_ppMEK, First_ERK_dephosphorylation, First_MEK1_phosphorylation_by_pRaf, First_MEK2_phosphorylation_by_pRaf, First_MEK_dephosphorylation, JAK2, JAK2_phosphorylation_by_Epo, MEK1 + pMEK1 + ppMEK1, MEK2 + pMEK2 + ppMEK2, Raf + pRaf, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, SOS + mSOS + pSOS, SOS_recruitment_by_pEpoR, Second_ERK1_phosphorylation_by_ppMEK, actSHP1, actSHP1_deactivation, mSHP1, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1]
new_system = 
[
-y1*y27 + y27*y33,
y1*y27 - y2*y27,
y2*y27 - y3*y27,
y3*y27 - y4*y27,
y4*y27 - y5*y27,
y5*y27 - y6*y27,
y6*y27 - y7*y27,
y7*y27 - y8*y27,
0,
0,
0,
-y12*y13*y36 + y31*y34*y35,
0,
0,
0,
0,
0,
0,
0,
-y11*y20*y21 + y31*y36*y37,
0,
0,
0,
0,
-y25*y26*y34 + y31*y32,
0,
0,
0,
0,
0,
y8*y27 - y31*y32,
0,
y25*y26*y34 - y27*y33,
y12*y13*y36 - y31*y34*y35,
0,
y11*y20*y21 - y31*y36*y37,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, ERK1 + pERK1 + ppERK1, ERK2 + pERK2 + ppERK2, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, First_ERK1_phosphorylation_by_ppMEK, First_ERK2_phosphorylation_by_ppMEK, First_ERK_dephosphorylation, First_MEK1_phosphorylation_by_pRaf, First_MEK2_phosphorylation_by_pRaf, First_MEK_dephosphorylation, JAK2, JAK2_phosphorylation_by_Epo, MEK1 + pMEK1 + ppMEK1, MEK2 + pMEK2 + ppMEK2, Raf + pRaf, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, SOS + mSOS + pSOS, SOS_recruitment_by_pEpoR, Second_ERK1_phosphorylation_by_ppMEK, Second_ERK2_phosphorylation_by_ppMEK, actSHP1, actSHP1_deactivation, mSHP1, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1]
new_system = 
[
-y1*y27 + y27*y34,
y1*y27 - y2*y27,
y2*y27 - y3*y27,
y3*y27 - y4*y27,
y4*y27 - y5*y27,
y5*y27 - y6*y27,
y6*y27 - y7*y27,
y7*y27 - y8*y27,
0,
0,
0,
-y12*y13*y37 + y32*y35*y36,
0,
0,
0,
0,
0,
0,
0,
-y11*y20*y21 + y32*y37*y38,
0,
0,
0,
0,
-y25*y26*y35 + y32*y33,
0,
0,
0,
0,
0,
0,
y8*y27 - y32*y33,
0,
y25*y26*y35 - y27*y34,
y12*y13*y37 - y32*y35*y36,
0,
y11*y20*y21 - y32*y37*y38,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, ERK1 + pERK1 + ppERK1, ERK2 + pERK2 + ppERK2, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, First_ERK1_phosphorylation_by_ppMEK, First_ERK2_phosphorylation_by_ppMEK, First_ERK_dephosphorylation, First_MEK1_phosphorylation_by_pRaf, First_MEK2_phosphorylation_by_pRaf, First_MEK_dephosphorylation, JAK2, JAK2_phosphorylation_by_Epo, MEK1 + pMEK1 + ppMEK1, MEK2 + pMEK2 + ppMEK2, Raf + pRaf, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, SOS + mSOS + pSOS, SOS_recruitment_by_pEpoR, Second_ERK1_phosphorylation_by_ppMEK, Second_ERK2_phosphorylation_by_ppMEK, Second_ERK_dephosphorylation, actSHP1, actSHP1_deactivation, mSHP1, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1]
new_system = 
[
-y1*y27 + y27*y35,
y1*y27 - y2*y27,
y2*y27 - y3*y27,
y3*y27 - y4*y27,
y4*y27 - y5*y27,
y5*y27 - y6*y27,
y6*y27 - y7*y27,
y7*y27 - y8*y27,
0,
0,
0,
-y12*y13*y38 + y33*y36*y37,
0,
0,
0,
0,
0,
0,
0,
-y11*y20*y21 + y33*y38*y39,
0,
0,
0,
0,
-y25*y26*y36 + y33*y34,
0,
0,
0,
0,
0,
0,
0,
y8*y27 - y33*y34,
0,
y25*y26*y36 - y27*y35,
y12*y13*y38 - y33*y36*y37,
0,
y11*y20*y21 - y33*y38*y39,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, ERK1 + pERK1 + ppERK1, ERK2 + pERK2 + ppERK2, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, First_ERK1_phosphorylation_by_ppMEK, First_ERK2_phosphorylation_by_ppMEK, First_ERK_dephosphorylation, First_MEK1_phosphorylation_by_pRaf, First_MEK2_phosphorylation_by_pRaf, First_MEK_dephosphorylation, JAK2, JAK2_phosphorylation_by_Epo, MEK1 + pMEK1 + ppMEK1, MEK2 + pMEK2 + ppMEK2, Raf + pRaf, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, SOS + mSOS + pSOS, SOS_recruitment_by_pEpoR, Second_ERK1_phosphorylation_by_ppMEK, Second_ERK2_phosphorylation_by_ppMEK, Second_ERK_dephosphorylation, Second_MEK1_phosphorylation_by_pRaf, actSHP1, actSHP1_deactivation, mSHP1, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1]
new_system = 
[
-y1*y27 + y27*y36,
y1*y27 - y2*y27,
y2*y27 - y3*y27,
y3*y27 - y4*y27,
y4*y27 - y5*y27,
y5*y27 - y6*y27,
y6*y27 - y7*y27,
y7*y27 - y8*y27,
0,
0,
0,
-y12*y13*y39 + y34*y37*y38,
0,
0,
0,
0,
0,
0,
0,
-y11*y20*y21 + y34*y39*y40,
0,
0,
0,
0,
-y25*y26*y37 + y34*y35,
0,
0,
0,
0,
0,
0,
0,
0,
y8*y27 - y34*y35,
0,
y25*y26*y37 - y27*y36,
y12*y13*y39 - y34*y37*y38,
0,
y11*y20*y21 - y34*y39*y40,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, ERK1 + pERK1 + ppERK1, ERK2 + pERK2 + ppERK2, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, First_ERK1_phosphorylation_by_ppMEK, First_ERK2_phosphorylation_by_ppMEK, First_ERK_dephosphorylation, First_MEK1_phosphorylation_by_pRaf, First_MEK2_phosphorylation_by_pRaf, First_MEK_dephosphorylation, JAK2, JAK2_phosphorylation_by_Epo, MEK1 + pMEK1 + ppMEK1, MEK2 + pMEK2 + ppMEK2, Raf + pRaf, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, SOS + mSOS + pSOS, SOS_recruitment_by_pEpoR, Second_ERK1_phosphorylation_by_ppMEK, Second_ERK2_phosphorylation_by_ppMEK, Second_ERK_dephosphorylation, Second_MEK1_phosphorylation_by_pRaf, Second_MEK2_phosphorylation_by_pRaf, actSHP1, actSHP1_deactivation, mSHP1, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1]
new_system = 
[
-y1*y27 + y27*y37,
y1*y27 - y2*y27,
y2*y27 - y3*y27,
y3*y27 - y4*y27,
y4*y27 - y5*y27,
y5*y27 - y6*y27,
y6*y27 - y7*y27,
y7*y27 - y8*y27,
0,
0,
0,
-y12*y13*y40 + y35*y38*y39,
0,
0,
0,
0,
0,
0,
0,
-y11*y20*y21 + y35*y40*y41,
0,
0,
0,
0,
-y25*y26*y38 + y35*y36,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y8*y27 - y35*y36,
0,
y25*y26*y38 - y27*y37,
y12*y13*y40 - y35*y38*y39,
0,
y11*y20*y21 - y35*y40*y41,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, ERK1 + pERK1 + ppERK1, ERK2 + pERK2 + ppERK2, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, First_ERK1_phosphorylation_by_ppMEK, First_ERK2_phosphorylation_by_ppMEK, First_ERK_dephosphorylation, First_MEK1_phosphorylation_by_pRaf, First_MEK2_phosphorylation_by_pRaf, First_MEK_dephosphorylation, JAK2, JAK2_phosphorylation_by_Epo, MEK1 + pMEK1 + ppMEK1, MEK2 + pMEK2 + ppMEK2, Raf + pRaf, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, SOS + mSOS + pSOS, SOS_recruitment_by_pEpoR, Second_ERK1_phosphorylation_by_ppMEK, Second_ERK2_phosphorylation_by_ppMEK, Second_ERK_dephosphorylation, Second_MEK1_phosphorylation_by_pRaf, Second_MEK2_phosphorylation_by_pRaf, Second_MEK_dephosphorylation, actSHP1, actSHP1_deactivation, mSHP1, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1]
new_system = 
[
-y1*y27 + y27*y38,
y1*y27 - y2*y27,
y2*y27 - y3*y27,
y3*y27 - y4*y27,
y4*y27 - y5*y27,
y5*y27 - y6*y27,
y6*y27 - y7*y27,
y7*y27 - y8*y27,
0,
0,
0,
-y12*y13*y41 + y36*y39*y40,
0,
0,
0,
0,
0,
0,
0,
-y11*y20*y21 + y36*y41*y42,
0,
0,
0,
0,
-y25*y26*y39 + y36*y37,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y8*y27 - y36*y37,
0,
y25*y26*y39 - y27*y38,
y12*y13*y41 - y36*y39*y40,
0,
y11*y20*y21 - y36*y41*y42,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, ERK1 + pERK1 + ppERK1, ERK2 + pERK2 + ppERK2, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, First_ERK1_phosphorylation_by_ppMEK, First_ERK2_phosphorylation_by_ppMEK, First_ERK_dephosphorylation, First_MEK1_phosphorylation_by_pRaf, First_MEK2_phosphorylation_by_pRaf, First_MEK_dephosphorylation, JAK2, JAK2_phosphorylation_by_Epo, MEK1 + pMEK1 + ppMEK1, MEK2 + pMEK2 + ppMEK2, Raf + pRaf, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, SOS + mSOS + pSOS, SOS_recruitment_by_pEpoR, Second_ERK1_phosphorylation_by_ppMEK, Second_ERK2_phosphorylation_by_ppMEK, Second_ERK_dephosphorylation, Second_MEK1_phosphorylation_by_pRaf, Second_MEK2_phosphorylation_by_pRaf, Second_MEK_dephosphorylation, actSHP1, actSHP1_deactivation, mSHP1, mSOS_induced_Raf_phosphorylation, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1]
new_system = 
[
-y1*y27 + y27*y38,
y1*y27 - y2*y27,
y2*y27 - y3*y27,
y3*y27 - y4*y27,
y4*y27 - y5*y27,
y5*y27 - y6*y27,
y6*y27 - y7*y27,
y7*y27 - y8*y27,
0,
0,
0,
-y12*y13*y42 + y36*y40*y41,
0,
0,
0,
0,
0,
0,
0,
-y11*y20*y21 + y36*y42*y43,
0,
0,
0,
0,
-y25*y26*y40 + y36*y37,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y8*y27 - y36*y37,
0,
y25*y26*y40 - y27*y38,
0,
y12*y13*y42 - y36*y40*y41,
0,
y11*y20*y21 - y36*y42*y43,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, ERK1 + pERK1 + ppERK1, ERK2 + pERK2 + ppERK2, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, First_ERK1_phosphorylation_by_ppMEK, First_ERK2_phosphorylation_by_ppMEK, First_ERK_dephosphorylation, First_MEK1_phosphorylation_by_pRaf, First_MEK2_phosphorylation_by_pRaf, First_MEK_dephosphorylation, JAK2, JAK2_phosphorylation_by_Epo, MEK1 + pMEK1 + ppMEK1, MEK2 + pMEK2 + ppMEK2, Raf + pRaf, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, SOS + mSOS + pSOS, SOS_recruitment_by_pEpoR, Second_ERK1_phosphorylation_by_ppMEK, Second_ERK2_phosphorylation_by_ppMEK, Second_ERK_dephosphorylation, Second_MEK1_phosphorylation_by_pRaf, Second_MEK2_phosphorylation_by_pRaf, Second_MEK_dephosphorylation, actSHP1, actSHP1_deactivation, mSHP1, mSOS_induced_Raf_phosphorylation, mSOS_release_from_membrane, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1]
new_system = 
[
-y1*y27 + y27*y38,
y1*y27 - y2*y27,
y2*y27 - y3*y27,
y3*y27 - y4*y27,
y4*y27 - y5*y27,
y5*y27 - y6*y27,
y6*y27 - y7*y27,
y7*y27 - y8*y27,
0,
0,
0,
-y12*y13*y43 + y36*y41*y42,
0,
0,
0,
0,
0,
0,
0,
-y11*y20*y21 + y36*y43*y44,
0,
0,
0,
0,
-y25*y26*y41 + y36*y37,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y8*y27 - y36*y37,
0,
y25*y26*y41 - y27*y38,
0,
0,
y12*y13*y43 - y36*y41*y42,
0,
y11*y20*y21 - y36*y43*y44,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, ERK1 + pERK1 + ppERK1, ERK2 + pERK2 + ppERK2, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, First_ERK1_phosphorylation_by_ppMEK, First_ERK2_phosphorylation_by_ppMEK, First_ERK_dephosphorylation, First_MEK1_phosphorylation_by_pRaf, First_MEK2_phosphorylation_by_pRaf, First_MEK_dephosphorylation, JAK2, JAK2_phosphorylation_by_Epo, MEK1 + pMEK1 + ppMEK1, MEK2 + pMEK2 + ppMEK2, Raf + pRaf, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, SOS + mSOS + pSOS, SOS_recruitment_by_pEpoR, Second_ERK1_phosphorylation_by_ppMEK, Second_ERK2_phosphorylation_by_ppMEK, Second_ERK_dephosphorylation, Second_MEK1_phosphorylation_by_pRaf, Second_MEK2_phosphorylation_by_pRaf, Second_MEK_dephosphorylation, actSHP1, actSHP1_deactivation, mSHP1, mSOS_induced_Raf_phosphorylation, mSOS_release_from_membrane, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1, pRaf_dephosphorylation]
new_system = 
[
-y1*y27 + y27*y38,
y1*y27 - y2*y27,
y2*y27 - y3*y27,
y3*y27 - y4*y27,
y4*y27 - y5*y27,
y5*y27 - y6*y27,
y6*y27 - y7*y27,
y7*y27 - y8*y27,
0,
0,
0,
-y12*y13*y43 + y36*y41*y42,
0,
0,
0,
0,
0,
0,
0,
-y11*y20*y21 + y36*y43*y44,
0,
0,
0,
0,
-y25*y26*y41 + y36*y37,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y8*y27 - y36*y37,
0,
y25*y26*y41 - y27*y38,
0,
0,
y12*y13*y43 - y36*y41*y42,
0,
y11*y20*y21 - y36*y43*y44,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, ERK1 + pERK1 + ppERK1, ERK2 + pERK2 + ppERK2, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, First_ERK1_phosphorylation_by_ppMEK, First_ERK2_phosphorylation_by_ppMEK, First_ERK_dephosphorylation, First_MEK1_phosphorylation_by_pRaf, First_MEK2_phosphorylation_by_pRaf, First_MEK_dephosphorylation, JAK2, JAK2_phosphorylation_by_Epo, MEK1 + pMEK1 + ppMEK1, MEK2 + pMEK2 + ppMEK2, Raf + pRaf, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, SOS + mSOS + pSOS, SOS_recruitment_by_pEpoR, Second_ERK1_phosphorylation_by_ppMEK, Second_ERK2_phosphorylation_by_ppMEK, Second_ERK_dephosphorylation, Second_MEK1_phosphorylation_by_pRaf, Second_MEK2_phosphorylation_by_pRaf, Second_MEK_dephosphorylation, actSHP1, actSHP1_deactivation, mSHP1, mSOS_induced_Raf_phosphorylation, mSOS_release_from_membrane, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1, pRaf_dephosphorylation, pSOS_dephosphorylation]
new_system = 
[
-y1*y27 + y27*y38,
y1*y27 - y2*y27,
y2*y27 - y3*y27,
y3*y27 - y4*y27,
y4*y27 - y5*y27,
y5*y27 - y6*y27,
y6*y27 - y7*y27,
y7*y27 - y8*y27,
0,
0,
0,
-y12*y13*y43 + y36*y41*y42,
0,
0,
0,
0,
0,
0,
0,
-y11*y20*y21 + y36*y43*y44,
0,
0,
0,
0,
-y25*y26*y41 + y36*y37,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y8*y27 - y36*y37,
0,
y25*y26*y41 - y27*y38,
0,
0,
y12*y13*y43 - y36*y41*y42,
0,
y11*y20*y21 - y36*y43*y44,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Delay01_mSHP1, Delay02_mSHP1, Delay03_mSHP1, Delay04_mSHP1, Delay05_mSHP1, Delay06_mSHP1, Delay07_mSHP1, Delay08_mSHP1, ERK1 + pERK1 + ppERK1, ERK2 + pERK2 + ppERK2, Epo, EpoR, EpoR_phosphorylation_by_pJAK2, First_ERK1_phosphorylation_by_ppMEK, First_ERK2_phosphorylation_by_ppMEK, First_ERK_dephosphorylation, First_MEK1_phosphorylation_by_pRaf, First_MEK2_phosphorylation_by_pRaf, First_MEK_dephosphorylation, JAK2, JAK2_phosphorylation_by_Epo, MEK1 + pMEK1 + ppMEK1, MEK2 + pMEK2 + ppMEK2, Raf + pRaf, SHP1, SHP1_activation_by_pEpoR, SHP1_delay, SOS + mSOS + pSOS, SOS_recruitment_by_pEpoR, Second_ERK1_phosphorylation_by_ppMEK, Second_ERK2_phosphorylation_by_ppMEK, Second_ERK_dephosphorylation, Second_MEK1_phosphorylation_by_pRaf, Second_MEK2_phosphorylation_by_pRaf, Second_MEK_dephosphorylation, actSHP1, actSHP1_deactivation, mSHP1, mSOS_induced_Raf_phosphorylation, mSOS_release_from_membrane, pEpoR, pEpoR_dephosphorylation_by_actSHP1, pJAK2, pJAK2_dephosphorylation_by_actSHP1, pRaf_dephosphorylation, pSOS_dephosphorylation, ppERK_neg_feedback_on_mSOS]
new_system = 
[
-y1*y27 + y27*y38,
y1*y27 - y2*y27,
y2*y27 - y3*y27,
y3*y27 - y4*y27,
y4*y27 - y5*y27,
y5*y27 - y6*y27,
y6*y27 - y7*y27,
y7*y27 - y8*y27,
0,
0,
0,
-y12*y13*y43 + y36*y41*y42,
0,
0,
0,
0,
0,
0,
0,
-y11*y20*y21 + y36*y43*y44,
0,
0,
0,
0,
-y25*y26*y41 + y36*y37,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y8*y27 - y36*y37,
0,
y25*y26*y41 - y27*y38,
0,
0,
y12*y13*y43 - y36*y41*y42,
0,
y11*y20*y21 - y36*y43*y44,
0,
0,
0,
0
]


