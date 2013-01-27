class @LandSprite extends SpriteBase
  render: (renderer, ctx) ->
    image = new Image
    image.src = 'img/ground.png'
    imageWidth = 129
    imageHeight = 250

    scale = [1/50, 1/50]

    #tileWidth = imageWidth*scale[0]
    #tileHeight = imageWidth*scale[1]

    
    
    #ntx = Math.ceil(@entity.width/tileWidth)
    #nty = Math.ceil(@entity.height/tileHeight)

    #tx0 = @entity.x - Math.ceil(@entity.x/tileWidth)*tileWidth
    #ty0 = @entity.y - Math.ceil(@entity.y/tileHeight)*tileHeight

    


    #nty.times =>
      #ntx.times =>
        #tile = 




    sourcePosition =  @transform renderer, @entity.position[0], 

    [x, y, width, height] = @transform(renderer, @entity.position[0], @entity.position[1], @entity.width, @entity.height)
    ctx.drawImage image, x, y, width, height
