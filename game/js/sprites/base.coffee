class @SpriteBase extends Events
  constructor: (@entity) -> #

  saveAndRestore: (ctx, fn) ->
    ctx.save()
    result = fn(ctx)
    ctx.restore()
    result

  render: (renderer, ctx) -> #

  transform: (renderer, ordinates...) ->
    os = ordinates.inGroupsOf(2).map (o) =>
      [o[0] * renderer.width * renderer.widthRatio,
       o[1] * renderer.height * renderer.heightRatio]

    os.flatten()
