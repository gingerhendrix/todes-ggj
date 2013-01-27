class @BallEntity extends EntityBase
  constructor: (attrs={}) ->
    super defaults attrs,
      width: 0.01
      height: 0.01
      forces: [[0, GRAVITY]]
      time: 0
      color: 'rgb(0, 255, 0)'

  onTick: (t) ->
    @time = @time + t
    hue = (Math.floor((@time)*100) % 50)/50
    if(@time < 4)
      red = Math.floor(hue * 120)
      green = 155 + Math.floor((1-hue)*100)
      blue = Math.floor(hue * 120)
      @color = "rgb(#{red},#{green}, #{blue})"
    else if(@time < 4.5)
      @color = "rgb(255, 0, 0)"
    else
      @trigger 'explode'
