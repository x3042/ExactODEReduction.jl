Original system:

[
w => 27//50000*ez + 1//250*z,
e => -1000*e*z + 3//4000*ez + 1//250*z,
z => -1000*e*z + 21//100000*ez - 1//250*z,
ez => 1000*e*z - 3//4000*ez
]

Reductions:


new_vars = fmpq_mpoly[e, ez, z]
new_system = 
[
-1000*y1*y3 + 3//4000*y2 + 1//250*y3,
1000*y1*y3 - 3//4000*y2,
-1000*y1*y3 + 21//100000*y2 - 1//250*y3
]


