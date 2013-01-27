{expect, assert} = chai

describe "Weapons", ->
  it "should exist", -> expect(window.WeaponBase).to.not.be.undefined