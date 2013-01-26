class @Game
  constructor: () ->
    @players = [new PlayerEntity(x: 0.2, color: 'red'), new PlayerEntity(x: 0.7, color: 'blue')]
    @land = new LandEntity()
    @ball = new BallEntity()
    @physics = new Physics(@)
    @timer = new Interval(1.second() / @ticksPerSecond, @tick)

  entities: ->
    [@land, @players..., @ball]

  ticksPerSecond: 50

  tick: =>
    @lastTime ||= new Date

    msPast = (new Date) - @lastTime
    ticksPast = msPast / (1.second() / @ticksPerSecond)

    ticksPast.times =>
      @physics.advance(@ticksPerSecond)

    @lastTime = new Date
