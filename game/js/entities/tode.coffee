class @TodeEntity extends EntityBase
  @spriteClass = TodeSprite
  constructor: (attrs={}) ->
    super defaults attrs,
      health: 50 
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
      isCurrent: false

  smallJump: (dir) ->
    return unless @canJump()
    @initial.velocity = [0.1 * dir, 0.2 * UP]
    @velocity = @initial.velocity.clone()

  bigJump: (dir) ->
    return unless @canJump()
    @initial.velocity = [0.2 * dir, 0.4 * UP]
    @velocity = @initial.velocity.clone()

  canJump: ->
    not @inFlight()

  inFlight: ->
    Math.abs(@velocity[1]) > 0.01

  onTick: (t) -> #

  heal: (points) -> @health += points
  sadden: (points) -> @health -= points
