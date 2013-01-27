class @HeartBombSprite extends SpriteBase
  render: (renderer, ctx) ->
    image = new Image
    image.src = @entity.image.src

    [x, y, width, height] = @transform(renderer, @entity.position[0], @entity.position[1], @entity.width, @entity.height)
    ctx.drawImage image, x, y, width, height
