
import LinearAlgebra
import SparseArrays: sparse, nnz

import Base: size

debug() = false

#------------------------------------------------------------------------------

#=  
    SparseBits

    Compressed information about matrix row sparsity.
=#
struct SparseBits
    bits::UInt64
end

# Builds `SparseBits` object from a dense row
function SparseBits(row::Vector{T}) where {T}
    cols = filter(i -> !iszero(row[i]), 1:length(row))
    rows = Int[1, length(cols)+1] 
    debug() && @info "in SparseBits(row)" cols rows
    SparseBits(rows, cols, 1)
end

# Builds `SparseBits` object from a sparse row starting from index i
function SparseBits(rows::Vector{Int}, cols::Vector{Int}, i::Int)
    bits = zero(UInt64)
    for colidx in rows[i]:rows[i+1]-1
        bits |= 1 << cols[colidx]
    end
    debug() && @info "in SparseBits(rows, cols, i)" bitstring(bits)
    SparseBits(bits)
end

# Is dot product of rows with sparse representations x and y equal zero?
function isestimatedzero(x::SparseBits, y::SparseBits)
    iszero(x.bits & y.bits)
end

#------------------------------------------------------------------------------

#=
    MatrixCSR{T}

    Sparse row order matrix with element type `T`.
=#
mutable struct MatrixCSR{T}
    m::Int
    n::Int
    vals::Vector{T}
    cols::Vector{Int}
    rows::Vector{Int}
    bits::Vector{SparseBits}
end

Base.size(x::MatrixCSR) = (x.m, x.n)
SparseArrays.nnz(x::MatrixCSR) = length(x.vals)

# Builds `MatrixCSR` from a dense 2D array
function MatrixCSR{T}(x::Matrix{T}) where {T}
    m, n = size(x)
    vals = Vector{T}(undef, length(x))
    cols = Vector{Int}(undef, length(x))
    rows = Vector{Int}(undef, m + 1)
    bits = Vector{SparseBits}(undef, m)
    pos = 1
    rows[1] = pos
    for i in 1:m
        @inbounds for j in 1:n
            if !iszero(x[i, j])
                vals[pos] = x[i, j]
                cols[pos] = j
                pos += 1
            end
        end
        rows[i+1] = pos
        bits[i] = SparseBits(rows, cols, i)
    end
    resize!(vals, pos - 1)
    resize!(cols, pos - 1)
    MatrixCSR{T}(m, n, vals, cols, rows, bits)
end

#------------------------------------------------------------------------------

#=
    MatrixDC{T}

    Dense column order matrix with element type `T`.
=#
mutable struct MatrixDC{T}
    A::Vector{Vector{T}}      # underlying matrix (dense)
    nnzcols::Vector{Int}      # vector of indices of nonzero columns
    bits::Vector{SparseBits}
end

# assuming the matrix is nonempty
Base.size(x::MatrixDC) = (length(A), length(first(A)))
SparseArrays.nnz(x::MatrixDC) = 200

# Builds `MatrixDC` from a dense 2D array
function MatrixDC{T}(x::Matrix{T}) where {T}
    m, n = size(x)
    nnzcols = findall(i -> !iszero(view(x, 1:m, i)), 1:n)
    A = Vector{Vector{T}}(undef, n)
    bits = Vector{SparseBits}(undef, m)
    for i in 1:n
        A[i] = x[:, i]
        bits[i] = SparseBits(A[i])
    end
    MatrixDC{T}(A, nnzcols, bits)
end

#------------------------------------------------------------------------------

# Returns the estimated number of nonzeros in A*B
function estimatemulsize(n::Int, nnzA::Int, nnzB::Int)
    p = (nnzA / (n^2)) * (nnzB / (n^2))
    p >= 1 ? n^2 : p > 0 ? Int(ceil(-expm1(log1p(-p) * n)*n^2)) : 0 # (1-(1-p)^n)*m*k
end

# Computes dot product <sparse row, dense row>,
# where sparse row is represented with `rows`, `cols`, and `vals`,
# and dense row is `denserow`
function sparsedot(rows::Vector{Int}, vals::Vector{T}, cols::Vector{Int}, 
                        i::Int, denserow::Vector{T}) where {T}
    s = zero(T)
    debug() && @info "" rows[i:i+1] vals[rows[i]:rows[i+1]-1] i denserow
    @inbounds for k in rows[i]:rows[i+1]-1
        s += vals[k] * denserow[cols[k]]
    end
    s
end

# Computes sparse matmul Z = X * Y
#
# Assumes Z has enough capacity to store the result
function matmul!(Z::MatrixCSR{T}, X::MatrixCSR{T}, Y::MatrixDC{T}) where {T}
    m, n = size(X)
    vals = Z.vals
    cols = Z.cols
    rows = Z.rows
    bits = Z.bits
    pos = 1
    rows[1] = pos
    for i in 1:m
        for nnzcol in Y.nnzcols
            debug() && @info "iteration" i nnzcol X.bits[i] Y.bits[nnzcol]
            isestimatedzero(X.bits[i], Y.bits[nnzcol]) && continue
            debug() && @info "isestimatedzero" false
            @inbounds s = sparsedot(X.rows, X.vals, X.cols, i, Y.A[nnzcol])
            debug() && @info "dot product" s
            if !iszero(s)
                @inbounds vals[pos] = s
                @inbounds cols[pos] = nnzcol
                pos += 1
            end
        end
        rows[i+1] = pos
    end
end

function allocatematmul(X::MatrixCSR{T}, Y::MatrixDC{T}) where {T}
    m, n = size(X)
    @assert m == n "Nonsquare matrices are not supported"
    nnzZ = min(estimate_mulsize(n, nnz(X), nnz(Y)) * 11 ÷ 10 + n, n^2)
    debug() && @info "Estimated nonzeros" nnzZ
    rows = Vector{Int}(undef, n + 1)
    cols = Vector{Int}(undef, nnzZ)
    vals = Vector{T}(undef, nnzZ)
    bits = Vector{SparseBits}(undef, n + 1)
    MatrixCSR{T}(m, n, vals, cols, rows, bits)
end

# Returns matmul X*Y
function matmul(X::MatrixCSR{T}, Y::MatrixDC{T}) where {T}
    Z = allocatematmul(X, Y)
    matmul!(Z, X, Y)
    Z
end

#------------------------------------------------------------------------------

function abstorel(m, colidx)
    colidx % m + iszero(colidx % m)
end

#------------------------------------------------------------------------------

n = 60
X, Y = rand(1:100, (n, n)), rand(1:100, (n, n))
X, Y = map(c -> div(c, 95), X), map(c -> div(c, 95), Y)
for i in 1:50
    X[rand(1:n), :] .= 0
    Y[rand(1:n), :] .= 0
end

# X has 0.04 nonzero entries, same as Y
# their product is estimates to have 0.07 nonzero entries

X1, Y1 = MatrixCSR{Int}(X), MatrixDC{Int}(Y)
Z1 = allocatematmul(X1, Y1)

@btime matmul!($Z1, $X1, $Y1)
# 5 μs

X2, Y2 = sparse(X), sparse(Y)
@btime *($X2, $Y2)
# 3 μs
