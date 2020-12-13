
#=
    The File contains `Subspacik<T>` and related funcs implementation
=#

# I guess find_basis funcs should be

#------------------------------------------------------------------------------

include("bidim_sparsik_lazy.jl")

#------------------------------------------------------------------------------

import Nemo: QQ, GF, Field

#------------------------------------------------------------------------------

# Subspacik
struct Subspacik{T<:Field}
    ambient_dim::Int
    field::T
    echelon_form::Dict{Int, AbstractSparsik{T}}
end

function Subspacik(n::Int, field::T) where {T}
    return Subspacik(n, field, Dict{Int, AbstractSparsik{T}}())
end

#------------------------------------------------------------------------------

function basis(V::Subspacik)
    return sort(collect(values(V.echelon_form)), by=first_nonzero)
end

#------------------------------------------------------------------------------

function ambient_dim(V::Subspacik)
    return V.ambient_dim
end

function dim(V::Subspacik)
    return length(V.echelon_form)
end

#------------------------------------------------------------------------------

function eat_sparsik!(V::Subspacik, new_vector::AbstractSparsik)
    for (piv, vect) in V.echelon_form
        if !iszero(new_vector[piv])
            reduce!(new_vector, vect, -new_vector[piv])
        end
    end

    if iszero(new_vector)
        return -1
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

function apply_vectors_inplace!(V::Subspacik, vectors)
    new_pivots = collect(keys(V.echelon_form))
    i = 0

    while !isempty(new_pivots)
        pivots_to_process = sort(deepcopy(new_pivots))
        empty!(new_pivots)

        for pivot in pivots_to_process
            for vect in vectors
                product = apply_vector(V.echelon_form[pivot], vect)

                i += 1
                i % 100 == 0 && print(".")

                if !iszero(product)
                    new_pivot = eat_sparsik!(V, product)
                    if new_pivot != -1
                        push!(new_pivots, new_pivot)
                    end
                end
            end
        end

    end

 end

#------------------------------------------------------------------------------

function Base.show(V::Subspacik)
    "<\n $(join(map(v -> Base.show(v), values(V.echelon_form)), "\n\n"))\n>\n"
end

function print_subspacik(V::Subspacik)
    println(show(V))
end

#------------------------------------------------------------------------------
