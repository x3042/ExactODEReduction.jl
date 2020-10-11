

import Base: +, *, ==, !=, zero


#=
    The File contains Sparsik<Real>
    which implements SparseVector<Real>

    Sparsik:
        scale, inner, sum, reduce,
        from_vector
=#

# Alex: SPOILER - type info deleted

# TODO: - write convenience functions, e.g array-subscription
#       - read documentation about documentation


# Gleb: the coordinates of the vectors will be (at least at first)
# usually rational numbers (I would go for Nemo.fmpq)
# You can check that it is not a subtype of Integer
struct Sparsik
    dim::Int
    nonzero::Vector{Int}
    data::Dict{Int, Any}
end



function print_vector(v)
    print("(")

    for i in 1 : v.dim
        print(get!(v.data, i, 0))
        i == v.dim || print(", ")
    end

    print(")\n")
end


function is_zero(v)
    return length(v.nonzero) == 0
end

function first_nonzero(v)
    return v.nonzero[1]
end

# Gleb: I do not insist on comprehensive typing for the prototype
# but here a more natural would be something like
# scale(v::Sparsik{T}, c::T)
# Alex: types erased
function scale(v, c)
    # Gleb: I also find the support of Unicode a fun feature
    # However, I suggest we do not use it in the "working" code
    # (as opposed to "presentational code").
    # Reason: problematic to type/search in many programming environments
    # Alex: fixed
    for idx in v.nonzero
        v.data[idx] *= c
    end
    return v
end


function sum(v1, v2)

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
    # Alex: fixed
    return Sparsik(v1.dim, new_indices, newdata)

end

# Gleb: this should be a docstring
# Alex: to be fixed
"returns v1 + v2 * c"
function reduce(v, u, c)
    return sum(v, scale(u, c))
end

# Gleb: this is the algorithm used in CLUE, I suggest
# we go deeper. A puzzle for you (should not be hard):
# if the vectors are with a and b nonzeroes, respectively,
# do this in O(min(a, b)) (randomized, amortized)
# Alex: see inner_2
function inner(v, u)
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


# assuming `Dict` to provide constant-time lookups
# and linear-time iterating
function inner_2(v, u)
    ans = 0

    if length(v.nonzero) > length(u.nonzero)
        # !!!
        # how to swap in O(1)?
        # swap(v, u)
    end

    if length(v.nonzero) > length(u.nonzero)
        for (i, x) in u.data
            ans += x * get(v, i)
        end
    else
        for (i, x) in v.data
            ans += x * get(u, i)
        end
    end

    return ans
end



function get(v, i)
    return get!(v.data, i, 0)
end


function from_vector(a)
    new_idx = []
    new_data = Dict()

    for (i, x) in enumerate(a)
        # generalized
        if !iszero(x)
            push!(new_idx, i)
            new_data[i] = x
        end
    end

    return Sparsik(length(a), new_idx, new_data)
end



+(v::Sparsik, u::Sparsik) = sum(v, u)
*(v::Sparsik, c::Real) = scale(v, c)
*(c::Real, v::Sparsik) = v * c
==(v::Sparsik, u::Sparsik) = (v.dim == u.dim;
            v.data == u.data;
            v.nonzero == u.nonzero)
!=(v::Sparsik, u::Sparsik) = !(v == u)

zero(v::Sparsik) = Sparsik(v.dim, [], Dict())


# Gleb: first, I am really happy to work with people who write tests for their code!
# Second: tests should be in a separate file in folder (tests/). I will send an example of how to organize
# Alex: tests moved

# --------------------------------------------
