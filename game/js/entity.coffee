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
  x: 0
  y: 0.7

  width: 1
  height: 0.3