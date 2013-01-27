class @Game
  constructor: (attrs) ->
    defaults attrs,
      width: 2
      height: 1

    @[key] = value for own key, value of attrs
    
    @players = [
      new PlayerEntity(position: [0.1, 0.0], color: 'red', velocity: [0.05, 0]),
      new PlayerEntity(position: [1.4, 0.0], color: 'blue', velocity: [-0.05, 0])
    ]

    @land = [new LandEntity(position: [0, 0.5], width: 0.5, height: 0.5),
             new LandEntity(position: [0.5, 0.7], width: 0.5, height: 0.3),
             new LandEntity(position: [1.0, 0.8], width: 0.5, height: 0.2),
             new LandEntity(position: [1.5, 0.6], width: 0.5, height: 0.4)]
    
    @ball = new BallEntity(color: 'green', position: [0.1, 0.3], velocity: [0.3*RIGHT, 0.4*UP])

    @ball.hook 'explode', =>
      @explosion = new ExplosionEntity(position: @ball.position)

      @explosion.hook 'done', =>
        @explosion = false

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
