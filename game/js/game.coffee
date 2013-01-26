class @Game
  constructor: ->
    @entities = [new LandEntity(), new PlayerEntity(x: 0.2, color: 'red'), new PlayerEntity(x: 0.7, color: 'blue'), new BallEntity()]
