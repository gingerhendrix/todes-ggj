class @Game
  constructor: () ->
    @players = [
      new PlayerEntity(position: [0.1, 0.4], color: 'red'),
      new PlayerEntity(position: [0.8, 0.6], color: 'blue')
    ]
    console.log @players
    @land = [new LandEntity(position: [0, 0.5], width: 0.5, height: 0.5), new LandEntity(position: [0.5, 0.7], width: 0.5, height: 0.3)] 
    @ball = new BallEntity(color: 'green', position: [0.1, 0.3], velocity: [0.1*RIGHT, 0.3*UP])
    @ball.hook 'explode', =>
      console.log "Explode"
      @explosion = new ExplosionEntity(position: @ball.position)
      @ball = false
    @physics = new Physics(@)
    @timer = new Interval(1.second() / @ticksPerSecond, @tick)
    @explosion = false

  entities: ->
    es = [@land..., @players...]
    es.push(@ball) if @ball
    es.push(@explosion) if @explosion
    es

  ticksPerSecond: 60 

  tick: =>
    @lastTime ||= new Date

    time = ((new Date) - @lastTime)/1000

    @physics.advance time


    @lastTime = new Date
