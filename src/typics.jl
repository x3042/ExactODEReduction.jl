
#=
    The File contains `AbstractSparsik<T>` interface
    and related funcs definitions
=#

#------------------------------------------------------------------------------

include("errors.jl")

#------------------------------------------------------------------------------

import Base: ==, !=, +, -, *
import Nemo: gfp_elem, gfp_fmpz_elem

#------------------------------------------------------------------------------

# AbstractSparsik<T>
#
# T is the field of the ground field
#
# Base interface for the Sparsiks family
# an Object which implements `AbstractSparsik` can be treated
# as a vector from a Vector space
abstract type AbstractSparsik{T} end

#------------------------------------------------------------------------------

function ground(::AbstractSparsik) end

function first_nonzero(::T) where {T<:AbstractSparsik} end
function getindex(::AbstractSparsik, i::Int) end

# Gleb: shouldn't we restrict C to the field of coefficients?
# Alex: I guess not, we want to be able to use standard `Number` subtypes,
#       such as Ints
function scale(::AbstractSparsik, ::C) where {C} end
function scale!(::AbstractSparsik, ::C) where {C} end

# To Be Changed sometime
function Base.reduce(::T, ::T, ::C) where {T<:AbstractSparsik{F}} where {F, C} end
function reduce!(::T, ::T, ::C) where {T<:AbstractSparsik{F}} where {F, C} end

function inner(::AbstractSparsik, ::AbstractSparsik) end

# hmmm
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

function Base.valtype(::AbstractSparsik) end
function Base.eltype(::AbstractSparsik) end

function Base.show(::AbstractSparsik) end
function print_sparsik(::AbstractSparsik) end

function modular_reduction(::AbstractSparsik, ::T) where {T} end
function rational_reconstruction(::AbstractSparsik) end

function Base.iterate(::AbstractSparsik, state) end

function unit_vector(::Int, ::Int, ::T) where {T} end

function random_sparsik(::Tuple{Int}, ::T) where {T} end

#------------------------------------------------------------------------------

function Base.convert(::Type{Int}, x::gfp_elem)
    return Int(x.data)
end

function Base.convert(::Type{BigInt}, x::gfp_fmpz_elem)
    return BigInt(x.data)
end

#------------------------------------------------------------------------------
