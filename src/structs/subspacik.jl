
#=
    The File contains `Subspacik<T>` and related funcs implementation
=#

# I guess find_basis funcs should be

#------------------------------------------------------------------------------

include("dok_sparsik.jl")

#------------------------------------------------------------------------------

import Nemo: QQ, GF, Field

#------------------------------------------------------------------------------

# Subspacik
mutable struct Subspacik{T<:Field}
    # as I see, we do not need the dimension of the ambient space yet:
    # now it is just redundant
    field::T
    # the echelon form of vectors is an invariant!
    echelon_form::Dict{Int, AbstractSparseObject{T}}
end

#------------------------------------------------------------------------------

# convenience ctor
function Subspacik(field::T) where {T}
    return Subspacik(field, Dict{Int, AbstractSparseObject{T}}())
end

# deepcopy redefinition in order to preserve the field
function Base.deepcopy_internal(x::Subspacik, stackdict::IdDict)
    y = Subspacik(x.ambient_dim, field,
            Base.deepcopy_internal(x.echelon_form, stackdict))
    stackdict[x] = y
    return y
end

#------------------------------------------------------------------------------

# Ground field!
ground(v::Subspacik) = v.field

#------------------------------------------------------------------------------

# returns basis vectors of V sorted by pivot indices
function basis(V::Subspacik)
    return sort(collect(deepcopy(values(V.echelon_form))), by=first_nonzero)
end

#------------------------------------------------------------------------------

# returns the dimension of the ambient space of V
function ambient_dim(V::Subspacik)
    return dim(first(values(V.echelon_form)))
end

# returns the dimension of V
function dim(V::Subspacik)
    return length(V.echelon_form)
end

#------------------------------------------------------------------------------

@enum EatCode begin
    reduced   = -1
    discarded = -2
end

# adds `new_vector` to the set of spanning vectors of V
# while modifying both
# returns -1 if `new_vector` lies in V, new pivot index otherwise
function eat_sparsik!(V::Subspacik, new_vector::AbstractSparseObject; ω=1.0)
    for (piv, vect) in V.echelon_form
        if !iszero(new_vector[piv])
            reduce!(new_vector, vect, -new_vector[piv])
        end
    end

    if iszero(new_vector)
        return reduced
    end

    if density(new_vector) > ω
        return discarded
    end

    pivot = first_nonzero(new_vector)
    scale!(new_vector, inv(new_vector[pivot]))

    for (piv, vect) in V.echelon_form
        if !iszero(vect[pivot])
            reduce!(V.echelon_form[piv], new_vector, -vect[pivot])
        end
    end

    V.echelon_form[pivot] = new_vector
    return pivot
end

#------------------------------------------------------------------------------

# returns a new Subspacik formed as a linear span
# of the given vectors
function linear_span!(vectors)
    V = Subspacik(ground(first(vectors)))
    for vect in vectors
        eat_sparsik!(V, vect)
    end
    return V
end

#------------------------------------------------------------------------------

# transformes V to the smallest subspace invariant under
# the given matrices and containing the original one
function apply_matrices_inplace!(V::Subspacik, matrices; ω=1.)
    fat_vectors = [ ]
    new_pivots = collect(keys(V.echelon_form))
    i = 0

    while !isempty(new_pivots)
        pivots_to_process = sort(deepcopy(new_pivots))
        empty!(new_pivots)

        for pivot in pivots_to_process
            for vect in matrices
                product = apply_vector(V.echelon_form[pivot], vect)

                i += 1
                i % 1000 == 0 && print(".")

                if !iszero(product)
                    new_pivot = eat_sparsik!(V, product, ω=ω)
                    if new_pivot == discarded
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
#
# TODO: check_inclusion!
function check_inclusion(V::Subspacik, vector::AbstractSparseObject)
    return check_inclusion!(V, deepcopy(vector))
end

# checks whether the given vector lies in V
#
function check_inclusion!(V::Subspacik, vector::AbstractSparseObject)
    for (piv, vect) in V.echelon_form
        if ! iszero(vector[piv])
            reduce!(vector, vect, -vector[piv])
        end
    end
    return iszero(vector)
end

#------------------------------------------------------------------------------

# checks whether the given subspace is invariant under the matrices
function check_invariance!(V::Subspacik, matrices)
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

#------------------------------------------------------------------------------

# checks whether U ⊆ V using the provived algorithm for vector-wise check
function check_inclusion!(V::Subspacik, U::Subspacik; algorithm=check_inclusion!)
    return algorithm(V, basis(U))
end

#------------------------------------------------------------------------------

# check whether the given vectors lie in V
# O(K)
# where K = ∑ᵢnnz(vᵢ)  for vᵢ ∈ vectors
function check_inclusion!(V::Subspacik, vectors)
    for vec in vectors
        if ! check_inclusion!(V, vec)
            return false
        end
    end
    return true
end


function check_inclusion_alpha!(V::Subspacik, vectors)
    # In this approach we try to reduce hash of each vector to zero
    # rather than the vector thyself

    # O(n)
    hash_vector = random_sparsik(
        size(first(vectors)),
        ground(first(vectors)),
        density=1.0
    )

    # O(K)
    # K = ∑ k_i  , k_i = nnz(v) from  V.echelon_form
    subspace_hashes = [
        inner(hash_vector, v)
        for v in values(V.echelon_form)
    ]

    # O(C)
    # C = length(vectors)
    for vect in vectors
        current_hash = inner(hash_vector, vect)

        for (i, (pivot, row)) in enumerate(V.echelon_form)
            current_hash -= vect[pivot] * subspace_hashes[i]
        end

        if ! iszero(current_hash)
            return false
        end

    end

    return true
end


function check_inclusion_beta!(V::Subspacik, vectors)
    # In this approach we precompute reduced hash vector,
    # whose wonderful properties are based on bilinearity of inner product

    sz = size(first(vectors))
    field = ground(first(vectors))

    hash_vector = random_sparsik(
        sz,
        field,
        density=1.0
    )

    reduced_hash_vector = deepcopy(hash_vector)
    for (pivot, row) in V.echelon_form
        reducer = scale!(
            unit_sparsik(sz, pivot, field),
            inner(row, hash_vector)
        )
        reduce!(reduced_hash_vector, reducer, -one(field))
    end

    for vect in vectors
        if ! iszero(inner(vect, reduced_hash_vector))
            return false
        end
    end

    return true
end

#------------------------------------------------------------------------------

Base.repr(::MIME"text/plain", V::Subspacik) = "<\n $(join(map(v -> repr(v), values(V.echelon_form)), ",\n"))\n>"
Base.show(io::IO, V::Subspacik) = print(io, repr(MIME("text/plain"), V))


#------------------------------------------------------------------------------

==(U::Subspacik{T}, V::Subspacik{T}) where {T} = (U.dim == V.dim &&
            U.field == V.field &&
            U.echelon_form == V.echelon_form;)
