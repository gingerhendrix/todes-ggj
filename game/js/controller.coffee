class @Controller
  constructor: (@el, @game)->
    @$el =  $(@el)
    @initializeEvents()
    @currentPlayer = @game.players[0]

  initializeEvents: ->
    @$el.keydown (e) =>
      if e.which is 37 or e.which is 39
        e.preventDefault()

      @handleKey e.which

  handleKey: (key) ->
    @handleLeft() if key == 37
    @handleRight() if key == 39

  handleLeft: (key) ->
    console.log "left"
    @currentPlayer.moving LEFT
    @$el.one 'keyup', (e) => @stop()

  handleRight: (key) ->
    console.log "right"
    @currentPlayer.moving RIGHT
    @$el.one 'keyup', (e) => @stop
  
  stop: ->
    console.log "stop"
    @currentPlayer.stop()



