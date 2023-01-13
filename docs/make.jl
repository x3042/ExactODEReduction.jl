using Documenter, ExactODEReduction

makedocs(
    sitename="ExactODEReduction",
    modules = [ExactODEReduction],
    pages = [
        "ExactODEReduction" => "index.md",
        "Guide" => "guide.md",
        "Interface" => [
            "Functions for manipulating ODEs" => "io.md",
            "Functions for finding reductions" => "reductions.md",
            "Functions for loading ODEs from a file" => "load.md"
        ]
    ],
    format = Documenter.HTML(analytics = "G-ETWS53KF64"),
)

deploydocs(
    repo = "github.com/x3042/ExactODEReduction.git",
)
