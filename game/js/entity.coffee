class @Entity
  x: 0
  y: 0

  width: 0
  height: 0
  color: '#000'

  constructor: (attrs={}) ->
    @initialize?()
    @[key] = value for own key, value of attrs

class @LandEntity extends Entity
  y: 0.7

  width: 1
  height: 0.3

class @PlayerEntity extends Entity
  y: 0.6

  width: 0.1
  height: 0.1

class @BallEntity extends Entity
  x: 0.4
  y: 0.1

  width: 0.1
  height: 0.1