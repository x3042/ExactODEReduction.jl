Original system:

[
Va => -APC*Va*k1 + HC*LC*k10 - Va*k9 + Va_APC*k2,
APC => -APC*LC*k1 - APC*Va*k1 - APC*Va3*k1 - APC*Va36*k1 - APC*Va5*k1 - APC*Va53*k1 - APC*Va536*k1 - APC*Va56*k1 - APC*VaLCA1*k1 + LC_APC*k2 + Va36_APC*k2 + Va3_APC*k2 + Va536_APC*k2 + Va53_APC*k2 + Va56_APC*k2 + Va5_APC*k2 + VaLCA1_APC*k2 + Va_APC*k2,
k5 => 0,
Va56_APC => APC*Va56*k1 - Va56_APC*k2 - Va56_APC*k3 + Va5_APC*k6,
k6 => 0,
VaLCA1 => -APC*VaLCA1*k1 + Va3*k7 + Va36*k7 + Va53*k7 + Va536*k7 - VaA3*VaLCA1*k8 - VaA36*VaLCA1*k8 - VaA53*VaLCA1*k8 - VaA536*VaLCA1*k8 + VaLCA1_APC*k2,
VaA36 => Va36*k7 + Va36_APC*k7 - VaA36*VaLCA1*k8 - VaA36*VaLCA1_APC*k8,
Va36 => -APC*Va36*k1 + HC36*LC*k10 - Va36*k7 - Va36*k9 + Va36_APC*k2 + VaA36*VaLCA1*k8,
VaA3 => Va3*k7 + Va3_APC*k7 - VaA3*VaLCA1*k8 - VaA3*VaLCA1_APC*k8,
Va5_APC => APC*Va5*k1 - Va5_APC*k2 - Va5_APC*k3 - Va5_APC*k6 + Va_APC*k5,
VaA53 => Va53*k7 + Va53_APC*k7 - VaA53*VaLCA1*k8 - VaA53*VaLCA1_APC*k8,
k10 => 0,
HC5 => -HC5*LC*k10 + Va5*k9,
HC3 => -HC3*LC*k10 + Va3*k9,
Va3 => -APC*Va3*k1 + HC3*LC*k10 - Va3*k7 - Va3*k9 + Va3_APC*k2 + VaA3*VaLCA1*k8,
VaLCA1_APC => APC*VaLCA1*k1 + Va36_APC*k7 + Va3_APC*k7 + Va536_APC*k7 + Va53_APC*k7 - VaA3*VaLCA1_APC*k8 - VaA36*VaLCA1_APC*k8 - VaA53*VaLCA1_APC*k8 - VaA536*VaLCA1_APC*k7 - VaLCA1_APC*k2,
k1 => 0,
Va53_APC => APC*Va53*k1 + Va3_APC*k5 - Va53_APC*k2 - Va53_APC*k6 - Va53_APC*k7 + Va5_APC*k3 + VaA53*VaLCA1_APC*k8,
Va53 => -APC*Va53*k1 + HC53*LC*k10 - Va53*k7 - Va53*k9 + Va53_APC*k2 + VaA53*VaLCA1*k8,
HC536 => -HC536*LC*k10 + Va536*k9,
LC => -APC*LC*k1 - HC*LC*k10 - HC3*LC*k10 - HC36*LC*k10 - HC5*LC*k10 - HC53*LC*k10 - HC536*LC*k10 - HC56*LC*k10 + LC_APC*k2 + Va*k9 + Va3*k9 + Va36*k9 + Va5*k9 + Va53*k9 + Va536*k9 + Va56*k9,
Va3_APC => APC*Va3*k1 - Va3_APC*k2 - Va3_APC*k5 - Va3_APC*k6 - Va3_APC*k7 + VaA3*VaLCA1_APC*k8 + Va_APC*k3,
k9 => 0,
HC56 => -HC56*LC*k10 + Va56*k9,
Va5 => -APC*Va5*k1 + HC5*LC*k10 - Va5*k9 + Va5_APC*k2,
LC_APC => APC*LC*k1 - LC_APC*k2,
Va56 => -APC*Va56*k1 + HC56*LC*k10 - Va56*k9 + Va56_APC*k2,
Va_APC => APC*Va*k1 - Va_APC*k2 - Va_APC*k3 - Va_APC*k5,
VaA536 => Va536*k7 + Va536_APC*k7 - VaA536*VaLCA1*k8 - VaA536*VaLCA1_APC*k7,
Va536 => -APC*Va536*k1 + HC536*LC*k10 - Va536*k7 - Va536*k9 + Va536_APC*k2 + VaA536*VaLCA1*k8,
Va36_APC => APC*Va36*k1 - Va36_APC*k2 - Va36_APC*k5 - Va36_APC*k7 + Va3_APC*k6 + VaA36*VaLCA1_APC*k8,
Va536_APC => APC*Va536*k1 + Va36_APC*k5 - Va536_APC*k2 - Va536_APC*k7 + Va53_APC*k6 + Va56_APC*k3 + VaA536*VaLCA1_APC*k7,
k7 => 0,
k8 => 0,
k3 => 0,
k2 => 0,
HC => -HC*LC*k10 + Va*k9,
HC36 => -HC36*LC*k10 + Va36*k9,
HC53 => -HC53*LC*k10 + Va53*k9
]

Reductions:

Interesting
new_vars = fmpq_mpoly[APC + LC_APC + Va36_APC + Va3_APC + Va536_APC + Va53_APC + Va56_APC + Va5_APC + VaLCA1_APC + Va_APC]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[APC + LC_APC + Va36_APC + Va3_APC + Va536_APC + Va53_APC + Va56_APC + Va5_APC + VaLCA1_APC + Va_APC, LC + LC_APC + Va + Va3 + Va36 + Va36_APC + Va3_APC + Va5 + Va53 + Va536 + Va536_APC + Va53_APC + Va56 + Va56_APC + Va5_APC + VaLCA1 + VaLCA1_APC + Va_APC]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[APC + LC_APC + Va36_APC + Va3_APC + Va536_APC + Va53_APC + Va56_APC + Va5_APC + VaLCA1_APC + Va_APC, LC + LC_APC + Va + Va3 + Va36 + Va36_APC + Va3_APC + Va5 + Va53 + Va536 + Va536_APC + Va53_APC + Va56 + Va56_APC + Va5_APC + VaLCA1 + VaLCA1_APC + Va_APC, k1]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[APC + LC_APC + Va36_APC + Va3_APC + Va536_APC + Va53_APC + Va56_APC + Va5_APC + VaLCA1_APC + Va_APC, LC + LC_APC + Va + Va3 + Va36 + Va36_APC + Va3_APC + Va5 + Va53 + Va536 + Va536_APC + Va53_APC + Va56 + Va56_APC + Va5_APC + VaLCA1 + VaLCA1_APC + Va_APC, k1, k2]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[APC, LC + Va + Va3 + Va36 + Va5 + Va53 + Va536 + Va56 + VaLCA1, LC_APC + Va36_APC + Va3_APC + Va536_APC + Va53_APC + Va56_APC + Va5_APC + VaLCA1_APC + Va_APC, k1, k2]
new_system = 
[
-y1*y2*y4 + y3*y5,
-y1*y2*y4 + y3*y5,
y1*y2*y4 - y3*y5,
0,
0
]

Interesting
new_vars = fmpq_mpoly[APC, HC + HC3 + HC36 + HC5 + HC53 + HC536 + HC56 + Va + Va3 + Va36 + Va36_APC + Va3_APC + Va5 + Va53 + Va536 + Va536_APC + Va53_APC + Va56 + Va56_APC + Va5_APC + VaLCA1 + VaLCA1_APC + Va_APC, LC + Va + Va3 + Va36 + Va5 + Va53 + Va536 + Va56 + VaLCA1, LC_APC + Va36_APC + Va3_APC + Va536_APC + Va53_APC + Va56_APC + Va5_APC + VaLCA1_APC + Va_APC, k1, k2]
new_system = 
[
-y1*y3*y5 + y4*y6,
0,
-y1*y3*y5 + y4*y6,
y1*y3*y5 - y4*y6,
0,
0
]

Interesting
new_vars = fmpq_mpoly[APC, HC + HC3 + HC36 + HC5 + HC53 + HC536 + HC56 + Va + Va3 + Va36 + Va36_APC + Va3_APC + Va5 + Va53 + Va536 + Va536_APC + Va53_APC + Va56 + Va56_APC + Va5_APC + VaLCA1 + VaLCA1_APC + Va_APC, LC + Va + Va3 + Va36 + Va5 + Va53 + Va536 + Va56 + VaLCA1, LC + LC_APC + Va + Va3 + Va36 + Va36_APC + Va3_APC + Va5 + Va53 + Va536 + Va536_APC + Va53_APC + Va56 + Va56_APC + Va5_APC + VaA3 + VaA36 + VaA53 + VaA536 + Va_APC, LC_APC + Va36_APC + Va3_APC + Va536_APC + Va53_APC + Va56_APC + Va5_APC + VaLCA1_APC + Va_APC, k1, k2]
new_system = 
[
-y1*y3*y6 + y5*y7,
0,
-y1*y3*y6 + y5*y7,
0,
y1*y3*y6 - y5*y7,
0,
0
]

Interesting
new_vars = fmpq_mpoly[APC, HC + HC3 + HC36 + HC5 + HC53 + HC536 + HC56 + Va + Va3 + Va36 + Va36_APC + Va3_APC + Va5 + Va53 + Va536 + Va536_APC + Va53_APC + Va56 + Va56_APC + Va5_APC + VaLCA1 + VaLCA1_APC + Va_APC, LC + Va + Va3 + Va36 + Va5 + Va53 + Va536 + Va56 + VaLCA1, LC + LC_APC + Va + Va3 + Va36 + Va36_APC + Va3_APC + Va5 + Va53 + Va536 + Va536_APC + Va53_APC + Va56 + Va56_APC + Va5_APC + VaA3 + VaA36 + VaA53 + VaA536 + Va_APC, LC_APC + Va36_APC + Va3_APC + Va536_APC + Va53_APC + Va56_APC + Va5_APC + VaLCA1_APC + Va_APC, k1, k10, k2]
new_system = 
[
-y1*y3*y6 + y5*y8,
0,
-y1*y3*y6 + y5*y8,
0,
y1*y3*y6 - y5*y8,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[APC, HC + HC3 + HC36 + HC5 + HC53 + HC536 + HC56 + Va + Va3 + Va36 + Va36_APC + Va3_APC + Va5 + Va53 + Va536 + Va536_APC + Va53_APC + Va56 + Va56_APC + Va5_APC + VaLCA1 + VaLCA1_APC + Va_APC, LC + Va + Va3 + Va36 + Va5 + Va53 + Va536 + Va56 + VaLCA1, LC + LC_APC + Va + Va3 + Va36 + Va36_APC + Va3_APC + Va5 + Va53 + Va536 + Va536_APC + Va53_APC + Va56 + Va56_APC + Va5_APC + VaA3 + VaA36 + VaA53 + VaA536 + Va_APC, LC_APC + Va36_APC + Va3_APC + Va536_APC + Va53_APC + Va56_APC + Va5_APC + VaLCA1_APC + Va_APC, k1, k10, k2, k3]
new_system = 
[
-y1*y3*y6 + y5*y8,
0,
-y1*y3*y6 + y5*y8,
0,
y1*y3*y6 - y5*y8,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[APC, HC + HC3 + HC36 + HC5 + HC53 + HC536 + HC56 + Va + Va3 + Va36 + Va36_APC + Va3_APC + Va5 + Va53 + Va536 + Va536_APC + Va53_APC + Va56 + Va56_APC + Va5_APC + VaLCA1 + VaLCA1_APC + Va_APC, LC + Va + Va3 + Va36 + Va5 + Va53 + Va536 + Va56 + VaLCA1, LC + LC_APC + Va + Va3 + Va36 + Va36_APC + Va3_APC + Va5 + Va53 + Va536 + Va536_APC + Va53_APC + Va56 + Va56_APC + Va5_APC + VaA3 + VaA36 + VaA53 + VaA536 + Va_APC, LC_APC + Va36_APC + Va3_APC + Va536_APC + Va53_APC + Va56_APC + Va5_APC + VaLCA1_APC + Va_APC, k1, k10, k2, k3, k5]
new_system = 
[
-y1*y3*y6 + y5*y8,
0,
-y1*y3*y6 + y5*y8,
0,
y1*y3*y6 - y5*y8,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[APC, HC + HC3 + HC36 + HC5 + HC53 + HC536 + HC56 + Va + Va3 + Va36 + Va36_APC + Va3_APC + Va5 + Va53 + Va536 + Va536_APC + Va53_APC + Va56 + Va56_APC + Va5_APC + VaLCA1 + VaLCA1_APC + Va_APC, LC + Va + Va3 + Va36 + Va5 + Va53 + Va536 + Va56 + VaLCA1, LC + LC_APC + Va + Va3 + Va36 + Va36_APC + Va3_APC + Va5 + Va53 + Va536 + Va536_APC + Va53_APC + Va56 + Va56_APC + Va5_APC + VaA3 + VaA36 + VaA53 + VaA536 + Va_APC, LC_APC + Va36_APC + Va3_APC + Va536_APC + Va53_APC + Va56_APC + Va5_APC + VaLCA1_APC + Va_APC, k1, k10, k2, k3, k5, k6]
new_system = 
[
-y1*y3*y6 + y5*y8,
0,
-y1*y3*y6 + y5*y8,
0,
y1*y3*y6 - y5*y8,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[APC, HC + HC3 + HC36 + HC5 + HC53 + HC536 + HC56 + Va + Va3 + Va36 + Va36_APC + Va3_APC + Va5 + Va53 + Va536 + Va536_APC + Va53_APC + Va56 + Va56_APC + Va5_APC + VaLCA1 + VaLCA1_APC + Va_APC, LC + Va + Va3 + Va36 + Va5 + Va53 + Va536 + Va56 + VaLCA1, LC + LC_APC + Va + Va3 + Va36 + Va36_APC + Va3_APC + Va5 + Va53 + Va536 + Va536_APC + Va53_APC + Va56 + Va56_APC + Va5_APC + VaA3 + VaA36 + VaA53 + VaA536 + Va_APC, LC_APC + Va36_APC + Va3_APC + Va536_APC + Va53_APC + Va56_APC + Va5_APC + VaLCA1_APC + Va_APC, k1, k10, k2, k3, k5, k6, k7]
new_system = 
[
-y1*y3*y6 + y5*y8,
0,
-y1*y3*y6 + y5*y8,
0,
y1*y3*y6 - y5*y8,
0,
0,
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[APC, HC + HC3 + HC36 + HC5 + HC53 + HC536 + HC56 + Va + Va3 + Va36 + Va36_APC + Va3_APC + Va5 + Va53 + Va536 + Va536_APC + Va53_APC + Va56 + Va56_APC + Va5_APC + VaLCA1 + VaLCA1_APC + Va_APC, LC + Va + Va3 + Va36 + Va5 + Va53 + Va536 + Va56 + VaLCA1, LC + LC_APC + Va + Va3 + Va36 + Va36_APC + Va3_APC + Va5 + Va53 + Va536 + Va536_APC + Va53_APC + Va56 + Va56_APC + Va5_APC + VaA3 + VaA36 + VaA53 + VaA536 + Va_APC, LC_APC + Va36_APC + Va3_APC + Va536_APC + Va53_APC + Va56_APC + Va5_APC + VaLCA1_APC + Va_APC, k1, k10, k2, k3, k5, k6, k7, k8]
new_system = 
[
-y1*y3*y6 + y5*y8,
0,
-y1*y3*y6 + y5*y8,
0,
y1*y3*y6 - y5*y8,
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
new_vars = fmpq_mpoly[APC, HC + HC3 + HC36 + HC5 + HC53 + HC536 + HC56 + Va + Va3 + Va36 + Va36_APC + Va3_APC + Va5 + Va53 + Va536 + Va536_APC + Va53_APC + Va56 + Va56_APC + Va5_APC + VaLCA1 + VaLCA1_APC + Va_APC, LC + Va + Va3 + Va36 + Va5 + Va53 + Va536 + Va56 + VaLCA1, LC + LC_APC + Va + Va3 + Va36 + Va36_APC + Va3_APC + Va5 + Va53 + Va536 + Va536_APC + Va53_APC + Va56 + Va56_APC + Va5_APC + VaA3 + VaA36 + VaA53 + VaA536 + Va_APC, LC_APC + Va36_APC + Va3_APC + Va536_APC + Va53_APC + Va56_APC + Va5_APC + VaLCA1_APC + Va_APC, k1, k10, k2, k3, k5, k6, k7, k8, k9]
new_system = 
[
-y1*y3*y6 + y5*y8,
0,
-y1*y3*y6 + y5*y8,
0,
y1*y3*y6 - y5*y8,
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


