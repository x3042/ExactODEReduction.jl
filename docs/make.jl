
push!(LOAD_PATH,"../src/")

#####

using Pkg, Documenter
using SparseAlgebra


makedocs(
    modules = [SparseAlgebra],
    sitename = "Documenter.jl",
    authors = "Elizaveta Demitraki, Alexander Demin, and Gleb Pogudin",
    pages = [
        "Home" => "index.md",
        "Examples" => [
            "Subspaces" => "example_subspaces.md",
            "Reduce ODEs" => "example_full.md"
        ]
        "Documentation" => [
            "Types" => "types.md",
            "Functions" => "functions.md",
            "Structures" => "structures.md",
        ]
        "types.md"
    ]
)

makedocs(sitename="SparseAlgebra.jl")

deploydocs(
    branch = "gh-pages",
    repo = "github.com/x3042/Exact-reduction-of-ODE-systems.git",
    devbranch = "main",
)
