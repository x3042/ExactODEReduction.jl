Original system:

[
kzd => 0,
kzs => 0,
lacz => kzs*sigb,
kbd => 0,
IPTG => 0,
kxd => 0,
kxs => 0,
kbx => 0,
kbs => 0,
sigb => IPTG*kbs + kxd*x + kzd*lacz,
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


new_vars = fmpq_mpoly[IPTG, kbd, kbs, kbx]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[IPTG, kbd, kbs, kbx, kxd]
new_system = 
[
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[IPTG, kbd, kbs, kbx, kxd, kxs]
new_system = 
[
0,
0,
0,
0,
0,
0
]


new_vars = fmpq_mpoly[IPTG, kbd, kbs, kbx, kxd, kxs, kzd]
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


new_vars = fmpq_mpoly[IPTG, kbd, kbs, kbx, kxd, kxs, kzd, kzs]
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


