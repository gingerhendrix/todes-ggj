class @Round
  constructor: (attrs) ->
    @[key] = value for own key, value of attrs

    @todeGenerator = todeGenerator(@players)
    @nextTurn()

    @initialize?()

  nextTurn: ->
    @currentTode = @todeGenerator()
    @currentPlayer = @currentTode.player

todeGenerator = (players) ->
  numPlayers = players.length

  currentPlayer = 1
  currentTode = 1

  ->
    tode = players[currentPlayer - 1].team.todes[currentTode - 1]

    if currentPlayer is numPlayers
      currentPlayer = 1
      currentTode += 1
    else
      currentPlayer += 1

    if currentTode is 5
      currentTode = 1

    tode