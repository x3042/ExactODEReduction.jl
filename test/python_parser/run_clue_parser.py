
from python_parser import clue

if __name__ == "__main__":

    internal_repr = construct_matrices(
        list(read_system(sys.argv[1])["equations"])
    )

    matrices = internal_repr

    from functools import reduce
    dicts = [
        matrix.export_as_triples(one_based=True)
        for matrix in matrices
    ]

    print(dicts)
