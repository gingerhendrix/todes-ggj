class @PlayerSprite extends @SpriteBase
  render: (renderer, ctx) ->
    @saveAndRestore ctx, =>
      image = new Image()
      image.src = @entity.image.src
      ctx.drawImage image, @transform(renderer, @entity.position[0], @entity.position[1], @entity.width, @entity.height)...
