class @Interval
  running: false

  constructor: (@ms, @fn) -> #

  start: =>
    @running = true
    @interval = setInterval(@fn, @ms)

  stop: =>
    clearInterval(@interval)
    @running = false

class @Events
  hook: (event, cb) ->
    (@_hooks ||= {})[event] ||= []

    @_hooks[event].push cb

  once: (event, cb) ->
    @hook event, cb.once()

  trigger: (event, params...) ->
    @_hooks?[event]?.forEach (cb) -> cb params...

exports.defaults = (t, s) -> Object.merge s, t, false
exports.collect = (array, collector) ->
  fn = if typeof collector is 'function' then collector else (i) ->
    if typeof i[collector] is 'function' then i[collector]() i[collector]

  fn(element) for element in array
