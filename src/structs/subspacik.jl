
#=
    The File contains `Subspacik<T>` and related funcs implementation
=#

# I guess find_basis funcs should be

#------------------------------------------------------------------------------

include("dok_sparsik.jl")
include("densik.jl")


#------------------------------------------------------------------------------

import Nemo: QQ, GF, Field

#------------------------------------------------------------------------------

# Subspacik
mutable struct Subspacik{T<:Field}
    field::T
    # the echelon form of vectors is an invariant!
    echelon_form::Dict{Int, AbstractSparseObject{T}}
end

#------------------------------------------------------------------------------

# Subspacik
mutable struct HashedSubspacik{T<:Field}
    # inherited from Subspacik
    field::T
    # pivot --> row
    # maybe we can call this "rref"
    echelon_form::Dict{Int, AbstractSparseObject{T}}

    # -----
    # new hash things

    hash_vector::AbstractSparseObject{T}
    # this vector is reduced over time
    reduced_hash_vector::AbstractSparseObject{T}

    # pivot --> hash
    hashes::Dict{Int, FieldElem}
end

#------------------------------------------------------------------------------

# convenience ctor
function Subspacik(field::T) where {T<:Field}
    return Subspacik(field, Dict{Int, AbstractSparseObject{T}}())
end

# deepcopy redefinition in order to preserve the field
function Base.deepcopy_internal(x::Subspacik{T}, stackdict::IdDict) where {T<:Field}
    y = Subspacik(ground(x), Base.deepcopy_internal(x.echelon_form, stackdict))
    stackdict[x] = y
    return y
end

#------------------------------------------------------------------------------

# Ground field!
# Gleb: also suggest base_ring
# Alex: to be changed soon..
ground(v::Union{Subspacik, HashedSubspacik}) = v.field

#------------------------------------------------------------------------------

# returns basis vectors of V sorted by pivot indices
function basis(V::Union{Subspacik, HashedSubspacik})
    return sort(collect(deepcopy(values(V.echelon_form))), by=first_nonzero)
end

#------------------------------------------------------------------------------

# returns the dimension of the ambient space of V
function ambient_dim(V::Union{Subspacik, HashedSubspacik})
    return dim(first(values(V.echelon_form)))
end

# returns the dimension of V
function dim(V::Union{Subspacik, HashedSubspacik})
    return length(V.echelon_form)
end

#------------------------------------------------------------------------------

@enum EatCode begin
    reduced = -1
    # Gleb: I would call discarded skipped
    skipped = -2
end

# adds `new_vector` to the set of spanning vectors of V
# while modifying both
# returns -1 if `new_vector` lies in V, new pivot index otherwise

# O(kR)  if k = nnz(new_vector) and R = Σnnz(v) for v in echelon_form
function eat_sparsik!(V::Subspacik, new_vector::AbstractSparseObject; ω=1.0)

    # O(kr) if k = nnz(new_vector) and r = len(echelon_form)
    for (piv, vect) in V.echelon_form
        if !iszero(new_vector[piv])
            reduce!(new_vector, vect, -new_vector[piv])
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
    pivot = first_nonzero(new_vector)
    scale!(new_vector, inv(new_vector[pivot]))

    # O(kR)  if k = nnz(new_vector) and R = Σnnz(v) for v in echelon_form
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
 function apply_matrices_inplace!(V::Union{Subspacik, HashedSubspacik}, matrices; ω=1.)
     global CNT
     global NONZERO

     fat_vectors = [ ]
     new_pivots = collect(keys(V.echelon_form))
     i = 0

     while !isempty(new_pivots)
         pivots_to_process = sort(deepcopy(new_pivots))
         empty!(new_pivots)

         for pivot in pivots_to_process
             for vect in matrices
                 product = apply_vector(V.echelon_form[pivot], vect)
                 CNT += 1

                 i += 1
                 i % 500 == 0 && print(".")

                 if !iszero(product)
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
function check_inclusion(V::Union{Subspacik, HashedSubspacik}, vector::AbstractSparseObject)
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

# checks whether the given vector lies in V
#
function check_inclusion!(V::HashedSubspacik, vector::AbstractSparseObject)
    return iszero(inner(V.reduced_hash_vector, vector))
end

#------------------------------------------------------------------------------

# checks whether the given subspace is invariant under the matrices
function check_invariance!(V::Union{Subspacik, HashedSubspacik}, matrices)
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
function check_inclusion!(V::Union{Subspacik, HashedSubspacik}, U::Union{Subspacik, HashedSubspacik}; algorithm=check_inclusion!)
    return algorithm(V, basis(U))
end

#------------------------------------------------------------------------------

# check whether the given vectors lie in V
# O(K)
# where K = ∑ᵢnnz(vᵢ)  for vᵢ ∈ vectors
function check_inclusion!(V::Union{Subspacik, HashedSubspacik}, vectors::Array)
    for vec in vectors
        if ! check_inclusion!(V, vec)
            return false
        end
    end
    return true
end

#------------------------------------------------------------------------------

Base.repr(::MIME"text/plain", V::Subspacik) = "<\n$(join(map(v -> repr(v), values(V.echelon_form)), ",\n"))\n>"
Base.show(io::IO, V::Subspacik) = print(io, repr(MIME("text/plain"), V))

#------------------------------------------------------------------------------

==(U::Subspacik{T}, V::Subspacik{T}) where {T} = (
            U.field == V.field &&
            U.echelon_form == V.echelon_form;)

#------------------------------------------------------------------------------

# convenience ctor
function HashedSubspacik(hash_vector, field::T) where {T<:Field}
    return HashedSubspacik(
        field,
        Dict{Int, AbstractSparseObject{T}}(),
        deepcopy(hash_vector),
        deepcopy(hash_vector),
        Dict{Int, FieldElem}()
    )
end

# deepcopy redefinition in order to preserve the field
function Base.deepcopy_internal(x::HashedSubspacik{T}, stackdict::IdDict) where {T<:Field}
    y = HashedSubspacik(
                ground(x),
                Base.deepcopy_internal(x.echelon_form, stackdict),
                Base.deepcopy_internal(x.hash_vector, stackdict),
                Base.deepcopy_internal(x.reduced_hash_vector, stackdict),
                Base.deepcopy_internal(x.hashes, stackdict)
    )
    stackdict[x] = y
    return y
end

Base.repr(::MIME"text/plain", V::HashedSubspacik) = "<\n$(join(map(v -> repr(v), values(V.echelon_form)), ",\n"))\n>\nwith hash vector $(repr(V.hash_vector))"
Base.show(io::IO, V::HashedSubspacik) = print(io, repr(MIME("text/plain"), V))

#------------------------------------------------------------------------------

# adds `new_vector` to the set of spanning vectors of V
# while modifying both
# returns -1 if `new_vector` lies in V, new pivot index otherwise
function eat_sparsik!(V::HashedSubspacik, new_vector::AbstractSparseObject; ω=1.0)
    # O(k) if k = nnz(new_vector)
    reduced_hash = inner(new_vector, V.reduced_hash_vector)
    if iszero(reduced_hash)
        return reduced
    end

    for (piv, vect) in V.echelon_form
        if !iszero(new_vector[piv])
            reduce!(new_vector, vect, -new_vector[piv])
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
    pivot = first_nonzero(new_vector)
    scale!(new_vector, inv(new_vector[pivot]))
    new_hash = inner(V.hash_vector, new_vector)

    # O(kR)  if k = nnz(new_vector) and R = Σnnz(v) for v in echelon_form
    for (piv, vect) in V.echelon_form
        if !iszero(vect[pivot])
            reduce!(V.echelon_form[piv], new_vector, -vect[pivot])
            V.hashes[piv] -= new_hash * (-vect[pivot])
        end
    end

    V.hashes[pivot] = new_hash
    V.echelon_form[pivot] = new_vector

    reduce!(V.reduced_hash_vector, pivot, -new_hash)

    return pivot
end

#------------------------------------------------------------------------------

function linear_span!(vectors, hash_vector)
    V = HashedSubspacik(hash_vector, ground(first(vectors)))
    for vect in vectors
        eat_sparsik!(V, vect)
    end
    return V
end

#------------------------------------------------------------------------------

# returns a Subspacik object consisting of REF elements
# each reconstructed from V.field to QQ
#
# reconstructs inplace
function rational_reconstruction!(V::Subspacik)
    V.field = QQ
    for piv in collect(keys(V.echelon_form))
        V.echelon_form[piv] = rational_reconstruction(V.echelon_form[piv])
    end
    return V
end

# returns a HashedSubspacik object consisting of REF elements
# each reconstructed from V.field to QQ
#
# hash vectors and hashes are reconstructed too
#
# reconstructs inplace
function rational_reconstruction!(V::HashedSubspacik)
    V.field = QQ
    for piv in collect(keys(V.echelon_form))
        V.echelon_form[piv] = rational_reconstruction(V.echelon_form[piv])
    end
    V.reduced_hash_vector = rational_reconstruction(V.reduced_hash_vector)
    V.hash_vector = rational_reconstruction(V.hash_vector)
    V.hashes = Dict(
        i => rational_reconstruction(x, characteristic(ground(V)))
        for (i, x) in V.hashes
    )
    return V
end
