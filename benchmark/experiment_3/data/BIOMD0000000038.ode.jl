Original system:

[
EIICBPGlc => 27//5000*EIICB*GlcP + 260*EIICBP*Glc - 5189*EIICBPGlc,
Pyr => -294*EIP*Pyr + 108000*PyrPI,
EIICB => -880*EIIAP*EIICB + 880*EIIAPIICB - 27//5000*EIICB*GlcP + 4800*EIICBPGlc,
HPrP => -3360*EI*HPrP - 21960*EIIA*HPrP + 84000*EIPHPr + 21960*HPrPIIA,
EIIA => -960*EIIA*EIICBP - 21960*EIIA*HPrP + 2640*EIIAPIICB + 21960*HPrPIIA,
EIIAPIICB => 960*EIIA*EIICBP + 880*EIIAP*EIICB - 3520*EIIAPIICB,
EIP => -14000*EIP*HPr - 294*EIP*Pyr + 14000*EIPHPr + 108000*PyrPI,
EIICBP => -960*EIIA*EIICBP + 2640*EIIAPIICB - 260*EIICBP*Glc + 389*EIICBPGlc,
PyrPI => 1960*EI*PEP + 294*EIP*Pyr - 588000*PyrPI,
HPr => -3384*EIIAP*HPr - 14000*EIP*HPr + 14000*EIPHPr + 4392*HPrPIIA,
EIPHPr => 3360*EI*HPrP + 14000*EIP*HPr - 98000*EIPHPr,
EIIAP => -880*EIIAP*EIICB - 3384*EIIAP*HPr + 880*EIIAPIICB + 4392*HPrPIIA,
Glc => -260*EIICBP*Glc + 389*EIICBPGlc,
HPrPIIA => 21960*EIIA*HPrP + 3384*EIIAP*HPr - 26352*HPrPIIA,
EI => -3360*EI*HPrP - 1960*EI*PEP + 84000*EIPHPr + 480000*PyrPI,
GlcP => -27//5000*EIICB*GlcP + 4800*EIICBPGlc,
PEP => -1960*EI*PEP + 480000*PyrPI
]

Reductions:

Interesting
new_vars = fmpq_mpoly[EI + EIP - HPr - HPrP - HPrPIIA + PyrPI]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[EI + EIP - HPr - HPrP - HPrPIIA + PyrPI, EIIA - EIICBP - EIP + Glc + HPr + HPrPIIA + Pyr]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[EI + EIP - HPr - HPrP - HPrPIIA + PyrPI, EIIA - EIICBP - EIP + Glc + HPr + HPrPIIA + Pyr, EIIAP - EIICB + EIP + GlcP - HPr - Pyr]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[EI + EIP - HPr - HPrP - HPrPIIA + PyrPI, EIIA - EIICBP - EIP + Glc + HPr + HPrPIIA + Pyr, EIIAP - EIICB + EIP + GlcP - HPr - Pyr, EIIAPIICB + EIICB + EIICBP - Glc - GlcP]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[EI + EIP - HPr - HPrP - HPrPIIA + PyrPI, EIIA - EIICBP - EIP + Glc + HPr + HPrPIIA + Pyr, EIIAP - EIICB + EIP + GlcP - HPr - Pyr, EIIAPIICB + EIICB + EIICBP - Glc - GlcP, EIICBPGlc + Glc + GlcP]
new_system = 
[
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[EI + EIP + EIPHPr + PyrPI, EI + EIIA + EIIAPIICB + EIICB + EIICBPGlc + EIPHPr + Glc + HPr + HPrPIIA + Pyr + PyrPI, EIIA + EIIAP + EIIAPIICB + HPrPIIA, EIIAPIICB + EIICB + EIICBP + EIICBPGlc, EIICBPGlc + Glc + GlcP, EIPHPr + HPr + HPrP + HPrPIIA]
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
new_vars = fmpq_mpoly[EI + EIP + EIPHPr + PyrPI, EI + EIIA + EIIAPIICB + EIICB + EIICBPGlc + EIPHPr + Glc + HPr + HPrPIIA + Pyr + PyrPI, EIIA + EIIAP + EIIAPIICB + HPrPIIA, EIIAPIICB + EIICB + EIICBP + EIICBPGlc, EIICBPGlc + Glc + GlcP, EIPHPr + HPr + HPrP + HPrPIIA, PEP + Pyr + PyrPI]
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


