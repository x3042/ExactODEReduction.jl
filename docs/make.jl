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
