#= require ./vendor/zepto.min.js
#= require_tree ./vendor
#= require ./constants
#= require ./util
#= require ./sprites/base
#= require_tree ./sprites
#= require ./entities/base
#= require_tree ./entities
#= require_tree .


$ ->
  canvas = $('canvas').get 0

  exports.world = new World(width: 2, height: 1)
  exports.renderer = new Renderer(world, canvas)
  exports.controller = new Controller document.body, world

  $('[data-start]').click -> console.log "Started"; renderer.start(); world.timer.start()
  $('[data-stop]').click -> console.log "Stopped"; renderer.stop(); world.timer.stop()

