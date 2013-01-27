class @World
  constructor: (attrs) ->
    defaults attrs,
      width: 2
      height: 1

    @[key] = value for own key, value of attrs
    
    @players = [
      new PlayerEntity(position: [0.25, 0.0], color: 'red', velocity: [0.01, 0]),
      new PlayerEntity(position: [1.17, 0.0], color: 'blue', velocity: [-0.01, 0])
      new PlayerEntity(position: [1.05, 0.0], color: 'blue', velocity: [0.01, 0])
      new PlayerEntity(position: [1.25, 0.0], color: 'red', velocity: [-0.01, 0])
    ]

    @land = @generateLand(20)
    console.log @land
    
    @ball = new BallEntity(color: 'green', position: [0.1, 0.3], velocity: [0.3*RIGHT, 0.4*UP])

    @ball.hook 'explode', =>
      @explosion = new ExplosionEntity(position: @ball.position)

      @explosion.hook 'done', =>
        @explosion = false

      @ball = false
    
    @physics = new Physics(@)
    @explosion = false

  generateLand : (n) ->
    [widths, heights] = [[], []]
    n.times ->
      widths.push(( (Math.random() * 10 ) %10 )/10)
    m = widths.sum()
    widths = widths.map (w) => w/m * @width
    n.times (n) ->
      if n > 0 then start = heights[n-1] else start = 0.5
      heights[n] = start + (Math.random()-0.5)*0.3
      heights[n] = 0.1 if heights[n] < 0
    lands = []
    n.times (n) =>
      if n > 0 then start = (lands[n-1].position[0] + widths[n-1]) else start = 0
      lands[n] = new LandEntity
        position: [start, @height - heights[n]]
        width: widths[n] + ALMOST_ZERO
        height: heights[n]

    lands

  entities: ->
    es = [@land..., @players...]
    es.push(@ball) if @ball
    es.push(@explosion) if @explosion
    es

  ticksPerSecond: 60 
