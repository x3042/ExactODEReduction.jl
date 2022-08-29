
#=
    The File contains `CSR5_Sparsik<T>` and related funcs implementation

    `CSR5_Sparsik` implements `AbstractSparseMatrix` interface
=#


# I HAVE BROKE SOMETHING IN MATRIX-VECTOR MULTIPLICATION,
# SO `apply_vector` DOES NOT WORK NOW

#------------------------------------------------------------------------------

import Base: ==, !=, +, -, *

#------------------------------------------------------------------------------

include("csr_sparsik.jl")

LI = LinearIndices

#using Base

#------------------------------------------------------------------------------

# It is convenient to have 0-based indexing in this file

struct Tile
    bit_flag::OffsetMatrix{Bool}
    y_offset::OffsetVector{Int}
    seg_offset::OffsetVector{Int}
    empty_offset::OffsetVector{Int}
end

Base.iterate(t::Tile, s::Int64) = iterate(map(i -> getfield(t, i), 1:nfields(t)), s)

mutable struct CSR5_Sparsik{T<:Field} <: AbstractSparseMatrix{T}
    # the struct uses the matrix storing strategy described in the article
    # "CSR5: An Efficient Storage Format for Cross-Platform
    #        Sparse Matrix-Vector Multiplication" (‡)
    #
    # The paper (‡) is available at
    # https://arxiv.org/pdf/1503.05032.pdf
    #
    # Моя отрада – мысленный полет
    # По книгам, со страницы на страницу.
    # Зимой за чтеньем быстро ночь пройдет,
    # Тепло по телу весело струится,
    # А если попадется редкий том,
    # От радости я на небе седьмом.
    #

    m::Int
    n::Int

    field::T

    # inherited from CSR_Sparsik
    row_ptr::OffsetVector{Int}
    col_idx::OffsetVector{Int}
    val::OffsetVector{<:FieldElem}

    # newcomers
    ω::Int
    σ::Int
    tile_ptr::OffsetVector{Int}
    tiles::OffsetVector{Tile}
end

#------------------------------------------------------------------------------

Base.size(A::CSR5_Sparsik) = (A.n, A.m)

nnz(A::CSR5_Sparsik) = length(A.val)

issquare(A::CSR5_Sparsik) = A.n == A.m

order(A::CSR5_Sparsik) = A.n

base_ring(v::CSR5_Sparsik) = v.field

#------------------------------------------------------------------------------

# let typemax(Int) == (2^63 - 1) be negative
isneg(x::Int) = x < 0 || x == typemax(x)
rmsign(x::Int) = (x == typemax(x) ? 0 : abs(x))
norm(x::Int) = (x == typemax(x) ? 0 : x)


# Note that a default matrix is linearly iterated column-wise,
# that is, linear iteration over
#   |1  2|
#   |4  8|
# yields [1, 4, 2, 8]
#
# Arrays are stored in a column major order
#

function CSR_to_CSR5(A::CSR_Sparsik)

    m, n = size(A)
    field = base_ring(A)
    row_ptr = OffsetVector(A.row_ptr, Origin(0))
    col_idx = OffsetVector(A.col_idx, Origin(0))
    val = OffsetVector(A.val, Origin(0))

    ω = 4
    σ = 4
    p = ceil(Int, nnz(A) / (ω * σ))

    tile_ptr = OffsetVector(zeros(Int, p + 1), Origin(0))
    for tid in 0 : p
        bnd = tid * ω * σ
        tile_ptr[tid] = searchsortedlast(row_ptr, bnd)
    end
    for tid in 0 : p - 1
        for rid in tile_ptr[tid] : (tile_ptr[tid + 1] - 1)
            if row_ptr[rid] == row_ptr[rid + 1]
                tile_ptr[tid] = - tile_ptr[tid]
                (tile_ptr[tid] == 0) && (tile_ptr[tid] = typemax(Int))
                break
            end
        end
    end

    tiles = OffsetVector(Tile[], Origin(0))

    pos = 1
    for tid in 0 : (p - 2)

        # generating bit_flag
        bit_flag = OffsetArray(fill(false, (ω, σ)), Origin(0, 0))
        bit_flag[1] = true
        for i in pos : length(row_ptr)
            # iterating thorough columns
            idx = row_ptr[i - 1] - tid * (ω * σ)
            if idx > ω * σ
                pos = i
                break
            end
            bit_flag[idx + 1] = true
        end

        # generating y_offset and seg_offset
        y_offset = OffsetVector(zeros(Int, ω), Origin(0))
        seg_offset = OffsetVector(zeros(Int, ω), Origin(0))
        tmp_bit = OffsetVector(fill(false, ω), Origin(0))

        for i in 0 : ω - 1
            for j in 0 : σ - 1
                y_offset[i] = y_offset[i] + bit_flag[j, i]
                tmp_bit[i] = tmp_bit[i] || bit_flag[j, i]
            end
            seg_offset[i] = 1 - tmp_bit[i]
        end
        exclusive_prefix_sum_scan!(y_offset)
        segmented_sum!(seg_offset, tmp_bit)

        # generating empty_offset
        empty_offset = OffsetVector(Int[], Origin(0))
        if isneg(tile_ptr[tid])
            l = reduce(+, bit_flag)
            fill!(resize!(empty_offset, l), 0)
            eid = 0
            for i in 1 : ω * σ
                if bit_flag[i]
                    ptr = tid * ω * σ + i - 1
                    idx = searchsortedlast(row_ptr, ptr)
                    idx -= rmsign(tile_ptr[tid])
                    empty_offset[eid] = idx
                    eid += 1
                end
            end
        end

        push!(tiles, Tile(bit_flag, y_offset, seg_offset, empty_offset))

    end


    CSR5_Sparsik(m, n, field, row_ptr, col_idx, val, ω, σ, tile_ptr, tiles)
end


#------------------------------------------------------------------------------

function Base.prod(A::CSR5_Sparsik, x)
    m, n = size(A)
    ω, σ = A.ω, A.σ
    field = base_ring(A)

    val = A.val
    col_idx = A.col_idx
    tile_ptr = A.tile_ptr

    y = OffsetVector(fill(zero(field), n), Origin(0))

    for (tid, tile) in zip(Iterators.countfrom(0), A.tiles)
        bit_flag, y_offset, seg_offset, empty_offset = tile

        tmp = ZeroBased(fill(zero(field), ω))
        last_tmp = ZeroBased(fill(zero(field), ω))
        RED = false

        for i in 0 : ω - 1
            offset = y_offset[i]
            offset = isneg(tile_ptr[tid]) ? empty_offset[offset] : offset

            sum = zero(field)

            for j in 0 : σ - 1

                ptr = tid * ω * σ + j * ω + i
                sum += val[ptr] * x[col_idx[ptr] + 1]

                # the junction
                if bit_flag[i, j]
                    if RED
                        tmp[i - 1] = sum
                        sum = zero(field)
                        RED = false
                    else
                        y[norm(tile_ptr[tid]) + offset] = sum
                        if ! isneg(tile_ptr[tid])
                            y_offset[i] += 1
                        else
                            empty_offset[y_offset[i]] += 1
                        end

                        sum = zero(field)
                    end
                end

            end

            if i + 1 < ω && !bit_flag[i + 1, σ - 1]
                RED = true
            end
            last_tmp[i] = sum
        end

        fast_segmented_sum!(tmp, seg_offset)

        for i in 0 : ω - 1
            last_tmp[i] += tmp[i]
            if ! isneg(tile_ptr[tid])
                y[min(norm(tile_ptr[tid]) + y_offset[i], 7)] = last_tmp[i]
            else
                y[norm(tile_ptr[tid]) + empty_offset[y_offset[i]]] = last_tmp[i]
            end
        end

    end

    return from_dense(y, field)
end

#------------------------------------------------------------------------------

function exclusive_prefix_sum_scan!(data)
    # the function uses linear indexing,
    # constructing the result inplace

    # strange to see an OffsetVector failing this test
    # hmm..
    Base.has_fast_linear_indexing(data) || throw(DomainError("too slow"))

    tmp = zero(first(data))
    for i in LI(data)
        data[i], tmp = tmp, tmp + data[i]
    end
    data
end

function inclusive_prefix_sum_scan!(data)
    # the function uses linear indexing,
    # constructing the result inplace

    Base.has_fast_linear_indexing(data) || throw(DomainError("too slow"))

    for i in LI(data)
        i == firstindex(data) && continue;
        data[i] += data[i - 1]
    end
    data
end

#------------------------------------------------------------------------------

function fast_segmented_sum!(data, seg_offset)
    # the function implements Algorithm 6 presented in the article (‡)

    LI(data) == LI(seg_offset) || throw(DimensionMismatch("indexing must match"))

    tmp = copy(data)
    inclusive_prefix_sum_scan!(data)

    for i in LI(data)
        data[i] = data[i + seg_offset[i]] - data[i] + tmp[i]
    end

    data
end

#------------------------------------------------------------------------------

function segmented_sum!(data, flag)
    # the function implements Algorithm 2 presented in the article (‡)

    LI(data) == LI(flag) || throw(DimensionMismatch("indexing must match"))

    for i in LI(data)
        if flag[i]
            j = i + 1
            while j <= lastindex(flag) && ! flag[j]
                data[i] += data[j]
                j += 1
            end
        else
            data[i] = zero(data[i])
        end
    end

    data
end

#------------------------------------------------------------------------------

A = [1 0 2 3 0 0 4 5;
     0 1 0 2 0 0 0 0;
     0 0 0 0 0 0 0 0;
     1 2 3 4 5 0 6 7;
     0 1 0 2 0 3 0 0;
     1 2 0 0 0 0 0 0;
     0 1 2 3 4 5 6 7;
     1 2 3 4 5 6 7 8;]

A_csr = dense_to_CSR(A, QQ);

A_csr5 = CSR_to_CSR5(A_csr)
