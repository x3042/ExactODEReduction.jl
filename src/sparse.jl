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
    # with anything other that `supported_domains`
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
function coo_dict_to_arrays(coo::Dict{T, U}) where {T, U}
    xys = collect(keys(coo))
    xs = map(first, xys)
    ys = map(last, xys)
    vs = [coo[xy] for xy in xys]
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

