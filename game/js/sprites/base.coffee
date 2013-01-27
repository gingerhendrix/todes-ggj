class @SpriteBase extends Events
  saveAndRestore: (ctx, fn) ->
    ctx.save()
    result = fn(ctx)
    ctx.restore()
    result

  constructor: (@renderer, @entity) ->
    #

  render: (ctx) ->
    #
    
  transform: (ordinates...) ->
    os = ordinates.inGroupsOf(2).map (o) => 
      [o[0] * @renderer.width * @renderer.widthRatio, 
       o[1] * @renderer.height * @renderer.heightRatio]
    os.flatten()
