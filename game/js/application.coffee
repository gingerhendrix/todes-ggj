#= require ./vendor/zepto.min.js
#= require_tree ./vendor
#= require ./constants
#= require ./util
#= require ./sprites/base
#= require_tree ./sprites
#= require ./entities/base
#= require_tree ./entities
#= require_tree .

window.exports = window

$ ->
  canvas = $('canvas').get(0)

  img = (src) ->
    i = new Image()
    i.src = src
    i

  exports.IMAGES =
    ground: img('img/ground.png')

  exports.game = new Game(canvas)

  $('[data-start]').click ->
    console.log 'Started'
    game.start()

  $('[data-stop]').click ->
    console.log 'Stopped'
    game.pause()
