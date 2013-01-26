class @Entity
  constructor: (attrs={}) ->
    @x = @y = @width = @height = 0
    @color = '#000'

    @[key] = value for own key, value of attrs

    @initialize?()

class @LandEntity extends Entity
  initialize: ->
    @width = 1
    @height = 0.3

    @x = 0
    @y = 1 - @height