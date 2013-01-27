class @ExplosionEntity extends EntityBase
  @spriteClass: ExplosionSprite
  constructor: (attrs={}) ->
    super defaults attrs,
      width: 0.2
      height: 0.2
      timer: 0
      hue: 0
      color: 'rgba(255, 50, 50, 0)'
      time: 0
      blastSpeed: 10
      blastTime: 0.5

  isMoving: ->
    return true

  isMovable: ->
    return false

  isDamaging: ->
    true

  onTick: (t) ->
    @time = @time + t
    @blastProgress = (Math.floor((@time/@blastTime)*100) % 100)/100

    @position[0] = @position[0] - t/(@blastSpeed)
    @position[1] = @position[1] - t/(@blastSpeed)
    @width = @time/(@blastSpeed/2)
    @height =  @time/(@blastSpeed/2)

    if @time > @blastTime
      @trigger 'done'
