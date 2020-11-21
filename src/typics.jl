
#=
    The File contains `AbstractSparsik<T>` interface
    and related funcs definitions
=#

#------------------------------------------------------------------------------

import Base: ==, !=, +, -, *

#------------------------------------------------------------------------------

# AbstractSparsik<T>
#
# T is a field of coefficients type
#
# Base interface for Sparsiks family
# an Object which implements `AbstractSparsik` can be treated
# as a vector from a Vector space
abstract type AbstractSparsik{T} end

#------------------------------------------------------------------------------

function first_nonzero(::T) where {T<:AbstractSparsik} end
function getindex(::AbstractSparsik, i::Int) end

function scale(::AbstractSparsik, ::C) where {C} end
function scale!(::AbstractSparsik, ::C) where {C} end

# what if we do not want to extend Base.reduce..
function Base.reduce(::T, ::T, ::C) where {T<:AbstractSparsik{F}} where {F, C} end
function reduce!(::T, ::T, ::C) where {T<:AbstractSparsik{F}} where {F, C} end

function inner(::AbstractSparsik, ::AbstractSparsik) end

# we dont have this for vectors
function Base.prod(::T, ::T) where {T<:AbstractSparsik{F}} where {F} end

function Base.zero(::AbstractSparsik) end
function Base.isempty(::AbstractSparsik) end
function Base.iszero(::AbstractSparsik) end

function dim(::AbstractSparsik) end
function Base.length(::AbstractSparsik) end
function Base.size(::AbstractSparsik) end
function Base.size(::AbstractSparsik, i::Int) end

function density(::AbstractSparsik) end


function ==(::T, ::T) where {T<:AbstractSparsik{F}} where {F} end
function !=(::T, ::T) where {T<:AbstractSparsik{F}} where {F} end

function Base.iterate(::AbstractSparsik) end

function Base.valtype(::AbstractSparsik) end
function Base.eltype(::AbstractSparsik) end

function Base.show(::AbstractSparsik) end
function print_sparsik(::AbstractSparsik) end

function modular_reduction(::AbstractSparsik, field) end
function rational_reconstruction(::AbstractSparsik) end

function Base.iterate(::AbstractSparsik, state) end

#------------------------------------------------------------------------------
