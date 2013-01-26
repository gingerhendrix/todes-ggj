#= require ./vendor/zepto.min.js
#= require_tree ./vendor
#= require_tree .

$ ->
  (exports.renderer = new Renderer(document.getElementById('game'))).start()
  exports.ctx = renderer.ctx