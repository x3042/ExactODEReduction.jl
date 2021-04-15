
#=
    The File contains types and interfaces definitions
=#


# All interfaces defined here must provide one-based indexing,
# yet internal indexing is implementation-defined

#------------------------------------------------------------------------------

include("policiks.jl")
include("utils.jl")


#------------------------------------------------------------------------------

import Nemo
import Base: ==, !=, +, -, *
import Nemo: gfp_elem, gfp_fmpz_elem, base_ring
import AbstractAlgebra: Field

#------------------------------------------------------------------------------

# AbstractSparseObject<T>
#
# `T` is the type of the base_ring field
#
# Base interface for anything Sparse implemented in this project
abstract type AbstractSparseObject{T} end

#------------------------------------------------------------------------------

# AbstractSparseVector<T>
#
# `T` is the type if the base_ring field
#
# Base interface for Sparse vectors family
# An object which implements `AbstractSparseVector` can be treated
# as an element of Rⁿ vectorspace. Thus, some vectorspace operations and
# left matrix multiplication are supported for such objects
abstract type AbstractSparseVector{T} <: AbstractSparseObject{T} end

#------------------------------------------------------------------------------

# AbstractSparseMatrix<T>
#
# `T` is the type if the base_ring field
#
# Base interface for Sparse matrices family
# An object which implements `AbstractSparseMatrix` can be treated
# as an element from a Matrix algebra
# An object which implements `AbstractSparseMatrix` can be treated
# as a linear operator in Rⁿ
#
#
# Implementing some functions for other sparse formats
# rather than DOK is tricky,
# probably, this interface it too strong to be applied to every class
abstract type AbstractSparseMatrix{T} <: AbstractSparseObject{T} end

#------------------------------------------------------------------------------

function Nemo.base_ring(::AbstractSparseMatrix) end

function first_nonzero(::T) where {T<:AbstractSparseMatrix} end
function getindex(::AbstractSparseMatrix, i::Int) end

function scale(::AbstractSparseMatrix, ::C) where {C} end
function scale!(::AbstractSparseMatrix, ::C) where {C} end

# To Be Changed sometime
# !!!
# A tender for a better name!
function Base.reduce(::T, ::T, ::C) where {T<:AbstractSparseMatrix{F}} where {F, C} end
function reduce!(::T, ::T, ::C) where {T<:AbstractSparseMatrix{F}} where {F, C} end

function inner(::AbstractSparseMatrix, ::AbstractSparseMatrix) end

# hmmm
function Base.prod(::T, ::T) where {T<:AbstractSparseMatrix{F}} where {F} end

function Base.zero(::AbstractSparseMatrix) end
function Base.isempty(::AbstractSparseMatrix) end
function Base.iszero(::AbstractSparseMatrix) end

function dim(::AbstractSparseMatrix) end
function Base.length(::AbstractSparseMatrix) end
function Base.size(::AbstractSparseMatrix) end
function Base.size(::AbstractSparseMatrix, i::Int) end

function density(::AbstractSparseMatrix) end

function ==(::T, ::T) where {T<:AbstractSparseMatrix{F}} where {F} end
function !=(::T, ::T) where {T<:AbstractSparseMatrix{F}} where {F} end

function Base.valtype(::AbstractSparseMatrix) end
function Base.eltype(::AbstractSparseMatrix) end

function Base.show(::AbstractSparseMatrix) end
function print_sparsik(::AbstractSparseMatrix) end

function modular_reduction(::AbstractSparseMatrix, ::T) where {T} end
function rational_reconstruction(::AbstractSparseMatrix) end

function Base.iterate(::AbstractSparseMatrix, state) end

function unit_vector(::Int, ::Int, ::T) where {T} end

function random_sparsik(::Tuple{Int}, ::T) where {T} end

#------------------------------------------------------------------------------
