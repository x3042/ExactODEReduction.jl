Original system:

[
kphosp38 => 0,
ATMA => ATMI*damDNA*kactATM,
p21step1 => ksynp21step1*p21_mRNA,
kdephosp38 => 0,
kdamROS => 0,
ksynp21mRNAp53 => 0,
kdegGADD45 => 0,
krelMdm2p53 => 0,
kgenROSp38 => 0,
kdamBasalROS => 0,
Mdm2_mRNA => ksynMdm2mRNA*p53 + ksynMdm2mRNA*p53_P,
ksynp53mRNA => 0,
damDNA => IR*kdam + ROS*kdamROS + basalROS*kdamBasalROS,
ksynp21step3 => 0,
kdegp53mRNA => 0,
kdegATMMdm2 => 0,
kdegp53 => 0,
ksynp21step1 => 0,
Source => 0,
p53_mRNA => Source*ksynp53mRNA,
kdegMdm2 => 0,
kp38ROS => 0,
p53 => Mdm2_p53*krelMdm2p53 + kdephosp53*p53_P + ksynp53*p53_mRNA,
ksynMdm2 => 0,
p21step2 => ksynp21step2*p21step1,
kactATM => 0,
IR => 0,
kphosMdm2 => 0,
ksynp53 => 0,
kdegMdm2mRNA => 0,
p53_P => ATMA*kphosp53*p53,
Mdm2_P => ATMA*Mdm2*kphosMdm2,
kbinMdm2p53 => 0,
kdephosMdm2 => 0,
ksynp21step2 => 0,
kdegp21 => 0,
ATMI => ATMA*kinactATM,
kremROS => 0,
kinactATM => 0,
krepair => 0,
ROS => kgenROSp38*kp38ROS*p38_P,
p21_mRNA => ksynp21mRNAp53*p53 + ksynp21mRNAp53P*p53_P,
kdam => 0,
kdegp21mRNA => 0,
kphosp53 => 0,
kGADD45 => 0,
basalROS => 0,
p21 => ksynp21step3*p21step2,
p38 => kdephosp38*p38_P,
GADD45 => kGADD45*p21,
Mdm2 => Mdm2_P*kdephosMdm2 + Mdm2_mRNA*ksynMdm2 + Mdm2_p53*kdegp53 + Mdm2_p53*krelMdm2p53,
ksynMdm2mRNA => 0,
p38_P => GADD45*kphosp38*p38,
kdegp53mdm2ind => 0,
Mdm2_p53 => Mdm2*kbinMdm2p53*p53,
kdephosp53 => 0,
ksynp21mRNAp53P => 0
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


new_vars = fmpq_mpoly[IR, Source, basalROS]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53, kdam]
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


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS]
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


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS]
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


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegp53]
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


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegp53, kdephosMdm2]
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


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegp53, kdephosMdm2, kdephosp38]
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


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegp53, kdephosMdm2, kdephosp38, kdephosp53]
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


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegp53, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38]
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


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegp53, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM]
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


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegp53, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS]
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


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegp53, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS, kphosMdm2]
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


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegp53, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS, kphosMdm2, kphosp38]
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


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegp53, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS, kphosMdm2, kphosp38, kphosp53]
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


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegp53, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS, kphosMdm2, kphosp38, kphosp53, krelMdm2p53]
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


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegp53, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS, kphosMdm2, kphosp38, kphosp53, krelMdm2p53, ksynMdm2]
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


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegp53, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS, kphosMdm2, kphosp38, kphosp53, krelMdm2p53, ksynMdm2, ksynMdm2mRNA]
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


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegp53, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS, kphosMdm2, kphosp38, kphosp53, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp21mRNAp53]
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


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegp53, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS, kphosMdm2, kphosp38, kphosp53, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp21mRNAp53, ksynp21mRNAp53P]
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


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegp53, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS, kphosMdm2, kphosp38, kphosp53, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp21mRNAp53, ksynp21mRNAp53P, ksynp21step1]
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


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegp53, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS, kphosMdm2, kphosp38, kphosp53, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp21mRNAp53, ksynp21mRNAp53P, ksynp21step1, ksynp21step2]
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


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegp53, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS, kphosMdm2, kphosp38, kphosp53, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp21mRNAp53, ksynp21mRNAp53P, ksynp21step1, ksynp21step2, ksynp21step3]
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


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegp53, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS, kphosMdm2, kphosp38, kphosp53, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp21mRNAp53, ksynp21mRNAp53P, ksynp21step1, ksynp21step2, ksynp21step3, ksynp53]
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


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegp53, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS, kphosMdm2, kphosp38, kphosp53, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp21mRNAp53, ksynp21mRNAp53P, ksynp21step1, ksynp21step2, ksynp21step3, ksynp53, ksynp53mRNA]
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


new_vars = fmpq_mpoly[IR, Source, basalROS, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegp53, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS, kphosMdm2, kphosp38, kphosp53, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp21mRNAp53, ksynp21mRNAp53P, ksynp21step1, ksynp21step2, ksynp21step3, ksynp53, ksynp53mRNA, p53_mRNA]
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
y2*y29
]


new_vars = fmpq_mpoly[ATMA, ATMI, GADD45, IR, Mdm2, Mdm2_P, Mdm2_mRNA, Mdm2_p53, ROS, Source, basalROS, damDNA, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegp53, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS, kphosMdm2, kphosp38, kphosp53, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp21mRNAp53, ksynp21mRNAp53P, ksynp21step1, ksynp21step2, ksynp21step3, ksynp53, ksynp53mRNA, p21, p21_mRNA, p21step1, p21step2, p38, p38_P, p53, p53_P, p53_mRNA]
new_system = 
[
y2*y12*y14,
y1*y24,
y13*y39,
0,
y6*y20 + y7*y30 + y8*y19 + y8*y29,
y1*y5*y26,
y31*y45 + y31*y46,
y5*y15*y45,
y23*y25*y44,
0,
0,
y4*y16 + y9*y18 + y11*y17,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y36*y42,
y32*y45 + y33*y46,
y34*y40,
y35*y41,
y21*y44,
y3*y27*y43,
y8*y29 + y22*y46 + y37*y47,
y1*y28*y45,
y10*y38
]


new_vars = fmpq_mpoly[ATMA, ATMI, GADD45, IR, Mdm2, Mdm2_P, Mdm2_mRNA, Mdm2_p53, ROS, Source, basalROS, damDNA, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegATMMdm2, kdegp53, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS, kphosMdm2, kphosp38, kphosp53, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp21mRNAp53, ksynp21mRNAp53P, ksynp21step1, ksynp21step2, ksynp21step3, ksynp53, ksynp53mRNA, p21, p21_mRNA, p21step1, p21step2, p38, p38_P, p53, p53_P, p53_mRNA]
new_system = 
[
y2*y12*y14,
y1*y25,
y13*y40,
0,
y6*y21 + y7*y31 + y8*y20 + y8*y30,
y1*y5*y27,
y32*y46 + y32*y47,
y5*y15*y46,
y24*y26*y45,
0,
0,
y4*y16 + y9*y18 + y11*y17,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y37*y43,
y33*y46 + y34*y47,
y35*y41,
y36*y42,
y22*y45,
y3*y28*y44,
y8*y30 + y23*y47 + y38*y48,
y1*y29*y46,
y10*y39
]


new_vars = fmpq_mpoly[ATMA, ATMI, GADD45, IR, Mdm2, Mdm2_P, Mdm2_mRNA, Mdm2_p53, ROS, Source, basalROS, damDNA, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegATMMdm2, kdegGADD45, kdegp53, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS, kphosMdm2, kphosp38, kphosp53, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp21mRNAp53, ksynp21mRNAp53P, ksynp21step1, ksynp21step2, ksynp21step3, ksynp53, ksynp53mRNA, p21, p21_mRNA, p21step1, p21step2, p38, p38_P, p53, p53_P, p53_mRNA]
new_system = 
[
y2*y12*y14,
y1*y26,
y13*y41,
0,
y6*y22 + y7*y32 + y8*y21 + y8*y31,
y1*y5*y28,
y33*y47 + y33*y48,
y5*y15*y47,
y25*y27*y46,
0,
0,
y4*y16 + y9*y18 + y11*y17,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y38*y44,
y34*y47 + y35*y48,
y36*y42,
y37*y43,
y23*y46,
y3*y29*y45,
y8*y31 + y24*y48 + y39*y49,
y1*y30*y47,
y10*y40
]


new_vars = fmpq_mpoly[ATMA, ATMI, GADD45, IR, Mdm2, Mdm2_P, Mdm2_mRNA, Mdm2_p53, ROS, Source, basalROS, damDNA, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegATMMdm2, kdegGADD45, kdegMdm2, kdegp53, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS, kphosMdm2, kphosp38, kphosp53, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp21mRNAp53, ksynp21mRNAp53P, ksynp21step1, ksynp21step2, ksynp21step3, ksynp53, ksynp53mRNA, p21, p21_mRNA, p21step1, p21step2, p38, p38_P, p53, p53_P, p53_mRNA]
new_system = 
[
y2*y12*y14,
y1*y27,
y13*y42,
0,
y6*y23 + y7*y33 + y8*y22 + y8*y32,
y1*y5*y29,
y34*y48 + y34*y49,
y5*y15*y48,
y26*y28*y47,
0,
0,
y4*y16 + y9*y18 + y11*y17,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y39*y45,
y35*y48 + y36*y49,
y37*y43,
y38*y44,
y24*y47,
y3*y30*y46,
y8*y32 + y25*y49 + y40*y50,
y1*y31*y48,
y10*y41
]


new_vars = fmpq_mpoly[ATMA, ATMI, GADD45, IR, Mdm2, Mdm2_P, Mdm2_mRNA, Mdm2_p53, ROS, Source, basalROS, damDNA, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegATMMdm2, kdegGADD45, kdegMdm2, kdegMdm2mRNA, kdegp53, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS, kphosMdm2, kphosp38, kphosp53, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp21mRNAp53, ksynp21mRNAp53P, ksynp21step1, ksynp21step2, ksynp21step3, ksynp53, ksynp53mRNA, p21, p21_mRNA, p21step1, p21step2, p38, p38_P, p53, p53_P, p53_mRNA]
new_system = 
[
y2*y12*y14,
y1*y28,
y13*y43,
0,
y6*y24 + y7*y34 + y8*y23 + y8*y33,
y1*y5*y30,
y35*y49 + y35*y50,
y5*y15*y49,
y27*y29*y48,
0,
0,
y4*y16 + y9*y18 + y11*y17,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y40*y46,
y36*y49 + y37*y50,
y38*y44,
y39*y45,
y25*y48,
y3*y31*y47,
y8*y33 + y26*y50 + y41*y51,
y1*y32*y49,
y10*y42
]


new_vars = fmpq_mpoly[ATMA, ATMI, GADD45, IR, Mdm2, Mdm2_P, Mdm2_mRNA, Mdm2_p53, ROS, Source, basalROS, damDNA, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegATMMdm2, kdegGADD45, kdegMdm2, kdegMdm2mRNA, kdegp21, kdegp53, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS, kphosMdm2, kphosp38, kphosp53, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp21mRNAp53, ksynp21mRNAp53P, ksynp21step1, ksynp21step2, ksynp21step3, ksynp53, ksynp53mRNA, p21, p21_mRNA, p21step1, p21step2, p38, p38_P, p53, p53_P, p53_mRNA]
new_system = 
[
y2*y12*y14,
y1*y29,
y13*y44,
0,
y6*y25 + y7*y35 + y8*y24 + y8*y34,
y1*y5*y31,
y36*y50 + y36*y51,
y5*y15*y50,
y28*y30*y49,
0,
0,
y4*y16 + y9*y18 + y11*y17,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y41*y47,
y37*y50 + y38*y51,
y39*y45,
y40*y46,
y26*y49,
y3*y32*y48,
y8*y34 + y27*y51 + y42*y52,
y1*y33*y50,
y10*y43
]


new_vars = fmpq_mpoly[ATMA, ATMI, GADD45, IR, Mdm2, Mdm2_P, Mdm2_mRNA, Mdm2_p53, ROS, Source, basalROS, damDNA, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegATMMdm2, kdegGADD45, kdegMdm2, kdegMdm2mRNA, kdegp21, kdegp21mRNA, kdegp53, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS, kphosMdm2, kphosp38, kphosp53, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp21mRNAp53, ksynp21mRNAp53P, ksynp21step1, ksynp21step2, ksynp21step3, ksynp53, ksynp53mRNA, p21, p21_mRNA, p21step1, p21step2, p38, p38_P, p53, p53_P, p53_mRNA]
new_system = 
[
y2*y12*y14,
y1*y30,
y13*y45,
0,
y6*y26 + y7*y36 + y8*y25 + y8*y35,
y1*y5*y32,
y37*y51 + y37*y52,
y5*y15*y51,
y29*y31*y50,
0,
0,
y4*y16 + y9*y18 + y11*y17,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y42*y48,
y38*y51 + y39*y52,
y40*y46,
y41*y47,
y27*y50,
y3*y33*y49,
y8*y35 + y28*y52 + y43*y53,
y1*y34*y51,
y10*y44
]


new_vars = fmpq_mpoly[ATMA, ATMI, GADD45, IR, Mdm2, Mdm2_P, Mdm2_mRNA, Mdm2_p53, ROS, Source, basalROS, damDNA, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegATMMdm2, kdegGADD45, kdegMdm2, kdegMdm2mRNA, kdegp21, kdegp21mRNA, kdegp53, kdegp53mRNA, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS, kphosMdm2, kphosp38, kphosp53, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp21mRNAp53, ksynp21mRNAp53P, ksynp21step1, ksynp21step2, ksynp21step3, ksynp53, ksynp53mRNA, p21, p21_mRNA, p21step1, p21step2, p38, p38_P, p53, p53_P, p53_mRNA]
new_system = 
[
y2*y12*y14,
y1*y31,
y13*y46,
0,
y6*y27 + y7*y37 + y8*y25 + y8*y36,
y1*y5*y33,
y38*y52 + y38*y53,
y5*y15*y52,
y30*y32*y51,
0,
0,
y4*y16 + y9*y18 + y11*y17,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y43*y49,
y39*y52 + y40*y53,
y41*y47,
y42*y48,
y28*y51,
y3*y34*y50,
y8*y36 + y29*y53 + y44*y54,
y1*y35*y52,
y10*y45
]


new_vars = fmpq_mpoly[ATMA, ATMI, GADD45, IR, Mdm2, Mdm2_P, Mdm2_mRNA, Mdm2_p53, ROS, Source, basalROS, damDNA, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegATMMdm2, kdegGADD45, kdegMdm2, kdegMdm2mRNA, kdegp21, kdegp21mRNA, kdegp53, kdegp53mRNA, kdegp53mdm2ind, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS, kphosMdm2, kphosp38, kphosp53, krelMdm2p53, ksynMdm2, ksynMdm2mRNA, ksynp21mRNAp53, ksynp21mRNAp53P, ksynp21step1, ksynp21step2, ksynp21step3, ksynp53, ksynp53mRNA, p21, p21_mRNA, p21step1, p21step2, p38, p38_P, p53, p53_P, p53_mRNA]
new_system = 
[
y2*y12*y14,
y1*y32,
y13*y47,
0,
y6*y28 + y7*y38 + y8*y25 + y8*y37,
y1*y5*y34,
y39*y53 + y39*y54,
y5*y15*y53,
y31*y33*y52,
0,
0,
y4*y16 + y9*y18 + y11*y17,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y44*y50,
y40*y53 + y41*y54,
y42*y48,
y43*y49,
y29*y52,
y3*y35*y51,
y8*y37 + y30*y54 + y45*y55,
y1*y36*y53,
y10*y46
]


new_vars = fmpq_mpoly[ATMA, ATMI, GADD45, IR, Mdm2, Mdm2_P, Mdm2_mRNA, Mdm2_p53, ROS, Source, basalROS, damDNA, kGADD45, kactATM, kbinMdm2p53, kdam, kdamBasalROS, kdamROS, kdegATMMdm2, kdegGADD45, kdegMdm2, kdegMdm2mRNA, kdegp21, kdegp21mRNA, kdegp53, kdegp53mRNA, kdegp53mdm2ind, kdephosMdm2, kdephosp38, kdephosp53, kgenROSp38, kinactATM, kp38ROS, kphosMdm2, kphosp38, kphosp53, krelMdm2p53, kremROS, ksynMdm2, ksynMdm2mRNA, ksynp21mRNAp53, ksynp21mRNAp53P, ksynp21step1, ksynp21step2, ksynp21step3, ksynp53, ksynp53mRNA, p21, p21_mRNA, p21step1, p21step2, p38, p38_P, p53, p53_P, p53_mRNA]
new_system = 
[
y2*y12*y14,
y1*y32,
y13*y48,
0,
y6*y28 + y7*y39 + y8*y25 + y8*y37,
y1*y5*y34,
y40*y54 + y40*y55,
y5*y15*y54,
y31*y33*y53,
0,
0,
y4*y16 + y9*y18 + y11*y17,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
y45*y51,
y41*y54 + y42*y55,
y43*y49,
y44*y50,
y29*y53,
y3*y35*y52,
y8*y37 + y30*y55 + y46*y56,
y1*y36*y54,
y10*y47
]


