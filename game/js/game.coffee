class @Game
  constructor: (@canvas) ->
    @players = [new Player(1), new Player(2)]
    @round = new Round(game: @, players: @players)

    @world = new World(width: 2, height: 1, round: @round, players: @players)
    @renderer = new Renderer(@world, @canvas)

  start: ->
    @renderer.start()
    @world.physics.start()

  pause: -> @world.physics.pause()
