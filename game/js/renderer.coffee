FPS = 30

class @Renderer
  constructor: (@world, @canvas) ->
    @aspectRatio = @world.width/@world.height
    @timer = new Interval(FPS, @loop)
    @ctx = @canvas.getContext('2d')
    @setupCanvas()

    @sprites = @world.entities.map (e) => console.log(window.e = e); new e.constructor.sprite(@, e)

  setupCanvas: ->
    [width, height] = [window.innerWidth - 10, window.innerHeight - 50]

    if height * @aspectRatio < width
      @height = @canvas.height = height
      @width = @canvas.width = height * @aspectRatio
    else
      @width = @canvas.width = width
      @height = @canvas.height = width/@aspectRatio

    @widthRatio = 1/@aspectRatio
    @heightRatio = 1

  start: -> @timer.start()
  stop: -> @timer.stop()

  clear: ->
    @ctx.fillStyle = '#fff'
    @ctx.fillRect(0, 0, @width, @height)

  loop: =>
    @clear()

    sprite.render(@ctx) for sprite in @sprites
