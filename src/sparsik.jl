

#=
    The File contains Sparsik<Rational> and related funcs

    Overloaded functions:
        get, getindex, zero, iszero, reduce,
        empty!, length, show, isempty
=#


# TODO:
#       - write nnz iterator

#------------------------------------------------------------------------------

using Nemo


import Base: ==, !=, +, -, *, get

#------------------------------------------------------------------------------


"""
Sparsik

`Sparsik` implements Sparse Vector to store Rational numbers. One can
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
    data::Dict{Int, fmpq}
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
    if iszero(v)
        return -1
    end
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
# mutates v
# if the vectors `v` and `u` have k and r nonzeroes respectively
# O(k + r) (randomized, amortized)
function Nemo.reduce!(v::Sparsik, u::Sparsik, c)
    new_nonzero = []
    new_data = Dict{Int, fmpq}()

    i, j = 1, 1

    v_nnz = v.nonzero
    u_nnz = u.nonzero

    while i <= length(v) || j <= length(u)
        new_val = zero(QQ)
        new_idx = 0

        if i > length(v)
            new_idx = u_nnz[j]
            j += 1
        elseif j > length(u)
            new_idx = v_nnz[i]
            i += 1
        else
            new_idx = min(v_nnz[i], u_nnz[j])
            if v_nnz[i] < u_nnz[j]
                i += 1
            elseif v_nnz[i] > u_nnz[j]
                j += 1
            else
                i += 1
                j += 1
            end
        end

        new_val = v[new_idx] + c * u[new_idx]

        if !iszero(new_val)
            push!(new_nonzero, new_idx)
            new_data[new_idx] = new_val
        end

    end
    v = Sparsik(size(v), new_nonzero, new_data)
    return v
end

#------------------------------------------------------------------------------

# returns v + c * u
# O(k + r) (randomized, amortized)
function Base.reduce(v::Sparsik, u::Sparsik, c)
    return reduce!(deepcopy(v), u, c)
end

#------------------------------------------------------------------------------

# if the vectors `v` and `u` have k and r nonzeroes respectively
# O(min(k, r)) (randomized, amortized)
function inner(v::Sparsik, u::Sparsik)

    ans = zero(QQ)

    if length(v) > length(u)
        inner(u, v)
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
    new_data = Dict{Int, fmpq}()

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
    return zero(Sparsik(dim, [], Dict{Int, fmpq}()))
end

#------------------------------------------------------------------------------

Base.zero(v::Sparsik) = Sparsik(v.dim, [], Dict{Int, fmpq}())
Base.iszero(v::Sparsik) = length(v) == 0

Base.get(v::Sparsik, i::Int) = get(v.data, i, zero(QQ))

Base.getindex(v::Sparsik, i::Int) = get(v, i)

Base.size(v::Sparsik) = v.dim
Base.size(v::Sparsik, i::Int) = v.dim

Base.length(v::Sparsik) = length(v.nonzero)

Base.isempty(v::Sparsik) = length(v.nonzero) == 0

# -----------------------------------------------------------------------------

+(v::Sparsik, u::Sparsik) = reduce(v, u, QQ(1))
-(v::Sparsik, u::Sparsik) = reduce(v, u, QQ(-1))
-(v::Sparsik) = scale(v, QQ(-1))

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
