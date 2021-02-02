
include("structs/sparsik.jl")



function main()
    n = 8
    sz = nextpow(2, n)
    power = floor(Int, log2(sz))
    field = GF(13)

    # -----

    hash_vector = random_sparsik(sz, field)
    println()
    println("hash _vector = ")
    print_sparsik(hash_vector)

    vs = [
        from_dense([1, 2, 3, 4, 1, 0, 0, 0], QQ),
        from_dense([0, 1, 1, 1, 0, 0, 1, 0], QQ),
        from_dense([0, 0, 1, 0, 0, 0, 0, 0], QQ)
    ]
    z = length(vs)

    hash_vectors = Dict{Int, Any}()
    hashes = [Dict{Int, Any}() for _ in 1:z]
    for hash

    for t in 0 : (power - 1)
        hash_vectors[t] = Dict(
            i => Sparsik(
                    sz,
                    field,
                    Array(1 : 2^t),
                    Dict(j => hash_vector[j] for j in (i + 1):(i + 2^t))
                )
            for i in 0 : 2^t : (sz - 1)
        )
        for (i, v) in enumerate(vs)
            hashes[i][t + 1] = Dict(
                i => inner(hash_vectors[t][i], v) +
                for i in 0 : 2^t : (sz - 1)
            )
        end
    end




    for (p, split) in hashers
        println("power of 2 = ", p)
        for (i, sp) in split
            println("starting at i = ", i)
            print_sparsik(sp)
        end
        println("----------------")
    end

    t = 4
    hashers[t] = Dict(
        0 => Sparsik(sz, field, Array(1:t), hash_vector[i] for i in 1:t),
        t => Sparsik(sz, field, Array(t:sz), hash_vector[i] for i in 1:t)
    )
    hashers[2] = Dict(
        0 => from_dense([3, 2, 0, 0, 0, 0, 0, 0], QQ),
        2 => from_dense([0, 0, 1, 1, 0, 0, 0, 0], QQ),
        4 => from_dense([0, 0, 0, 0, 2, 3, 0, 0], QQ),
        6 => from_dense([0, 0, 0, 0, 0, 0, 2, 1], QQ)
    )
    hashers[1] = Dict(
        i => unit_sparsik(n, i + 1, QQ) for i in 0 : n - 1
    )
    # ------


    # -----

    f = from_dense([1, 3, 5, 3, 1, 0, 1, 0], QQ)

    pivots = [1, 2, 3]
    ys = [1, 1, 1]

    # -----

    k = n
    i = 0
    while k > 1
        k = div(k, 2)

        hasher = hashers[k][i]
        summed = sum(y * inner(hasher, v) for (y, v) in zip(ys, vs))

        if summed != inner(hasher, f)
            i = i
        else
            i += k
        end

    end

    println()
    println(i)



end

main()
