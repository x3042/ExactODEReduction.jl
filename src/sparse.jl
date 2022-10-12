# Definitions of MySparseVector and MySparseMatrix - 
# sparse vector and matrix used in the algorithm.

# MySparseVector and MySparseMatrix are aliases for corresponding
# types from SparseArrays.jl
const MySparseVector{T} = SparseVector{T, Int64} where {T}
const MySparseMatrix{T} = SparseMatrixCSC{T, Int64} where {T}

# MySparseVector & MySparseMatrix work with the following
const supported_domains = [
    (fieldT=QQFieldT, coeffT=QQCoeffT),
    (fieldT=FFFieldT, coeffT=FFCoeffT),
    (fieldT=QQBarFieldT, coeffT=QQBarCoeffT)
]

_sparse_domain_error(field) = throw(DomainError(field, "not supported"))

sizeargs(::Val{:MySparseVector}) = (:n,)
sizeargs(::Val{:MySparseMatrix}) = (:m, :n)

function _apply_function_preserving_sparsity(
        f, 
        A::MySparseVector{D1}, 
        ::Type{D2}) where {D1, D2}
    MySparseVector{D2}(
        size(A, 1),
        copy(nonzeroinds(A)),
        map(f, nonzeros(A))
    )
end

function _apply_function_preserving_sparsity(
        f, 
        A::MySparseMatrix{D1}, 
        ::Type{D2}) where {D1, D2}
    MySparseMatrix{D2}(
        size(A, 1), size(A, 2),
        copy(getcolptr(A)), copy(getrowval(A)),
        map(f, getnzval(A))
    )
end

# define some missing methods
for (op, args) in ((:MySparseVector, (:n, :inds, :vals)),
                    (:MySparseMatrix, (:m, :n, :colptr, :rowval, :nzval)))
    
    n_or_mn = sizeargs(Val(op))

    for domain in supported_domains
        fieldT, coeffT = domain.fieldT, domain.coeffT
        # usually in the code we construct a sparse object from some data
        # and the ground field of its coefficients. 
        # To reflect it, following convenience constructors are introduced
        @eval begin
            function $op($(args...), field::$fieldT)
                $op{$coeffT}($(args...))
            end
        end

        # define 1d and 2d versions of:
        #   zero_sparse_vector,
        #   random_sparse_vector,
        #   unit_sparse_vector,
        @eval begin 
            function zero_sparse_vector($(n_or_mn...), field::$fieldT)
                SparseArrays.spzeros($coeffT, $(n_or_mn...))
            end
            
            function random_sparse_vector($(n_or_mn...), field::$fieldT; density=0.1)
                @assert 0 <= density <= 1
                $coeffT.(SparseArrays.sprand(Int, $(n_or_mn...), density))
            end
            
            function random_sparse_vector(n_or_mn::Tuple, field::$fieldT; density=0.1)
                random_sparse_vector(n_or_mn..., field, density=density)
            end

            function unit_sparse_vector($(n_or_mn...), i, field::$fieldT)
                x = SparseArrays.spzeros($coeffT, $(n_or_mn...))
                x[i] = one($coeffT)
                x
            end
        end
    end

    # dissalow creating sparse vectors 
    # with anything other that supported_domains
    @eval begin
        @noinline ($op)($(args...), field::Any) = _sparse_domain_error(field)
        @noinline (zero_sparse_vector)($(n_or_mn...), field::Any) = _sparse_domain_error(field)
        @noinline (random_sparse_vector)($(n_or_mn...), field::Any; density=0.1) = _sparse_domain_error(field)
        @noinline (unit_sparse_vector)($(n_or_mn...), i, field::Any) = _sparse_domain_error(field)
    end

    # define dim(::MySparseVector) and dim(::MySparseMatrix)
    @eval (dim)(x::$op{T}) where {T} = length(x)

    # define density(::MySparseVector) and density(::MySparseMatrix)
    @eval (density)(x::$op{T}) where {T} = nnz(x) / dim(x)

    # define 1d and 2d versions of:
    #   scale
    #   extend_field
    #   rational_reconstruction
    #   modular_reduction
    @eval begin
        function scale(A::$op{T}, z::T) where {T}
            @inline f(x) = x*z
            _apply_function_preserving_sparsity(f, A, T) 
        end

        function extend_field(A::$op{T1}, F::T2) where {T1, T2}
            @inline f(x) = F(x)
            _apply_function_preserving_sparsity(f, A, spec_elem_type(T2)) 
        end

        function rational_reconstruction(A::$op{FFCoeffT})
            @inline f(x) = rational_reconstruction(BigInt(data(data(x))), BigInt(global_field[].n))
            _apply_function_preserving_sparsity(f, A, QQCoeffT) 
        end
        
        function modular_reduction(A::$op{QQCoeffT}, field)
            @inline f(x) = FFCoeffT(modular_reduction(x, field))
            _apply_function_preserving_sparsity(f, A, FFCoeffT) 
        end
    end

end

# peculiar base_ring definition
Nemo.base_ring(x::MySparseMatrix{QQCoeffT}) = Nemo.QQ
Nemo.base_ring(x::MySparseMatrix{FFCoeffT}) = global_field[]
Nemo.base_ring(x::MySparseMatrix{QQBarCoeffT}) = Nemo.QQBar
Nemo.base_ring(x::MySparseVector{QQCoeffT}) = Nemo.QQ
Nemo.base_ring(x::MySparseVector{FFCoeffT}) = global_field[]
Nemo.base_ring(x::MySparseVector{QQBarCoeffT}) = Nemo.QQBar

# dictionary representation to three-arrays representation
function coo_to_arrays(coo::Dict{T, U}) where {T, U}
    xys = collect(keys(coo))
    xs = map(first, xys)
    ys = map(last, xys)
    vs = [coo[xy] for xy in xys]
    xs, ys, vs
end

# dictionary representation to three-arrays representation
function coo_to_arrays(coo::Vector{T}) where {T}
    xs = [xyv[1] for xyv in coo]
    ys = [xyv[2] for xyv in coo]
    vs = [xyv[3] for xyv in coo]
    xs, ys, vs
end

# extract the index of the first nonzero
# from the matrix data (column-major order)
function first_nonzero(m, n, colptr, rowval)
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

# the index of the first nonzero (column-major order)
function first_nonzero(A::MySparseMatrix{T}) where {T}
    if iszero(A)
        return -1
    end
    first_nonzero(
        size(A, 1), 
        size(A, 2), 
        getcolptr(A),
        getrowval(A)
    )
end

# the index of the first nonzero
function first_nonzero(A::MySparseVector{T}) where {T}
    if iszero(A)
        return -1
    end
    first(nonzeroinds(A))
end

# return true if A[I] is a structural nonzero in A
# and false otherwise
function issetindex(A::MySparseMatrix{T}, I...) where {T}
    i0, i1 = Base._to_subscript_indices(A, I...)
    @boundscheck checkbounds(A, i0, i1)
    r1 = Int(getcolptr(A)[i1])
    r2 = Int(getcolptr(A)[i1+1]-1)
    (r1 > r2) && return false
    r1 = searchsortedfirst(rowvals(A), i0, r1, r2, Base.Forward)
    ((r1 > r2) || (rowvals(A)[r1] != i0)) ? false : true
end

function issetindex(x::MySparseVector{T}, i::Integer) where {T}
    m = nnz(x) 
    nzind = nonzeroinds(x)
    nzval = nonzeros(x)
    ii = searchsortedfirst(nzind, i)
    (ii <= m && nzind[ii] == i) ? true : false
end

# functions below are (partly) copied from SparseArrays v1.8

function mydot(x::MySparseVector{T}, y::MySparseVector{T}) where {T}
    x === y && return sum(abs2, x)
    n = length(x)
    length(y) == n || throw(DimensionMismatch())

    xnzind = nonzeroinds(x)
    ynzind = nonzeroinds(y)
    xnzval = nonzeros(x)
    ynzval = nonzeros(y)

    _myspdot(dot,
           1, length(xnzind), xnzind, xnzval,
           1, length(ynzind), ynzind, ynzval)
end

function _myspdot(f::Function,
                xj::Int, xj_last::Int, xnzind, xnzval,
                yj::Int, yj_last::Int, ynzind, ynzval)
    # dot product between ranges of non-zeros,
    s = f(zero(eltype(xnzval)), zero(eltype(ynzval)))
    @inbounds while xj <= xj_last && yj <= yj_last
        ix = xnzind[xj]
        iy = ynzind[yj]
        if ix == iy
            s += f(xnzval[xj], ynzval[yj])
            xj += 1
            yj += 1
        elseif ix < iy
            xj += 1
        else
            yj += 1
        end
    end
    s
end
