expect = chai.expect

describe 'A stub test', ->
  it 'should work', -> expect(1 + 1).to.equal(2)
  it 'should not work', -> expect(2 + 2).to.equal(5)