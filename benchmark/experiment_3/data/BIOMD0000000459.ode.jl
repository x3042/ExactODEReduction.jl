Original system:

[
kzs => 0,
kzx => 0,
lacz => kzs*sigb,
kbd => 0,
IPTG => 0,
kxs => 0,
kzd => 0,
kxd => 0,
kbs => 0,
sigb => IPTG*kbs + kxd*x + kzd*lacz + kzx*lacz*x,
x => kxs*sigb
]

Reductions:


new_vars = fmpq_mpoly[IPTG]
new_system = 
[
0
]


new_vars = fmpq_mpoly[IPTG, kbd]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[IPTG, kbd, kbs]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[IPTG, kbd, kbs, kxd]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[IPTG, kbd, kbs, kxd, kxs]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[IPTG, kbd, kbs, kxd, kxs, kzd]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[IPTG, kbd, kbs, kxd, kxs, kzd, kzs]
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


new_vars = fmpq_mpoly[IPTG, kbd, kbs, kxd, kxs, kzd, kzs, kzx]
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


