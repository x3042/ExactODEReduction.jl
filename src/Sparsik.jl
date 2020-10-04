

import Base: +, *, ==, !=


#=
    This version of Vector is a
        a test site for Julia

    Sparsik<T>
    Implements SparseVector<T>

    scale, inner, sum, reduce,
    is_zero, first_nonzero
=#

# Gleb: the coordinates of the vectors will be (at least at first)
# usually rational numbers (I would go for Nemo.fmpq)
# You can check that it is not a subtype of Integer
struct Sparsik{T<:Integer}
    dim::Int
    nonzero::Vector{Int}
    data::Dict{Int, T}
end



function print_vector(v::Sparsik)
    i, j = 1, 1

    print("(")
    while i <= v.dim
        if j <= length(v.nonzero) && v.nonzero[j] == i
            print(v.data[i], ", ")
            j += 1
        else
            print(0, ", ")
        end
        i += 1
    end
    println(")")
end


function is_zero(v::Sparsik)
    return length(v.nonzero) == 0
end

function first_nonzero(v::Sparsik)
    return v.nonzero[1]
end

# Gleb: I do not insist on comprehensive typing for the prototype
# but here a more natural would be something like
# scale(v::Sparsik{T}, c::T)
function scale(v::Sparsik, c)
    # Gleb: I also find the support of Unicode a fun feature
    # However, I suggest we do not use it in the "working" code
    # (as opposed to "presentational code").
    # Reason: problematic to type/search in many programming environments
    for idx ∈ v.nonzero
        v.data[idx] *= c
    end
    return v
end


function sum(v1::Sparsik, v2::Sparsik)

    new_indices = []
    newdata = Dict()

    i, j = 1, 1

    while i <= length(v1.nonzero) || j <= length(v2.nonzero)
        new_idx, new_val = 1, 0
        if i <= length(v1.nonzero) && j <= length(v2.nonzero)
            if v1.nonzero[i] == v2.nonzero[j]
                new_val = v1.data[v1.nonzero[i]] + v2.data[v2.nonzero[j]]
                new_idx = v1.nonzero[i]
                i += 1
                j += 1
            elseif v1.nonzero[i] < v2.nonzero[j]
                new_val = v1.data[v1.nonzero[i]]
                new_idx = v1.nonzero[i]
                i += 1
            else
                new_val = v2.data[v2.nonzero[j]]
                new_idx = v2.nonzero[j]
                j += 1
            end
        elseif i <= length(v1.nonzero)
            new_val = v1.data[v1.nonzero[i]]
            new_idx = v1.nonzero[i]
            i += 1
        else
            new_val = v2.data[v2.nonzero[j]]
            new_idx = v2.nonzero[j]
            j += 1
        end

        if new_val != 0
            append!(new_indices, new_idx)
            newdata[new_idx] = new_val
        end

    end

    # Gleb: why integer?!
    return Sparsik{Integer}(v1.dim, new_indices, newdata)

end

# Gleb: this should be a docstring
# returns v1 + v2 * c
function reduce(v::Sparsik, u::Sparsik, c)
    return ∑(v, scale_(u, c))
end

# Gleb: this is the algorithm used in CLUE, I suggest 
# we go deeper. A puzzle for you (should not be hard):
# if the vectors are with a and b nonzeroes, respectively,
# do this in O(min(a, b)) (randomized, amortized)
function inner(v::Sparsik, u::Sparsik)
    i, j = 1, 1
    ans = 0
    while i <= length(v.nonzero) && j <= length(u.nonzero)
        if v.nonzero[i] == u.nonzero[j]
            ans += v.data[v.nonzero[i]] * u.data[u.nonzero[j]]
            i += 1
            j += 1
        elseif v.nonzero[i] < u.nonzero[j]
            i += 1
        else
            j += 1
        end
    end
    return ans
end


function get(v::Sparsik, i::Int)
    return get(v.data, i, 0)
end


function from_array(a::Vector{T}) where {T<:Integer}
    new_idx = Vector{T}()
    new_data = Dict{Int, T}()

    for (i, x) ∈ enumerate(a)
        if x != 0
            append!(new_idx, i)
            new_data[i] = x
        end
    end

    return Sparsik{T}(length(a), new_idx, new_data)
end


∑(x::Sparsik) = x
∑(x, xs...) = sum(x, ∑(xs...))



+(v::Sparsik, u::Sparsik) = sum(v, u)
*(v::Sparsik, c::Integer) = scale(v, c)
*(c::Integer, v::Sparsik) = v * c
==(v::Sparsik, u::Sparsik) = (v.dim == u.dim;
                                v.data == u.data;
                                v.nonzero == u.nonzero)
!=(v::Sparsik, u::Sparsik) = !(v == u)


# --------------------------------------------

# Gleb: first, I am really happy to work with people who write tests for their code!
# Second: tests should be in a separate file in folder (tests/). I will send an example of how to organize
v1 = Sparsik{Integer}(7, [1, 3, 5, 7],
            Dict(1 => 10, 3 => -2, 5 => 8, 7 => 4))
v2 = Sparsik{Integer}(7, [2, 3, 5, 6],
            Dict(2 => 2, 3 => 1, 5 => -8, 6 => 11))


@assert v1 == from_array([10, 0, -2, 0, 8, 0, 4])

@assert (v1 + v2) == from_array([10, 2, -1, 0, 0, 11, 4])

@assert (v1 * 2) == from_array([20, 0, -4, 0, 16, 0, 8])

@assert is_zero(Sparsik{Int64}(3, [], Dict()))
@assert is_zero(from_array([0, 0, 0]))

@assert first_nonzero(v2) == 2

@assert inner(v1, v2) == -132

@assert ∑(from_array([1, 2]),
        from_array([-1, 3]),
        from_array([0, 1])) == from_array([0, 6])

println("OK")
