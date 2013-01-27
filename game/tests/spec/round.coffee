{expect, assert} = chai

describe 'Rounds', ->
  before ->
    @playerOne = new Player(1)
    @playerTwo = new Player(2)

    @round = new Round(players: [@playerOne, @playerTwo])

  it "should have a current player", ->
    expect(@round.currentPlayer).to.equal(@playerOne)

  it "should have a current tode", ->
    expect(@round.currentTode).to.equal(@playerOne.team.todes.first())

  describe "rotation", ->
    it 'should be player 1, tode 1', ->
      expect(@round.currentTode).to.equal(@playerOne.team.todes[0])

    it 'should be player 2, tode 1', ->
      @round.nextTurn()
      expect(@round.currentTode).to.equal(@playerTwo.team.todes[0])

    it 'should be player 1, tode 2', ->
      @round.nextTurn()
      expect(@round.currentTode).to.equal(@playerOne.team.todes[1])

    it 'should be player 2, tode 2', ->
      @round.nextTurn()
      expect(@round.currentTode).to.equal(@playerTwo.team.todes[1])

    describe "current tode", ->
      it "should only be isCurrent on the round's current tode", ->
        expect(@round.currentTode.isCurrent).to.be.true

        @round.players.forEach (player) =>
          player.team.todes.forEach (tode) =>
            expect(tode.isCurrent).to.be.false unless @round.currentTode is tode
