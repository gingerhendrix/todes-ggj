class @BallEntity extends EntityBase
  constructor: (attrs={}) ->
    super defaults attrs,
      width: 0.01
      height: 0.01
      forces: [[0, GRAVITY]]
