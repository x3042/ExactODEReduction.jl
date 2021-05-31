
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
        "types.md"
    ]
)

makedocs(sitename="SparseAlgebra.jl")

deploydocs(
    root =  "github.com/sumiya11/SparseAlgebra.jl.git",
    branch = "gh-pages",
    repo = "github.com/sumiya11/SparseAlgebra.jl.git",
    devbranch = "master",
    target = "build"
)
