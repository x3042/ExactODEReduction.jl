var documenterSearchIndex = {"docs":
[{"location":"guide/#Guide","page":"Guide","title":"Guide","text":"","category":"section"},{"location":"guide/","page":"Guide","title":"Guide","text":"The algorithms in this package take as input a system of ODEs with polynomial right-hand side and return the new variable expressions and the corresponding system(s).","category":"page"},{"location":"guide/#Creating-an-ODE-and-finding-reductions","page":"Guide","title":"Creating an ODE and finding reductions","text":"","category":"section"},{"location":"guide/","page":"Guide","title":"Guide","text":"As an example, consider the folliwing system of differential equations","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"begincases \ndotx_1 = x_1^2 + 2x_1x_2 \ndotx_2 =  x_2^2 + x_3 + x_4 \ndotx_3 = x_2 + x_4 \ndotx_4 = x_1 + x_3 \nendcases","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"To create a system as above in ExactODEReduction.jl, use the ODEsystem macro. This is the easiest way to do so.","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"using ExactODEReduction\n\nodes = @ODEsystem(   \n    x1'(t) = x1^2 + 2x1*x2,     \n    x2'(t) = x2^2 + x3 + x4,    \n    x3'(t) = x2 + x4,\n    x4'(t) = x1 + x3\n)","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"After using the macro, we can call find_reductions function. This function accepts the ODE model and outputs possible linear reductions.","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"reductions = find_reductions(odes)","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"Note that because of the randomization the result may be different between several runs. If you need to fix the result, use the seed keyword argument (see Finding reductions).","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"The reductions object can be treated as an array of reductions. For example, to access the second reduction from the list, type","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"reduction2 = reductions[2]","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"Further, we can use new_system and new_vars functions to explore this reduction.","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"new_ode = new_system(reduction2)","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"Note that new_ode from above is again an ODE object. In particular, this means that all functions from (Section Functions for manipulating ODEs) will also work for it.","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"new_vars = new_vars(reduction2)","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"The function find_reductions additionaly provides several useful keyword arguments, which are described in Finding reductions.","category":"page"},{"location":"reductions/#Functions-for-finding-reductions","page":"Functions for finding reductions","title":"Functions for finding reductions","text":"","category":"section"},{"location":"reductions/#Finding-reductions","page":"Functions for finding reductions","title":"Finding reductions","text":"","category":"section"},{"location":"reductions/","page":"Functions for finding reductions","title":"Functions for finding reductions","text":"find_reductions","category":"page"},{"location":"reductions/#ExactODEReduction.find_reductions","page":"Functions for finding reductions","title":"ExactODEReduction.find_reductions","text":"find_reductions(system::ODE; overQ=true, makepositive=false, loglevel=Logging.Info)\n\nFinds reductions of the system corresponding to a Jordan-Hoelder filtration. This means that the reduction form a chain, and there are no extra intermediate reduction in this chain. In particular, if there exists at least one reduction, it will be found.\n\nArguments:\n\nsystem is an ODE system given as ODE object,\noverQ tells the algorithm to search for reductions over rational numbers. Is true by default,\nseed is a seed for the random number generator,\nmakepositive tells the algorithm to search for reductions with positive coefficients. false by default.\n\nTo enable this argument, you should have Polymake.jl imported. \n\nloglevel is a level of logging. Logging.Info by default.\nparameter_strategy prescribes the way the parameter in the resulting system will be recognized:\n:inheritance (default) the parameters in the new system are exactly combinations of the original parameters\n:constants the parameters in the new system will be the variables with zero dynamics\n:none - no parameters in the result\n\nExample:\n\njulia> using ExactODEReduction\njulia> odes = @ODEsystem(\n    x'(t) = x + y,\n    y'(t) = x - y - z,\n    z'(t) = 2x - z\n)\njulia> find_reductions(odes)\nA chain of 2 reductions of dimensions 1, 2.\n==================================\n1. Reduction of dimension 1.\nNew system:\ny1'(t) = 0\nNew variables:\ny1 = x + y - z\n==================================\n2. Reduction of dimension 2.\nNew system:\ny1'(t) = -y1(t) + y2(t)\ny2'(t) = y1(t) - y2(t)\nNew variables:\ny1 = x - z\ny2 = y\n\n\n\n\n\n","category":"function"},{"location":"reductions/","page":"Functions for finding reductions","title":"Functions for finding reductions","text":"find_smallest_constrained_reduction","category":"page"},{"location":"reductions/#ExactODEReduction.find_smallest_constrained_reduction","page":"Functions for finding reductions","title":"ExactODEReduction.find_smallest_constrained_reduction","text":"find_smallest_constrained_reduction(system::ODE, observables; overQ=true, makepositive=false, loglevel=Logging.Info)\n\nFinds the best linear reduction of the system. If there exists a reduction, it will be found.\n\nArguments:\n\nsystem is an ODE system given as ODE object,\nobservables is a list of linear functions of initial variables desired to be preserved by reduction,\noverQ tells the algorithm to search for reductions over rational numbers. Is true by default,\nseed is a seed for the random number generator,\nmakepositive tells the algorithm to search for reductions with positive coefficients. false by default.\n\nTo enable this argument, you should have Polymake.jl imported. \n\nloglevel is a level of logging. Logging.Info by default.\nparameter_strategy prescribes the way the parameter in the resulting system will be recognized:\n:inheritance (default) the parameters in the new system are exactly combinations of the original parameters\n:constants the parameters in the new system will be the variables with zero dynamics\n:none - no parameters in the result\n\nExample:\n\njulia> using ExactODEReduction\njulia> odes = @ODEsystem(\n    x'(t) = x + y,\n    y'(t) = x - y - z,\n    z'(t) = 2x - z\n)\njulia> find_smallest_constrained_reduction(odes, [x + (1//2)*z])\nReduction of dimension 2.\nNew system:\ny1'(t) = 2*y1(t) + y2(t)\ny2'(t) = -2*y1(t) - y2(t)\nNew variables:\ny1 = x + 1//2*z\ny2 = y - 3//2*z\n\n\n\n\n\n","category":"function"},{"location":"reductions/","page":"Functions for finding reductions","title":"Functions for finding reductions","text":"find_some_reduction","category":"page"},{"location":"reductions/#ExactODEReduction.find_some_reduction","page":"Functions for finding reductions","title":"ExactODEReduction.find_some_reduction","text":"find_some_reduction(system::ODE; overQ, seed, makepositive, loglevel, parameter_strategy)\n\nFinds a nontrivial linear reduction of the system. If there exists a reduction, it will be found.\n\nArguments:\n\nsystem is an ODE system given as ODE object,\noverQ tells the algorithm to search for reductions over rational numbers. Is true by default,\nseed is a seed for the random number generator,\nmakepositive tells the algorithm to search for reductions with positive coefficients. false by default.\n\nTo enable this argument, you should have Polymake.jl imported. \n\nloglevel is a level of logging. Logging.Info by default.\nparameter_strategy prescribes the way the parameter in the resulting system will be recognized:\n:inheritance (default) the parameters in the new system are exactly combinations of the original parameters\n:constants the parameters in the new system will be the variables with zero dynamics\n:none - no parameters in the result\n\nExample:\n\njulia> using ExactODEReduction\njulia> odes = @ODEsystem(\n    x'(t) = x + y,\n    y'(t) = x - y - z,\n    z'(t) = 2x - z\n)\njulia> find_some_reduction(odes)\nReduction of dimension 1.\nNew system:\ny1'(t) = -2*y1(t)\nNew variables:\ny1 = x - y - z\n\n\n\n\n\n","category":"function"},{"location":"reductions/#Exploring-found-reductions","page":"Functions for finding reductions","title":"Exploring found reductions","text":"","category":"section"},{"location":"reductions/","page":"Functions for finding reductions","title":"Functions for finding reductions","text":"The functions find_some_reduction and find_smallest_constrained_reduction return a Reduction object.","category":"page"},{"location":"reductions/","page":"Functions for finding reductions","title":"Functions for finding reductions","text":"Reduction","category":"page"},{"location":"reductions/#ExactODEReduction.Reduction","page":"Functions for finding reductions","title":"ExactODEReduction.Reduction","text":"Reduction\n\nRepresents a single reduction of some ODE system.  This is returned from reduction functions.\n\nExample:\n\nusing ExactODEReduction\nodes = @ODEsystem(\n    x'(t) = x + y,\n    y'(t) = x - y - z,\n    z'(t) = 2x - z\n)\n\nreduction = find_some_reduction(odes)\n\n## prints\nReduction of dimension 1.\nNew system:\ny1'(t) = y1(t)\nNew variables:\ny1 = x + 1//2*y - 1//4*z\n\nnew_system(reduction)\n## prints\ny1'(t) = y1(t)\n\nnew_vars(reduction)\n## prints\nDict{Nemo.fmpq_mpoly, Nemo.fmpq_mpoly} with 1 entry:\n  y1 => x + 1//2*y - 1//4*z\n\n\n\n\n\n","category":"type"},{"location":"reductions/","page":"Functions for finding reductions","title":"Functions for finding reductions","text":"new_system","category":"page"},{"location":"reductions/#ExactODEReduction.new_system","page":"Functions for finding reductions","title":"ExactODEReduction.new_system","text":"new_system(r::Reduction)\n\nReturns the ODE object that defines the reduced system.\n\n\n\n\n\n","category":"function"},{"location":"reductions/","page":"Functions for finding reductions","title":"Functions for finding reductions","text":"new_vars","category":"page"},{"location":"reductions/#ExactODEReduction.new_vars","page":"Functions for finding reductions","title":"ExactODEReduction.new_vars","text":"new_system(r::Reduction)\n\nReturns the dictionary of new macro-variables expressed as linear combinations of the original variables.\n\n\n\n\n\n","category":"function"},{"location":"reductions/","page":"Functions for finding reductions","title":"Functions for finding reductions","text":"old_system","category":"page"},{"location":"reductions/#ExactODEReduction.old_system","page":"Functions for finding reductions","title":"ExactODEReduction.old_system","text":"old_system(r::Reduction)\n\nReturns the ODE object that defines the original system.\n\n\n\n\n\n","category":"function"},{"location":"reductions/","page":"Functions for finding reductions","title":"Functions for finding reductions","text":"new_initialconds","category":"page"},{"location":"reductions/#ExactODEReduction.new_initialconds","page":"Functions for finding reductions","title":"ExactODEReduction.new_initialconds","text":"new_initialconds(r::Reduction, ics::Dict)\n\nReturns a dictionary of initial conditions for the new variables as defined by the given reduction.\n\n\n\n\n\n","category":"function"},{"location":"reductions/","page":"Functions for finding reductions","title":"Functions for finding reductions","text":"reduce_data","category":"page"},{"location":"reductions/#ExactODEReduction.reduce_data","page":"Functions for finding reductions","title":"ExactODEReduction.reduce_data","text":"reduce_data(data::Array{Any, 2}, r::Reduction)\n\nFor a time-series data for the original system, returns  the corresponding time series for the reduction\n\n\n\n\n\n","category":"function"},{"location":"reductions/","page":"Functions for finding reductions","title":"Functions for finding reductions","text":"The function find_reduction returns a ChainOfReductions object, which, in practice, can be treated as Vector{Reduction}.","category":"page"},{"location":"reductions/","page":"Functions for finding reductions","title":"Functions for finding reductions","text":"ChainOfReductions","category":"page"},{"location":"reductions/#ExactODEReduction.ChainOfReductions","page":"Functions for finding reductions","title":"ExactODEReduction.ChainOfReductions","text":"Reduction\n\nRepresents a chain of Reductions of some ODE system.  This is returned from the find_reductions function.\n\nExample:\n\nusing ExactODEReduction\nodes = @ODEsystem(\n    x'(t) = x + y,\n    y'(t) = x - y - z,\n    z'(t) = 2x - z\n)\n\nreductions = find_reductions(odes)\n\n## prints\nA chain of 2 reductions of dimensions 1, 2.\n==================================\n1. Reduction of dimension 1.\nNew system:\ny1'(t) = y1(t)\nNew variables:\ny1 = x + 1//2*y - 1//4*z\n==================================\n2. Reduction of dimension 2.\nNew system:\ny1'(t) = y2(t)\ny2'(t) = 2*y1(t) - y2(t)\nNew variables:\ny1 = x - 1//2*z\ny2 = y + 1//2*z\n\nreduction2 = reductions[2]\n## prints\nReduction of dimension 2.\nNew system:\ny1'(t) = y2(t)\ny2'(t) = 2*y1(t) - y2(t)\nNew variables:\ny1 = x - 1//2*z\ny2 = y + 1//2*z\n\n\n\n\n\n\n","category":"type"},{"location":"reductions/","page":"Functions for finding reductions","title":"Functions for finding reductions","text":"length(::ChainOfReductions)","category":"page"},{"location":"reductions/#Base.length-Tuple{ChainOfReductions}","page":"Functions for finding reductions","title":"Base.length","text":"length(cor::ChainOfReductions)\n\nReturns the number of reductions in the chain.\n\n\n\n\n\n","category":"method"},{"location":"reductions/","page":"Functions for finding reductions","title":"Functions for finding reductions","text":"getindex(::ChainOfReductions, ::Integer)","category":"page"},{"location":"reductions/#Base.getindex-Tuple{ChainOfReductions, Integer}","page":"Functions for finding reductions","title":"Base.getindex","text":"getindex(cor::ChainOfReductions, i::Integer)\n\nReturns the i-th reduction in the chain. Returned object is of type Reduction.\n\n\n\n\n\n","category":"method"},{"location":"load/#Functions-for-loading-ODEs-from-a-file","page":"Functions for loading ODEs from a file","title":"Functions for loading ODEs from a file","text":"","category":"section"},{"location":"load/","page":"Functions for loading ODEs from a file","title":"Functions for loading ODEs from a file","text":"load_ODE_fromfile","category":"page"},{"location":"load/#ExactODEReduction.load_ODE_fromfile","page":"Functions for loading ODEs from a file","title":"ExactODEReduction.load_ODE_fromfile","text":"load_ODE_fromfile(filepath)\n\nReturns the ODE object constructed from equations in the *.ode file at the given filepath.\n\nFor the format *.ode see the examples folder in the repository.\n\n\n\n\n\n","category":"function"},{"location":"#ExactODEReduction.jl-documentation","page":"ExactODEReduction","title":"ExactODEReduction.jl documentation","text":"","category":"section"},{"location":"","page":"ExactODEReduction","title":"ExactODEReduction","text":"ExactODEReduction.jl is a Julia package that provides an algorithm for computing exact reductions of ODE systems. It finds a longest possible chain of linear reductions corresponding to Jordan-Hoelder filtration.","category":"page"},{"location":"","page":"ExactODEReduction","title":"ExactODEReduction","text":"This documentation contains information about the functionality of the package as well as examples of use cases. See the Guide section for a quick introduction.","category":"page"},{"location":"#Installation","page":"ExactODEReduction","title":"Installation","text":"","category":"section"},{"location":"","page":"ExactODEReduction","title":"ExactODEReduction","text":"To install ExactODEReduction.jl, run the following command in Julia:","category":"page"},{"location":"","page":"ExactODEReduction","title":"ExactODEReduction","text":"import Pkg\nPkg.add(\"ExactODEReduction.jl\")","category":"page"},{"location":"","page":"ExactODEReduction","title":"ExactODEReduction","text":"The package dependency on polymake is optional; it is loaded lazily only if necessary, and most of the package functionality works without it.","category":"page"},{"location":"#Features","page":"ExactODEReduction","title":"Features","text":"","category":"section"},{"location":"","page":"ExactODEReduction","title":"ExactODEReduction","text":"Given an ODE system with polynomial right-hand side, ExactODEReduction.jl computes a smaller, reduced system, with macro-parameters expressed as linear combinations of the original ones. ","category":"page"},{"location":"","page":"ExactODEReduction","title":"ExactODEReduction","text":"The main feature of the package is the algorithm for computing a longest chain of such reductions.","category":"page"},{"location":"#Feature-list","page":"ExactODEReduction","title":"Feature list","text":"","category":"section"},{"location":"","page":"ExactODEReduction","title":"ExactODEReduction","text":"Computed reductions are always exact transformations,\nAllows coefficients from rational numbers, as well as its extension,\nExpresses new macro-variables as conic combinations of the original ones.","category":"page"},{"location":"#Citation","page":"ExactODEReduction","title":"Citation","text":"","category":"section"},{"location":"","page":"ExactODEReduction","title":"ExactODEReduction","text":"/\n","category":"page"},{"location":"io/#Functions-for-manipulating-ODEs","page":"Functions for manipulating ODEs","title":"Functions for manipulating ODEs","text":"","category":"section"},{"location":"io/#Creating-ODE-systems","page":"Functions for manipulating ODEs","title":"Creating ODE systems","text":"","category":"section"},{"location":"io/","page":"Functions for manipulating ODEs","title":"Functions for manipulating ODEs","text":"@ODEsystem","category":"page"},{"location":"io/#ExactODEReduction.@ODEsystem","page":"Functions for manipulating ODEs","title":"ExactODEReduction.@ODEsystem","text":"@ODEsystem\n\nMacro for creating an ODE from a list of equations. Also injects all variables into the global scope. This macro accepts a sybolically written ODE system and generates an ODE structure instance.\n\nExample:\n\node = @ODEsystem(\n    x1'(t) = -k1 * x1(t),\n    x2'(t) = -k2 * x2(t)\n)\n[ Info: Summary of the model:\n[ Info: State variables: x1, x2\n[ Info: Parameters: k1, k2\nx1'(t) = -x1(t)*k1\nx2'(t) = -x2(t)*k2\n\n\n\n\n\n","category":"macro"},{"location":"io/","page":"Functions for manipulating ODEs","title":"Functions for manipulating ODEs","text":"ODE{P}","category":"page"},{"location":"io/#ExactODEReduction.ODE","page":"Functions for manipulating ODEs","title":"ExactODEReduction.ODE","text":"ODE{P}\n\nThe main structure that represents input ODE system. Stores information about states, initial conditions, and the equations. This structure is constructed via the @ODEmodel macro.\n\n\n\n\n\n","category":"type"},{"location":"io/#Accessing-ODE-data","page":"Functions for manipulating ODEs","title":"Accessing ODE data","text":"","category":"section"},{"location":"io/","page":"Functions for manipulating ODEs","title":"Functions for manipulating ODEs","text":"equations(ode::ODE)","category":"page"},{"location":"io/#ModelingToolkit.equations-Tuple{ODE}","page":"Functions for manipulating ODEs","title":"ModelingToolkit.equations","text":"equations(ode::ODE)\n\nReturns the array of equations of the given ODE system.\n\n\n\n\n\n","category":"method"},{"location":"io/","page":"Functions for manipulating ODEs","title":"Functions for manipulating ODEs","text":"states(ode::ODE)","category":"page"},{"location":"io/#SymbolicIndexingInterface.states-Tuple{ODE}","page":"Functions for manipulating ODEs","title":"SymbolicIndexingInterface.states","text":"states(ode::ODE)\n\nReturns the array of states of the given ODE system.\n\n\n\n\n\n","category":"method"},{"location":"io/","page":"Functions for manipulating ODEs","title":"Functions for manipulating ODEs","text":"parameters(ode::ODE)","category":"page"},{"location":"io/#SymbolicIndexingInterface.parameters-Tuple{ODE}","page":"Functions for manipulating ODEs","title":"SymbolicIndexingInterface.parameters","text":"parameters(ode::ODE)\n\nReturns the array of parameters of the given ODE system.\n\n\n\n\n\n","category":"method"},{"location":"io/","page":"Functions for manipulating ODEs","title":"Functions for manipulating ODEs","text":"initial_conditions(ode::ODE)","category":"page"},{"location":"io/#ExactODEReduction.initial_conditions-Tuple{ODE}","page":"Functions for manipulating ODEs","title":"ExactODEReduction.initial_conditions","text":"initial_conditions(ode::ODE)\n\nReturns the array of initial conditions of the given ODE system.\n\n\n\n\n\n","category":"method"},{"location":"io/","page":"Functions for manipulating ODEs","title":"Functions for manipulating ODEs","text":"parameter_values(ode::ODE)","category":"page"},{"location":"io/#ExactODEReduction.parameter_values-Tuple{ODE}","page":"Functions for manipulating ODEs","title":"ExactODEReduction.parameter_values","text":"parameter_values(ode::ODE)\n\nReturns the array of parameter values of the given ODE system.\n\n\n\n\n\n","category":"method"},{"location":"io/","page":"Functions for manipulating ODEs","title":"Functions for manipulating ODEs","text":"vars(ode::ODE)","category":"page"},{"location":"io/#AbstractAlgebra.vars-Tuple{ODE}","page":"Functions for manipulating ODEs","title":"AbstractAlgebra.vars","text":"vars(ode::ODE)\n\nReturns the array of polynomial variables of the given ODE system.\n\n\n\n\n\n","category":"method"},{"location":"io/","page":"Functions for manipulating ODEs","title":"Functions for manipulating ODEs","text":"to_state","category":"page"},{"location":"io/#ExactODEReduction.to_state","page":"Functions for manipulating ODEs","title":"ExactODEReduction.to_state","text":"to_state(ode::ODE, p)\n\nReturns a new ODE in which the parameter p is a state with zero dynamics.\n\n\n\n\n\n","category":"function"},{"location":"io/","page":"Functions for manipulating ODEs","title":"Functions for manipulating ODEs","text":"to_parameter","category":"page"},{"location":"io/#ExactODEReduction.to_parameter","page":"Functions for manipulating ODEs","title":"ExactODEReduction.to_parameter","text":"to_parameter(ode::ODE, x)\n\nReturns a new ODE in which the state x with zero dynamics is a parameter.\n\n\n\n\n\n","category":"function"},{"location":"io/#Converting-ODE-to-MTK.jl-and-back","page":"Functions for manipulating ODEs","title":"Converting ODE to MTK.jl and back","text":"","category":"section"},{"location":"io/","page":"Functions for manipulating ODEs","title":"Functions for manipulating ODEs","text":"ODEtoMTK","category":"page"},{"location":"io/#ExactODEReduction.ODEtoMTK","page":"Functions for manipulating ODEs","title":"ExactODEReduction.ODEtoMTK","text":"ODEtoMTK(ode::ODE)\n\nConverts an ODE object to an ModelingToolkit.ODESystem object and (!) inserts the MTK variables into the global scope.\n\nInput:\n\node - ODE object\n\nOutput: \n\nModelingToolkit.ODESystem object\n\n\n\n\n\n","category":"function"},{"location":"io/","page":"Functions for manipulating ODEs","title":"Functions for manipulating ODEs","text":"MTKtoODE","category":"page"},{"location":"io/#ExactODEReduction.MTKtoODE","page":"Functions for manipulating ODEs","title":"ExactODEReduction.MTKtoODE","text":"MTKtoODE(de::ModelingToolkit.ODESystem)\n\nConverts an ModelingToolkit.ODESystem object to an ODE object.\n\nInput:\n\nde - ModelingToolkit.ODESystem, a system to be converted\n\nOutput: \n\nODE object suitable for finding reductions\n\n\n\n\n\n","category":"function"}]
}
