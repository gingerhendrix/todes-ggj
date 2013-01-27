class @Player
  constructor: (@n) ->
    @entity = new PlayerEntity(player: @)
    @team = new Team(@, "Player #{@n}'s team")
