
#=
    The file contains radicals related code
    We use the algorithm provided by basis.jl
=#

#------------------------------------------------------------------------------

include("basis.jl")

#------------------------------------------------------------------------------

# import iiiiiiiii

#------------------------------------------------------------------------------

algebra = 1

function find_radical_1(vectors)
    global algebra
    algebra = find_basis(vectors)
    As = basis(algebra)
    F = ground(first(As))
    n = dim(algebra)

    # println("algebra = \n", algebra)

    traces = Dict{Tuple{Int, Int}, elem_type(F)}(
        (i, j) => tr(As[i] * As[j])
        for i in 1 : n
            for j in i : n
    )

    nnz_coords = [
        (i, j, traces[min(i, j), max(i, j)])
        for i in 1 : n
            for j in 1 : n
                if ! iszero(traces[min(i, j), max(i, j)])
    ]

    AAAAAAA = from_COO(n, n, nnz_coords, F)

    ZZ = GF(2^31 - 1)

    A = modular_reduction(AAAAAAA, ZZ)

    @info "$n×$n-dim algebra matrix of densitu $(density(A))"
    # println(AAAAAAA)


    char_poly = randomized_char_polynomial(A)
    println("m(AAAAAAA) = $(Int(iszero(evaluate(char_poly, A))))")

    shifted_char_poly = shift_right_x(char_poly)

    Image = evaluate(shifted_char_poly, A)

    #

    # println(Image)



end


#------------------------------------------------------------------------------


function uwu()
    for (i, (mfn, mdim, msz, mdata)) in enumerate(load_COO_if(from_dim=10, to_dim=20))

        @info "$i-th model : $mfn of dim : $mdim"
        #=if i in [2]
            continue
        end=#

        As = map(matr -> from_COO(matr..., QQ), mdata)

        @time Rad = find_radical_1(As)


        println("-------------------------")

        #break
    end
end

function OWO()
    As = [
        from_dense([
            1 0 0;
            0 2 0;
            0 0 3;
        ], QQ)
    ]

    find_radical_1(As)
end

uwu()
# OWO()
