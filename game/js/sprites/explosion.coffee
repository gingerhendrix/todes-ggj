class @ExplosionSprite extends SpriteBase
  render: (renderer, ctx) ->
    @saveAndRestore ctx, =>
      image = new Image
      image.src = @entity.ball.image.src

      [x, y, width, height] = @transform(renderer, @entity.position[0], @entity.position[1], @entity.width, @entity.height)
      ctx.globalAlpha = 1 - @entity.blastProgress
      ctx.drawImage image, x, y, width, height
