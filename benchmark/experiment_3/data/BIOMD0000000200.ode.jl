Original system:

[
TTWAAp => -8460000*B*TTWAAp + 32007//1000000*TTWAA - 42300000*TTWAAp*Y,
TTW => -1410000*AA*TTW + 1410000*TT*W - 1410000*TTW*W - 1410000*TTW*WAA - 10293//2000000*TTW + 102507//100*TTWAA + 72051//1000000*TTWW + 564//625*TTWWAA,
TTWWAAp => -8460000*B*TTWWAAp + 4371//200*TTWWAA - 42300000*TTWWAAp*Y,
WWAA => 8460000*B*WWAAp - 1410000*TT*WWAA + 32289//1000000*TTWWAA + 1410000*W*WAA - 175827//1000000*WWAA + 42300000*WWAAp*Y,
WWAAp => -8460000*B*WWAAp + 32007//1000000*WWAA - 42300000*WWAAp*Y,
Bp => 8460000*AAp*B + 8460000*B*TTAAp + 8460000*B*TTWAAp + 8460000*B*TTWWAAp + 8460000*B*WAAp + 8460000*B*WWAAp - 987//2000*Bp,
TTWWAA => 1410000*AA*TTWW + 8460000*B*TTWWAAp + 1410000*TT*WWAA + 1410000*TTW*WAA + 1410000*TTWAA*W - 229476200967//10000000000*TTWWAA + 42300000*TTWWAAp*Y,
WAA => 1410000*AA*W + 8460000*B*WAAp - 1410000*TT*WAA - 1410000*TTW*WAA + 41877//100*TTWAA + 564//625*TTWWAA - 1410000*W*WAA - 111531//2500000*WAA + 42300000*WAAp*Y + 7191//50000*WWAA,
Y => -42300000*AAp*Y - 42300000*TTAAp*Y - 42300000*TTWAAp*Y - 42300000*TTWWAAp*Y - 42300000*WAAp*Y - 42300000*WWAAp*Y - 4371//2500000*Y + 705000*Yp*Z + 5217//100000*Yp,
W => -1410000*AA*W - 1410000*TT*W - 1410000*TTAA*W - 1410000*TTW*W + 10293//2000000*TTW - 1410000*TTWAA*W + 23829//250000*TTWAA + 72051//1000000*TTWW + 110967//10000000000*TTWWAA - 1410000*W*WAA + 63027//5000000*WAA + 7191//50000*WWAA,
AA => -1410000*AA*TT - 1410000*AA*TTW - 1410000*AA*TTWW - 1410000*AA*W - 32007//1000000*AA + 8460000*AAp*B + 42300000*AAp*Y + 55413//1000*TTAA + 102507//100*TTWAA + 987//6250*TTWWAA + 63027//5000000*WAA,
B => -8460000*AAp*B - 8460000*B*TTAAp - 8460000*B*TTWAAp - 8460000*B*TTWWAAp - 8460000*B*WAAp - 8460000*B*WWAAp + 987//2000*Bp,
TTWW => -1410000*AA*TTWW + 1410000*TTW*W - 72051//1000000*TTWW + 987//6250*TTWWAA,
AAp => 32007//1000000*AA - 8460000*AAp*B - 42300000*AAp*Y,
WAAp => -8460000*B*WAAp + 32007//1000000*WAA - 42300000*WAAp*Y,
TT => -1410000*AA*TT - 1410000*TT*W - 1410000*TT*WAA - 1410000*TT*WWAA + 55413//1000*TTAA + 10293//2000000*TTW + 41877//100*TTWAA + 32289//1000000*TTWWAA,
TTAAp => -8460000*B*TTAAp + 32007//1000000*TTAA - 42300000*TTAAp*Y,
TTAA => 1410000*AA*TT + 8460000*B*TTAAp - 1410000*TTAA*W - 55445007//1000000*TTAA + 42300000*TTAAp*Y + 23829//250000*TTWAA,
TTWAA => 1410000*AA*TTW + 8460000*B*TTWAAp + 1410000*TT*WAA + 1410000*TTAA*W - 1410000*TTWAA*W - 1443967323//1000000*TTWAA + 42300000*TTWAAp*Y + 110967//10000000000*TTWWAA,
Yp => 42300000*AAp*Y + 42300000*TTAAp*Y + 42300000*TTWAAp*Y + 42300000*TTWWAAp*Y + 42300000*WAAp*Y + 42300000*WWAAp*Y + 4371//2500000*Y - 705000*Yp*Z - 5217//100000*Yp,
Z => 0
]

Reductions:

Interesting
new_vars = fmpq_mpoly[AA + AAp + TTAA + TTAAp + TTWAA + TTWAAp + TTWWAA + TTWWAAp + WAA + WAAp + WWAA + WWAAp]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[AA + AAp + TTAA + TTAAp + TTWAA + TTWAAp + TTWWAA + TTWWAAp + WAA + WAAp + WWAA + WWAAp, B + Bp]
new_system = 
[
0,
0
]

Interesting
new_vars = fmpq_mpoly[AA + AAp + TTAA + TTAAp + TTWAA + TTWAAp + TTWWAA + TTWWAAp + WAA + WAAp + WWAA + WWAAp, B + Bp, TT + TTAA + TTAAp - TTWW - TTWWAA - TTWWAAp - W - WAA - WAAp - 2*WWAA - 2*WWAAp]
new_system = 
[
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[AA + AAp + TTAA + TTAAp + TTWAA + TTWAAp + TTWWAA + TTWWAAp + WAA + WAAp + WWAA + WWAAp, B + Bp, TT + TTAA + TTAAp + TTW + TTWAA + TTWAAp + TTWW + TTWWAA + TTWWAAp, TTW + TTWAA + TTWAAp + 2*TTWW + 2*TTWWAA + 2*TTWWAAp + W + WAA + WAAp + 2*WWAA + 2*WWAAp]
new_system = 
[
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[AA + AAp + TTAA + TTAAp + TTWAA + TTWAAp + TTWWAA + TTWWAAp + WAA + WAAp + WWAA + WWAAp, B + Bp, TT + TTAA + TTAAp + TTW + TTWAA + TTWAAp + TTWW + TTWWAA + TTWWAAp, TTW + TTWAA + TTWAAp + 2*TTWW + 2*TTWWAA + 2*TTWWAAp + W + WAA + WAAp + 2*WWAA + 2*WWAAp, Y + Yp]
new_system = 
[
0,
0,
0,
0,
0
]

Interesting
new_vars = fmpq_mpoly[AA + AAp + TTAA + TTAAp + TTWAA + TTWAAp + TTWWAA + TTWWAAp + WAA + WAAp + WWAA + WWAAp, B + Bp, TT + TTAA + TTAAp + TTW + TTWAA + TTWAAp + TTWW + TTWWAA + TTWWAAp, TTW + TTWAA + TTWAAp + 2*TTWW + 2*TTWWAA + 2*TTWWAAp + W + WAA + WAAp + 2*WWAA + 2*WWAAp, Y + Yp, Z]
new_system = 
[
0,
0,
0,
0,
0,
0
]

