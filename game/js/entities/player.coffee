class @PlayerEntity extends EntityBase
  constructor: (attrs={}) ->
    super defaults attrs, 
      width: 0.0438 * 2
      height: 0.0306 * 2
      walkingSpeed: 0.1
      forces: [[0, GRAVITY]]
      image: 
        src: 'img/frog.png'
        width: 438
        height: 306

  moving: (dir) ->
    #@initial.velocity[0] = @velocity[0] = dir * @walkingSpeed 
 
  stop: (dir) ->
    #@initial.velocity[0] = @velocity[0] = 0

