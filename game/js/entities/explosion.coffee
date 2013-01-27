class @ExplosionEntity extends EntityBase
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
      affected: []
 
  isMoving: ->
    return true
 
  isDamaging: ->
    true

  onTick: (t) ->
    @time = @time + t
    alpha = (Math.floor((@time)*100) % 100)/100
    @color = "rgba(255, 50, 50, #{alpha})"
    @position[0] = @position[0] - t/(@blastSpeed)
    @position[1] = @position[1] - t/(@blastSpeed)
    @width = @time/(@blastSpeed/2)
    @height =  @time/(@blastSpeed/2)
    if @time > @blastTime
      @trigger 'done'

