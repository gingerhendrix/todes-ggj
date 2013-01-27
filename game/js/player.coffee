class @Player
  constructor: (@n) ->
    @team = new Team(@, "Player #{@n}'s team")
