class @Game
  constructor: () ->
    @players = [
      new PlayerEntity(position: [0.1, 0.6], color: 'red'),
      new PlayerEntity(position: [0.8, 0.6], color: 'blue')
    ]
    @land = new LandEntity()
    @ball = new BallEntity(color: 'green')
    @physics = new Physics(@)
    @timer = new Interval(1.second() / @ticksPerSecond, @tick)

  entities: ->
    [@land, @ball]
    #[@land, @players..., @ball]

  ticksPerSecond: 50 

  tick: =>
    @lastTime ||= new Date

    msPast = (new Date) - @lastTime

    @physics.advance msPast/1000

    @lastTime = new Date
