{assert, expect} = chai

describe 'Tode entity', ->
  beforeEach ->
    @player = new Player(1)
    @sampleTode = @player.team.todes.first()

  describe 'health', ->
    it 'should be 0 by default', ->
      expect(@sampleTode.health).to.equal(0)

    it 'should be able to add health', ->
      @sampleTode.heal(12.5)

      expect(@sampleTode.health).to.equal 12.5
      @sampleTode.heal(4.6)
      expect(@sampleTode.health).to.equal 12.5 + 4.6

    it 'should be able to remove health', ->
      @sampleTode.heal(67)
      @sampleTode.sadden(12)
      expect(@sampleTode.health).to.equal 67 - 12