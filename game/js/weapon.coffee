class @Weapon
  constructor: (attrs={}) ->
    @[key] = value for own key, value of attrs