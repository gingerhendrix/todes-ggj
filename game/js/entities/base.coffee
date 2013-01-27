class @EntityBase extends @Events
  @spriteClass = RectangleSprite
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

    @sprite ||= @constructSprite()

  constructSprite: () ->
    spriteClass = @constructor.spriteClass
    sprite = new spriteClass(@)

  minX: ->
    @position[0]

  maxX: ->
    @position[0] + @width

  minY: ->
    @position[1]

  maxY: ->
   @position[1] + @height

  center: ->
    [@position[0] + @width/2, @position[1] + @height/2]

  isMoving: ->
    return false if [@velocity...,(Math.abs(@initial.velocity[i] - @velocity[i]) for vel, i in @velocity)...].all (delta) -> ( Math.abs(delta) < STOPPED )
    return true

  isSolid: ->
    return true

  isDamaging: ->
    return false

  isMovable: ->
    return true

  onTick: (t) ->

  onCollision: (entity) ->
