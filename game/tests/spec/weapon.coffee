{expect, assert} = chai

describe "Weapons", ->
  it "should exist", -> expect(window.Weapon).to.not.be.undefined