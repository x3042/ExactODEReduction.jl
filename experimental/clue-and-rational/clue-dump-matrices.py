from sympy import vring, QQ, FractionField
from clue import FODESystem, SparsePolynomial, RationalFunction

varnames = [
    'x1', 'x2', 'x3', 'x4', 'x5', 
    'x6', 'x7', 'x8', 'x9', 'x10', 
    'x11', 'x12', 'x13', 'x14', 'x15', 
    'x16', 'x17', 'x18', 'x19', 'x20', 
    'x21', 'x22', 'x23', 'x24', 'x25', 
    'x26', 'x27', 'x28', 'x29', 'x30', 
    'x31', 'x32',
]
parnames = [
    'k1', 'k2', 'k3', 'k4', 'k5', 'k6', 
    'k7', 'k8', 'k9', 'k10', 'k11', 'k12', 
    'k13', 'k14', 'k15', 'k16', 'k17', 'k18', 
    'k19', 'k20', 'k21', 'k22', 'k23', 'k24', 
    'k25', 'k26', 'k27', 'k28', 'k29', 'k30', 
    'k31', 'k32', 'k33', 'k34', 'k35', 'k36', 
    'k37', 'k38', 'k39', 'k40', 'k41', 'k42', 
    'k43', 'k44', 'k45', 'k46', 'k47', 'k48',
]

ff = FractionField(QQ, parnames)
R = vring(varnames, ff)

fin = open("./ode.txt", "r")
lines = []
for r in fin.readlines():
    if r.strip() != "":
        r = r.strip('\t').strip('\n')
        s = r.find('=')
        lines.append(r[s+1:])
fin.close()

eqs = [
    RationalFunction.from_string(line, varnames + parnames)
    for line in lines
]
# eqs = eqs + [
#     RationalFunction.from_string("0", varnames + parnames) 
#     for _ in range(len(parnames))
# ]

system = FODESystem(eqs, variables = varnames)

print(system.variables)
print(system.pars)
print(system.equations)

fout = open("./matrices.txt", "w")
matrices = system.construct_matrices("random")
for m in matrices:
    s = m.pretty_print()
    fout.write(s + "\n==============\n")
