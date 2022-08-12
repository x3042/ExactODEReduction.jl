function rational_to_int(matrix::Array{<: Union{<: Rational, fmpq}, 2})
    for row in eachrow(matrix)
        lcm_ = 1
        for x in row
            lcm_ = lcm(lcm_, denominator(x))
        end 
        row .= (row .* lcm_)
    end
    matrix = Array{BigInt, 2}(numerator.(matrix))
    return matrix
end


function positivize(subspace)
    stacked_basis = Matrix(transpose(reduce(hcat, map(v -> to_dense(v), subspace))))
    integerized = rational_to_int(stacked_basis)
    @debug "Before positivization: $integerized"
    positivized = undef
    try
        positivized = intersection_calc(integerized)
    catch e
        @debug "$e"
        if typeof(e) == DimensionMismatch
            return subspace
        else
            throw(e)
        end
    end
    @debug "After positivization: $positivized"
    (nr, nc) = size(positivized)
    return [from_dense([positivized[i, j] for j in 1:nc], Nemo.QQ) for i in 1:nr] 
end

function intersection_calc(m::Array{BigInt, 2})
    row, col = size(m)
    
    # we create the canonical matrix of col dimension
    canon_matrix = Matrix(1LinearAlgebra.I, col, col)

    #we create a zeros matrix that has twice the rows of the input matrix to add negation matrix.
    input_matrix = zeros(BigInt, row * 2, col)
    
    #now we fill the matrix with the parsed matrix and its negation matrix
    for i in 1:row
        for j in 1:col
            input_matrix[i, j] = m[i, j]
            input_matrix[i + row, j] = -m[i, j]
        end
    end

    #compute the cones
    matrix_cone = polytope.Cone(INPUT_RAYS=input_matrix)
    orthant_cone = polytope.Cone(INPUT_RAYS=canon_matrix)

    intersect_cone = polytope.intersection(matrix_cone, orthant_cone)
    intersect_matrix = intersect_cone.RAYS

    #Now turn all rational elements into integers
    intersect_matrix = Array{Rational{Int}}(intersect_matrix)
    intersect_matrix = rational_to_int(intersect_matrix)

    #We now modify the matrix into upper triangular form using merge sort
    intersect_matrix = sort_matrix(intersect_matrix)

    if size(intersect_matrix)[1] < size(m)[1]
        throw(DimensionMismatch("No suitable matrix found"))
    elseif size(intersect_matrix)[1] > size(m)[1]
        intersect_matrix = find_best_basis(intersect_matrix)
        intersect_matrix = sort_matrix(intersect_matrix)
    end

    S = MatrixSpace(Nemo.QQ, size(m)...)
    return S(intersect_matrix)
end

function find_best_basis(m::Array{BigInt, 2})
    # first we construct a list of edges where each edge is a tuple (weight, row1)
    (nrows, ncols) = size(m)
    rows_list = []
    for i in 1:nrows
        weight = sum([1 for x in m[i, :] if x != 0])
        push!(rows_list, (weight, i))
    end
    # the rows are sorted in increasing order of weight
    sort!(rows_list, by = x -> x[1])

    # we pop the first row and construct the return matrix to be [row]
    return_matrix = reshape(m[rows_list[1][2], :], 1, ncols)
    popfirst!(rows_list)
    
    # for every edge in list of edges, we add to the return_matrix and see if it is linearly independent, if not, we remove it
    # after everyloop, we check if the rank of return_matrix is the same as the input matrix
    for row in rows_list
        old_rank = size(return_matrix)[1]
        return_matrix = vcat(return_matrix, vcat(reshape(m[row[2], :], 1, ncols)))
        S = MatrixSpace(Nemo.QQ, size(return_matrix)...)
        new_rank = LinearAlgebra.rank(S(return_matrix))
        if old_rank != new_rank - 1
            return_matrix = return_matrix[1:size(return_matrix)[1] - 1, :]
        end
        S = MatrixSpace(Nemo.QQ, size(return_matrix)...)
        S1 = MatrixSpace(Nemo.QQ, nrows, ncols)
        if LinearAlgebra.rank(S(return_matrix)) == LinearAlgebra.rank(S1(m))
            println(8)
            break
        end
    end
    return return_matrix
end


function sort_matrix(m::Array{BigInt})
    new_matrix = zeros(BigInt, size(m)...)
    tuples = [(row_index, findfirst(x -> x != 0, m[row_index, :])) for row_index in 1:size(m)[1]]
    sort!(tuples, by = x -> x[2])
    for row_index in 1:size(tuples)[1]
        new_matrix[row_index, :] = m[tuples[row_index][1], :]
    end
    return new_matrix
end
