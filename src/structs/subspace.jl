
#=
    The File contains `Subspace<T>` and related funcs implementation
=#
#------------------------------------------------------------------------------

"""
    Subspace{F, T}

Provides basic linear subspace interface. Parametrized with the type of ground 
field `F` and the vector type `T`.

One can add a vector to the spanning vectors of a `Subspace` instance via `eat_sparsik!` function
or create a subspace from scratch with `linear_span!`
"""
mutable struct Subspace{F, T}
    field::F
    # the echelon form of vectors is an invariant!
    echelon_form::Dict{Int, T}
end

#------------------------------------------------------------------------------

# convenience ctor
function Subspace(field::T) where {T}
    return Subspace(field, Dict{Int, MySparseMatrix{elem_type(field)}}())
end

function Subspace(field::Nemo.GaloisFmpzField)
    return Subspace(field, Dict{Int, MySparseMatrix{MyModNumber}}())
end

# deepcopy redefinition in order to preserve the field
function Base.deepcopy_internal(x::Subspace{T}, stackdict::IdDict) where {T <: AbstractAlgebra.Field}
    y = Subspace(base_ring(x), Base.deepcopy_internal(x.echelon_form, stackdict))
    stackdict[x] = y
    return y
end

#------------------------------------------------------------------------------

# base_ring field!
Nemo.base_ring(v::Subspace) = v.field

#------------------------------------------------------------------------------

# returns basis vectors of V, i.e
# an array of vectors sorted by pivot
function basis(V::Subspace)
    return sort(collect(values(V.echelon_form)), by=first_nonzero)
end

#------------------------------------------------------------------------------

# returns the dimension of the ambient space of V
function ambient_dim(V::Subspace)
    return dim(first(values(V.echelon_form)))
end

# returns the dimension of V
function dim(V::Subspace)
    return length(V.echelon_form)
end

#------------------------------------------------------------------------------

@enum EatCode begin
    reduced = -1
    skipped = -2
end

# adds `new_vector` to the set of spanning vectors of V
# while modifying both
# returns -1 if `new_vector` lies in V, new pivot index otherwise

# O(kR)  if k = nnz(new_vector) and R = Σnnz(v) for v in echelon_form
function eat_sparsik!(V::Subspace, new_vector; ω=1.0)
    # PRobably, we need eat_sparsik( ;verbose) which will return
    # coordinates of new_vector if V basis in case of linear dependency

    # O(kr) if k = nnz(new_vector) and r = len(echelon_form)
    for (piv, vect) in V.echelon_form
        # if haskey(new_vector, piv)
        if !iszero(new_vector[piv])
            # reduce!(new_vector, vect, -new_vector[piv])
            # 1
            new_vector = new_vector - vect .* [new_vector[piv]]
        end
    end

    if iszero(new_vector)
        return reduced
    end

    # it should(must) be optimized somehow
    # O(k)
    if density(new_vector) > ω
        return skipped
    end

    # O(k)
    dropzeros!(new_vector)
        
    pivot = first_nonzero(new_vector)

    # scale!(new_vector, inv(new_vector[pivot]))
    new_vector = new_vector .* [inv(new_vector[pivot])]

    # O(kR)  if k = nnz(new_vector) and R = Σnnz(v) for v in echelon_form
    for (piv, vect) in V.echelon_form
        if !iszero(vect[pivot])
            # reduce!(V.echelon_form[piv], new_vector, -vect[pivot])
            V.echelon_form[piv] = V.echelon_form[piv] - new_vector .* [vect[pivot]]
        end
    end

    V.echelon_form[pivot] = new_vector
    return pivot
end

#------------------------------------------------------------------------------

# returns a new Subspace formed as a linear span
# of the given vectors
function linear_span!(vectors)
    filter!(!iszero, vectors)
    V = Subspace(base_ring(first(vectors)))
    for vect in vectors
        eat_sparsik!(V, vect)
    end
    return V
end

#------------------------------------------------------------------------------

# TODO: !!! fat --> 

# transformes V to the smallest subspace invariant under
# the given matrices and containing the original one
function apply_matrices_inplace!(V::Subspace, matrices; ω=1.)
    fat_vectors = []
    new_pivots = collect(keys(V.echelon_form))
    i = 0

    while !isempty(new_pivots)
        pivots_to_process = sort(deepcopy(new_pivots))
        empty!(new_pivots)

        for pivot in pivots_to_process
            for (vectidx, vect) in enumerate(matrices)
            # [indentation broken]
            #
            # Alex: sparse-dense product
            # 
            #   S × D
            #
            # S is a matrix in CSR format (maybe, absolute column values ?)
            # 
            # D is a matrix in Dense format, but nonzero columns indices are stored
            #
            # for each nnz row rr in S
            #   for each nnz col cc in D
            #       add <rr, cc> to its position in the product 
            #
            # if D is Dense then
            #   <rr, cc> is computed in 
            #   O(nnz(rr)) flops 
            #   O(nnz(rr)) loads
            # if D is Sparse then
            #   <rr, cc> is computed in 
            #   O(min(nnz(rr), nnz(cc))) flops, 
            #   O(nnz(rr) + nnnz(cc)) loads
            #   try first one !
            #
            # matrix --> vector    easily ?
            # solution: CSR with absolute column indides
            # example :
            #   [5, 0, 6]
            #   [0, 0, 7]
            #   [8, 9, 0]
            #
            #   vals = [5, 6, 7, 8, 9]
            #   cols = [1, 3, 3, 1, 2]  (relative)
            #   rows = [1, 3, 4, 4, 6]
            #   cols = [1, 3, 6, 7, 8]  (absolute)
            # 
            # (absolute cols .% n  .+ absolute cols .== n) == relative cols
            # Compute relative cols on the fly, store only absolute ones!
            #
            # Conversion matrix --> vector :
            #   Take vals and absolute cols from the matrix.
            #
                product = V.echelon_form[pivot] * vect

                i += 1
                i % 500 == 0 && print(".")
            
                # Alex: 90% or more of products are zero,
                # need to detect zero products during matmul:
                #  S × D
                # 
                # <Si, Dj^T> = 0 ?
                # For each row in S and each column in D 
                # additionaly store a UInt8 (or larger type) 
                # for the sparsity pattern (spattern) :
                # Example: 
                #  row1 = { vals={1, 2, 3}, cols={1, 3, 7} }
                #  spattern1 = 10100010 (as UInt8)
                #
                #  row2 = { vals={4, 5},    cols={2, 4} }
                #  spattern2 = 01010010 (as UInt8)
                #
                # (!) spattern1 & spattern2 == 0
                #      =>
                #  <row1, row2^T> == 0   (hopefully the most frequent case)
                #
                # (!) spattern1 & spattern2 == power of two
                #      =>
                #  <row1, row2^T> != 0
                #
                #  spattern1 & spattern2 == anything else
                #  no info  
                #
                # 
                # thoughts on implementation:
                # UInt64 for an spattern object;
                # n - number of columns (say, 200);
                # split n into blocks of div(n+64, 64) 
                # (say, div(200+64, 64) = 5)
                # then div(200, 5) = 40 bits of UInt64 will be used.
                if !iszero(product)
                # Alex: Low-Rank Sparse Gaussian Elimination
                # 
                # do not reduce the product immediately;
                # instead, collect k products. 
                # then, take a random (dense) linear combination of them,
                # and reduce the combination;
                # repeate k times, or until first
                # linearly dependent combination is produced 
                # (whichever comes first);
                # obtained are several (0 to k) new pivots;
                    new_pivot = eat_sparsik!(V, product, ω=ω)

                    if new_pivot == skipped
                        push!(fat_vectors, product)
                    elseif new_pivot != reduced
                        push!(new_pivots, new_pivot)
                    end
                end

            end
        end

    end

    return fat_vectors
end

#------------------------------------------------------------------------------

# checks whether the given vector lies in V
function check_inclusion(V::Subspace, vector::SparseArrays.AbstractSparseArray)
    return check_inclusion!(V, deepcopy(vector))
end

# checks whether the given vector lies in V
#
function check_inclusion!(V::Subspace, vector::SparseArrays.AbstractSparseArray)
    for (piv, vect) in V.echelon_form
        if ! iszero(vector[piv])
            # reduce!(vector, vect, -vector[piv])
            vector = vector - vect .* [vector[piv]]
        end
    end
    return iszero(vector)
end

#------------------------------------------------------------------------------

# checks whether the given subspace is invariant under the given matrices
function check_invariance!(matrices, V::Subspace)
    if base_ring(first(matrices)[1, 1]) != base_ring(V)
        # Alex: hmm
        matrices = [extend_field(M, base_ring(V)) for M in matrices]
    end
    for matr in matrices
        for vec in values(V.echelon_form)
            product = matr * vec
            if ! check_inclusion!(V, product)
                return false
            end
        end
    end
    return true
end

# checks whether the given vectors are invariant under the given matrices
function check_invariance!(matrices, vectors::AbstractArray)
    isempty(vectors) && return true
    isubspace = linear_span!(deepcopy(vectors))
    return check_invariance!(matrices, isubspace)
end

#------------------------------------------------------------------------------

# checks whether U ⊆ V using the provived algorithm for vector-wise check
function check_inclusion!(V::Subspace, U::Subspace; algorithm=check_inclusion!)
    return algorithm(V, basis(U))
end

#------------------------------------------------------------------------------

# check whether the given vectors lie in V
# O(K)
# where K = ∑ᵢnnz(vᵢ)  for vᵢ ∈ vectors
function check_inclusion!(V::Subspace, vectors::AbstractArray)
    for vec in vectors
        if ! check_inclusion!(V, vec)
            return false
        end
    end
    return true
end

#------------------------------------------------------------------------------

Base.repr(::MIME"text/plain", V::Subspace) = "<\n$(join(map(v -> repr(v), values(V.echelon_form)), ",\n"))\n>"
Base.show(io::IO, V::Subspace) = print(io, repr(MIME("text/plain"), V))

#------------------------------------------------------------------------------

==(U::Subspace{T}, V::Subspace{T}) where {T} = (
            U.field == V.field &&
            U.echelon_form == V.echelon_form;)

#------------------------------------------------------------------------------

# returns a new Subspace object consisting of REF elements
# each reconstructed from V.field to QQ
#
# reconstructs *not* inplace
function rational_reconstruction(V::Subspace)
    ans = Subspace(Nemo.QQ)
    for piv in keys(V.echelon_form)
        ans.echelon_form[piv] = rational_reconstruction(V.echelon_form[piv])
    end
    return ans
end

#------------------------------------------------------------------------------

# returns a random element from the given space,
# constructed as a linear combination of `count` basis vectors
function random_element(A::Subspace; count=5)
    count = min(dim(A), count)
    indices = rand(1:dim(A), count)

    # a₁e₁ + … + aₖeₖ
    return sum(map(prod, zip(rand(1:count, count), basis(A)[indices])))
end

#------------------------------------------------------------------------------

# Returns an array of vectors T such that
#   V ⊕ T = R^n
#
# How can we name it btw?
function complement_subspace(V::Subspace)
    each = [i for i in 1:ambient_dim(V)]
    present = collect(keys(V.echelon_form))
    [
        unit_sparsik(ambient_dim(V), i, base_ring(V))
        for i in setdiff(each, present)
    ]
end

# maby `universum(dim, field)` ?
function fullspace(dim, field)
    [
        unit_sparsik(dim, i, field)
        for i in 1 : dim
    ]
end
