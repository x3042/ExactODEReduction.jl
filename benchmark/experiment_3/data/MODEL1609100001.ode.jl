Original system:

[
s1 => -83//1000*s1 + 1//20*s2 + 24//25*s6,
s6 => 0,
s2 => 1//20*s1 - 3//50*s2,
s3 => 1//100*s2 - 1//100*s3,
s8 => 33//1000*s1,
s4 => 1//100*s3 - 1//200*s4,
s5 => 1//200*s4
]

Reductions:


new_vars = fmpq_mpoly[s6]
new_system = 
[
0
]


new_vars = fmpq_mpoly[s1, s2, s6]
new_system = 
[
-83//1000*y1 + 1//20*y2 + 24//25*y3,
1//20*y1 - 3//50*y2,
0
]


new_vars = fmpq_mpoly[s1, s2, s3, s6]
new_system = 
[
-83//1000*y1 + 1//20*y2 + 24//25*y4,
1//20*y1 - 3//50*y2,
1//100*y2 - 1//100*y3,
0
]


new_vars = fmpq_mpoly[s1, s2, s3, s4, s6]
new_system = 
[
-83//1000*y1 + 1//20*y2 + 24//25*y5,
1//20*y1 - 3//50*y2,
1//100*y2 - 1//100*y3,
1//100*y3 - 1//200*y4,
0
]


new_vars = fmpq_mpoly[s1, s2, s3, s4, s5, s6]
new_system = 
[
-83//1000*y1 + 1//20*y2 + 24//25*y6,
1//20*y1 - 3//50*y2,
1//100*y2 - 1//100*y3,
1//100*y3 - 1//200*y4,
1//200*y4,
0
]


