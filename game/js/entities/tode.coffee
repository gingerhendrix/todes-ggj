class @TodeEntity extends EntityBase
  @spriteClass = PlayerSprite
  constructor: (attrs={}) ->
    super defaults attrs,
      health: 0
      width: 0.0438 * 2
      height: 0.0306 * 2
      walkingSpeed: 0.1
      forces: [[0, GRAVITY]]
      image:
        src: 'img/frog.png'
        width: 438
        height: 306

      velocity: [Math.random() / 4, 0]
      position: [Math.random(), 0.0]
      color: ['red', 'blue'].sample()
      isCurrent: false

  smallJump: (dir) ->
    @initial.velocity = @velocity = [0.1 * dir, 2]

  bigJump: (dir) ->
    @initial.velocity = @velocity = [0.2 * dir, 4]

  onTick: (t) -> #

  heal: (points) -> @health += points
  sadden: (points) -> @health -= points
