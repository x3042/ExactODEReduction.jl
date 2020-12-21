
# the File for some errors definitions

#------------------------------------------------------------------------------

import Base: showerror, show

#------------------------------------------------------------------------------

# should be raised in case of an algoruthm inconsistency occurred
# and must be handled usually
#
# how can we name it....
struct AlgebraException <: Exception
    msg::String
end

#------------------------------------------------------------------------------

function Base.showerror(io::IO, e::AlgebraException)
    print(io, "AlgebraException: " * e.msg)
end

function Base.show(io::IO, e::AlgebraException)
    print(io, "AlgebraException: " * e.msg)
end
