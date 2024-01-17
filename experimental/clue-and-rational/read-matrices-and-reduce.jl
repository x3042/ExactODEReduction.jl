include((@__DIR__) * "/../../src/ExactODEReduction.jl")
using Nemo
using NaturalSort

# We need to be careful with the order of variables.
# In clue-dump-matrices.py, we have 80 variables initially:
# 48 are constant parameters, 32 are variables.
#
# (?) As I understand, these are turned to 32 variables
# via a random substitution of parameters. As a result,
# 32 by 32 matrices are obtained in clue-dump-matrices.py
# and written to file ode.txt 
# (file ode.ode contains same equations, but preluded/concluded with begin/end)

# This file reads those matrices from ode.txt,
# runs subspace search, and finally tries to convert subspaces into systems

##################
# Parse matrices

# load the matrix from `lines` until separator is met
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

# load and return all matrices from the filename
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

# (!!!) Note: 32 by 32 matrices.
# one dimension per each variable, params excluded
matrices = readmatrices((@__DIR__)*"/matrices.txt")

@assert length(unique(map(size, matrices))) == 1
@info "$(length(matrices)) matrices, each is $(size(matrices[1]))"

##################
# Find invariant subspaces

our_matrices = map(
    m -> ExactODEReduction.sparse(m), 
    matrices
)

invariant_subspaces = ExactODEReduction.many_invariant_subspaces(our_matrices, ExactODEReduction.invariant_subspace_global)

##################
# Show reductions as systems in polynomial variables

# We use some legacy code, without ODE structs,
# for system-less transformation
include("legacy.jl")

# vars contains 80 things,
# first 48 are k1, k2, ..., k48 (constant parameters)
# last 32 are x1, x2, ..., x32
# (!!!) we will need to change the order of variables
ODEs, vars, params = ExactODEReduction.load_ODE_fromfile((@__DIR__) * "\\ode.ode", return_dict=true)

# (!!!) Exactly 32 equations in the correct order

eqs = [ODEs[x] for x in filter(var -> occursin("x", string(var)), sort(vars, by=string, lt=natural))]
correctRing, correctVars = PolynomialRing(QQ,
    ["x$i" for i in 1:32]
)

# Change the order of variables in eq
# (!!!) and substitute 48 ones for parameters
forty_eight_ones = [one(correctRing) for i in 1:48]
eqs = map(eq -> evaluate(eq, [forty_eight_ones..., correctVars...]), eqs)

results = Vector{Any}()
for (i, V) in enumerate(invariant_subspaces)
    V = ExactODEReduction.basis(ExactODEReduction.linear_span!(V))
    (transformation, new_system) = perform_change_of_variables(eqs, V)
    push!(results, Dict(:new_vars => transformation, :new_system => new_system))
end

# We find 24 reductions in total.
# Out of those, there are some (the list is unexaustive)
# with non-trivial dynamics:

results[3][:new_system]
#=
3-element Vector{AbstractAlgebra.Generic.Frac{fmpq_mpoly}}:
 -y1*y2 + y3
 -y1*y2 + y3
 y1*y2 - y3
=#

results[6][:new_system]
#=
6-element Vector{AbstractAlgebra.Generic.Frac{fmpq_mpoly}}:
 -y1*y3 + y4
 -y2*y5 + y6
 -y1*y3 + y4
 y1*y3 - y4
 -y2*y5 + y6
 y2*y5 - y6
=#

results[17][:new_system]
#=
17-element Vector{AbstractAlgebra.Generic.Frac{fmpq_mpoly}}:
 -y1*y3 + y4
 -y2*y5 + y6
 -y1*y3 + y4
 y1*y3 - y4
 -y2*y5 + y6
 y2*y5 - y6
 0
 0
 ...
 0
 (-y6*y17)//(y17 + 1)
=#

results[23][:new_system]
#=
23-element Vector{AbstractAlgebra.Generic.Frac{fmpq_mpoly}}:
 -y1*y3 + y4
 -y2*y5 + y6
 -y1*y3 + y4
 y1*y3 - y4
 -y2*y5 + y6
 y2*y5 - y6
 0
 ...
 0
 (-y6*y17)//(y17 + 1)
 (y6*y17)//(y17 + 1)
 (-y18*y19*y20 - y18*y19 + y19*y20*y21 + y20*y21)//(y19*y20 + y19 + y20 + 1)
 (y18*y19*y20 + y18*y19 - y19*y20*y21 - y20*y21)//(y19*y20 + y19 + y20 + 1) 0
 0
 ...
=#
