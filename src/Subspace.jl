
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
    Subspace(field, Dict{Int, MySparseMatrix{spec_elem_type(T)}}())
end

# deepcopy redefinition in order to preserve the field
function Base.deepcopy_internal(x::Subspace{T}, stackdict::IdDict) where {T}
    y = Subspace(base_ring(x), Base.deepcopy_internal(x.echelon_form, stackdict))
    stackdict[x] = y
    y
end

Base.repr(::MIME"text/plain", V::Subspace) = "<\n$(join(map(v -> repr(v), values(V.echelon_form)), ",\n"))\n>"
Base.show(io::IO, V::Subspace) = print(io, repr(MIME("text/plain"), V))

==(U::Subspace{T}, V::Subspace{T}) where {T} = (
            U.field == V.field &&
            U.echelon_form == V.echelon_form;)

#------------------------------------------------------------------------------

Nemo.base_ring(v::Subspace) = v.field

# returns basis vectors of V, i.e
# an array of vectors sorted by pivot
function basis(V::Subspace)
    sort(collect(values(V.echelon_form)), by=first_nonzero)
end

# returns the dimension of the ambient space of V
function ambient_dim(V::Subspace)
    dim(first(values(V.echelon_form)))
end

# returns the dimension of V as a vector space
function dim(V::Subspace)
    length(V.echelon_form)
end

#------------------------------------------------------------------------------

# vector is reduced
@inline reduced() = -1
# vector is deferred
@inline deferred() = -2

isreduced(x::Integer) = x == reduced()
isdeferred(x::Integer) = x == deferred() 

# adds `new_vector` to the set of spanning vectors of V while modifying both;
# returns reduced() if `new_vector` lies in V,
# returns deferred() if `new_vector` is not very sparse,
# returns new pivot index in V otherwise
#
# O(kR)  if k = nnz(new_vector) and R = Σnnz(v) for v in echelon_form
function eat_sparsik!(V::Subspace, new_vector; ω=1.0)
    # PRobably, we need your_cool_name_here( ;verbose) which will return
    # coordinates of new_vector if V basis in case of linear dependency

    # O(kr) if k = nnz(new_vector) and r = len(echelon_form)
    for (piv, vect) in V.echelon_form
        if issetindex(new_vector, piv)
            new_vector = new_vector - scale(vect, new_vector[piv])
        end
    end

    dropzeros!(new_vector)

    if iszero(new_vector)
        # new_vector reduced to zero
        return reduced()
    end

    # it should(must) be optimized somehow
    # O(1)
    if density(new_vector) > ω
        # new_vector has lost sparsity
        return deferred()
    end

    pivot = first_nonzero(new_vector)
    @assert !iszero(new_vector[pivot])

    new_vector = scale(new_vector, inv(new_vector[pivot]))

    # O(kR)  if k = nnz(new_vector) and R = Σnnz(v) for v in echelon_form
    for (piv, vect) in V.echelon_form
        if issetindex(vect, pivot)
            V.echelon_form[piv] = V.echelon_form[piv] - scale(new_vector, vect[pivot])
        end
    end

    V.echelon_form[pivot] = new_vector
    pivot
end

#------------------------------------------------------------------------------

# returns a new Subspace formed as a linear span
# of the given vectors
function linear_span!(vectors)
    V = Subspace(base_ring(first(vectors)))
    for vect in vectors
        eat_sparsik!(V, vect)
    end
    V
end

#------------------------------------------------------------------------------

# checks whether the given vector lies in V
function check_inclusion(V::Subspace, vector::SparseArrays.AbstractSparseArray)
    check_inclusion!(V, deepcopy(vector))
end

# checks whether the given vector lies in V
function check_inclusion!(V::Subspace, vector::SparseArrays.AbstractSparseArray)
    for (piv, vect) in V.echelon_form
        if issetindex(vector, piv)
            vector = vector - scale(vect, vector[piv])
        end
    end
    iszero(vector)
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
    check_invariance!(matrices, isubspace)
end

#------------------------------------------------------------------------------

# checks whether U ⊆ V using the provived algorithm for vector-wise check
function check_inclusion!(V::Subspace, U::Subspace; algorithm=check_inclusion!)
    algorithm(V, basis(U))
end

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

# returns a new Subspace object consisting of REF elements
# each reconstructed from V.field to QQ
#
# reconstructs *not* inplace
function rational_reconstruction(V::Subspace)
    ans = Subspace(Nemo.QQ)
    for piv in keys(V.echelon_form)
        ans.echelon_form[piv] = rational_reconstruction(V.echelon_form[piv])
    end
    ans
end

#------------------------------------------------------------------------------

# returns a random element from the given space,
# constructed as a linear combination of `count` basis vectors
function random_element(A::Subspace; count=5)
    indices = unique(rand(1:dim(A), min(dim(A), count)))
    # a₁e₁ + … + aₖeₖ
    sum(map(prod, zip(rand(1:count, min(dim(A), count)), basis(A)[indices])))
end

#------------------------------------------------------------------------------

# Returns an array of vectors T such that
#   <V> ⊕ <T> = R^n
#
# How can we name it btw?
function complement_subspace(V::Subspace)
    one_to_n = collect(1:ambient_dim(V))
    present_pivots = collect(keys(V.echelon_form))
    complement_pivots = setdiff(one_to_n, present_pivots)
    [
        unit_sparse_vector(ambient_dim(V), i, base_ring(V))
        for i in complement_pivots
    ]
end

function fullspace(dim::Integer, field)
    [
        unit_sparse_vector(dim, i, field)
        for i in 1:dim
    ]
end
