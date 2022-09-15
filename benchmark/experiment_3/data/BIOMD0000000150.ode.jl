Original system:

[
Cdk2 => 1//40000000000*CDK2cycA - 19//1000000*Cdk2*CyclinA,
CDK2cycA => -25813//1000000000000000*CDK2cycA + 557//1000000000000000*CDK2cycA_star_ + 19//1000000*Cdk2*CyclinA,
CyclinA => 1//40000000000*CDK2cycA - 19//1000000*Cdk2*CyclinA,
CDK2cycA_star_ => 813//1000000000000000*CDK2cycA - 557//1000000000000000*CDK2cycA_star_
]

Reductions:

Interesting
new_vars = fmpq_mpoly[CDK2cycA + CDK2cycA_star_ + CyclinA]
new_system = 
[
0
]

Interesting
new_vars = fmpq_mpoly[CDK2cycA + CDK2cycA_star_ + CyclinA, CDK2cycA + CDK2cycA_star_ + Cdk2]
new_system = 
[
0,
0
]


