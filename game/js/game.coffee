class @Game
  constructor: (@canvas) ->
    @world = new World(width: 2, height: 1)
    @renderer = new Renderer(@world, @canvas)

  start: ->
    @renderer.start()
    @world.physics.start()

  pause: -> @world.physics.pause()
