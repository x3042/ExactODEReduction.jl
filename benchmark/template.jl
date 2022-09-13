
include("../src/ExactODEReduction.jl")

#------------------------------------------------------------------------------

using Nemo
using Logging

#------------------------------------------------------------------------------

function uwuwu(from_size, to_size)
    dataset = ExactODEReduction.load_ODEs_recursive_if("/data/ODEs/",from_size=from_size, to_size=to_size)

    for  (i, (filename, system)) in enumerate(dataset)
        ODE = ExactODEReduction.ODE{fmpq_mpoly}(system) 
        reductions = ExactODEReduction.find_reductions(ODE, loglevel=Logging.Debug)
    end

end

#------------------------------------------------------------------------------

for sz in [(20, 30), (30, 40), (60, 70)]
    uwuwu(sz...)
end
