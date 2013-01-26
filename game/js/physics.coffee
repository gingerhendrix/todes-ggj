class @Physics
  constructor: (@game) -> #

  advance: ->
    @game.entities.forEach (e) =>
      e.applyAcceleration(@game.ticksPerSecond)
      velocity = e.velocity()

      e.x += @speedToUnit velocity[0]
      e.y += @speedToUnit velocity[1]

  speedToUnit: (s) -> s / @game.ticksPerSecond