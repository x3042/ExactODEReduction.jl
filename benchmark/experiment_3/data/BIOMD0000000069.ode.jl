Original system:

[
Cbp => 0,
p3 => 0,
Kser => 0,
k1 => 0,
k2 => 0,
kPTP => 0,
PTP => PTP_pY789*p2,
srcc => Cbp_P_CSK*k1*srca,
CSK_cytoplasm => Cbp_P_CSK*kCSKoff,
Cbp_P_CSK => CSK_cytoplasm*Cbp_P*kCSKon,
kCSKoff => 0,
rho_srcc => 0,
rho_srca => 0,
k4 => 0,
srci => Cbp_P_CSK*k1*srco + k4*p1*srcc,
p2 => 0,
p1 => 0,
srco => Kser*PTP_pY789*k2*srci + PTP_background*k2*srci + p1*srca,
PTP_background => 0,
PTP_pY789 => PTP*kPTP*rho_srca*srca + PTP*kPTP*rho_srcc*srcc + PTP*kPTP*rho_srco*srco + PTP*kPTP*src_background + PTP*p3,
kCSKon => 0,
kCbp => 0,
rho_srco => 0,
srca => Kser*PTP_pY789*k2*srcc + PTP_background*k2*srcc + k3*rho_srcc*srcc*srco + 2*k3*rho_srco*srco + k3*src_background*srco,
Cbp_P => Cbp*kCbp*rho_srca*srca + Cbp*kCbp*rho_srcc*srcc + Cbp*kCbp*rho_srco*srco + Cbp*kCbp*src_background + Cbp_P_CSK*kCSKoff,
src_background => 0,
k3 => 0
]

Reductions:


new_vars = fmpq_mpoly[Cbp]
new_system = 
[
0
]


new_vars = fmpq_mpoly[Cbp, Kser]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[Cbp, Kser, PTP_background]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[Cbp, Kser, PTP_background, k1]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Cbp, Kser, PTP_background, k1, k2]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Cbp, Kser, PTP_background, k1, k2, k3]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[Cbp, Kser, PTP_background, k1, k2, k3, k4]
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


new_vars = fmpq_mpoly[Cbp, Kser, PTP_background, k1, k2, k3, k4, kCSKoff]
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


new_vars = fmpq_mpoly[Cbp, Kser, PTP_background, k1, k2, k3, k4, kCSKoff, kCSKon]
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


new_vars = fmpq_mpoly[Cbp, Kser, PTP_background, k1, k2, k3, k4, kCSKoff, kCSKon, kCbp]
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


new_vars = fmpq_mpoly[Cbp, Kser, PTP_background, k1, k2, k3, k4, kCSKoff, kCSKon, kCbp, kPTP]
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


new_vars = fmpq_mpoly[Cbp, Kser, PTP_background, k1, k2, k3, k4, kCSKoff, kCSKon, kCbp, kPTP, p1]
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


new_vars = fmpq_mpoly[Cbp, Kser, PTP_background, k1, k2, k3, k4, kCSKoff, kCSKon, kCbp, kPTP, p1, p2]
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


new_vars = fmpq_mpoly[Cbp, Kser, PTP_background, k1, k2, k3, k4, kCSKoff, kCSKon, kCbp, kPTP, p1, p2, p3]
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


new_vars = fmpq_mpoly[Cbp, Kser, PTP_background, k1, k2, k3, k4, kCSKoff, kCSKon, kCbp, kPTP, p1, p2, p3, rho_srca]
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


new_vars = fmpq_mpoly[Cbp, Kser, PTP_background, k1, k2, k3, k4, kCSKoff, kCSKon, kCbp, kPTP, p1, p2, p3, rho_srca, rho_srcc]
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


new_vars = fmpq_mpoly[Cbp, Kser, PTP_background, k1, k2, k3, k4, kCSKoff, kCSKon, kCbp, kPTP, p1, p2, p3, rho_srca, rho_srcc, rho_srco]
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


new_vars = fmpq_mpoly[Cbp, Kser, PTP_background, k1, k2, k3, k4, kCSKoff, kCSKon, kCbp, kPTP, p1, p2, p3, rho_srca, rho_srcc, rho_srco, src_background]
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


