Original system:

[
S37 => S3*S32*fk_on + S33*S4*zap_on - S37*S4*zap_on - S37*fk_cat - S37*fk_off - S37*zap_off2 + S41*zap_off1,
S15 => S13*ek_cat + S14*S4*zap_on - S15*S2*ek_on - S15*S3*fk_on - S15*zap_off1 + S18*fk_off + S19*ek_off + S25*fk_cat,
S36 => S3*S31*fk_on + S33*S4*zap_on - S36*S4*zap_on - S36*fk_cat - S36*fk_off - S36*zap_off1 + S41*zap_off2,
S2 => -S1*S2*ek_on + S11*ek_cat + S11*ek_off - S12*S2*ek_on + S13*ek_cat + S13*ek_off - S14*S2*ek_on - S15*S2*ek_on + S17*ek_cat + S17*ek_off + S19*ek_cat + S19*ek_off - S2*S20*ek_on - S2*S21*ek_on - S2*S24*ek_on - S2*S28*ek_on - S2*S29*ek_on - S2*S31*ek_on - S2*S32*ek_on - S2*S35*ek_on - S2*S6*ek_on - S2*S9*ek_on + S23*ek_cat + S23*ek_off + S26*ek_cat + S26*ek_off + S27*ek_cat + S27*ek_off + S30*ek_cat + S30*ek_off + S34*ek_cat + S34*ek_off + S38*ek_cat + S38*ek_off + S39*ek_cat + S39*ek_off + S42*ek_cat + S42*ek_off + S5*ek_cat + S5*ek_off + S8*ek_cat + S8*ek_off,
S29 => -S2*S29*ek_on + S21*S4*zap_on + S24*S4*zap_on - S29*zap_off1 - S29*zap_off2 + S30*ek_off + S41*fk_cat,
S41 => S3*S35*fk_on + S36*S4*zap_on + S37*S4*zap_on - S41*fk_cat - S41*fk_off - S41*zap_off1 - S41*zap_off2,
fk_on => 0,
S18 => S15*S3*fk_on + S16*S4*zap_on - S18*fk_cat - S18*fk_off - S18*zap_off1,
zap_off1 => 0,
S40 => -S3*S40*fk_on + S34*ek_cat - 3*S4*S40*zap_on + S43*zap_off1 + S44*zap_off2 + S45*fk_off + S46*zap_off3,
S1 => -S1*S2*ek_on + S5*ek_off + S7*fk_cat,
S28 => -S2*S28*ek_on + S23*ek_cat - S28*S3*fk_on - 2*S28*S4*zap_on + S31*zap_off1 + S32*zap_off2 + S33*fk_off + S34*ek_off + S45*fk_cat,
S3 => S10*fk_cat + S10*fk_off - S14*S3*fk_on - S15*S3*fk_on + S16*fk_cat + S16*fk_off + S18*fk_cat + S18*fk_off - S20*S3*fk_on - S21*S3*fk_on + S22*fk_cat + S22*fk_off + S25*fk_cat + S25*fk_off - S28*S3*fk_on - S3*S31*fk_on - S3*S32*fk_on - S3*S35*fk_on - S3*S40*fk_on - S3*S43*fk_on - S3*S44*fk_on - S3*S47*fk_on - S3*S6*fk_on - S3*S9*fk_on + S33*fk_cat + S33*fk_off + S36*fk_cat + S36*fk_off + S37*fk_cat + S37*fk_off + S41*fk_cat + S41*fk_off + S45*fk_cat + S45*fk_off + S48*fk_cat + S48*fk_off + S49*fk_cat + S49*fk_off + S52*fk_cat + S52*fk_off + S7*fk_cat + S7*fk_off,
S33 => S28*S3*fk_on - 2*S33*S4*zap_on - S33*fk_cat - S33*fk_off + S36*zap_off1 + S37*zap_off2,
fk_off => 0,
S47 => -S3*S47*fk_on + S4*S43*zap_on + S4*S44*zap_on - S4*S47*zap_on + S42*ek_cat - S47*zap_off1 - S47*zap_off2 + S52*fk_off + S53*zap_off3,
S53 => S4*S47*zap_on + S4*S50*zap_on + S4*S51*zap_on - S53*zap_off1 - S53*zap_off2 - S53*zap_off3,
S51 => S4*S44*zap_on + S4*S46*zap_on - S4*S51*zap_on - S51*zap_off2 - S51*zap_off3 + S53*zap_off1,
S27 => S2*S24*ek_on + S23*S4*zap_on - S27*S4*zap_on - S27*ek_cat - S27*ek_off - S27*zap_off2 + S30*zap_off1,
S39 => S2*S32*ek_on + S34*S4*zap_on - S39*S4*zap_on - S39*ek_cat - S39*ek_off - S39*zap_off2 + S42*zap_off1,
S7 => S3*S6*fk_on - S7*fk_cat - S7*fk_off,
S11 => -S11*S4*zap_on - S11*ek_cat - S11*ek_off + S13*zap_off1 + S2*S9*ek_on,
S23 => S2*S20*ek_on - 2*S23*S4*zap_on - S23*ek_cat - S23*ek_off + S26*zap_off1 + S27*zap_off2,
S52 => S3*S47*fk_on + S4*S48*zap_on + S4*S49*zap_on - S52*fk_cat - S52*fk_off - S52*zap_off1 - S52*zap_off2,
S16 => S14*S3*fk_on - S16*S4*zap_on - S16*fk_cat - S16*fk_off + S18*zap_off1,
ek_on => 0,
S46 => S4*S40*zap_on - 2*S4*S46*zap_on - S46*zap_off3 + S50*zap_off1 + S51*zap_off2,
S32 => -S2*S32*ek_on + S27*ek_cat + S28*S4*zap_on - S3*S32*fk_on - S32*S4*zap_on - S32*zap_off2 + S35*zap_off1 + S37*fk_off + S39*ek_off + S49*fk_cat,
S34 => S2*S28*ek_on - 2*S34*S4*zap_on - S34*ek_cat - S34*ek_off + S38*zap_off1 + S39*zap_off2,
S31 => -S2*S31*ek_on + S26*ek_cat + S28*S4*zap_on - S3*S31*fk_on - S31*S4*zap_on - S31*zap_off1 + S35*zap_off2 + S36*fk_off + S38*ek_off + S48*fk_cat,
S22 => S20*S3*fk_on - S22*S4*zap_on - S22*fk_cat - S22*fk_off + S25*zap_off1,
S44 => -S3*S44*fk_on + S39*ek_cat + S4*S40*zap_on - 2*S4*S44*zap_on - S44*zap_off2 + S47*zap_off1 + S49*fk_off + S51*zap_off3,
S50 => S4*S43*zap_on + S4*S46*zap_on - S4*S50*zap_on - S50*zap_off1 - S50*zap_off3 + S53*zap_off2,
zap_off2 => 0,
S17 => S14*S2*ek_on - S17*S4*zap_on - S17*ek_cat - S17*ek_off + S19*zap_off1,
S8 => S2*S6*ek_on - S8*ek_cat - S8*ek_off,
S35 => -S2*S35*ek_on - S3*S35*fk_on + S30*ek_cat + S31*S4*zap_on + S32*S4*zap_on - S35*zap_off1 - S35*zap_off2 + S41*fk_off + S42*ek_off + S52*fk_cat,
S19 => S15*S2*ek_on + S17*S4*zap_on - S19*ek_cat - S19*ek_off - S19*zap_off1,
S21 => S19*ek_cat - S2*S21*ek_on + S20*S4*zap_on - S21*S3*fk_on - S21*S4*zap_on - S21*zap_off1 + S25*fk_off + S26*ek_off + S29*zap_off2 + S36*fk_cat,
S13 => S11*S4*zap_on + S12*S2*ek_on - S13*ek_cat - S13*ek_off - S13*zap_off1,
S14 => S11*ek_cat - S14*S2*ek_on - S14*S3*fk_on - S14*S4*zap_on + S15*zap_off1 + S16*fk_off + S17*ek_off + S22*fk_cat,
S48 => S3*S43*fk_on + S4*S45*zap_on - S4*S48*zap_on - S48*fk_cat - S48*fk_off - S48*zap_off1 + S52*zap_off2,
S26 => S2*S21*ek_on + S23*S4*zap_on - S26*S4*zap_on - S26*ek_cat - S26*ek_off - S26*zap_off1 + S30*zap_off2,
S9 => S10*fk_off + S11*ek_off + S12*zap_off1 + S16*fk_cat - S2*S9*ek_on - S3*S9*fk_on - S4*S9*zap_on + S8*ek_cat,
zap_off3 => 0,
S45 => S3*S40*fk_on - 2*S4*S45*zap_on - S45*fk_cat - S45*fk_off + S48*zap_off1 + S49*zap_off2,
S10 => -S10*fk_cat - S10*fk_off + S3*S9*fk_on,
zap_on => 0,
S6 => S10*fk_cat - S2*S6*ek_on - S3*S6*fk_on + S5*ek_cat + S7*fk_off + S8*ek_off,
S5 => S1*S2*ek_on - S5*ek_cat - S5*ek_off,
S25 => S21*S3*fk_on + S22*S4*zap_on - S25*fk_cat - S25*fk_off - S25*zap_off1,
S4 => -S11*S4*zap_on + S12*zap_off1 + S13*zap_off1 - S14*S4*zap_on + S15*zap_off1 - S16*S4*zap_on - S17*S4*zap_on + S18*zap_off1 + S19*zap_off1 - 2*S20*S4*zap_on - S21*S4*zap_on + S21*zap_off1 - S22*S4*zap_on - 2*S23*S4*zap_on - S24*S4*zap_on + S24*zap_off2 + S25*zap_off1 - S26*S4*zap_on + S26*zap_off1 - S27*S4*zap_on + S27*zap_off2 - 2*S28*S4*zap_on + S29*zap_off1 + S29*zap_off2 + S30*zap_off1 + S30*zap_off2 - S31*S4*zap_on + S31*zap_off1 - S32*S4*zap_on + S32*zap_off2 - 2*S33*S4*zap_on - 2*S34*S4*zap_on + S35*zap_off1 + S35*zap_off2 - S36*S4*zap_on + S36*zap_off1 - S37*S4*zap_on + S37*zap_off2 - S38*S4*zap_on + S38*zap_off1 - S39*S4*zap_on + S39*zap_off2 - 3*S4*S40*zap_on - 2*S4*S43*zap_on - 2*S4*S44*zap_on - 2*S4*S45*zap_on - 2*S4*S46*zap_on - S4*S47*zap_on - S4*S48*zap_on - S4*S49*zap_on - S4*S50*zap_on - S4*S51*zap_on - S4*S9*zap_on + S41*zap_off1 + S41*zap_off2 + S42*zap_off1 + S42*zap_off2 + S43*zap_off1 + S44*zap_off2 + S46*zap_off3 + S47*zap_off1 + S47*zap_off2 + S48*zap_off1 + S49*zap_off2 + S50*zap_off1 + S50*zap_off3 + S51*zap_off2 + S51*zap_off3 + S52*zap_off1 + S52*zap_off2 + S53*zap_off1 + S53*zap_off2 + S53*zap_off3,
S49 => S3*S44*fk_on + S4*S45*zap_on - S4*S49*zap_on - S49*fk_cat - S49*fk_off - S49*zap_off2 + S52*zap_off1,
S30 => S2*S29*ek_on + S26*S4*zap_on + S27*S4*zap_on - S30*ek_cat - S30*ek_off - S30*zap_off1 - S30*zap_off2,
S38 => S2*S31*ek_on + S34*S4*zap_on - S38*S4*zap_on - S38*ek_cat - S38*ek_off - S38*zap_off1 + S42*zap_off2,
S12 => -S12*S2*ek_on - S12*zap_off1 + S13*ek_off + S18*fk_cat + S4*S9*zap_on,
S42 => S2*S35*ek_on + S38*S4*zap_on + S39*S4*zap_on - S42*ek_cat - S42*ek_off - S42*zap_off1 - S42*zap_off2,
S20 => S17*ek_cat - S2*S20*ek_on - S20*S3*fk_on - 2*S20*S4*zap_on + S21*zap_off1 + S22*fk_off + S23*ek_off + S24*zap_off2 + S33*fk_cat,
S43 => -S3*S43*fk_on + S38*ek_cat + S4*S40*zap_on - 2*S4*S43*zap_on - S43*zap_off1 + S47*zap_off2 + S48*fk_off + S50*zap_off3,
S24 => -S2*S24*ek_on + S20*S4*zap_on - S24*S4*zap_on - S24*zap_off2 + S27*ek_off + S29*zap_off1 + S37*fk_cat,
ek_cat => 0,
ek_off => 0,
fk_cat => 0
]

Reductions:

Interesting
new_vars = fmpq_mpoly[S1 - S13 + S14 - S18 - S19 - S2 + S20 - S25 - S26 - S27 + S28 - S29 - S3 - 2*S30 - S35 - S36 - S37 - S38 - S39 - S4 + S40 - 2*S41 - 2*S42 - S47 - S48 - S49 - S50 - S51 - 2*S52 - 2*S53 + S6 + S9]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[S1 - S13 + S14 - S18 - S19 - S2 + S20 - S25 - S26 - S27 + S28 - S29 - S3 - 2*S30 - S35 - S36 - S37 - S38 - S39 - S4 + S40 - 2*S41 - 2*S42 - S47 - S48 - S49 - S50 - S51 - 2*S52 - 2*S53 + S6 + S9, S10 + S16 + S18 + S22 + S25 + S3 + S33 + S36 + S37 + S41 + S45 + S48 + S49 + S52 + S7]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[S1 - S13 + S14 - S18 - S19 - S2 + S20 - S25 - S26 - S27 + S28 - S29 - S3 - 2*S30 - S35 - S36 - S37 - S38 - S39 - S4 + S40 - 2*S41 - 2*S42 - S47 - S48 - S49 - S50 - S51 - 2*S52 - 2*S53 + S6 + S9, S10 + S16 + S18 + S22 + S25 + S3 + S33 + S36 + S37 + S41 + S45 + S48 + S49 + S52 + S7, S11 + S13 + S17 + S19 + S2 + S23 + S26 + S27 + S30 + S34 + S38 + S39 + S42 + S5 + S8]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[S1 + S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S18 + S19 + S20 + S21 + S22 + S23 + S24 + S25 + S26 + S27 + S28 + S29 + S30 + S31 + S32 + S33 + S34 + S35 + S36 + S37 + S38 + S39 + S40 + S41 + S42 + S43 + S44 + S45 + S46 + S47 + S48 + S49 + S5 + S50 + S51 + S52 + S53 + S6 + S7 + S8 + S9, S10 + S16 + S18 + S22 + S25 + S3 + S33 + S36 + S37 + S41 + S45 + S48 + S49 + S52 + S7, S11 + S13 + S17 + S19 + S2 + S23 + S26 + S27 + S30 + S34 + S38 + S39 + S42 + S5 + S8, S12 + S13 + S15 + S18 + S19 + S21 + S24 + S25 + S26 + S27 + 2*S29 + 2*S30 + S31 + S32 + 2*S35 + S36 + S37 + S38 + S39 + S4 + 2*S41 + 2*S42 + S43 + S44 + S46 + 2*S47 + S48 + S49 + 2*S50 + 2*S51 + 2*S52 + 3*S53]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[S1 + S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S18 + S19 + S20 + S21 + S22 + S23 + S24 + S25 + S26 + S27 + S28 + S29 + S30 + S31 + S32 + S33 + S34 + S35 + S36 + S37 + S38 + S39 + S40 + S41 + S42 + S43 + S44 + S45 + S46 + S47 + S48 + S49 + S5 + S50 + S51 + S52 + S53 + S6 + S7 + S8 + S9, S10 + S16 + S18 + S22 + S25 + S3 + S33 + S36 + S37 + S41 + S45 + S48 + S49 + S52 + S7, S11 + S13 + S17 + S19 + S2 + S23 + S26 + S27 + S30 + S34 + S38 + S39 + S42 + S5 + S8, S12 + S13 + S15 + S18 + S19 + S21 + S24 + S25 + S26 + S27 + 2*S29 + 2*S30 + S31 + S32 + 2*S35 + S36 + S37 + S38 + S39 + S4 + 2*S41 + 2*S42 + S43 + S44 + S46 + 2*S47 + S48 + S49 + 2*S50 + 2*S51 + 2*S52 + 3*S53, ek_cat]
new_system = 
[
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[S1 + S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S18 + S19 + S20 + S21 + S22 + S23 + S24 + S25 + S26 + S27 + S28 + S29 + S30 + S31 + S32 + S33 + S34 + S35 + S36 + S37 + S38 + S39 + S40 + S41 + S42 + S43 + S44 + S45 + S46 + S47 + S48 + S49 + S5 + S50 + S51 + S52 + S53 + S6 + S7 + S8 + S9, S10 + S16 + S18 + S22 + S25 + S3 + S33 + S36 + S37 + S41 + S45 + S48 + S49 + S52 + S7, S11 + S13 + S17 + S19 + S2 + S23 + S26 + S27 + S30 + S34 + S38 + S39 + S42 + S5 + S8, S12 + S13 + S15 + S18 + S19 + S21 + S24 + S25 + S26 + S27 + 2*S29 + 2*S30 + S31 + S32 + 2*S35 + S36 + S37 + S38 + S39 + S4 + 2*S41 + 2*S42 + S43 + S44 + S46 + 2*S47 + S48 + S49 + 2*S50 + 2*S51 + 2*S52 + 3*S53, ek_cat, ek_off]
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
new_vars = fmpq_mpoly[S1 + S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S18 + S19 + S20 + S21 + S22 + S23 + S24 + S25 + S26 + S27 + S28 + S29 + S30 + S31 + S32 + S33 + S34 + S35 + S36 + S37 + S38 + S39 + S40 + S41 + S42 + S43 + S44 + S45 + S46 + S47 + S48 + S49 + S5 + S50 + S51 + S52 + S53 + S6 + S7 + S8 + S9, S10 + S16 + S18 + S22 + S25 + S3 + S33 + S36 + S37 + S41 + S45 + S48 + S49 + S52 + S7, S11 + S13 + S17 + S19 + S2 + S23 + S26 + S27 + S30 + S34 + S38 + S39 + S42 + S5 + S8, S12 + S13 + S15 + S18 + S19 + S21 + S24 + S25 + S26 + S27 + 2*S29 + 2*S30 + S31 + S32 + 2*S35 + S36 + S37 + S38 + S39 + S4 + 2*S41 + 2*S42 + S43 + S44 + S46 + 2*S47 + S48 + S49 + 2*S50 + 2*S51 + 2*S52 + 3*S53, ek_cat, ek_off, ek_on]
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
new_vars = fmpq_mpoly[S1 + S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S18 + S19 + S20 + S21 + S22 + S23 + S24 + S25 + S26 + S27 + S28 + S29 + S30 + S31 + S32 + S33 + S34 + S35 + S36 + S37 + S38 + S39 + S40 + S41 + S42 + S43 + S44 + S45 + S46 + S47 + S48 + S49 + S5 + S50 + S51 + S52 + S53 + S6 + S7 + S8 + S9, S10 + S16 + S18 + S22 + S25 + S3 + S33 + S36 + S37 + S41 + S45 + S48 + S49 + S52 + S7, S11 + S13 + S17 + S19 + S2 + S23 + S26 + S27 + S30 + S34 + S38 + S39 + S42 + S5 + S8, S12 + S13 + S15 + S18 + S19 + S21 + S24 + S25 + S26 + S27 + 2*S29 + 2*S30 + S31 + S32 + 2*S35 + S36 + S37 + S38 + S39 + S4 + 2*S41 + 2*S42 + S43 + S44 + S46 + 2*S47 + S48 + S49 + 2*S50 + 2*S51 + 2*S52 + 3*S53, ek_cat, ek_off, ek_on, fk_cat]
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
new_vars = fmpq_mpoly[S1 + S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S18 + S19 + S20 + S21 + S22 + S23 + S24 + S25 + S26 + S27 + S28 + S29 + S30 + S31 + S32 + S33 + S34 + S35 + S36 + S37 + S38 + S39 + S40 + S41 + S42 + S43 + S44 + S45 + S46 + S47 + S48 + S49 + S5 + S50 + S51 + S52 + S53 + S6 + S7 + S8 + S9, S10 + S16 + S18 + S22 + S25 + S3 + S33 + S36 + S37 + S41 + S45 + S48 + S49 + S52 + S7, S11 + S13 + S17 + S19 + S2 + S23 + S26 + S27 + S30 + S34 + S38 + S39 + S42 + S5 + S8, S12 + S13 + S15 + S18 + S19 + S21 + S24 + S25 + S26 + S27 + 2*S29 + 2*S30 + S31 + S32 + 2*S35 + S36 + S37 + S38 + S39 + S4 + 2*S41 + 2*S42 + S43 + S44 + S46 + 2*S47 + S48 + S49 + 2*S50 + 2*S51 + 2*S52 + 3*S53, ek_cat, ek_off, ek_on, fk_cat, fk_off]
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
new_vars = fmpq_mpoly[S1 + S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S18 + S19 + S20 + S21 + S22 + S23 + S24 + S25 + S26 + S27 + S28 + S29 + S30 + S31 + S32 + S33 + S34 + S35 + S36 + S37 + S38 + S39 + S40 + S41 + S42 + S43 + S44 + S45 + S46 + S47 + S48 + S49 + S5 + S50 + S51 + S52 + S53 + S6 + S7 + S8 + S9, S10 + S16 + S18 + S22 + S25 + S3 + S33 + S36 + S37 + S41 + S45 + S48 + S49 + S52 + S7, S11 + S13 + S17 + S19 + S2 + S23 + S26 + S27 + S30 + S34 + S38 + S39 + S42 + S5 + S8, S12 + S13 + S15 + S18 + S19 + S21 + S24 + S25 + S26 + S27 + 2*S29 + 2*S30 + S31 + S32 + 2*S35 + S36 + S37 + S38 + S39 + S4 + 2*S41 + 2*S42 + S43 + S44 + S46 + 2*S47 + S48 + S49 + 2*S50 + 2*S51 + 2*S52 + 3*S53, ek_cat, ek_off, ek_on, fk_cat, fk_off, fk_on]
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
new_vars = fmpq_mpoly[S1 + S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S18 + S19 + S20 + S21 + S22 + S23 + S24 + S25 + S26 + S27 + S28 + S29 + S30 + S31 + S32 + S33 + S34 + S35 + S36 + S37 + S38 + S39 + S40 + S41 + S42 + S43 + S44 + S45 + S46 + S47 + S48 + S49 + S5 + S50 + S51 + S52 + S53 + S6 + S7 + S8 + S9, S10 + S16 + S18 + S22 + S25 + S3 + S33 + S36 + S37 + S41 + S45 + S48 + S49 + S52 + S7, S11 + S13 + S17 + S19 + S2 + S23 + S26 + S27 + S30 + S34 + S38 + S39 + S42 + S5 + S8, S12 + S13 + S15 + S18 + S19 + S21 + S24 + S25 + S26 + S27 + 2*S29 + 2*S30 + S31 + S32 + 2*S35 + S36 + S37 + S38 + S39 + S4 + 2*S41 + 2*S42 + S43 + S44 + S46 + 2*S47 + S48 + S49 + 2*S50 + 2*S51 + 2*S52 + 3*S53, ek_cat, ek_off, ek_on, fk_cat, fk_off, fk_on, zap_off1]
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
new_vars = fmpq_mpoly[S1 + S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S18 + S19 + S20 + S21 + S22 + S23 + S24 + S25 + S26 + S27 + S28 + S29 + S30 + S31 + S32 + S33 + S34 + S35 + S36 + S37 + S38 + S39 + S40 + S41 + S42 + S43 + S44 + S45 + S46 + S47 + S48 + S49 + S5 + S50 + S51 + S52 + S53 + S6 + S7 + S8 + S9, S10 + S16 + S18 + S22 + S25 + S3 + S33 + S36 + S37 + S41 + S45 + S48 + S49 + S52 + S7, S11 + S13 + S17 + S19 + S2 + S23 + S26 + S27 + S30 + S34 + S38 + S39 + S42 + S5 + S8, S12 + S13 + S15 + S18 + S19 + S21 + S24 + S25 + S26 + S27 + 2*S29 + 2*S30 + S31 + S32 + 2*S35 + S36 + S37 + S38 + S39 + S4 + 2*S41 + 2*S42 + S43 + S44 + S46 + 2*S47 + S48 + S49 + 2*S50 + 2*S51 + 2*S52 + 3*S53, ek_cat, ek_off, ek_on, fk_cat, fk_off, fk_on, zap_off1, zap_off2]
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
new_vars = fmpq_mpoly[S1 + S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S18 + S19 + S20 + S21 + S22 + S23 + S24 + S25 + S26 + S27 + S28 + S29 + S30 + S31 + S32 + S33 + S34 + S35 + S36 + S37 + S38 + S39 + S40 + S41 + S42 + S43 + S44 + S45 + S46 + S47 + S48 + S49 + S5 + S50 + S51 + S52 + S53 + S6 + S7 + S8 + S9, S10 + S16 + S18 + S22 + S25 + S3 + S33 + S36 + S37 + S41 + S45 + S48 + S49 + S52 + S7, S11 + S13 + S17 + S19 + S2 + S23 + S26 + S27 + S30 + S34 + S38 + S39 + S42 + S5 + S8, S12 + S13 + S15 + S18 + S19 + S21 + S24 + S25 + S26 + S27 + 2*S29 + 2*S30 + S31 + S32 + 2*S35 + S36 + S37 + S38 + S39 + S4 + 2*S41 + 2*S42 + S43 + S44 + S46 + 2*S47 + S48 + S49 + 2*S50 + 2*S51 + 2*S52 + 3*S53, ek_cat, ek_off, ek_on, fk_cat, fk_off, fk_on, zap_off1, zap_off2, zap_off3]
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
new_vars = fmpq_mpoly[S1 + S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S18 + S19 + S20 + S21 + S22 + S23 + S24 + S25 + S26 + S27 + S28 + S29 + S30 + S31 + S32 + S33 + S34 + S35 + S36 + S37 + S38 + S39 + S40 + S41 + S42 + S43 + S44 + S45 + S46 + S47 + S48 + S49 + S5 + S50 + S51 + S52 + S53 + S6 + S7 + S8 + S9, S10 + S16 + S18 + S22 + S25 + S3 + S33 + S36 + S37 + S41 + S45 + S48 + S49 + S52 + S7, S11 + S13 + S17 + S19 + S2 + S23 + S26 + S27 + S30 + S34 + S38 + S39 + S42 + S5 + S8, S12 + S13 + S15 + S18 + S19 + S21 + S24 + S25 + S26 + S27 + 2*S29 + 2*S30 + S31 + S32 + 2*S35 + S36 + S37 + S38 + S39 + S4 + 2*S41 + 2*S42 + S43 + S44 + S46 + 2*S47 + S48 + S49 + 2*S50 + 2*S51 + 2*S52 + 3*S53, ek_cat, ek_off, ek_on, fk_cat, fk_off, fk_on, zap_off1, zap_off2, zap_off3, zap_on]
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


