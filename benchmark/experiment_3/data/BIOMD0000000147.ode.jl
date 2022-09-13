Original system:

[
IkBaNFkB_cytoplasm => 3//40*IkBaIKKNFkB + 207//250*IkBaNFkB_nucleus + 30*IkBa_cytoplasm*NFkB_cytoplasm,
IkBe_mRNA => 381//12500000*source,
source => 0,
IkBaIKK => 27//20*IKK*IkBa_cytoplasm + 3//50000*IkBaIKKNFkB,
IkBaIKKNFkB => 111//10*IKK*IkBaNFkB_cytoplasm + 30*IkBaIKK*NFkB_cytoplasm,
IkBa_mRNA => 99//25*NFkB_nucleus + 231//1250000*source,
IkBbNFkB_cytoplasm => 21//200*IkBbIKKNFkB + 207//500*IkBbNFkB_nucleus + 30*IkBb_cytoplasm*NFkB_cytoplasm,
IkBb_nucleus => 3//50000*IkBbNFkB_nucleus + 9//500*IkBb_cytoplasm,
SINK => -3//25*IkBa_cytoplasm - 21//1250*IkBa_mRNA - 3//25*IkBa_nucleus - 9//50*IkBb_cytoplasm - 21//1250*IkBb_mRNA - 9//50*IkBb_nucleus - 9//50*IkBe_cytoplasm - 21//1250*IkBe_mRNA - 9//50*IkBe_nucleus,
IkBaNFkB_nucleus => 30*IkBa_nucleus*NFkB_nucleus,
IkBbIKK => 9//25*IKK*IkBb_cytoplasm + 3//50000*IkBbIKKNFkB,
IkBb_mRNA => 267//6250000*source,
IkBeNFkB_cytoplasm => 21//200*IkBeIKKNFkB + 207//500*IkBeNFkB_nucleus + 30*IkBe_cytoplasm*NFkB_cytoplasm,
IkBeIKK => 27//50*IKK*IkBe_cytoplasm + 3//50000*IkBeIKKNFkB,
IkBbNFkB_nucleus => 30*IkBb_nucleus*NFkB_nucleus,
IkBb_cytoplasm => 21//200*IkBbIKK + 3//50000*IkBbNFkB_cytoplasm + 153//625*IkBb_mRNA + 3//250*IkBb_nucleus,
IkBa_nucleus => 3//50000*IkBaNFkB_nucleus + 9//500*IkBa_cytoplasm,
IkBeIKKNFkB => 21//5*IKK*IkBeNFkB_cytoplasm + 30*IkBeIKK*NFkB_cytoplasm,
IkBe_nucleus => 3//50000*IkBeNFkB_nucleus + 9//500*IkBe_cytoplasm,
IkBa_cytoplasm => 3//40*IkBaIKK + 3//50000*IkBaNFkB_cytoplasm + 153//625*IkBa_mRNA + 3//250*IkBa_nucleus,
IkBbIKKNFkB => 72//25*IKK*IkBbNFkB_cytoplasm + 30*IkBbIKK*NFkB_cytoplasm,
IkBe_cytoplasm => 21//200*IkBeIKK + 3//50000*IkBeNFkB_cytoplasm + 153//625*IkBe_mRNA + 3//250*IkBe_nucleus,
NFkB_nucleus => 3//25000*IkBaNFkB_nucleus + 3//25000*IkBbNFkB_nucleus + 3//25000*IkBeNFkB_nucleus + 27//5*NFkB_cytoplasm,
IKK => 147//1000*IkBaIKK + 87//200*IkBaIKKNFkB + 129//1000*IkBbIKK + 9//40*IkBbIKKNFkB + 141//1000*IkBeIKK + 57//200*IkBeIKKNFkB,
IkBeNFkB_nucleus => 30*IkBe_nucleus*NFkB_nucleus,
NFkB_cytoplasm => 18003//50000*IkBaIKKNFkB + 3//25000*IkBaNFkB_cytoplasm + 6003//50000*IkBbIKKNFkB + 3//25000*IkBbNFkB_cytoplasm + 9003//50000*IkBeIKKNFkB + 3//25000*IkBeNFkB_cytoplasm + 3//625*NFkB_nucleus
]

Reductions:

Interesting
new_vars = fmpq_mpoly[IkBb_mRNA - 178//127*IkBe_mRNA]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[IkBb_mRNA - 178//127*IkBe_mRNA, source]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[IkBb_mRNA, IkBe_mRNA, source]
new_system = 
[
267//6250000*y3,
381//12500000*y3,
0
]


new_vars = fmpq_mpoly[IKK, IkBaIKK, IkBaIKKNFkB, IkBaNFkB_cytoplasm, IkBaNFkB_nucleus, IkBa_cytoplasm, IkBa_mRNA, IkBa_nucleus, IkBbIKK, IkBbIKKNFkB, IkBbNFkB_cytoplasm, IkBbNFkB_nucleus, IkBb_cytoplasm, IkBb_mRNA, IkBb_nucleus, IkBeIKK, IkBeIKKNFkB, IkBeNFkB_cytoplasm, IkBeNFkB_nucleus, IkBe_cytoplasm, IkBe_mRNA, IkBe_nucleus, NFkB_cytoplasm, NFkB_nucleus, source]
new_system = 
[
147//1000*y2 + 87//200*y3 + 129//1000*y9 + 9//40*y10 + 141//1000*y16 + 57//200*y17,
27//20*y1*y6 + 3//50000*y3,
111//10*y1*y4 + 30*y2*y23,
3//40*y3 + 207//250*y5 + 30*y6*y23,
30*y8*y24,
3//40*y2 + 3//50000*y4 + 153//625*y7 + 3//250*y8,
99//25*y24 + 231//1250000*y25,
3//50000*y5 + 9//500*y6,
9//25*y1*y13 + 3//50000*y10,
72//25*y1*y11 + 30*y9*y23,
21//200*y10 + 207//500*y12 + 30*y13*y23,
30*y15*y24,
21//200*y9 + 3//50000*y11 + 153//625*y14 + 3//250*y15,
267//6250000*y25,
3//50000*y12 + 9//500*y13,
27//50*y1*y20 + 3//50000*y17,
21//5*y1*y18 + 30*y16*y23,
21//200*y17 + 207//500*y19 + 30*y20*y23,
30*y22*y24,
21//200*y16 + 3//50000*y18 + 153//625*y21 + 3//250*y22,
381//12500000*y25,
3//50000*y19 + 9//500*y20,
18003//50000*y3 + 3//25000*y4 + 6003//50000*y10 + 3//25000*y11 + 9003//50000*y17 + 3//25000*y18 + 3//625*y24,
3//25000*y5 + 3//25000*y12 + 3//25000*y19 + 27//5*y23,
0
]


