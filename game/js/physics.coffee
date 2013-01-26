class @Physics
  constructor: (@game) -> #

  advance: (t) ->
    @game.entities().forEach (e) =>
      @advanceMotion(e, t) if e.isMoving()
    @game.entities().forEach (e) =>
      @handleCollision(e) if e.isMoving()

  handleCollision: (e) ->
    collisions =  @game.entities().findAll ((e2) => @detectCollision(e, e2)), @game.entities()
    if collisions.length >  0
      collision = collisions[0]
      
      console.log "Collision", e, collisions

      #### General Algorithm
      # Find edge of collision
      # Compute intersection/reflection
      # Move point to reflection point
      # Reflect velocity vector
     
      #### Simplified aligned rectangles algorithm
      BOUNCE = 0.6
      FRICTION = 0.5
      # Enumerate edges, check if we crossed them
      if (e.initial.position[0] + e.width) - collision.minX() < ALMOST_ZERO and 
          (e.position[0] + e.width) - collision.minX() > ALMOST_ZERO #Crossed the left edge

        console.log "Horizontal Collision"
        dx = e.initial.position[0] - e.position[0]
        dline = (e.initial.position[0] + e.width) - collision.minX()

        e.position[0] = e.initial.position[0] + dline - (dx - dline)*BOUNCE # Subtract bounce term if < 1
        e.velocity[0] = e.velocity[0] * -BOUNCE

        e.velocity[1] = e.velocity[1] * FRICTION

      else if (e.initial.position[0]) - collision.maxX() > ALMOST_ZERO and 
              (e.position[0]) - collision.maxX() < ALMOST_ZERO #Crossed the right edge
        console.log "Horizontal Collision"

        dx = e.initial.position[0] - e.position[0]
        dline = (e.initial.position[0] + e.width) - collision.maxX()

        e.position[0] = e.initial.position[0] + dline - (dx - dline)*BOUNCE # Subtract bounce term if < 1
        e.velocity[0] = e.velocity[0] * -BOUNCE

        e.velocity[1] = e.velocity[1] * FRICTION

      else if (e.initial.position[1] + e.height) - collision.minY() < ALMOST_ZERO  and
              (e.position[1] + e.height) - collision.minY() > ALMOST_ZERO #Crossed the top edge
        console.log "Vertical Collision"

        dy = e.initial.position[1] - e.position[1]
        dline = (e.initial.position[1] + e.width) - collision.minY()

        e.position[1] = e.initial.position[1] + dline - (dy - dline)*BOUNCE # Subtract bounce term if < 1
        e.velocity[1] = e.velocity[1] * -BOUNCE

        e.velocity[0] = e.velocity[0] * FRICTION


      else if (e.initial.position[1]) - collision.maxY() > ALMOST_ZERO and 
              (e.position[1]) - collision.maxY() < ALMOST_ZERO #Crossed the bottom edge
        console.log "Vertical Collision"

        dy = e.initial.position[1] - e.position[1]
        dline = (e.initial.position[1] + e.width) - collision.maxY()

        e.position[1] = e.initial.position[1] + dline - (dy - dline)*BOUNCE # Subtract bounce term if < 1
        e.velocity[1] = e.velocity[1] * -BOUNCE

        e.velocity[0] = e.velocity[0] * FRICTION

  advanceMotion: (e, t) ->
    e.initial = 
      position: e.position
      velocity: e.velocity
      acceleration: e.acceleration

    position = [0, 0]
    velocity = [0, 0]
    acceleration = [0, 0]

    for i in [0, 1]
      position[i] = e.initial.position[i] + (e.initial.velocity[i] * t) - (0.5 * e.initial.acceleration[i] * t * t)

      velocity[i] = e.initial.velocity[i] + ( e.initial.acceleration[i] * t)
      velocity[i] = 0 if velocity[i] < ALMOST_ZERO and velocity[i] > ALMOST_ZERO

      acceleration[i] = e.forces.sum (f) -> f[i] if e.forces.length > 0
      acceleration[i] = 0 if acceleration[i] < ALMOST_ZERO and acceleration[i] > ALMOST_ZERO

    e.position = position
    e.velocity = velocity
    e.acceleration = acceleration
    

  detectCollision: (e1, e2) ->
     return false if e1 == e2
     return false if e1.maxX() - e2.minX() < ALMOST_ZERO #To the left
     return false if e1.minX() - e2.maxX() > ALMOST_ZERO #To the right
     return false if e1.maxY() - e2.minY() < ALMOST_ZERO #Above
     return false if e1.minY() - e2.maxY() > ALMOST_ZERO #Below
     return true

  
