Original system:

[
kbinARFMdm2 => 0,
IR => 0,
kbinMdm2p53 => 0,
kdam => 0,
kdegARF => 0,
Mdm2 => Mdm2_mRNA*ksynMdm2 + Mdm2_p53*kdegp53*kproteff + Mdm2_p53*krelMdm2p53,
kactARF => 0,
Source => 0,
kproteff => 0,
ARF => ARF_Mdm2*kdegARFMdm2*kproteff + damDNA*kactARF,
totdamDNA => IR*kdam*source,
ksynp53 => 0,
source => 0,
damDNA => IR*kdam*source,
kdegMdm2 => 0,
ksynMdm2 => 0,
krepair => 0,
kdegMdm2mRNA => 0,
Mdm2mRNAsyn => ksynMdm2mRNA*p53,
Mdm2_mRNA => ksynMdm2mRNA*p53,
ksynMdm2mRNA => 0,
krelMdm2p53 => 0,
kdegARFMdm2 => 0,
mdm2deg => ARF_Mdm2*kdegARFMdm2*kproteff + Mdm2*kdegMdm2*kproteff,
p53 => Mdm2_p53*krelMdm2p53 + Source*ksynp53,
Mdm2mRNAdeg => Mdm2_mRNA*kdegMdm2mRNA,
ARF_Mdm2 => ARF*Mdm2*kbinARFMdm2,
kdegp53 => 0,
p53syn => Source*ksynp53,
Mdm2_p53 => Mdm2*kbinMdm2p53*p53,
mdm2syn => Mdm2_mRNA*ksynMdm2,
p53deg => Mdm2_p53*kdegp53*kproteff
]

Reductions:


new_vars = fmpq_mpoly[IR]
new_system = 
[
0
]


new_vars = fmpq_mpoly[IR, Source]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[IR, Source, kactARF]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[IR, Source, kactARF, kbinARFMdm2]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[IR, Source, kactARF, kbinARFMdm2, kbinMdm2p53]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[IR, Source, kactARF, kbinARFMdm2, kbinMdm2p53, kdam]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[IR, Source, kactARF, kbinARFMdm2, kbinMdm2p53, kdam, kdegARFMdm2]
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


new_vars = fmpq_mpoly[IR, Source, kactARF, kbinARFMdm2, kbinMdm2p53, kdam, kdegARFMdm2, kdegp53]
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


new_vars = fmpq_mpoly[IR, Source, kactARF, kbinARFMdm2, kbinMdm2p53, kdam, kdegARFMdm2, kdegp53, kproteff]
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


new_vars = fmpq_mpoly[IR, Source, kactARF, kbinARFMdm2, kbinMdm2p53, kdam, kdegARFMdm2, kdegp53, kproteff, krelMdm2p53]
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


new_vars = fmpq_mpoly[IR, Source, kactARF, kbinARFMdm2, kbinMdm2p53, kdam, kdegARFMdm2, kdegp53, kproteff, krelMdm2p53, ksynMdm2]
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


new_vars = fmpq_mpoly[IR, Source, kactARF, kbinARFMdm2, kbinMdm2p53, kdam, kdegARFMdm2, kdegp53, kproteff, krelMdm2p53, ksynMdm2, ksynMdm2mRNA]
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


new_vars = fmpq_mpoly[IR, Source, kactARF, kbinARFMdm2, kbinMdm2p53, kdam, kdegARFMdm2, kdegp53, kproteff, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp53]
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


new_vars = fmpq_mpoly[IR, Source, kactARF, kbinARFMdm2, kbinMdm2p53, kdam, kdegARFMdm2, kdegp53, kproteff, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp53, source]
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


new_vars = fmpq_mpoly[IR, Mdm2, Mdm2_mRNA, Mdm2_p53, Source, kactARF, kbinARFMdm2, kbinMdm2p53, kdam, kdegARFMdm2, kdegp53, kproteff, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp53, p53, source]
new_system = 
[
0,
y3*y14 + y4*y11*y12 + y4*y13,
y15*y17,
y2*y8*y17,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y4*y13 + y5*y16,
0
]


new_vars = fmpq_mpoly[IR, Mdm2, Mdm2_mRNA, Mdm2_p53, Source, damDNA, kactARF, kbinARFMdm2, kbinMdm2p53, kdam, kdegARFMdm2, kdegp53, kproteff, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp53, p53, source]
new_system = 
[
0,
y3*y15 + y4*y12*y13 + y4*y14,
y16*y18,
y2*y9*y18,
0,
y1*y10*y19,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y4*y14 + y5*y17,
0
]


new_vars = fmpq_mpoly[ARF, ARF_Mdm2, IR, Mdm2, Mdm2_mRNA, Mdm2_p53, Source, damDNA, kactARF, kbinARFMdm2, kbinMdm2p53, kdam, kdegARFMdm2, kdegp53, kproteff, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp53, p53, source]
new_system = 
[
y2*y13*y15 + y8*y9,
y1*y4*y10,
0,
y5*y17 + y6*y14*y15 + y6*y16,
y18*y20,
y4*y11*y20,
0,
y3*y12*y21,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y6*y16 + y7*y19,
0
]


new_vars = fmpq_mpoly[ARF, ARF_Mdm2, IR, Mdm2, Mdm2_mRNA, Mdm2_p53, Source, damDNA, kactARF, kbinARFMdm2, kbinMdm2p53, kdam, kdegARFMdm2, kdegMdm2mRNA, kdegp53, kproteff, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp53, p53, source]
new_system = 
[
y2*y13*y16 + y8*y9,
y1*y4*y10,
0,
y5*y18 + y6*y15*y16 + y6*y17,
y19*y21,
y4*y11*y21,
0,
y3*y12*y22,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y6*y17 + y7*y20,
0
]


new_vars = fmpq_mpoly[ARF, ARF_Mdm2, IR, Mdm2, Mdm2_mRNA, Mdm2_p53, Mdm2mRNAdeg, Source, damDNA, kactARF, kbinARFMdm2, kbinMdm2p53, kdam, kdegARFMdm2, kdegMdm2mRNA, kdegp53, kproteff, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp53, p53, source]
new_system = 
[
y2*y14*y17 + y9*y10,
y1*y4*y11,
0,
y5*y19 + y6*y16*y17 + y6*y18,
y20*y22,
y4*y12*y22,
y5*y15,
0,
y3*y13*y23,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y6*y18 + y8*y21,
0
]


new_vars = fmpq_mpoly[ARF, ARF_Mdm2, IR, Mdm2, Mdm2_mRNA, Mdm2_p53, Mdm2mRNAdeg, Mdm2mRNAsyn, Source, damDNA, kactARF, kbinARFMdm2, kbinMdm2p53, kdam, kdegARFMdm2, kdegMdm2mRNA, kdegp53, kproteff, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp53, p53, source]
new_system = 
[
y2*y15*y18 + y10*y11,
y1*y4*y12,
0,
y5*y20 + y6*y17*y18 + y6*y19,
y21*y23,
y4*y13*y23,
y5*y16,
y21*y23,
0,
y3*y14*y24,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y6*y19 + y9*y22,
0
]


new_vars = fmpq_mpoly[ARF, ARF_Mdm2, IR, Mdm2, Mdm2_mRNA, Mdm2_p53, Mdm2mRNAdeg, Mdm2mRNAsyn, Source, damDNA, kactARF, kbinARFMdm2, kbinMdm2p53, kdam, kdegARF, kdegARFMdm2, kdegMdm2mRNA, kdegp53, kproteff, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp53, p53, source]
new_system = 
[
y2*y16*y19 + y10*y11,
y1*y4*y12,
0,
y5*y21 + y6*y18*y19 + y6*y20,
y22*y24,
y4*y13*y24,
y5*y17,
y22*y24,
0,
y3*y14*y25,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y6*y20 + y9*y23,
0
]


new_vars = fmpq_mpoly[ARF, ARF_Mdm2, IR, Mdm2, Mdm2_mRNA, Mdm2_p53, Mdm2mRNAdeg, Mdm2mRNAsyn, Source, damDNA, kactARF, kbinARFMdm2, kbinMdm2p53, kdam, kdegARF, kdegARFMdm2, kdegMdm2, kdegMdm2mRNA, kdegp53, kproteff, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp53, p53, source]
new_system = 
[
y2*y16*y20 + y10*y11,
y1*y4*y12,
0,
y5*y22 + y6*y19*y20 + y6*y21,
y23*y25,
y4*y13*y25,
y5*y18,
y23*y25,
0,
y3*y14*y26,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y6*y21 + y9*y24,
0
]


new_vars = fmpq_mpoly[ARF, ARF_Mdm2, IR, Mdm2, Mdm2_mRNA, Mdm2_p53, Mdm2mRNAdeg, Mdm2mRNAsyn, Source, damDNA, kactARF, kbinARFMdm2, kbinMdm2p53, kdam, kdegARF, kdegARFMdm2, kdegMdm2, kdegMdm2mRNA, kdegp53, kproteff, krelMdm2p53, krepair, ksynMdm2, ksynMdm2mRNA, ksynp53, p53, source]
new_system = 
[
y2*y16*y20 + y10*y11,
y1*y4*y12,
0,
y5*y23 + y6*y19*y20 + y6*y21,
y24*y26,
y4*y13*y26,
y5*y18,
y24*y26,
0,
y3*y14*y27,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y6*y21 + y9*y25,
0
]


new_vars = fmpq_mpoly[ARF, ARF_Mdm2, IR, Mdm2, Mdm2_mRNA, Mdm2_p53, Mdm2mRNAdeg, Mdm2mRNAsyn, Source, damDNA, kactARF, kbinARFMdm2, kbinMdm2p53, kdam, kdegARF, kdegARFMdm2, kdegMdm2, kdegMdm2mRNA, kdegp53, kproteff, krelMdm2p53, krepair, ksynMdm2, ksynMdm2mRNA, ksynp53, mdm2deg, p53, source]
new_system = 
[
y2*y16*y20 + y10*y11,
y1*y4*y12,
0,
y5*y23 + y6*y19*y20 + y6*y21,
y24*y27,
y4*y13*y27,
y5*y18,
y24*y27,
0,
y3*y14*y28,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y2*y16*y20 + y4*y17*y20,
y6*y21 + y9*y25,
0
]


new_vars = fmpq_mpoly[ARF, ARF_Mdm2, IR, Mdm2, Mdm2_mRNA, Mdm2_p53, Mdm2mRNAdeg, Mdm2mRNAsyn, Source, damDNA, kactARF, kbinARFMdm2, kbinMdm2p53, kdam, kdegARF, kdegARFMdm2, kdegMdm2, kdegMdm2mRNA, kdegp53, kproteff, krelMdm2p53, krepair, ksynMdm2, ksynMdm2mRNA, ksynp53, mdm2deg, mdm2syn, p53, source]
new_system = 
[
y2*y16*y20 + y10*y11,
y1*y4*y12,
0,
y5*y23 + y6*y19*y20 + y6*y21,
y24*y28,
y4*y13*y28,
y5*y18,
y24*y28,
0,
y3*y14*y29,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y2*y16*y20 + y4*y17*y20,
y5*y23,
y6*y21 + y9*y25,
0
]


new_vars = fmpq_mpoly[ARF, ARF_Mdm2, IR, Mdm2, Mdm2_mRNA, Mdm2_p53, Mdm2mRNAdeg, Mdm2mRNAsyn, Source, damDNA, kactARF, kbinARFMdm2, kbinMdm2p53, kdam, kdegARF, kdegARFMdm2, kdegMdm2, kdegMdm2mRNA, kdegp53, kproteff, krelMdm2p53, krepair, ksynMdm2, ksynMdm2mRNA, ksynp53, mdm2deg, mdm2syn, p53, p53deg, source]
new_system = 
[
y2*y16*y20 + y10*y11,
y1*y4*y12,
0,
y5*y23 + y6*y19*y20 + y6*y21,
y24*y28,
y4*y13*y28,
y5*y18,
y24*y28,
0,
y3*y14*y30,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y2*y16*y20 + y4*y17*y20,
y5*y23,
y6*y21 + y9*y25,
y6*y19*y20,
0
]


new_vars = fmpq_mpoly[ARF, ARF_Mdm2, IR, Mdm2, Mdm2_mRNA, Mdm2_p53, Mdm2mRNAdeg, Mdm2mRNAsyn, Source, damDNA, kactARF, kbinARFMdm2, kbinMdm2p53, kdam, kdegARF, kdegARFMdm2, kdegMdm2, kdegMdm2mRNA, kdegp53, kproteff, krelMdm2p53, krepair, ksynMdm2, ksynMdm2mRNA, ksynp53, mdm2deg, mdm2syn, p53, p53deg, p53syn, source]
new_system = 
[
y2*y16*y20 + y10*y11,
y1*y4*y12,
0,
y5*y23 + y6*y19*y20 + y6*y21,
y24*y28,
y4*y13*y28,
y5*y18,
y24*y28,
0,
y3*y14*y31,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y2*y16*y20 + y4*y17*y20,
y5*y23,
y6*y21 + y9*y25,
y6*y19*y20,
y9*y25,
0
]


