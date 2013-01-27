class @LandSprite extends SpriteBase
  render: (renderer, ctx) ->
    image = IMAGES.ground

    imageWidth = 2508
    imageHeight = 1218

    #scale = [1/50, 1/50]

    [x, y, width, height] = @transform(renderer, @entity.position[0], @entity.position[1], @entity.width, @entity.height)

    source = 
      x: x % imageWidth
      y: y % imageHeight
      width: width % imageWidth
      height: height % imageHeight
    
    console.log image, source.x, source.y, source.width, source.height, x, y, width, height

    ctx.drawImage image, Math.round(source.x), Math.round(source.y), Math.round(source.width), Math.round(source.height), Math.round(x), Math.round(y), Math.round(width), Math.round(height)
