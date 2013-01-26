class @Game
  constructor: () ->
    @players = [
      new PlayerEntity(position: [0.1, 0.4], color: 'red'),
      new PlayerEntity(position: [0.8, 0.6], color: 'blue')
    ]
    @land = [new LandEntity(position: [0, 0.5], width: 0.5, height: 0.5), new LandEntity(position: [0.5, 0.7], width: 0.5, height: 0.3)] 
    @ball = new BallEntity(color: 'green', position: [0.1, 0.3], velocity: [0.1*RIGHT, 0.3*UP])
      
    @physics = new Physics(@)
    @timer = new Interval(1.second() / @ticksPerSecond, @tick)

  entities: ->
    [@land..., @players..., @ball]

  ticksPerSecond: 50 

  tick: =>
    @lastTime ||= new Date

    msPast = (new Date) - @lastTime

    @physics.advance msPast/1000

    @lastTime = new Date
