class @Game
  ticksPerSecond: 50

  constructor: ->
    @entities = [new LandEntity(), new PlayerEntity(x: 0.2, color: 'red'), new PlayerEntity(x: 0.7, color: 'blue'), new BallEntity()]
    @timer = new Interval(1.second() / @ticksPerSecond, @tick)

    @physics = new Physics(@)

  tick: =>
    @lastTime ||= new Date

    msPast = (new Date) - @lastTime
    ticksPast = msPast / (1.second() / @ticksPerSecond)

    ticksPast.times =>
      @physics.advance(@ticksPerSecond)

    @lastTime = new Date