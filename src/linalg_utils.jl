
function gram_matrix(As::AbstractArray)
    F = base_ring(As[1])
    n = length(As)

    # allocate buffers
    xs = Vector{Int}(undef, n^2)
    ys = Vector{Int}(undef, n^2)
    vs = Vector{spec_elem_type(F)}(undef, n^2)

    as = map(sparse ∘ vec, As)
    ast = map(sparse ∘ vec ∘ transpose, As)

    # multiply everything with everything
    k = 0
    @inbounds for i in 1:n
        for j in i:n
            z = mydot(as[i], ast[j])
            if !iszero(z)
                k += 1
                xs[k] = i
                ys[k] = j
                vs[k] = z
                if j > i
                    k += 1
                    xs[k] = j
                    ys[k] = i
                    vs[k] = z
                end
            end
        end
    end
    # trim buffers
    resize!(xs, k)
    resize!(ys, k)
    resize!(vs, k)

    sparse(xs, ys, vs, n, n)
end

#-------------------------------------------------------------------------------

"""
    eigenspaces(M)

For a diagonalizable matrix M over QQ or QQBar, returns a list of 
bases of eigenspaces with entries in QQBar
"""
function eigenspaces(M)
    n = size(M, 1)
    SBar = Nemo.MatrixSpace(Nemo.QQBar, n, n)
    MBar = SBar([M[i, j] for i in 1:n for j in 1:n])
    eigenvals = Set(Nemo.eigenvalues(M, Nemo.QQBar))
    result = []
    id = one(MatrixSpace(Nemo.QQBar, size(M)...))
    for l in eigenvals
        as_matrix = AbstractAlgebra.nullspace(MBar - l * id)[2]
        push!(result, [as_matrix[:, i] for i in 1:size(as_matrix, 2)])
    end
    result
end

#------------------------------------------------------------------------------

# finds the general kernel of the given matrices
function common_kernel(matrices::AbstractArray)
    stacked = vcat(matrices...)
    Space = MatrixSpace(Nemo.QQ, size(stacked)...)
    return Array(last(kernel(Space(stacked))))
end

#------------------------------------------------------------------------------

# returns f(x₀)
# O(d) multiplications/additions of x₀ if d = degree(f)
function evaluate(f::Nemo.PolyElem, x₀)
    d = degree(f)

    I = one(x₀)
    accum = scale(I, lead(f))

    for i in 1 : d
        accum = accum * x₀ + scale(I, coeff(f, d - i))
    end

    return accum
end

#------------------------------------------------------------------------------

"""
    construct_jacobians(system)

For the given system of polynomials in variables xi
consturucts a set of matrices Aᵢ over number field
such that the Jacobian J of the provided system can represented as the sum
J = Aᵢxⁱ
"""
function construct_jacobians(system::AbstractArray{T}) where {T<:Nemo.MPolyElem}
    domain = base_ring(first(system))
    poly_ring = parent(first(system))
    gen2idx = Dict(x=>i for (i, x) in enumerate(gens(poly_ring)))

    jacobians = Dict()

    for (p_idx, poly) in enumerate(system)
        for var in vars(poly)
            v_idx = gen2idx[var]
            # term is of form α*monomial
            for term in terms(derivative(poly, var))
                monom = monomial(term, 1)
                cf = coeff(term, 1)

                !haskey(jacobians, monom) && (jacobians[monom] = Dict())
                idx = (v_idx, p_idx)
                if !haskey(jacobians[monom], idx)
                    jacobians[monom][idx] = zero(domain)
                end
                jacobians[monom][idx] += cf
            end
        end
    end

    m, n = length(system), length(gens(poly_ring))
    factors = [
        sparse(coo_to_arrays(jac)..., m, n)
        for jac in values(jacobians)
    ]

    @info "Constructed a set of $(length(factors)) matrices $m×$n from the system Jacobian"

    factors
end

function construct_jacobians(system)
    ring = parent(first(keys(system)))
    construct_jacobians([system[x] for x in gens(ring)])
end
