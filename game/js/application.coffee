#= require ./vendor/zepto.min.js
#= require_tree ./vendor
#= require_tree .

exports.LEFT = -1
exports.RIGHT = 1

$ ->
  canvas = $('canvas').get 0
  exports.game = new Game
  exports.renderer = new Renderer(game, canvas)
  exports.controller = new Controller document.body, game

  exports.renderer.start()
