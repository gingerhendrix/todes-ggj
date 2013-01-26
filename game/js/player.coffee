class @Player
  constructor: (@n) ->
    @entity = new PlayerEntity(player: @)
