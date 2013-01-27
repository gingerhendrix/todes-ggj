class @PlayerEntity extends EntityBase
  constructor: (attrs={}) ->
    super defaults attrs,
      health: 0
      width: 0.02
      height: 0.1
      walkingSpeed: 0.1
      forces: [[0, GRAVITY]]

  moving: (dir) ->
    #@initial.velocity[0] = @velocity[0] = dir * @walkingSpeed 
 
  stop: (dir) ->
    #@initial.velocity[0] = @velocity[0] = 0

  heal: (points) -> @health += points
  sadden: (points) -> @health -= points

@TodeEntity = PlayerEntity