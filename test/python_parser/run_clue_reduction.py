
from sympy import QQ
from sympy.polys.rings import xring, vring
from sympy.polys.domains import ZZ
from sympy.polys.orderings import lex
from sympy.polys import Poly
from clue import do_lumping, construct_matrices
from true_parser import read_system
from sparse_polynomial import SparsePolynomial

import sys

###############################################

obss = {
    "BIOMD0000000504.ode" :  [
        ["cFos_P", "cJun_P"],
        ["MMP1_mRNA", "MMP13_mRNA", "TIMP1_mRNA"],
        ["MMP1", "MMP13", "ColFrag"],
        ["JAK1_P", "JNK_P", "cJun_P", "cJun_dimer", "STAT3_P_nuc", "STAT3_P_cyt"]
    ],
    "fceri_ji.ode" : [
        ["S0"],
        ["S2", "S178", "S267", "S77"],
        ["S2 + S178 + S267 + S77"],
        ["S7"],
        ["S1"]
    ],
    "e2.ode" : [
        ["S0"],
        ["S1"]
    ],
    "Barua.ode" : [
        ["aS000"],
        ["aS027"]
    ]
}

if __name__ == "__main__":

    path = sys.argv[1]
    name = path[path.rindex('/')+1:]

    system = read_system("{0}".format(path))

    obs_sets = obss[name]

    for obs_set in obs_sets:
        obs_polys = [SparsePolynomial.from_string(s, system['variables']) for s in obs_set]

        do_lumping(system["equations"], obs_polys)
