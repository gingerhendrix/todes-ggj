class @Game
  constructor: () ->
    @players = [new PlayerEntity(x: 0.2, color: 'red'), new PlayerEntity(x: 0.7, color: 'blue')]
    @land = new LandEntity()
    @ball = new BallEntity()

  entities: ->
    [@land, @players..., @ball]


