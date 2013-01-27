class @BallEntity extends EntityBase
  @spriteClass = HeartBombSprite
  constructor: (attrs={}) ->
    super defaults attrs,
      width: 0.05
      height: 0.05
      forces: [[0, GRAVITY]]
      time: 0
      color: 'rgb(0, 255, 0)'
      image:
        src: 'img/small-heart-bomb.png'

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
