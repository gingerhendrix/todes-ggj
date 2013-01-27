class @Viewport extends EntityBase
  @spriteClass: BackgroundSprite
  constructor: (attrs={}) ->
    super defaults attrs,
      image:
        src: 'img/background.png'
        width: 960
        height: 550

