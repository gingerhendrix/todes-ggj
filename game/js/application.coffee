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
  canvas = $('canvas').get(0)

  exports.game = new Game(canvas)

  $('[data-start]').click ->
    console.log 'Started'
    game.start()

  $('[data-stop]').click ->
    console.log 'Stopped'
    game.pause()