class @Interval
  running: false

  constructor: (@ms, @fn) -> #

  start: ->
    @running = true
    @interval = setInterval(@fn, @ms)

  stop: ->
    clearInterval(@interval)
    @running = false


exports.defaults = (t, s) -> Object.merge s, t, true
