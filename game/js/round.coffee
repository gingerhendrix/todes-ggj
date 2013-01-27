class @Round
  constructor: (attrs) ->
    @[key] = value for own key, value of attrs

    @currentPlayer = @players.first()
    @initialize?()