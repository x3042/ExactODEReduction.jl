
#=
    The File contains `CSR_Sparsik<T>` and related funcs implementation

    `CSR_Sparsik` implements `AbstractSparseMatrix` interface
=#

#------------------------------------------------------------------------------

import Base: ==, !=, +, -, *
import AbstractAlgebra: elem_type, Field, FieldElem, FracField,
                        characteristic
import OffsetArrays: OffsetVector, OffsetArray, OffsetMatrix,
                     Origin, no_offset_view
# interesting import technique
import CustomUnitRanges: filename_for_zerorange

#------------------------------------------------------------------------------

include("dok_sparsik.jl")
include(filename_for_zerorange)

#------------------------------------------------------------------------------

# It is convenient to have 0-based indexing in this file

ZeroBased(arr::Array) = OffsetArray(arr, Origin(0))
ZeroBased(T::Type) = OffsetArray(T[], Origin(0))

#------------------------------------------------------------------------------

# T
mutable struct CSR_Sparsik{T<:Field} <: AbstractSparseMatrix{T}
    # The struct implements the `Compressed Sparse Row` storage strategy
    # No amortized algorithms here!

    m::Int
    n::Int

    field::T

    #
    #
    #
    row_ptr::OffsetVector{Int}
    col_idx::OffsetVector{Int}
    val::OffsetVector{<:FieldElem}
end

#------------------------------------------------------------------------------

nnz(A::CSR_Sparsik) = length(A.val)

Base.size(A::CSR_Sparsik) = (A.m, A.n)
Base.size(A::CSR_Sparsik, i::Int) = (A.m, A.n)[i]

issquare(A::CSR_Sparsik) = A.n == A.m

order(A::CSR_Sparsik) = A.n

ground(v::CSR_Sparsik) = v.field

#------------------------------------------------------------------------------

# constructs a CSR_Sparsik object from the given dense matrix `A`
# while coercing each element into the `field`
function dense_to_CSR(A::AbstractMatrix, field)
    nnz_coords = [
        (idx[1], idx[2], A[idx])
        for idx in findall(!iszero, A)
    ]
    return COO_to_CSR(size(A)..., nnz_coords, field)
end

#------------------------------------------------------------------------------

# constructs a CSR_Sparsik object from the given list of entries of form:
#   nnz_coords = { (x, y, val) }
# where (x, y) stands for the coordinates and val - for the value
# of an entry
function COO_to_CSR(m, n, nnz_coords, field)
    row_ptr = ZeroBased(Int[0])
    col_idx = ZeroBased(Int)
    data = ZeroBased(elem_type(field))

    sort!(nnz_coords)

    j = 1

    for i in 1 : m
        while j <= length(nnz_coords) && nnz_coords[j][1] == i
            push!(col_idx, nnz_coords[j][2] - 1)
            push!(data, field(nnz_coords[j][3]))
            j += 1
        end
        push!(row_ptr, j - 1)
    end

    return CSR_Sparsik(m, n, field, row_ptr, col_idx, data)
end

#------------------------------------------------------------------------------

function __apply_vector_seq(A::CSR_Sparsik, x)
    field = ground(A)
    nnz = Int[]
    data = Dict{Int, elem_type(field)}()

    for i in 1 : A.m
        v = zero(field)
        for j in A.row_ptr[i] : A.row_ptr[i + 1] - 1
            v += A.val[j] * x[A.col_idx[j] + 1]
        end
        if !iszero(v)
            push!(nnz, i)
            data[i] = v
        end
    end

    return Sparsik(A.n, field, nnz, data)
end

function __apply_vector_par(A::CSR_Sparsik, x)
    field = ground(A)
    m, n = size(A)
    y = zeros(field, n)

    @threads for i in 1 : m
        for j in A.row_ptr[i] : A.row_ptr[i + 1] - 1
            y[i] += A.val[j] * x[A.col_idx[j] + 1]
        end
    end

    return from_dense(y, field)
end

# The resulting vectors are dense almost surely
function apply_vector(A::CSR_Sparsik, x; policy=seq)
    field = ground(A)
    m, n = size(A)
    y = zeros(field, n)

    for i in 1 : m
        for j in A.row_ptr[i - 1] : A.row_ptr[i] - 1
            y[i] += A.val[j] * x[A.col_idx[j] + 1]
        end
    end

    return from_dense(y, field)
    error("unknown policy..")
end

#------------------------------------------------------------------------------

Base.iszero(A::CSR_Sparsik) = isempty(A.val)


function first_nonzero(A::CSR_Sparsik)
    if iszero(A)
        return -1
    end

    i = 0
    while A.row_ptr[i] == 0
        i += 1
    end

    return to_plain(size(A), i, A.col_idx[A.row_ptr[i - 1]] + 1)
end


function zero(A::CSR_Sparsik)
    row_ptr = OffsetArray(zeros(Int, size(A, 1) + 1), Origin(0))
    return CSR_Sparsik(
        size(A)...,
        ground(A),
        row_ptr,
        ZeroBased(Int),
        ZeroBased(elem_type(ground(A)))
    )
end


function scale!(A::CSR_Sparsik, c)
    if iszero(c)
        return A = zero(A)
    end

    for i in LinearIndices(A.val)
        A.val[i] *= c
    end

    return A
end

function reduce!(A::CSR_Sparsik{T}, B::CSR_Sparsik{T}, c) where {T}
    field = ground(A)

    val = ZeroBased(elem_type(field))
    col_idx = ZeroBased(Int)
    row_ptr = ZeroBased(Int)

    for ridx in LinearIndices(A.row_ptr)
        begin_i, end_i = A.row_ptr[ridx - 1], A.row_ptr[ridx] - 1
        begin_j, end_j = B.row_ptr[ridx - 1], B.row_ptr[ridx] - 1

        i = begin_i
        j = begin_j
        while i <= end_i || j <= end_j
            if i > end_i
                new_idx = B.col_idx[j]
                j += 1
            elseif j > end_j
                new_idx = A.col_idx[i]
                i += 1
            else
                new_idx = min(A.col_idx[i], B.col_idx[j])
                if A.col_idx[i] > B.col_idx[j]
                    j += 1
                elseif A.col_idx[i] < B.col_idx[j]
                    i += 1
                else
                    i += 1
                    j += 1
                end
            end


            push!(col_idx, new_idx)






        end

    end






end



==(A::CSR_Sparsik{T}, B::CSR_Sparsik{T}) where {T} = (size(A) == size(B) &&
                    A.col_idx == B.col_idx;
                    A.val == B.val;)
