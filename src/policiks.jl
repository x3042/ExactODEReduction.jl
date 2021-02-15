
#=
    The File contains Policies definitions -
    - they are used to specify the execution policy of parallel algorithms -
      i.e., the kinds of parallelism allowed
=#

### NOT USED FOR NOW

using Base.Threads

#------------------------------------------------------------------------------

# Each other policy is a subtype of this
abstract type AbstractPolicy end

#------------------------------------------------------------------------------

# The execution policy type used as a unique type to disambiguate
# parallel algorithm overloading and require that a parallel algorithm's
# execution *may not be* parallelized
# The invocations of element access functions in parallel algorithms
# invoked with this policy are indeterminately sequenced in the calling thread
struct SequencedPolicy <: AbstractPolicy

end

#------------------------------------------------------------------------------

# The execution policy type used as a unique type to disambiguate
# parallel algorithm overloading and indicate that a parallel algorithm's
# execution *may be* parallelized.
# The invocations of element access functions in parallel algorithms
# invoked with this policy are permitted to execute in either the invoking thread
# or in a thread implicitly created by the library to support parallel algorithm execution
# Any such invocations executing in the same thread
# are indeterminately sequenced with respect to each other
struct ParallelPolicy <: AbstractPolicy

end

#------------------------------------------------------------------------------

const seq = SequencedPolicy()
const par = ParallelPolicy()
