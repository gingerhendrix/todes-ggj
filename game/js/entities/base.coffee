class @EntityBase extends @Plugin
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
    return false if [@velocity...,(Math.abs(@initial.velocity[i] - @velocity[i]) for vel, i in @velocity)...].all (delta) -> ( Math.abs(delta) < STOPPED )
    return true

