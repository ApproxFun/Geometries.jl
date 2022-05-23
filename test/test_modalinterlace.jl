using MultivariateOrthogonalPolynomials, ArrayLayouts, BandedMatrices, BlockArrays, Test
import MultivariateOrthogonalPolynomials: ModalInterlace, ModalInterlaceLayout, ModalTrav

@testset "modalTrav" begin
    a = ModalTrav(randn(2,5))
    b = PseudoBlockArray(a)
    v = Vector(a)

    @test zero(a) isa ModalTrav
    @test zero(a) == zero(b)

    @test exp.(a) isa ModalTrav
    @test 2a isa ModalTrav
    @test a+a isa ModalTrav
    @test a+b isa PseudoBlockArray
    @test a+v isa BlockArray

    @test exp.(a) == exp.(b)
    @test a + a == 2a == a+b
end

@testset "ModalInterlace" begin
    ops = [brand(2,3,1,2), brand(1,2,1,1), brand(1,2,1,2)]
    A = ModalInterlace(ops, (3,5), (2,4))
    @test MemoryLayout(A) isa ModalInterlaceLayout
    @test A[[1,4],[1,4,11]] == ops[1]
    @test A[[2],[2,7]] == ops[2]
    @test A[[5],[5,12]] == A[[6],[6,13]] == ops[3]
end