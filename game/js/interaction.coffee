class @Interaction
  constructor: (@game, @$el) ->
    @bindKeyboardEvents()

  bindKeyboardEvents: ->
    @$el.keydown(@handleKey)

  handleKey: (e) =>
    console.log e.which

    if e.which is 81
      @game.round.currentTode.bigJump(LEFT)
    else if e.which is 80
      @game.round.currentTode.bigJump(RIGHT)
    else if e.which is 87
      @game.round.currentTode.smallJump(LEFT)
    else if e.which is 79
      @game.round.currentTode.smallJump(RIGHT)
    else if 49 <= e.which <= 57
      @game.round.currentPlayer.equipment.selectWeapon(e.which - 48)