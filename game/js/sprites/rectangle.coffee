class @RectangleSprite extends SpriteBase
  render: (renderer, ctx) ->
    @saveAndRestore ctx, =>
      ctx.fillStyle = @entity.color
      ctx.fillRect @transform(renderer, @entity.position[0], @entity.position[1], @entity.width, @entity.height)...
