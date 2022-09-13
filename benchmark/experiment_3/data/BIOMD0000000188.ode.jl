Original system:

[
damDNA => IR*kdam*source,
ATMA => ATMI*damDNA*kactATM,
p53_P => ATMA*kphosp53*p53,
kinactATM => 0,
p53_mRNA => Source*ksynp53mRNA,
ksynMdm2 => 0,
kproteff => 0,
kbinMdm2p53 => 0,
kphosp53 => 0,
kphosMdm2 => 0,
krelMdm2p53 => 0,
mdm2deg => Mdm2*kdegMdm2*kproteff + Mdm2_P*kdegATMMdm2,
Mdm2_P => ATMA*Mdm2*kphosMdm2,
IR => 0,
kactATM => 0,
ksynMdm2mRNA => 0,
ksynp53mRNA => 0,
kdephosMdm2 => 0,
kdegMdm2mRNA => 0,
Mdm2_p53 => Mdm2*kbinMdm2p53*p53,
Mdm2mRNAsyn => ksynMdm2mRNA*p53 + ksynMdm2mRNA*p53_P,
kdegATMMdm2 => 0,
source => 0,
Mdm2mRNAdeg => Mdm2_mRNA*kdegMdm2mRNA,
kdegMdm2 => 0,
Source => 0,
kdephosp53 => 0,
ksynp53 => 0,
krepair => 0,
kdegp53 => 0,
kdam => 0,
kdegp53mRNA => 0,
p53deg => Mdm2_p53*kdegp53*kproteff,
p53syn => ksynp53*p53_mRNA,
p53 => Mdm2_p53*krelMdm2p53 + kdephosp53*p53_P + ksynp53*p53_mRNA,
mdm2syn => Mdm2_mRNA*ksynMdm2,
ATMI => ATMA*kinactATM,
Mdm2 => Mdm2_P*kdephosMdm2 + Mdm2_mRNA*ksynMdm2 + Mdm2_p53*kdegp53*kproteff + Mdm2_p53*krelMdm2p53,
Mdm2_mRNA => ksynMdm2mRNA*p53 + ksynMdm2mRNA*p53_P
]

Reductions:


new_vars = fmpq_mpoly[IR]
new_system = 
[
0
]


new_vars = fmpq_mpoly[IR, kactATM]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[IR, kactATM, kdam]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[IR, kactATM, kdam, kinactATM]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[IR, kactATM, kdam, kinactATM, source]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[IR, damDNA, kactATM, kdam, kinactATM, source]
new_system = 
[
0,
y1*y4*y6,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[ATMA, ATMI, IR, damDNA, kactATM, kdam, kinactATM, source]
new_system = 
[
y2*y4*y5,
y1*y7,
0,
y3*y6*y8,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Source, damDNA, kactATM, kdam, kinactATM, source]
new_system = 
[
y2*y5*y6,
y1*y8,
0,
0,
y3*y7*y9,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Source, damDNA, kactATM, kbinMdm2p53, kdam, kinactATM, source]
new_system = 
[
y2*y5*y6,
y1*y9,
0,
0,
y3*y8*y10,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Source, damDNA, kactATM, kbinMdm2p53, kdam, kdegp53, kinactATM, source]
new_system = 
[
y2*y5*y6,
y1*y10,
0,
0,
y3*y8*y11,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Source, damDNA, kactATM, kbinMdm2p53, kdam, kdegp53, kdephosMdm2, kinactATM, source]
new_system = 
[
y2*y5*y6,
y1*y11,
0,
0,
y3*y8*y12,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Source, damDNA, kactATM, kbinMdm2p53, kdam, kdegp53, kdephosMdm2, kdephosp53, kinactATM, source]
new_system = 
[
y2*y5*y6,
y1*y12,
0,
0,
y3*y8*y13,
0,
0,
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Source, damDNA, kactATM, kbinMdm2p53, kdam, kdegp53, kdephosMdm2, kdephosp53, kinactATM, kphosMdm2, source]
new_system = 
[
y2*y5*y6,
y1*y12,
0,
0,
y3*y8*y14,
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


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Source, damDNA, kactATM, kbinMdm2p53, kdam, kdegp53, kdephosMdm2, kdephosp53, kinactATM, kphosMdm2, kphosp53, source]
new_system = 
[
y2*y5*y6,
y1*y12,
0,
0,
y3*y8*y15,
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


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Source, damDNA, kactATM, kbinMdm2p53, kdam, kdegp53, kdephosMdm2, kdephosp53, kinactATM, kphosMdm2, kphosp53, kproteff, source]
new_system = 
[
y2*y5*y6,
y1*y12,
0,
0,
y3*y8*y16,
0,
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


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Source, damDNA, kactATM, kbinMdm2p53, kdam, kdegp53, kdephosMdm2, kdephosp53, kinactATM, kphosMdm2, kphosp53, kproteff, krelMdm2p53, source]
new_system = 
[
y2*y5*y6,
y1*y12,
0,
0,
y3*y8*y17,
0,
0,
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


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Source, damDNA, kactATM, kbinMdm2p53, kdam, kdegp53, kdephosMdm2, kdephosp53, kinactATM, kphosMdm2, kphosp53, kproteff, krelMdm2p53, ksynMdm2, source]
new_system = 
[
y2*y5*y6,
y1*y12,
0,
0,
y3*y8*y18,
0,
0,
0,
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


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Source, damDNA, kactATM, kbinMdm2p53, kdam, kdegp53, kdephosMdm2, kdephosp53, kinactATM, kphosMdm2, kphosp53, kproteff, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, source]
new_system = 
[
y2*y5*y6,
y1*y12,
0,
0,
y3*y8*y19,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Source, damDNA, kactATM, kbinMdm2p53, kdam, kdegp53, kdephosMdm2, kdephosp53, kinactATM, kphosMdm2, kphosp53, kproteff, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp53, source]
new_system = 
[
y2*y5*y6,
y1*y12,
0,
0,
y3*y8*y20,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Source, damDNA, kactATM, kbinMdm2p53, kdam, kdegp53, kdephosMdm2, kdephosp53, kinactATM, kphosMdm2, kphosp53, kproteff, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp53, ksynp53mRNA, source]
new_system = 
[
y2*y5*y6,
y1*y12,
0,
0,
y3*y8*y21,
0,
0,
0,
0,
0,
0,
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


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Source, damDNA, kactATM, kbinMdm2p53, kdam, kdegp53, kdephosMdm2, kdephosp53, kinactATM, kphosMdm2, kphosp53, kproteff, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp53, ksynp53mRNA, p53_mRNA, source]
new_system = 
[
y2*y5*y6,
y1*y12,
0,
0,
y3*y8*y22,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y4*y20,
0
]


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Mdm2, Mdm2_P, Mdm2_mRNA, Mdm2_p53, Source, damDNA, kactATM, kbinMdm2p53, kdam, kdegp53, kdephosMdm2, kdephosp53, kinactATM, kphosMdm2, kphosp53, kproteff, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp53, ksynp53mRNA, p53, p53_P, p53_mRNA, source]
new_system = 
[
y2*y9*y10,
y1*y16,
0,
y5*y14 + y6*y21 + y7*y13*y19 + y7*y20,
y1*y4*y17,
y22*y25 + y22*y26,
y4*y11*y25,
0,
y3*y12*y28,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y7*y20 + y15*y26 + y23*y27,
y1*y18*y25,
y8*y24,
0
]


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Mdm2, Mdm2_P, Mdm2_mRNA, Mdm2_p53, Source, damDNA, kactATM, kbinMdm2p53, kdam, kdegMdm2mRNA, kdegp53, kdephosMdm2, kdephosp53, kinactATM, kphosMdm2, kphosp53, kproteff, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp53, ksynp53mRNA, p53, p53_P, p53_mRNA, source]
new_system = 
[
y2*y9*y10,
y1*y17,
0,
y5*y15 + y6*y22 + y7*y14*y20 + y7*y21,
y1*y4*y18,
y23*y26 + y23*y27,
y4*y11*y26,
0,
y3*y12*y29,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y7*y21 + y16*y27 + y24*y28,
y1*y19*y26,
y8*y25,
0
]


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Mdm2, Mdm2_P, Mdm2_mRNA, Mdm2_p53, Mdm2mRNAdeg, Source, damDNA, kactATM, kbinMdm2p53, kdam, kdegMdm2mRNA, kdegp53, kdephosMdm2, kdephosp53, kinactATM, kphosMdm2, kphosp53, kproteff, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp53, ksynp53mRNA, p53, p53_P, p53_mRNA, source]
new_system = 
[
y2*y10*y11,
y1*y18,
0,
y5*y16 + y6*y23 + y7*y15*y21 + y7*y22,
y1*y4*y19,
y24*y27 + y24*y28,
y4*y12*y27,
y6*y14,
0,
y3*y13*y30,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y7*y22 + y17*y28 + y25*y29,
y1*y20*y27,
y9*y26,
0
]


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Mdm2, Mdm2_P, Mdm2_mRNA, Mdm2_p53, Mdm2mRNAdeg, Mdm2mRNAsyn, Source, damDNA, kactATM, kbinMdm2p53, kdam, kdegMdm2mRNA, kdegp53, kdephosMdm2, kdephosp53, kinactATM, kphosMdm2, kphosp53, kproteff, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp53, ksynp53mRNA, p53, p53_P, p53_mRNA, source]
new_system = 
[
y2*y11*y12,
y1*y19,
0,
y5*y17 + y6*y24 + y7*y16*y22 + y7*y23,
y1*y4*y20,
y25*y28 + y25*y29,
y4*y13*y28,
y6*y15,
y25*y28 + y25*y29,
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
0,
y7*y23 + y18*y29 + y26*y30,
y1*y21*y28,
y10*y27,
0
]


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Mdm2, Mdm2_P, Mdm2_mRNA, Mdm2_p53, Mdm2mRNAdeg, Mdm2mRNAsyn, Source, damDNA, kactATM, kbinMdm2p53, kdam, kdegATMMdm2, kdegMdm2mRNA, kdegp53, kdephosMdm2, kdephosp53, kinactATM, kphosMdm2, kphosp53, kproteff, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp53, ksynp53mRNA, p53, p53_P, p53_mRNA, source]
new_system = 
[
y2*y11*y12,
y1*y20,
0,
y5*y18 + y6*y25 + y7*y17*y23 + y7*y24,
y1*y4*y21,
y26*y29 + y26*y30,
y4*y13*y29,
y6*y16,
y26*y29 + y26*y30,
0,
y3*y14*y32,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y7*y24 + y19*y30 + y27*y31,
y1*y22*y29,
y10*y28,
0
]


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Mdm2, Mdm2_P, Mdm2_mRNA, Mdm2_p53, Mdm2mRNAdeg, Mdm2mRNAsyn, Source, damDNA, kactATM, kbinMdm2p53, kdam, kdegATMMdm2, kdegMdm2, kdegMdm2mRNA, kdegp53, kdephosMdm2, kdephosp53, kinactATM, kphosMdm2, kphosp53, kproteff, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp53, ksynp53mRNA, p53, p53_P, p53_mRNA, source]
new_system = 
[
y2*y11*y12,
y1*y21,
0,
y5*y19 + y6*y26 + y7*y18*y24 + y7*y25,
y1*y4*y22,
y27*y30 + y27*y31,
y4*y13*y30,
y6*y17,
y27*y30 + y27*y31,
0,
y3*y14*y33,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y7*y25 + y20*y31 + y28*y32,
y1*y23*y30,
y10*y29,
0
]


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Mdm2, Mdm2_P, Mdm2_mRNA, Mdm2_p53, Mdm2mRNAdeg, Mdm2mRNAsyn, Source, damDNA, kactATM, kbinMdm2p53, kdam, kdegATMMdm2, kdegMdm2, kdegMdm2mRNA, kdegp53, kdegp53mRNA, kdephosMdm2, kdephosp53, kinactATM, kphosMdm2, kphosp53, kproteff, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp53, ksynp53mRNA, p53, p53_P, p53_mRNA, source]
new_system = 
[
y2*y11*y12,
y1*y22,
0,
y5*y20 + y6*y27 + y7*y18*y25 + y7*y26,
y1*y4*y23,
y28*y31 + y28*y32,
y4*y13*y31,
y6*y17,
y28*y31 + y28*y32,
0,
y3*y14*y34,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y7*y26 + y21*y32 + y29*y33,
y1*y24*y31,
y10*y30,
0
]


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Mdm2, Mdm2_P, Mdm2_mRNA, Mdm2_p53, Mdm2mRNAdeg, Mdm2mRNAsyn, Source, damDNA, kactATM, kbinMdm2p53, kdam, kdegATMMdm2, kdegMdm2, kdegMdm2mRNA, kdegp53, kdegp53mRNA, kdephosMdm2, kdephosp53, kinactATM, kphosMdm2, kphosp53, kproteff, krelMdm2p53, krepair, ksynMdm2, ksynMdm2mRNA, ksynp53, ksynp53mRNA, p53, p53_P, p53_mRNA, source]
new_system = 
[
y2*y11*y12,
y1*y22,
0,
y5*y20 + y6*y28 + y7*y18*y25 + y7*y26,
y1*y4*y23,
y29*y32 + y29*y33,
y4*y13*y32,
y6*y17,
y29*y32 + y29*y33,
0,
y3*y14*y35,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y7*y26 + y21*y33 + y30*y34,
y1*y24*y32,
y10*y31,
0
]


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Mdm2, Mdm2_P, Mdm2_mRNA, Mdm2_p53, Mdm2mRNAdeg, Mdm2mRNAsyn, Source, damDNA, kactATM, kbinMdm2p53, kdam, kdegATMMdm2, kdegMdm2, kdegMdm2mRNA, kdegp53, kdegp53mRNA, kdephosMdm2, kdephosp53, kinactATM, kphosMdm2, kphosp53, kproteff, krelMdm2p53, krepair, ksynMdm2, ksynMdm2mRNA, ksynp53, ksynp53mRNA, mdm2deg, p53, p53_P, p53_mRNA, source]
new_system = 
[
y2*y11*y12,
y1*y22,
0,
y5*y20 + y6*y28 + y7*y18*y25 + y7*y26,
y1*y4*y23,
y29*y33 + y29*y34,
y4*y13*y33,
y6*y17,
y29*y33 + y29*y34,
0,
y3*y14*y36,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y4*y16*y25 + y5*y15,
y7*y26 + y21*y34 + y30*y35,
y1*y24*y33,
y10*y31,
0
]


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Mdm2, Mdm2_P, Mdm2_mRNA, Mdm2_p53, Mdm2mRNAdeg, Mdm2mRNAsyn, Source, damDNA, kactATM, kbinMdm2p53, kdam, kdegATMMdm2, kdegMdm2, kdegMdm2mRNA, kdegp53, kdegp53mRNA, kdephosMdm2, kdephosp53, kinactATM, kphosMdm2, kphosp53, kproteff, krelMdm2p53, krepair, ksynMdm2, ksynMdm2mRNA, ksynp53, ksynp53mRNA, mdm2deg, mdm2syn, p53, p53_P, p53_mRNA, source]
new_system = 
[
y2*y11*y12,
y1*y22,
0,
y5*y20 + y6*y28 + y7*y18*y25 + y7*y26,
y1*y4*y23,
y29*y34 + y29*y35,
y4*y13*y34,
y6*y17,
y29*y34 + y29*y35,
0,
y3*y14*y37,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y4*y16*y25 + y5*y15,
y6*y28,
y7*y26 + y21*y35 + y30*y36,
y1*y24*y34,
y10*y31,
0
]


new_vars = fmpq_mpoly[ATMA, ATMI, IR, Mdm2, Mdm2_P, Mdm2_mRNA, Mdm2_p53, Mdm2mRNAdeg, Mdm2mRNAsyn, Source, damDNA, kactATM, kbinMdm2p53, kdam, kdegATMMdm2, kdegMdm2, kdegMdm2mRNA, kdegp53, kdegp53mRNA, kdephosMdm2, kdephosp53, kinactATM, kphosMdm2, kphosp53, kproteff, krelMdm2p53, krepair, ksynMdm2, ksynMdm2mRNA, ksynp53, ksynp53mRNA, mdm2deg, mdm2syn, p53, p53_P, p53_mRNA, p53deg, source]
new_system = 
[
y2*y11*y12,
y1*y22,
0,
y5*y20 + y6*y28 + y7*y18*y25 + y7*y26,
y1*y4*y23,
y29*y34 + y29*y35,
y4*y13*y34,
y6*y17,
y29*y34 + y29*y35,
0,
y3*y14*y38,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y4*y16*y25 + y5*y15,
y6*y28,
y7*y26 + y21*y35 + y30*y36,
y1*y24*y34,
y10*y31,
y7*y18*y25,
0
]


