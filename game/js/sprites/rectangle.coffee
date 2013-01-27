class @RectangleSprite extends SpriteBase
  render: (ctx) ->
    @saveAndRestore ctx, =>
      ctx.fillStyle = @entity.color
      ctx.fillRect @transform(@entity.position[0], @entity.position[1], @entity.width, @entity.height)...
