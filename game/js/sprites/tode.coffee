class @TodeSprite extends SpriteBase
  render: (renderer, ctx) ->
    @saveAndRestore ctx, =>
      image = new Image()
      image.src = @entity.image.src

      [x, y, width, height] = @transform(renderer, @entity.position[0], @entity.position[1], @entity.width, @entity.height)
      ctx.drawImage image, x, y, width, height
      #ctx.fillStyle = 'rgba(0,0,0,0.1)'
      #ctx.fillRect  x, y, width, height

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

      #{@entity.health}♥
