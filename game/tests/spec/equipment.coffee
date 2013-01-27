{expect, assert} = chai

describe 'Equipment', ->
  before ->
    @player = new Player(1)

  it "should have a weapon, by default the first - heart bomb", ->
    e = new Equipment(@player)
    expect(e.weapon).to.be.an.instanceof(Equipment.WEAPONS[1])