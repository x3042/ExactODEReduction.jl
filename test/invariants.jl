#=
    The File contains restrict/factorize/lift tests 
=#

cases = [
    (matrices=[
        [1 0 0;
        0 1 0;
        0 0 1;]
    ], 
    subspaces=[
        [[1, 0, 0]],
        [[1, 0, 0],[0, 1, 0]],
    ],
    restricted=[
        [
            reshape([1;;], 1, 1)
        ],
        [
            [1 0;
            0 1;],
        ]
    ],
    factorized=[
        [
            [1 0;
            0 1;]
        ],
        [
            reshape([1;;], 1, 1)
        ]
    ]),
    (matrices=[
        [1 0 0;
        0 2 0;
        0 0 3;]
    ], 
    subspaces=[
        [[1, 0, 0]],
        [[1, 0, 0],[0, 1, 0]],
    ],
    restricted=[
        [
            reshape([1;;], 1, 1)
        ],
        [
            [1 0;
            0 2;],
        ]
    ],
    factorized=[
        [
            [2 0;
            0 3;]
        ],
        [
            reshape([3;;], 1, 1)
        ]
    ]),
    (matrices=[
        [1 2 0;
        3 4 0;
        0 0 5;]
    ], 
    subspaces=[
        [[1, 0, 0],[0, 1, 0]],
        [[0, 0, 1]]
    ],
    restricted=[
        [
            [1 2;
            3 4]
        ],
        [
            reshape([5;;], 1, 1)
        ]
    ],
    factorized=[
        [
            reshape([5;;], 1, 1)
        ],
        [
            [1 2;
            3 4]
        ]
    ]),
    (matrices=[
        [2 0 4;
        0 0 0;
        1 0 2;]
    ], 
    subspaces=[
        [[1, 0, 0], [0, 0, 3]],
        [[2, 0, 1]]
    ],
    restricted=[
        [
            [2   12;
            1//3 2],
        ],
        [
            reshape([4;;], 1, 1)
        ]
    ],
    factorized=[
        [
            reshape([0;;], 1, 1)
        ],
        [
            [0 0;
            0 0]
        ]
    ]),
    (matrices=[
        [0 0 0 1;
        0 0 0 0;
        0 0 0 0;
        1 0 0 0],
        [0 0 0 0;
        0 -1 -2 0;
        0 -3 -4 0;
        0 0 0 0],
    ], 
    subspaces=[
        [[1, 0, 0, 1]],
        [[0, 1, 0, 0], [0, 0, 1, 0]]
    ],
    restricted=[
        [
            reshape([1;;], 1, 1), reshape([0;;], 1, 1)
        ],
        [
            [0 0;
            0 0],
            [-1 -2;
            -3 -4]
        ]
    ],
    factorized=[
        [
            [0 0 0;
            0 0 0;
            0 0 -1],
            [-1 -2 0;
            -3 -4 0;
            0 0 0],
        ],
        [
            [0 1;
            1 0],
            [0 0;
            0 0]
        ]
    ])
]

@testset "Restrict tests" begin
    for case in cases
        matrices = map(m -> sparse(Nemo.QQ.(m)), case.matrices)
        for (subspace, restricted) in zip(case.subspaces, case.restricted)
            subspace = map(v -> sparse(Nemo.QQ.(v)), subspace)
            restricted = map(v -> sparse(Nemo.QQ.(v)), restricted)
            @test ExactODEReduction.restrict(matrices, subspace) == restricted
        end
    end
end

@testset "Factorize tests" begin
    for case in cases
        matrices = map(m -> sparse(Nemo.QQ.(m)), case.matrices)
        for (subspace, factorized) in zip(case.subspaces, case.factorized)
            subspace = map(v -> sparse(Nemo.QQ.(v)), subspace)
            factorized = map(v -> sparse(Nemo.QQ.(v)), factorized)
            @test ExactODEReduction.factorize(matrices, subspace) == factorized
        end
    end
end
