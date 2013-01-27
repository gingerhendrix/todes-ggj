class @LandEntity extends EntityBase
  @spriteClass = LandSprite
  constructor: (attrs={}) ->
    super defaults attrs,
      position: [0, 0.7]
      width: 1
      height: 0.3

  isMovable: ->
    return false
