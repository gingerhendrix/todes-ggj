@PLAYERS_PER_TEAM = 4

class @Team
  constructor: (@player, @name) ->
    @todes = [1..PLAYERS_PER_TEAM].map (i) => new TodeEntity({@player, n: i})
