class @Interval
  running: false

  constructor: (@ms, @fn) -> #

  start: ->
    @running = true
    @interval = setInterval(@fn, @ms)

  stop: ->
    clearInterval(@interval)
    @running = false