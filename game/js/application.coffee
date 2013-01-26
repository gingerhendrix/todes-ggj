#= require ./vendor/zepto.min.js
#= require_tree ./vendor
#= require_tree .

$ ->
  canvas = $('canvas').get 0
  exports.game = new Game
  exports.renderer = new Renderer(game, canvas)

  renderer.start()
  game.timer.start()