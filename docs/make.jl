using Documenter, ExactODEReduction

makedocs(
    sitename="ExactODEReduction",
    modules = [ExactODEReduction],
    pages = [
        "ExactODEReduction" => "index.md",
        "Guide" => "guide.md",
        "Interface" => "interface.md"
    ]
)

deploydocs(
    repo = "github.com/x3042/Exact-reduction-of-ODE-systems.git",
)
