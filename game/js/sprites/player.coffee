class @PlayerSprite extends @SpriteBase
  render: (ctx) ->
    @saveAndRestore ctx, =>
      image = new Image()
      image.src = @entity.image.src
      ctx.drawImage image, @transform(@entity.position[0], @entity.position[1], @entity.width, @entity.height)...
