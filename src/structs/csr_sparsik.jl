
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

ZeroBased(arr::Array) = OffsetArray(arr, Origin(0))
ZeroBased(T::Type) = OffsetArray(T[], Origin(0))

#------------------------------------------------------------------------------

# It is convenient to have 0-based indexing in this file

# T
mutable struct CSR_Sparsik{T<:Field} <: AbstractSparseMatrix{T}
    # The struct implements the `Compressed Sparse Row` storage strategy
    # No amortized algorithms here!

    m::Int
    n::Int

    field::T

    row_ptr::OffsetVector{Int}
    col_idx::OffsetVector{Int}
    val::OffsetVector{<:FieldElem}
end

#------------------------------------------------------------------------------

nnz(A::CSR_Sparsik) = length(A.val)

Base.size(A::CSR_Sparsik) = (A.n, A.m)

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
