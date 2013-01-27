class @TodeSprite extends SpriteBase
  render: (renderer, ctx) ->
    @saveAndRestore ctx, =>
      image = new Image()

      src = "img/"
      if @entity.velocity[1] < -0.05 #1.0725
        src += 'leapfrog' #739x689
        scale = [1, 1.33]
      else
        src += 'frog' #438x306 #1.4313
        scale = [1, 1]

      if @entity.velocity[0] > 0
        src += '-right.png'
      else
        src += '-left.png'

      image.src = src

      [x, y, width, height] = @transform(renderer, @entity.position[0], @entity.position[1], @entity.width, @entity.height)
      ctx.drawImage image, x, y, width*scale[0], height*scale[1]
      #ctx.fillStyle = 'rgba(0,0,0,0.1)'
      #ctx.fillRect  x, y, width, height

      if @entity.isCurrent
        ctx.font = "20px helvetica"
        crown = "♛"
        ctx.fillStyle = 'rgb(242,215,12)'
        textSize = ctx.measureText crown
        ctx.fillText crown, x + (width-textSize.width)/2, y
      else 
        ctx.fillStyle = if @entity.player.n == 1 then '#FF0000' else '#0000FF'

        textSize = ctx.measureText "Tode #{@entity.n}"
        ctx.fillText "Tode #{@entity.n}", x + (width-textSize.width)/2, y - 10 

        if @entity.health > 20
          ctx.fillStyle = 'rgba(255,50,50, 0.6)'
          health = "♥".repeat(Math.floor(@entity.health/20))
        else
          ctx.fillStyle = 'rgba(0,0,0, 0.6)'
          health = "♥"

        textSize = ctx.measureText health
        ctx.fillText health, x + (width-textSize.width)/2, y
