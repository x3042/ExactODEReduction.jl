
include("../src/typics.jl")
include("../src/bidim_sparsik_lazy.jl")
include("../src/parsik.jl")

#------------------------------------------------------------------------------

import Nemo: QQ, GF

#------------------------------------------------------------------------------

struct Subspacik
    ambient_dim::Int
    echelon_form::Dict{Int, AbstractSparsik}

    function Subspacik(dim::Int)
        new(dim, Dict{Int, AbstractSparsik}())
    end

    function Subspacik(dim::Int, echelon_form)
        new(dim, echelon_form)
    end
end

#------------------------------------------------------------------------------

function ambient_dim(V::Subspacik)
    return V.ambient_dim
end

function dim(V::Subspacik)
    return length(V.echelon_form)
end

#------------------------------------------------------------------------------

#
function eat_sparsik!(V::Subspacik, new_vector)
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
                # (i) multiplication

                product = apply_vector(V.echelon_form[pivot], vect)

                i += 1
                i % 100 == 0 && print(".")

                if !iszero(product)
                    # (ii) and (iii) - checking for linear independence and eating
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

function find_basis(vectors)
    # hope vectors is not empty
    alg = Subspacik(dim(first(vectors)))

    for v in vectors
        eat_sparsik!(alg, BidimSparsikLazy(v))
    end

    apply_vectors_inplace!(alg, [BidimSparsikLazy(x) for x in vectors])

    return alg
end

#------------------------------------------------------------------------------

function find_basis_2(vectors)
    alg = Subspacik(dim(first(vectors)))



    return alg
end

#------------------------------------------------------------------------------

function Base.show(V::Subspacik)
    "<\n $(join(map(v -> Base.show(v), values(V.echelon_form)), "\n\n"))\n>\n"
end

function print_subspacik(V::Subspacik)
    println(show(V))
end

#------------------------------------------------------------------------------

function modular_reduction(xs, field)
    [modular_reduction(x, field) for x in xs]
end

function rational_reconstruction(xs)
    [rational_reconstruction(x) for x in xs]
end

#------------------------------------------------------------------------------

R = GF(2^31 - 1)

for (i, (mfn, mdim, msz, mdata)) in enumerate(load_COO_if(from_dim=0, to_dim=50))

    println("$(i)th model: $mfn, dim = $mdim, size = $msz")
    As = map(matr -> from_COO(matr..., QQ), mdata)

    As_reduced = modular_reduction(As, R)

    @time e1 = find_basis(As_reduced)

    As_reduced = rational_reconstruction(collect(values(e1.echelon_form)))

    println("~~~~~~~~~~~~~~~")
    println()

end
