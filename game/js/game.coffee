class @Game
  constructor: () ->
    @players = [
      new PlayerEntity(position: [0.2, 0.6], color: 'red'),
      new PlayerEntity(position: [0.7, 0.6], color: 'blue')
    ]
    @land = new LandEntity()
    @ball = new BallEntity()
    @physics = new Physics(@)
    @timer = new Interval(1.second() / @ticksPerSecond, @tick)

  entities: ->
    [@players[0], @ball]
    #[@land, @players..., @ball]

  ticksPerSecond: 5

  tick: =>
    @lastTime ||= new Date

    msPast = (new Date) - @lastTime

    @physics.advance msPast/1000

    @lastTime = new Date
