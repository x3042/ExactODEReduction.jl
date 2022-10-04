
const MySparseVector{T} = SparseVector{T, Int64} where {T}
const MySparseMatrix{T} = SparseMatrixCSC{T, Int64} where {T}

function MySparseVector(sz, nnzinds, nnzvals, field::QQField)
    MySparseVector{QQCoeff}(sz, nnzinds, nnzvals)
end
function MySparseVector(sz, nnzinds, nnzvals, field::FFField)
    MySparseVector{FFCoeff}(sz, nnzinds, nnzvals)
end

function MySparseMatrix(m, n, colptr, rowval, nzval, field::QQField)
    MySparseMatrix{QQCoeff}(m, n, colptr, rowval, nzval)
end
function MySparseMatrix(m, n, colptr, rowval, nzval, field::FFField)
    MySparseMatrix{FFCoeff}(m, n, colptr, rowval, nzval)
end

function mysparse(A::MySparseMatrix{T}) where {T}
    sparse(A)
end

function mysparse(A::DOK_Sparsik)
    sparse(to_dense(A))
end

function to_dense(A::MySparseMatrix{T}) where {T}
    collect(A)
end

function first_idx_plain(m, n, colptr, rowval)
    i = 1
    first_nnz_col = 1
    while i <= length(colptr) && colptr[i] == colptr[i + 1]
        i += 1
    end
    if i > 1
        first_nnz_col = i
    end
    (first_nnz_col-1)*m + first(rowval)
end

function first_nonzero(A::MySparseMatrix{T}) where {T}
    if iszero(A)
        return -1
    end
    first_idx_plain(
        size(A, 1), 
        size(A, 2), 
        getcolptr(A),
        getrowval(A)
    )
end

function first_nonzero(A::MySparseVector{T}) where {T}
    if iszero(A)
        return -1
    end
    return first(nonzeroinds(A))
end

function dim(A::MySparseMatrix{T}) where {T}
    length(A)
end

function dim(A::MySparseVector{T}) where {T}
    length(A)
end

function density(A::MySparseMatrix{T}) where {T}
    nnz(A) / dim(A)
end

function density(A::MySparseVector{T}) where {T}
    nnz(A) / dim(A)
end

function rational_reconstruction(A::MySparseMatrix{T}) where {T}
    m, n = size(A)
    new_nzval = Vector{QQCoeff}(undef, nnz(A))
    for (i, x) in enumerate(getnzval(A))
        # TODO: !!!
        y = rational_reconstruction(BigInt(data(data(x))), BigInt(global_field[].n))
        new_nzval[i] = y
    end
    return MySparseMatrix{QQCoeff}(m, n, getcolptr(A), getrowval(A), new_nzval)
end

function modular_reduction(A::MySparseMatrix{T}, field) where {T}
    m, n = size(A)
    new_nzval = Vector{FFCoeff}(undef, 0)
    for (i, x) in enumerate(getnzval(A))
        # TODO: !!!
        y = MyModNumber(modular_reduction(x, field))
        push!(new_nzval, y)
    end
    return MySparseMatrix{FFCoeff}(m, n, getcolptr(A), getrowval(A), new_nzval)
end

function unit_sparsik(n::Integer, i::Integer, field::Nemo.FlintRationalField)
    MySparseVector{QQCoeff}(n, Int[i], [field(1)])
end

function unit_sparsik(n::Integer, i::Integer, field::Nemo.GaloisField)
    MySparseVector{FFCoeff}(n, Int[i], [FFCoeff(1)])
end

function unit_sparsik(n::Tuple{Int, Int}, i::Integer, field)
    @assert false "I should not be called"
    MySparseMatrix(n, Int[i], [field(1)])
end

function zero_sparsik(n::Integer, ground::QQField)
    sparsezero(n, QQCoeff)
end

function zero_sparsik(n::Integer, ground::FFField)
    sparsezero(n, FFCoeff)
end

function zero_sparsik(n::Integer, ground)
    sparsezero(n, elem_type(ground))
end

function sparsezero(m::Integer, n::Integer, eltype)
    MySparseMatrix{eltype}(m, n, ones(Int, n + 1), Int[], Vector{eltype}(undef, 0))
end

function sparsezero(n::Integer, eltype)
    MySparseVector{eltype}(n, Int[], Vector{eltype}(undef, 0))
end

function Nemo.base_ring(v::MySparseMatrix{QQCoeff})
    # if iszero(v)
    #     throw("Beda beda ogorchenie")
    # end
    # parent(first(getnzval(v)))
    Nemo.QQ
end

function Nemo.base_ring(v::MySparseMatrix{FFCoeff})
    global_field[]
end

function Nemo.base_ring(v::MySparseVector{QQCoeff})
    # if iszero(v)
    #     throw("Beda beda ogorchenie")
    # end
    # parent(first(nonzeros(v)))
    Nemo.QQ
end

function Nemo.base_ring(v::MySparseVector{FFCoeff})
    global_field[]
end

function extend_field(A::MySparseMatrix, F)
    m, n = size(A)
    return MySparseMatrix{elem_type(F)}(
        m, 
        n, 
        getcolptr(A), 
        getrowval(A), 
        [F(x) for x in getnzval(A)]
    )
end

function extend_field(v::MySparseVector, F)
    return MySparseVector{elem_type(F)}(
        dim(v), 
        nonzeroinds(v), 
        [F(x) for x in nonzeros(v)]
    )
end

function random_sparsik(sz::Tuple{Int, Int}, field; density=0.1)
    @assert 0 <= density <= 1
    return field.(sprand(Int8, sz..., density))
end

function random_sparsik(sz::Tuple{Int, Int}, field::Nemo.GaloisFmpzField; density=0.1)
    @assert 0 <= density <= 1
    return dropzeros!(MyModNumber.(sprand(Int, sz..., density)))
end

function random_sparsik(sz::Int, field; density=0.1)
    @assert 0 <= density <= 1
    return field.(sprand(Int8, sz, density))
end

function random_sparsik(sz::Int, field::Nemo.GaloisFmpzField; density=0.1)
    @assert 0 <= density <= 1
    return dropzeros!(MyModNumber.(sprand(Int, sz, density)))
end

function random_sparsik(sz::Tuple{Int}, field; density=0.1)
    random_sparsik(sz..., field, density=density)
end