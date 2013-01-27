expect = chai.expect

describe 'Player', ->
  it 'should make an entity for itself', ->
    player = new Player(1)
    expect(player.entity).to.be.an.instanceof(EntityBase)