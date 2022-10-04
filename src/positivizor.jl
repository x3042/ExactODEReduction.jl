# The code in this file has been adapted from https://github.com/xjzhaang/LumpingPostiviser
# commit 1fec31a493a7884ea8b202a8fe8943bb2d66b853

"""
    rational_to_int(m)

Converts a matrix `m`  with rational entries (Rational or fmpq) into a 
BigInt matrix my bringing the rows to the common denominator
"""
function rational_to_int(m::Array{<: Union{<: Rational, fmpq}, 2})
    for row in eachrow(m)
        lcm_ = 1
        for x in row
            lcm_ = lcm(lcm_, denominator(x))
        end 
        row .= (row .* lcm_)
    end
    return Array{BigInt, 2}(numerator.(m))
end

#------------------------------------------------------------------------------

"""
    positivize(subspace)

For a list `subspace` of linear indepenent sparsiks, tries to find
a list of vectors (also sparsiks) generating the same subspace but having
all the coordinates >= 0. If this is possible, returns such a list, otherwise
returns the original subspace.
Arguments
  - `subspace`: a list of linearly independent Sparsik's
"""
function positivize(subspace)
    if base_ring(first(subspace)) != Nemo.QQ
        @warn "The base ring is not Q but $(base_ring(first(subspace))), no positivization"
        return subspace
    end
    stacked_basis = Matrix(transpose(reduce(hcat, map(v -> collect(v), subspace))))
    integerized = rational_to_int(stacked_basis)
    @debug "Before positivization: $integerized"
    positivized = nothing
    try
        positivized = positivize_int(integerized)
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
    return [sparse([positivized[i, j] for j in 1:nc]) for i in 1:nr] 
end

#------------------------------------------------------------------------------

"""
    positivize_int(m)

Given an integer matrix with linearly independent rows, searches
for a matrix with the same row space but all emtries being >= 0.
If this is not possible, throws `DimensionMismatch`
Arguments
    - `m`: integer matrix
"""
function positivize_int(m::Array{BigInt, 2})
    (nrows, ncols) = size(m)
    
    orthant_rays = Matrix(1LinearAlgebra.I, ncols, ncols)
    rowspace_rays = zeros(BigInt, 2 * nrows, ncols)
    
    for i in 1:nrows
        for j in 1:ncols
            rowspace_rays[i, j] = m[i, j]
            rowspace_rays[i + nrows, j] = -m[i, j]
        end
    end

    orthant_cone = polytope.Cone(INPUT_RAYS=orthant_rays)
    rowspace_cone = polytope.Cone(INPUT_RAYS=rowspace_rays)

    intersect_cone = polytope.intersection(rowspace_cone, orthant_cone)
    intersect_matrix = intersect_cone.RAYS

    intersect_matrix = Array{Rational{BigInt}}(intersect_matrix)
    intersect_matrix = rational_to_int(intersect_matrix)
    intersect_matrix = sort_matrix(intersect_matrix)

    if size(intersect_matrix)[1] < nrows
        throw(DimensionMismatch("No suitable matrix found"))
    elseif size(intersect_matrix)[1] > nrows
        intersect_matrix = find_sparsiest_basis(intersect_matrix)
        intersect_matrix = sort_matrix(intersect_matrix)
    end

    S = MatrixSpace(Nemo.QQ, nrows, ncols)
    return S(intersect_matrix)
end

#------------------------------------------------------------------------------

"""
    find_sparsiest_basis(m)

For an integer matrix `m` with nonegative entries finds a subset of rows
being a basis for the whole row space and having as few nonzero elements
in total as possible
"""
function find_sparsiest_basis(m::Array{BigInt, 2})
    (nrows, ncols) = size(m)
    rows_list = []
    for i in 1:nrows
        weight = sum([1 for x in m[i, :] if x != 0])
        push!(rows_list, (weight, i))
    end
    sort!(rows_list, by = x -> x[1])

    cur_matrix = Array{BigInt, 2}(undef, 0, ncols)

    for (weight, i) in rows_list
        next_matrix = [cur_matrix; reshape(m[i, :], 1, ncols)]
	S_cur = MatrixSpace(Nemo.QQ, size(next_matrix)...)
        if LinearAlgebra.rank(S_cur(next_matrix)) > size(cur_matrix)[1]
	    cur_matrix = next_matrix
	end
    end

    return cur_matrix
end

#------------------------------------------------------------------------------

"""
    sort_matrix(m)

Sorts the rows of matrix `m` by the index of the leftmost nonzero element
"""
function sort_matrix(m::Array{BigInt})
    new_matrix = zeros(BigInt, size(m)...)
    tuples = [(row_index, findfirst(x -> x != 0, m[row_index, :])) for row_index in 1:size(m)[1]]
    sort!(tuples, by = x -> x[2])
    for row_index in 1:size(tuples)[1]
        new_matrix[row_index, :] = m[tuples[row_index][1], :]
    end
    return new_matrix
end

#------------------------------------------------------------------------------


