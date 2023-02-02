using ExactODEReduction
using Nemo

##################
# Parse

function readmatrix(lines; separator="==============")
    j = 1
    while !occursin(separator, lines[j])
        j += 1
    end
    mlines, lines = lines[1:j-1], lines[j+1:end]
    n = length(mlines)
    matrix = zeros(QQ, n, n)
    for i in 1:n
        line = strip(mlines[i], ['[', ']', '\n', '\t'])
        matrix[i, :] = map(s -> QQ(parse(Int, s)), split(line))
    end
    lines, matrix
end

function readmatrices(filename)
    fin = open(filename, "r")
    lines = readlines(fin)
    matrices = []
    while !isempty(lines)
        lines, matrix = readmatrix(lines)
        push!(matrices, matrix)
    end
    close(fin)
    matrices
end

matrices = readmatrices((@__DIR__)*"/matrices.txt")

@assert length(unique(map(size, matrices))) == 1
@info "$(length(matrices)) matrices, each is $(size(matrices[1]))"

##################
# Find reductions 

our_matrices = map(
    m -> ExactODEReduction.sparse(m), 
    matrices
)

invariant_subspaces = ExactODEReduction.many_invariant_subspaces(our_matrices, ExactODEReduction.invariant_subspace_global)

##################
# Show reductions as systems

# results = Vector{Any}()
# for (i, V) in enumerate(invariant_subspaces)
#     V = ExactODEReduction.basis(ExactODEReduction.linear_span!(V))
#     push!(results, ExactODEReduction.Reduction{Nemo.fmpq_mpoly}(system, V, :inheritance))
# end

# sort!(results, by=r -> length(r.new_vars))

# varnames = [
#     "x1", "x2", "x3", "x4", "x5", 
#     "x6", "x7", "x8", "x9", "x10", 
#     "x11", "x12", "x13", "x14", "x15", 
#     "x16", "x17", "x18", "x19", "x20", 
#     "x21", "x22", "x23", "x24", "x25", 
#     "x26", "x27", "x28", "x29", "x30", 
#     "x31", "x32",
#     "k1", "k2", "k3", "k4", "k5", "k6", 
#     "k7", "k8", "k9", "k10", "k11", "k12", 
#     "k13", "k14", "k15", "k16", "k17", "k18", 
#     "k19", "k20", "k21", "k22", "k23", "k24", 
#     "k25", "k26", "k27", "k28", "k29", "k30", 
#     "k31", "k32", "k33", "k34", "k35", "k36", 
#     "k37", "k38", "k39", "k40", "k41", "k42", 
#     "k43", "k44", "k45", "k46", "k47", "k48",
# ]

# poly_ring, xs = PolynomialRing(QQ, varnames)
