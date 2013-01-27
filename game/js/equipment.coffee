#= require_tree ./weapons

class @Equipment
  constructor: (@player) ->
    @selectWeapon(1)

  selectWeapon: (n) ->
    @weapon = new Equipment.WEAPONS[n]({@player})

Equipment.WEAPONS =
  1: HeartBombWeapon