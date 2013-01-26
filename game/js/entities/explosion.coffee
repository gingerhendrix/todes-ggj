class @ExplosionEntity extends EntityBase
  constructor: (attrs={}) ->
    super defaults attrs,
      width: 0.2
      height: 0.2
      timer: 0
      hue: 0
      color: 'rgb(255, 50, 50)'
 
  isMoving: ->
    return false

  onTick: (t) ->

