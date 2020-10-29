

#=
    The File contains Sparsik<Real> and related funcs

    Overloaded functions:
        get, getindex, zero, iszero, reduce, empty!, length,
        show, isempty
=#


# TODO:
#       - write nnz iterator

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

Alternatively, a sequence of values may be passed into `from_vector`

```
u = from_vector([4, 0, -1])
```

Note that `v` and `u` are considered equal
"""
struct Sparsik
    dim::Int
    nonzero::Vector{Int}
    data::Dict{Int, Any}
end

#------------------------------------------------------------------------------

function get_nnz(v::Sparsik)
    return v.nonzero
end

function get_data(v::Sparsik)
    return v.data
end

#------------------------------------------------------------------------------

# O(1)
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

    v_nnz = get_nnz(v)
    u_nnz = get_nnz(u)

    while i <= length(v) || j <= length(u)
        new_val = 0
        new_idx = 0

        if i > length(v)
            new_idx = j
            new_val = c * u[u_nnz[j]]
            j += 1
        elseif j > length(u)
            new_idx = i
            new_val = v[v_nnz[i]]
            i += 1
        else
            new_val = v[v_nnz[i]] + c * u[u_nnz[j]]

            if v_nnz[i] < u_nnz[j]
                new_idx = v_nnz[i]
                new_val = v[v_nnz[i]]
                i += 1
            elseif v_nnz[i] > u_nnz[j]
                new_idx = u_nnz[j]
                new_val = c * u[u_nnz[j]]
                j += 1
            else
                new_idx = v_nnz[i]
                i += 1
                j += 1
            end
        end

        if !iszero(new_val)
            push!(new_nonzero, new_idx)
            new_data[new_idx] = new_val
        end

    end

    return Sparsik(size(v), new_nonzero, new_data)
end

#------------------------------------------------------------------------------

# if the vectors `v` and `u` have k and r nonzeroes respectively
# O(k + r) (randomized, amortized)
function inner(v::Sparsik, u::Sparsik)

    # zero(...) instead of `0`
    ans = 0

    i, j = 1, 1

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

    # zero(...) instead of `0
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
function from_vector(a::Vector)
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

Base.size(v::Sparsik) = v.dim
Base.size(v::Sparsik, i::Int) = v.dim

Base.length(v::Sparsik) = length(v.nonzero)

Base.isempty(v::Sparsik) = length(v.nonzero) == 0

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

Base.show(v::Sparsik) = "($(join(map(idx -> v[idx], 1 : v.dim), ", ")))"

function print_vector(v::Sparsik)
    println(show(v))
end

# -----------------------------------------------------------------------------
