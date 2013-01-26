class @Entity
  x: 0
  y: 0

  width: 0
  height: 0
  color: '#000'

  constructor: (attrs={}) ->
    @vectors = []

    @initialize?()
    @[key] = value for own key, value of attrs

  applyAcceleration: (step) ->
    @vectors.forEach (v) ->
      v.x += v.a.x / step
      v.y += v.a.y / step

  velocity: -> [@vectors.sum((v) -> v.x), @vectors.sum((v) -> v.y)]

class @LandEntity extends Entity
  y: 0.7

  width: 1
  height: 0.3

class @PlayerEntity extends Entity
  walkingSpeed: 0.1
  velocity: [0, 0]
  y: 0.6

  width: 0.1
  height: 0.1

  move: (dir) ->
    @velocity[0] = dir * @walkingSpeed #???
 
  stop: (dir) ->
    @velocity[0] = 0 #Really


class @BallEntity extends Entity
  x: 0.4
  y: 0.1

  width: 0.1
  height: 0.1

  initialize: ->
    gravity =
      x: 0
      y: 0

      a:
        y: 1 / 9.81
        x: 0

    @vectors = [gravity]
