class @Entity
  position: [0, 0]
  velocity: [0, 0]
  acceleration: [0, 0]
  forces: []

  width: 0
  height: 0
  color: '#000'

  constructor: (attrs={}) ->

    @initialize?()
    @[key] = value for own key, value of attrs

class @LandEntity extends Entity
  position: [0, 0.7]

  width: 1
  height: 0.3

class @PlayerEntity extends Entity
  initialize: ->

  walkingSpeed: 0.1
  position: [0, 0.6]

  width: 0.1
  height: 0.1

  moving: (dir) ->
    #@velocity[0] = dir * @walkingSpeed #???
 
  stop: (dir) ->
    #@velocity[0] = 0 #Really


class @BallEntity extends Entity
  position: [0.4, 0.1]

  width: 0.1
  height: 0.1
  forces: [[0, 0.02]]


  #initialize: ->
    #gravity =
      #x: 0
      #y: 0

      #a:
        #y: 1 / 9.81
        #x: 0

    #@forces = [gravity]
