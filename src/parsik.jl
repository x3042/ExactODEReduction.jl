
import JSON


#------------------------------------------------------------------------------

# returns a model parsed from the given `filename`
# (with matrices in a dense format)
# each returned matrix is represented with a dense array
function load_dense_set(filename::String)
    ans = []

    filepath = "$(normpath(joinpath(@__FILE__, "..", "..")))/src/data/matrices/$(filename)"

    open(filepath, "r") do input_stream
        for arr in JSON.Parser.parse(input_stream)
            push!(ans, arr)
        end
    end

    return ans
end

#------------------------------------------------------------------------------

# returns a model parsed from the given `filename`
# (with matrices in a coordinate format)
# each returned matrix is represented with an array of
# items (i, j, x) where typeof(x) is Rational
function load_COO_set(filename::String)
    model = []

    filepath = "$(normpath(joinpath(@__FILE__, "..", "..")))/src/data/matrices/$(filename)"

    str_to_nom = (x -> parse(BigInt, first(split(x, '/'))))
    str_to_den = (x -> (if occursin('/', x) parse(BigInt, last(split(x, '/'))) else 1 end))

    open(filepath, "r") do input_stream
        for arr in JSON.Parser.parse(input_stream)
            normal_repr = [
                arr[1], arr[2],
                map(x -> (x[1], x[2], str_to_nom(x[3]) // str_to_den(x[3])), arr[3])
            ]

            push!(model, normal_repr)
        end
    end

    return model
end

#------------------------------------------------------------------------------

# returns an array of all models from data/matrices that satisfy
# the given criterias:
#   `from_dim`  - lower bound for the model's matrices one-side dimension
#   `to_dim`    - upper bound -//-
#   `from_size` - lower bound for the model's total number of matrices
#   `to_size`   - upper bound -//-
#
# each returned model is represented with an array:
#   [filename, dim, size, matrices-data]
# each returned matrix is represented with an array of
# items (i, j, x) of nonzeroes where typeof(x) is Rational
function load_COO_if(;from_dim, to_dim, from_size=0, to_size=Inf)
    models = []

    for filename in readdir("src/data/matrices/")
        model_data = load_COO_set(filename)
        model_dim = first(first(model_data))
        model_size = length(model_data)

        if from_dim <= model_dim <= to_dim &&
                from_size <= model_size <= to_size
            push!(models, [filename, model_dim, model_size, model_data])
        end
    end

    @info "loaded models: $(length(models))"

    return models
end

#------------------------------------------------------------------------------
