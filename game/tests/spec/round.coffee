{expect, assert} = chai

describe 'Rounds', ->
  before ->
    @playerOne = new Player(1)
    @playerTwo = new Player(2)

    @round = new Round(players: [@playerOne, @playerTwo])

  it "should have a current player", ->
    expect(@round.currentPlayer).to.equal(@playerOne)