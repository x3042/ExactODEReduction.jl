

if !isdefined(Main, :BidimSparsikLazy)
    include("../src/bidim_sparsik_lazy.jl")
end

import Nemo
using Nemo




 struct Subspace

     echelon_form::Dict{Int, Any}

     function Subspace(echelon_form)
         new(echelon_form)
     end

     function Subspace()
         new(Dict{Int, Any}())
     end

 end


 function dim(V::Subspace)
     return size(V.echelon_form)
 end

 function eat_sparsik!(V::Subspace, new_vector)


     for (piv, vect) in V.echelon_form

         if !iszero(new_vector[piv])
             new_vector = reduce(new_vector, vect, -new_vector[piv])
         end

     end


     # if new_vector is a linear combination
     if iszero(new_vector)
         return -1
     end

     pivot = first_nonzero(new_vector)

     new_vector = scale(new_vector, 1 // new_vector[pivot])

     for (piv, vect) in V.echelon_form
         if !iszero(vect[pivot])
             V.echelon_form[piv] = reduce(V.echelon_form[piv], new_vector, -vect[pivot])
         end
     end

     V.echelon_form[pivot] = new_vector
     return pivot

 end

 function apply_matrices_inplace!(V::Subspace, matrices)

     new_pivots = collect(keys(V.echelon_form))

     while !isempty(new_pivots)

         pivots_to_process = deepcopy(new_pivots)
         empty!(new_pivots)

         for pivot in pivots_to_process

             for matr in matrices

                product = apply_vector(V.echelon_form[pivot], matr)


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


 function find_basis(matrices)
     alg = Subspace()
     for matr in matrices
         eat_sparsik!(alg, matr)
     end

     apply_matrices_inplace!(alg, matrices)
     return alg
end

function print_manifold(V::Subspace)
    println("<\n $(join(map(v -> show(v), values(V.echelon_form)), "\n\n"))\n>\n")
end


