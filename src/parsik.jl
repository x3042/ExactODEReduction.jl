import JSON

#=

    For the input format check the file `src/data/matrices_1.json`

    For the possible use case check the file `test/parsik_tests.jl`

=#

function load_matrix_set(filename::String)
    ans = []

    filepath = "$(normpath(joinpath(@__FILE__, "..", "..")))/src/data/$(filename)"

    open(filepath, "r") do input_stream
        for arr in JSON.Parser.parse(input_stream)
            push!(ans, arr)
        end
    end

    return ans
end
