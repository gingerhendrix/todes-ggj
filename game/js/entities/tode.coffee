class @TodeEntity extends EntityBase
  @spriteClass = TodeSprite
  constructor: (attrs={}) ->
    super defaults attrs,
      health: 0
      width: 0.0438 * 2
      height: 0.0306 * 2
      walkingSpeed: 0.1
      forces: [[0, GRAVITY]]
      image:
        src: 'img/frog-right.png'
        width: 438
        height: 306

      velocity: [Math.random() / 4, 0]
      position: [Math.random(), 0.0]
      color: ['red', 'blue'].sample()

  moving: (dir) ->
    #@initial.velocity[0] = @velocity[0] = dir * @walkingSpeed

  stop: (dir) ->
    #@initial.velocity[0] = @velocity[0] = 0

  onTick: (t) -> #

  isCurrent: ->

  heal: (points) -> @health += points
  sadden: (points) -> @health -= points
