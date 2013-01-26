class @Physics
  constructor: (@game) -> #

  advance: (t) ->
    @game.entities().forEach (e) =>
      initial = 
        position: e.position
        velocity: e.velocity
        acceleration: e.acceleration

      position = [0, 0]
      velocity = [0, 0]
      acceleration = [0, 0]

      for i in [0, 1]
        position[i] = initial.position[i] + (initial.velocity[i] * t)

        velocity[i] = initial.velocity[i] + (0.5 * initial.acceleration[i] * t * t)
        velocity[i] = 0 if velocity[i] < 0.000001  and velocity[i] > -0.000001

        acceleration[i] = e.forces.sum (f) -> f[i] if e.forces.length > 0
        acceleration[i] = 0 if acceleration[i] < 0.000001 and acceleration[i] > -0.000001

      e.position = position
      e.velocity = velocity
      e.acceleration = acceleration
        

