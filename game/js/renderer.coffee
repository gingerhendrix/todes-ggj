FPS = 30

class @Renderer
  constructor: (@game, @canvas) ->
    @aspectRatio = @game.width/@game.height
    @timer = new Interval(FPS, @loop)
    @ctx = @canvas.getContext('2d')
    @setupCanvas()

    @sprites = @game.entities().map (e) => new e.constructor.sprite(@, e)

  setupCanvas: ->
    [width, height] = [window.innerWidth - 10, window.innerHeight - 50]

    if height * @aspectRatio < width
      @height = @canvas.height = height
      @width = @canvas.width = height * @aspectRatio
      @widthRatio = 1/@aspectRatio
      @heightRatio = 1
    else
      @width = @canvas.width = width
      @height = @canvas.height = height/@aspectRatio
      @widthRatio = 1
      @heightRatio = @aspectRatio

  start: -> @timer.start()
  stop: -> @timer.stop()

  clear: ->
    @ctx.fillStyle = '#fff'
    @ctx.fillRect(0, 0, @width, @height)

  loop: =>
    @clear()

    sprite.render(@ctx) for sprite in @sprites
    
