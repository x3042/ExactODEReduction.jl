Original system:

[
s1 => -1//8*s1 + 3//40*s2 + 24//25*s6,
s6 => 0,
s2 => 1//40*s1 - 17//200*s2,
s3 => 1//100*s2 - 1//100*s3,
s8 => 1//10*s1,
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
-1//8*y1 + 3//40*y2 + 24//25*y3,
1//40*y1 - 17//200*y2,
0
]


new_vars = fmpq_mpoly[s1, s2, s3, s6]
new_system = 
[
-1//8*y1 + 3//40*y2 + 24//25*y4,
1//40*y1 - 17//200*y2,
1//100*y2 - 1//100*y3,
0
]


new_vars = fmpq_mpoly[s1, s2, s3, s4, s6]
new_system = 
[
-1//8*y1 + 3//40*y2 + 24//25*y5,
1//40*y1 - 17//200*y2,
1//100*y2 - 1//100*y3,
1//100*y3 - 1//200*y4,
0
]


new_vars = fmpq_mpoly[s1, s2, s3, s4, s5, s6]
new_system = 
[
-1//8*y1 + 3//40*y2 + 24//25*y6,
1//40*y1 - 17//200*y2,
1//100*y2 - 1//100*y3,
1//100*y3 - 1//200*y4,
1//200*y4,
0
]


