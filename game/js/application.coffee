#= require ./vendor/zepto.min.js
#= require_tree ./vendor
#= require_tree .


$ ->
  canvas = $('canvas').get 0
  exports.game = new Game
  exports.renderer = new Renderer(game, canvas)
  exports.controller = new Controller document.body, game
  console.log $('[data-start]')
  $('[data-start]').click -> console.log "Started"; renderer.start(); game.timer.start()
  $('[data-stop]').click -> console.log "Stopped"; renderer.stop(); game.timer.stop()

