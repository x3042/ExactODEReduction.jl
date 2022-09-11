

include("structs/dok_sparsik.jl")

using BloomFilters
using StaticArrays
using Distributions
using Profile


_powersof2 = SA[UInt64(1), UInt64(2), UInt64(4), UInt64(8), UInt64(16),
                UInt64(32), UInt64(64), UInt64(128), UInt64(256), UInt64(512),
                UInt64(1024), UInt64(2048), UInt64(4096), UInt64(8192), UInt64(16384),
                UInt64(32768), UInt64(65536), UInt64(131072), UInt64(262144), UInt64(524288),
                UInt64(1048576), UInt64(2097152), UInt64(4194304), UInt64(8388608), UInt64(16777216),
                UInt64(33554432), UInt64(67108864), UInt64(134217728), UInt64(268435456),
                UInt64(536870912), UInt64(1073741824), UInt64(2147483648), UInt64(4294967296),
                UInt64(8589934592), UInt64(17179869184), UInt64(34359738368), UInt64(68719476736),
                UInt64(137438953472), UInt64(274877906944), UInt64(549755813888), UInt64(1099511627776),
                UInt64(2199023255552), UInt64(4398046511104), UInt64(8796093022208), UInt64(17592186044416),
                UInt64(35184372088832), UInt64(70368744177664), UInt64(140737488355328), UInt64(281474976710656),
                UInt64(562949953421312), UInt64(1125899906842624), UInt64(2251799813685248), UInt64(4503599627370496),
                UInt64(9007199254740992), UInt64(18014398509481984), UInt64(36028797018963968), UInt64(72057594037927936),
                UInt64(144115188075855872), UInt64(288230376151711744), UInt64(576460752303423488), UInt64(1152921504606846976),
                UInt64(2305843009213693952), UInt64(4611686018427387904), UInt64(9223372036854775808)]


function prod_hashed(
    A::DOK_Sparsik{T}, B,
    Ahashes, Bhashes,
    hash2prod::Dict) where {T}

    # we want hash(x, y) == hash(y, x)
    hashpair(x, y) = x + y

    FF = base_ring(A)

    nnz_rows = Int[]

    rows = Dict{Int, Sparsik{T}}()
    for i in A.nnz_rows
        row_vals = Dict{Int, valtype(A)}()
        row_indices = Int[]

        for j in B.nnz_cols
            hp = hashpair(Ahashes[1][i], Bhashes[2][j])
            if haskey(hash2prod, hp)
                product = hash2prod[hp]
            else
                product = inner(A.rows[i], B.cols[j])
                hash2prod[hp] = product
            end

            if !iszero(product)
                push!(row_indices, j)
                row_vals[j] = product
            end
        end

        if !isempty(row_indices)
            push!(nnz_rows, i)
            rows[i] = Sparsik(size(A, 2), A.field, row_indices, row_vals)
        end
    end

    # we can return 0 instead of instantiating new object
    # as long as this method is not a part of interface
    return from_rows(
        size(A, 1), size(B, 2), A.field,
        nnz_rows, rows
    )
end

function do_something_hashed(matrices)
    n = size(first(matrices), 1)
    hashvector = from_dense([i in [1, 3, 5] ? 2^i : 0 for i in 1:n], QQ)
    hash2prod = Dict()

    matrixhashes = []

    for m in matrices
        row2hash, col2hash = Dict(), Dict()
        for idx in m.nnz_rows
            row2hash[idx] = inner(m.rows[idx], hashvector)
        end
        for idx in m.nnz_cols
            col2hash[idx] = inner(m.cols[idx], hashvector)
        end

        push!(matrixhashes, (row2hash, col2hash))
    end

    ans = []
    for (i, lhs) in enumerate(matrices)
        for (j, rhs) in enumerate(matrices)
            push!(
                ans,
                prod_hashed(
                    lhs,
                    rhs,
                    matrixhashes[i],
                    matrixhashes[j],
                    hash2prod)
            )
        end
    end
    ans
end

PREDICTED_ZERO = 0
ACTUAL_ZERO = 0

function fill_bloom(A::DOK_Sparsik, powersof2::Array{UInt64})
    matrixbloom = Dict{Int, UInt64}[
        Dict{Int, UInt64}(),
        Dict{Int, UInt64}()
    ]

    for idx in A.nnz_rows
        bloom = UInt64(0)
        for i in A.rows[idx].nonzero
            bloom |= powersof2[max(1, i % 64)]
        end
        matrixbloom[1][idx] = bloom
    end

    for idx in A.nnz_cols
        bloom = UInt64(0)
        for i in A.cols[idx].nonzero
            bloom |= powersof2[max(1, i % 64)]
        end
        matrixbloom[2][idx] = bloom
    end
    matrixbloom
end

function do_overlap(bv::BloomFilter, bu::BloomFilter)
    tmp = similar(bv.array)
    map!(&, bv.array, bv.array, bu.array)
    #=global PREDICTED_ZERO += Int(count(tmp) == 0)=#
    return count(tmp) != 0
end

function do_overlap(bv::UInt64, bu::UInt64)
    # global PREDICTED_ZERO += (bv & bu == 0)
    return (bv & bu) != 0
end

function prod_bloom(
    A::DOK_Sparsik{T}, B::DOK_Sparsik{T},
    bloomA::Dict{Int, UInt64}, bloomB::Dict{Int, UInt64}) where {T}

    FF = base_ring(A)
    nnz_rows = Int[]
    rows = Dict{Int, Sparsik{T}}()

    for i in A.nnz_rows
        row_vals = Dict{Int, valtype(A)}()
        row_indices = Int[]

        for j in B.nnz_cols
            #=if iszero(inner(A.rows[i], B.cols[j]))
                global ACTUAL_ZERO
                ACTUAL_ZERO += 1
            end=#
            if do_overlap(bloomA[i], bloomB[j])
                product = inner(A.rows[i], B.cols[j])
                if !iszero(product)
                    push!(row_indices, j)
                    row_vals[j] = product
                end
            end
        end

        if !isempty(row_indices)
            push!(nnz_rows, i)
            rows[i] = Sparsik(size(A, 2), A.field, row_indices, row_vals)
        end
    end

    return from_rows(
        size(A, 1), size(B, 2), A.field,
        nnz_rows, rows
    )
end

function do_something_bloom_uint(matrices)
    ans = []
    powersof2 = [UInt64(2)^i for i in 0:63]

    blooms = []
    for m in matrices
        matrixbloom = Dict{Int, UInt64}[
            Dict{Int, UInt64}(),
            Dict{Int, UInt64}()
        ]
        for idx in m.nnz_rows
            bloom = UInt64(0)
            for i in m.rows[idx].nonzero
                bloom |= powersof2[max(1, i % 64)]
            end
            matrixbloom[1][idx] = bloom
        end
        for idx in m.nnz_cols
            bloom = UInt64(0)
            for i in m.cols[idx].nonzero
                bloom |= powersof2[max(1, i % 64)]
            end
            matrixbloom[2][idx] = bloom
        end
        push!(blooms, matrixbloom)
    end

    global justbloom
    @savetime for (i, lhs) in enumerate(matrices)
        for (j, rhs) in enumerate(matrices)
            push!(ans, prod_bloom(lhs, rhs, blooms[i][1], blooms[j][2]))
        end
    end justbloom

    ans
end


function do_something_bloom_bloom(matrices)
    ans = []

    blooms = []
    @info "construct blooms"
    for m in matrices
        matrixbloom = [
            Dict{Int, BloomFilter}(),
            Dict{Int, BloomFilter}()
        ]
        for idx in m.nnz_rows
            bloom = BloomFilter(16, 0.1, 1)
            for i in m.rows[idx].nonzero
                add!(bloom, i)
            end
            matrixbloom[1][idx] = bloom
        end
        for idx in m.nnz_cols
            bloom = BloomFilter(16, 0.1, 1)
            for i in m.cols[idx].nonzero
                add!(bloom, i)
            end
            matrixbloom[2][idx] = bloom
        end
        push!(blooms, matrixbloom)
    end


    for (i, lhs) in enumerate(matrices)
        for (j, rhs) in enumerate(matrices)
            push!(ans, prod_bloom(lhs, rhs, blooms[i], blooms[j]))
            global DENS
            push!(DENS, density(last(ans)))
        end
    end

    ans
end


function hashmatrix(matrix, bloom)
    a = [UInt64(0) for _ in 1:64]
    for i in matrix.nnz_rows
        a[max(i%64, 1)] = bloom[1][i]
    end
    b = [UInt64(0) for _ in 1:64]
    for i in matrix.nnz_cols
        b[max(i%64, 1)] = bloom[2][i]
    end
    [a, b]
end


function hashmatrix_2(matrix, bloom)
    a = UInt64(0)
    for i in matrix.nnz_rows
        a |= bloom[1][i]
    end
    b = UInt64(0)
    for i in matrix.nnz_cols
        b |= bloom[2][i]
    end
    [a, b]
end

function hashmatrix_3(matrix, bloom)
    a = [UInt64(0), UInt64(0), UInt64(0), UInt64(0)]
    for i in matrix.nnz_rows
        a[max((i-1)%4+1)] |= bloom[1][i]
    end
    b = [UInt64(0), UInt64(0), UInt64(0), UInt64(0)]
    for i in matrix.nnz_cols
        b[max((i-1)%4+1)] |= bloom[2][i]
    end
    [a, b]
end

function do_overlap(bv::Array{UInt64}, bu::Array{UInt64})
    for i in length(bv)
        for j in length(bu)
            if bv[i] & bu[j] > 0
                return true
            end
        end
    end
    return false
end

function do_something_very_bloom_uint(matrices)
    ans = []
    powersof2 = [UInt64(2)^i for i in 0:63]

    blooms = [
        fill_bloom(m, powersof2)
        for m in matrices
    ]
    matrices_hashes = [
        hashmatrix_3(m, blooms[i])
        for (i, m) in enumerate(matrices)
    ]


    #println(matrices)
    #println(blooms)
    #println(matrices_hashes)

    global verybloom
    @savetime for (i, lhs) in enumerate(matrices)
        for (j, rhs) in enumerate(matrices)
            # println("overlap=$(do_overlap(matrices_hashes[i][1], matrices_hashes[j][2])) iszero=$(iszero(prod_bloom(lhs, rhs, blooms[i][1], blooms[j][2])))")
            if do_overlap(matrices_hashes[i][1], matrices_hashes[j][2])
                push!(ans, prod_bloom(lhs, rhs, blooms[i][1], blooms[j][2]))
            end
        end
    end verybloom

    ans
end


function do_something(matrices)
    ans = []

    global std
    @savetime for lhs in matrices
        for rhs in matrices
            push!(ans, lhs * rhs)

        end
    end std

    ans
end

actuall = []
predictedd = []
DENStrue = []
DENS = []

verybloom = []
justbloom = []
std = []


function UWU()

    @profile for i in 1:10
        As_std = [
            reconstruct!(from_dense(floor.(Int, abs.(randn(200, 200)) / 2), QQ))
            for _ in 1:10
        ]
        As_verysparse = [
            reconstruct!(from_dense(floor.(Int, abs.(randn(200, 200)) / 3), QQ))
            for _ in 1:10
        ]

        As = [
            As_std As_verysparse
        ]

        @info "stats" length= length(As) size=size(first(As)) density=sum(density.(As))/length(As)

        @info "normal"
        do_something(As)

        # @info "bloom bloom"
        # @time do_something_bloom_bloom(As)

        #global PREDICTED_ZERO = 0
        #global ACTUAL_ZERO = 0

        @info "bloom uint"
        do_something_bloom_uint(As)

        @info "very bloom uint"
        do_something_very_bloom_uint(As)
        #=global actuall
        global predictedd
        push!(actuall, ACTUAL_ZERO)
        push!(predictedd, PREDICTED_ZERO)=#

        println("########")
    end
end

UWU()
