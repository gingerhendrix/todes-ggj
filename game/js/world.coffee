class @World
  constructor: (attrs) ->
    attrs = defaults attrs,
      entities: []
      width: 2
      height: 1

    @[key] = value for own key, value of attrs

    @viewport = new Viewport
      width: 2
      height: 1


    @entities.push collect(@players, (p) -> p.team.todes).flatten()...
    @entities.push @generateLand(20)...

    @dummyBall()

    @physics = new Physics(@)
    @explosion = false

  generateLand : (n) ->
    [widths, heights, lands] = [[], [], []]

    n.times -> widths.push(( (Math.random() * 10 ) %10 )/10)
    m = widths.sum()

    widths = widths.map (w) => w/m * @width

    n.times (n) ->
      if n > 0 then start = heights[n-1] else start = 0.5
      heights[n] = start + (Math.random()-0.5)*0.3
      heights[n] = 0.1 if heights[n] < 0

    n.times (n) =>
      if n > 0 then start = (lands[n-1].position[0] + widths[n-1]) else start = 0
      lands[n] = new LandEntity
        position: [start, @height - heights[n]]
        width: widths[n] + ALMOST_ZERO
        height: heights[n]

    lands

  dummyBall: ->
    ball = new BallEntity(color: 'green', position: [0.1, 0.3], velocity: [0.3*RIGHT, 0.4*UP])

    ball.hook 'explode', =>
      explosion = new ExplosionEntity(position: ball.position)
      explosion.hook 'done', => @entities.remove (e) -> e is explosion

      @entities.remove (e) -> e is ball
      @entities.push(explosion)

    @entities.push(ball)

  ticksPerSecond: 60
