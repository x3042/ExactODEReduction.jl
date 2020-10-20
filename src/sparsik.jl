

#=
    The File contains Sparsik<Real> and related funcs

    Overloaded functions:
        get, getindex, zero, iszero, reduce, empty!, length
=#


# TODO:
#       - write convenience functions, e.g array-subscription
#       - read documentation about documentation

#------------------------------------------------------------------------------

import Base: ==, !=, +, -, *, get

#------------------------------------------------------------------------------


"""
Sparsik

`Sparsik` implements Sparse Vector to store Real numbers. One can
instantiate `Sparsik` via a default constructor

```
v = Sparsik(3, [1, 3], Dict(1 => 4, 3 => -1))
```
which is essentially equal to constructing a vector (4, 0, -1)

Alternatively, a sequence of values may be passed into `from_dense`

```
u = from_dense([4, 0, -1])
```

Note that `v` and `u` are considered equal
"""
struct Sparsik
    dim::Int
    nonzero::Vector{Int}
    data::Dict{Int, Any}
end

#------------------------------------------------------------------------------

# Alex: should this throw?
# O(1)
# Gleb: I would say yes
function first_nonzero(v::Sparsik)
    return v.nonzero[1]
end

#------------------------------------------------------------------------------

# if `v` has k nonzeroes
# O(k) (randomized, amortized)
function scale!(v::Sparsik, c)
    if iszero(c)
        return empty!(v)
    end

    for idx in v.nonzero
        v.data[idx] *= c
    end
    return v
end

#------------------------------------------------------------------------------

# if `v` has k nonzeroes
#  O(k) (randomized, amortized)
function scale(v::Sparsik, c)
    return scale!(deepcopy(v), c)
end

#------------------------------------------------------------------------------

# returns v + c * u
# if the vectors `v` and `u` have k and r nonzeroes respectively
# O(k + r) (randomized, amortized)
function Base.reduce(v::Sparsik, u::Sparsik, c)
    new_nonzero = []
    new_data = Dict()

    i, j = 1, 1

    while i <= length(v) || j < length(u)
        new_val = v[i] + c * u[j]
        new_idx = 0

        if i > length(v)
            new_idx = j
            j += 1
        elseif j > length(u)
            new_idx = i
            i += 1
        else
            if v.nonzero[i] < u.nonzero[j]
                new_idx = i
                i += 1
            elseif v.nonzero[i] > u.nonzero[j]
                new_idx = j
                j += 1
            else
                new_idx = i
                i += 1
                j += 1
            end
        end

        if !iszero(new_val)
            push!(new_nonzero, new_idx)
            new_data[new_idx] = new_val
        end

    end

    return Sparsik(size(v, 1), new_nonzero, new_data)
end

#------------------------------------------------------------------------------

# if the vectors `v` and `u` have k and r nonzeroes respectively
# O(k + r) (randomized, amortized)
function inner(v::Sparsik, u::Sparsik)
    i, j = 1, 1

    # zero(...) instead of `0`
    ans = 0

    while i <= length(v) && j <= length(u)
        if v.nonzero[i] == u.nonzero[j]
            ans += v[v.nonzero[i]] * u[u.nonzero[j]]
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

# if the vectors `v` and `u` have k and r nonzeroes respectively
# O(min(k, r)) (randomized, amortized)
function inner_2(v::Sparsik, u::Sparsik)

    # zero(...) instead of `0`
    ans = 0

    if length(v) > length(u)
        inner_2(u, v)
    end

    for (i, x) in v.data
        ans += x * u[i]
    end

    return ans
end

#------------------------------------------------------------------------------

# constructs a `Sparsik` instance from an one-dimensional collection
# O(n) where n = length(a) (randomized, amortized)
function from_dense(a)
    new_nonzero = []
    new_data = Dict()

    for idx in findall(!iszero, a)
        push!(new_nonzero, idx[1])
        new_data[idx[1]] = a[idx]
    end

    return Sparsik(length(a), new_nonzero, new_data)
end

#------------------------------------------------------------------------------

# if the vector `v` has k nonzeroes,
# O(k)
function Base.empty!(v::Sparsik)
    empty!(v.nonzero)
    empty!(v.data)
    return v
end

#------------------------------------------------------------------------------

function zero_sparsik(dim::Int)
    return zero(Sparsik(dim, [], Dict()))
end

#------------------------------------------------------------------------------

Base.zero(v::Sparsik) = Sparsik(v.dim, [], Dict())
Base.iszero(v::Sparsik) = length(v) == 0

# `zero(...)` instead of `0`
Base.get(v::Sparsik, i::Int) = get(v.data, i, 0)

Base.getindex(v::Sparsik, i::Int) = get(v, i)

Base.size(v::Sparsik) = (v.dim, )
Base.size(v::Sparsik, i::Int) = v.dim

Base.length(v::Sparsik) = length(v.nonzero)

# -----------------------------------------------------------------------------

+(v::Sparsik, u::Sparsik) = reduce(v, u, 1)
-(v::Sparsik, u::Sparsik) = reduce(v, u, -1)
-(v::Sparsik) = scale(v, -1)

*(v::Sparsik, c::Any) = scale(v, c)
*(c::Any, v::Sparsik) = v * c

==(v::Sparsik, u::Sparsik) = (v.dim == u.dim &&
            v.data == u.data &&
            v.nonzero == u.nonzero)
!=(v::Sparsik, u::Sparsik) = !(v == u)

# -----------------------------------------------------------------------------

function print_vector(v::Sparsik)
    println("($(join(map(idx -> get(v, idx), 1 : v.dim), ", ")))")
end

# -----------------------------------------------------------------------------
