
push!(LOAD_PATH,"../src/")

#####

using Pkg, Documenter
using ExactODEReduction


makedocs(
    modules = [ ExactODEReduction ],
    sitename = "Documenter.jl",
    authors = "Elizaveta Demitraki, Alexander Demin, and Gleb Pogudin",
    pages = [
        "Home" => "index.md",
        "Examples" => Any[
            "examples/example_subspaces.md",
            "examples/example_full.md"
        ],
        "Documentation" => Any[
            "documentation/types.md",
            "documentation/functions.md",
            "documentation/structures.md",
        ]
    ]
)

makedocs(sitename="ExactODEReduction.jl")

deploydocs(
    branch = "gh-pages",
    repo = "github.com/x3042/Exact-reduction-of-ODE-systems.git",
    devbranch = "main",
)
