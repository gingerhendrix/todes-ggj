defaults = (t, s) -> Object.merge s, t, true

class @Entity
  constructor: (attrs={}) ->
    attrs = defaults attrs,
      position: [0, 0]
      velocity: [0, 0]
      acceleration: [0, 0]
      initial:
        position: [0, 0]
        velocity: [0, 0]
        acceleration: [0, 0]
      forces: []
      width: 0
      height: 0
      color: '#000'
    
    @[key] = value for own key, value of attrs

  minX: ->
    @position[0]

  maxX: ->
    @position[0] + @width

  minY: ->
    @position[1]

  maxY: ->
   @position[1] + @height
 
  isMoving: ->
    return false if [@velocity...,@acceleration...,@forces...].all (delta) -> (delta < ALMOST_ZERO and delta > -ALMOST_ZERO)
    return true

class @LandEntity extends Entity
  constructor: (attrs={}) ->
    super defaults attrs, 
      position: [0, 0.7]
      width: 1
      height: 0.3

class @PlayerEntity extends Entity
  constructor: (attrs={}) ->
    super defaults attrs, 
      width: 0.02
      height: 0.1
      walkingSpeed: 0.1
      width: 0.1
      height: 0.1

  moving: (dir) ->
    @initial.velocity[0] = @velocity[0] = dir * @walkingSpeed 
 
  stop: (dir) ->
    @initial.velocity[0] = @velocity[0] = 0


class @BallEntity extends Entity
  constructor: (attrs={}) ->
    super defaults attrs,
      position: [0.1, 0.5]
      width: 0.01
      height: 0.01
      velocity: [0.05*RIGHT, 0.3*UP] 
      forces: [[0, GRAVITY]]
