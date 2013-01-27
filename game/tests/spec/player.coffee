expect = chai.expect

describe 'Player', ->
  it 'should make an entity for itself', ->
    player = new Player(1)
    expect(player.entity).to.be.an.instanceof(EntityBase)

  it 'should have a team', ->
    player = new Player(1)
    expect(player.team).to.be.an.instanceof(Team)

  it 'should have a name of "Player n\'s team" by default', ->
    player = new Player(568)
    expect(player.team.name).to.equal("Player 568's team")