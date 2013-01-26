FPS = 30

class @Renderer
  constructor: (@canvas) ->
    @setupCanvas()

    @timer = new Interval(FPS, @loop)
    @ctx = @canvas.getContext('2d')

    @entities = [new LandEntity(), new PlayerEntity(x: 0.2, color: 'red'), new PlayerEntity(x: 0.7, color: 'blue'), new BallEntity()]

  setupCanvas: ->
    @width = @canvas.width = window.innerWidth
    @height = @canvas.height = window.innerHeight

  start: -> @timer.start()
  stop: -> @timer.stop()

  clear: ->
    @ctx.fillStyle = '#fff'
    @ctx.fillRect(0, 0, @width, @height)

  loop: =>
    @clear()

    @entities.forEach (e) =>
      @ctx.fillStyle = e.color
      @ctx.fillRect @transform(e.x, e.y, e.width, e.height)...

  transform: (ordinates...) ->
    ordinates.inGroupsOf(2).map((o) => [o[0] * @width, o[1] * @height]).flatten()