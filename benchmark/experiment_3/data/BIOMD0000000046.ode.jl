Original system:

[
NADH => 2//25*I,
per3 => 13//2500*ArH*coII,
NAD => 3//1000000*NADH*O2 + 20*NADrad*O2 + 40*NADrad*coIII + 9//5*NADrad*per3,
coII => 3//20*ArH*coI,
ArH => 7//10*Ar*NADH,
I => 0,
NADHres => -2//25*I,
NAD2 => 120*NADrad,
super => 20*NADrad*O2,
coI => 18*H2O2*per3 + 40*NADrad*coIII,
NADrad => 7//10*Ar*NADH,
H2O2 => 3//1000000*NADH*O2 + 40*super,
O2 => 3//500*O2g + 40*super,
coIII => 1//10*O2*per2 + 17*per3*super,
Ar => 3//20*ArH*coI + 13//2500*ArH*coII,
O2g => 3//500*O2,
per2 => 9//5*NADrad*per3
]

Reductions:

Interesting
new_vars = fmpq_mpoly[Ar - coII - per3]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[Ar - coII - per3, ArH - NADrad]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[Ar - coII - per3, ArH - NADrad, I]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[Ar - coII - per3, ArH - NADrad, I, NADH]
new_system = 
[
0,
0,
0,
2//25*y3
]


new_vars = fmpq_mpoly[Ar, ArH, H2O2, I, NADH, NADrad, O2, O2g, coI, coII, coIII, per2, per3, super]
new_system = 
[
3//20*y2*y9 + 13//2500*y2*y10,
7//10*y1*y5,
3//1000000*y5*y7 + 40*y14,
0,
2//25*y4,
7//10*y1*y5,
3//500*y8 + 40*y14,
3//500*y7,
18*y3*y13 + 40*y6*y11,
3//20*y2*y9,
1//10*y7*y12 + 17*y13*y14,
9//5*y6*y13,
13//2500*y2*y10,
20*y6*y7
]


new_vars = fmpq_mpoly[Ar, ArH, H2O2, I, NAD, NADH, NADrad, O2, O2g, coI, coII, coIII, per2, per3, super]
new_system = 
[
3//20*y2*y10 + 13//2500*y2*y11,
7//10*y1*y6,
3//1000000*y6*y8 + 40*y15,
0,
3//1000000*y6*y8 + 20*y7*y8 + 40*y7*y12 + 9//5*y7*y14,
2//25*y4,
7//10*y1*y6,
3//500*y9 + 40*y15,
3//500*y8,
18*y3*y14 + 40*y7*y12,
3//20*y2*y10,
1//10*y8*y13 + 17*y14*y15,
9//5*y7*y14,
13//2500*y2*y11,
20*y7*y8
]


new_vars = fmpq_mpoly[Ar, ArH, H2O2, I, NAD, NAD2, NADH, NADrad, O2, O2g, coI, coII, coIII, per2, per3, super]
new_system = 
[
3//20*y2*y11 + 13//2500*y2*y12,
7//10*y1*y7,
3//1000000*y7*y9 + 40*y16,
0,
3//1000000*y7*y9 + 20*y8*y9 + 40*y8*y13 + 9//5*y8*y15,
120*y8,
2//25*y4,
7//10*y1*y7,
3//500*y10 + 40*y16,
3//500*y9,
18*y3*y15 + 40*y8*y13,
3//20*y2*y11,
1//10*y9*y14 + 17*y15*y16,
9//5*y8*y15,
13//2500*y2*y12,
20*y8*y9
]


