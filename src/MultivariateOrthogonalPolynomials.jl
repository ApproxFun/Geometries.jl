module MultivariateOrthogonalPolynomials
using StaticArrays: iszero
using QuasiArrays: AbstractVector
using ClassicalOrthogonalPolynomials, FastTransforms, BlockBandedMatrices, BlockArrays, DomainSets,
      QuasiArrays, StaticArrays, ContinuumArrays, InfiniteArrays, InfiniteLinearAlgebra,
      LazyArrays, SpecialFunctions, LinearAlgebra, BandedMatrices, LazyBandedMatrices, ArrayLayouts,
      HarmonicOrthogonalPolynomials

import Base: axes, in, ==, *, ^, \, copy, copyto!, OneTo, getindex, size, oneto, all, resize!, BroadcastStyle, similar, fill!, setindex!, convert
import Base.Broadcast: Broadcasted, broadcasted, DefaultArrayStyle
import DomainSets: boundary

import QuasiArrays: LazyQuasiMatrix, LazyQuasiArrayStyle
import ContinuumArrays: @simplify, Weight, weight, grid, plotgrid, TransformFactorization, ExpansionLayout, plotvalues, unweighted

import ArrayLayouts: MemoryLayout, sublayout, sub_materialize
import BlockArrays: block, blockindex, BlockSlice, viewblock, blockcolsupport, AbstractBlockStyle, BlockStyle
import BlockBandedMatrices: _BandedBlockBandedMatrix, AbstractBandedBlockBandedMatrix, _BandedMatrix, blockbandwidths, subblockbandwidths
import LinearAlgebra: factorize
import LazyArrays: arguments, paddeddata, LazyArrayStyle, LazyLayout
import LazyBandedMatrices: LazyBandedBlockBandedLayout, AbstractBandedBlockBandedLayout, AbstractLazyBandedBlockBandedLayout
import InfiniteArrays: InfiniteCardinal

import ClassicalOrthogonalPolynomials: jacobimatrix, Weighted, orthogonalityweight, HalfWeighted, WeightedBasis
import HarmonicOrthogonalPolynomials: BivariateOrthogonalPolynomial, MultivariateOrthogonalPolynomial, Plan,
                                          PartialDerivative, AngularMomentum, BlockOneTo, BlockRange1, interlace

export MultivariateOrthogonalPolynomial, BivariateOrthogonalPolynomial,
       UnitTriangle, UnitDisk,
       JacobiTriangle, TriangleWeight, WeightedTriangle,
       DunklXuDisk, DunklXuDiskWeight, WeightedDunklXuDisk,
       Zernike, ZernikeWeight, zerniker, zernikez,
       PartialDerivative, Laplacian, AbsLaplacianPower, AngularMomentum,
       RadialCoordinate, Weighted, Block, jacobimatrix

include("ModalInterlace.jl")
include("disk.jl")
include("rectdisk.jl")
include("triangle.jl")


end # module
