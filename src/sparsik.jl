

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


struct Sparsik
    dim::Int
    nonzero::Vector{Int}
    data::Dict{Int, Any}
end

#------------------------------------------------------------------------------

function print_vector(v::Sparsik)
    print("(")

    for i in 1 : v.dim
        # Gleb: important thing: in Julia, there is a convention that functions changing the arguments end with !
        # Therefore, this get! may change the argument. In fact, it there is no i, it will insert zero, so your vector
        # will soon become not so sparse. Use simply get instead
        print(get!(v.data, i, 0))
        # Gleb: if would be more readable. By the way, there is a join function like in Python
        i == v.dim || print(", ")
    end

    print(")\n")
end

#------------------------------------------------------------------------------

function is_zero(v::Sparsik)
    return length(v.nonzero) == 0
end

#------------------------------------------------------------------------------

function first_nonzero(v::Sparsik)
    return v.nonzero[1]
end

#------------------------------------------------------------------------------

function scale(v::Sparsik, c)
    # Gleb: treat the case c = 0 (and include it to tests)
    for idx in v.nonzero
        v.data[idx] *= c
    end
    return v
end

#------------------------------------------------------------------------------

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

    return Sparsik(v1.dim, new_indices, newdata)
end

#------------------------------------------------------------------------------

# Gleb: this should be a docstring
# Alex: to be fixed
"returns v1 + v2 * c"
function reduce(v::Sparsik, u::Sparsik, c)
    return sum(v, scale(u, c))
end

#------------------------------------------------------------------------------

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

#------------------------------------------------------------------------------

# assuming `Dict` to provide constant-time lookups
# and linear-time iterating
# Gleb: valid assumption
function inner_2(v, u)
    ans = 0

    if length(v.nonzero) > length(u.nonzero)
        # !!!
        # how to swap in O(1)?
        # swap(v, u)
        # Gleb: just call inner_2(u, v)
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

#------------------------------------------------------------------------------

# Gleb: again, get! is mutating
function get(v::Sparsik, i::Int)
    return get!(v.data, i, 0)
end

#------------------------------------------------------------------------------

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

#------------------------------------------------------------------------------

+(v::Sparsik, u::Sparsik) = sum(v, u)
*(v::Sparsik, c::Any) = scale(v, c)
*(c::Any, v::Sparsik) = v * c
==(v::Sparsik, u::Sparsik) = (v.dim == u.dim;
            v.data == u.data;
            v.nonzero == u.nonzero)
!=(v::Sparsik, u::Sparsik) = !(v == u)

zero(v::Sparsik) = Sparsik(v.dim, [], Dict())

# -----------------------------------------------------------------------------
