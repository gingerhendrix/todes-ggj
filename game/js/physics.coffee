class @Physics
  constructor: (@game) -> #

  advance: (t) ->
    @game.entities().forEach (e) =>
      @advanceMotion(e, t)
    @game.entities().forEach (e) =>
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

        # Enumerate edges, check if we crossed them
        if (e.initial.position[0] + e.width) < collision.minX() and (e.position[0] + e.width) > collision.minX() or #Crossed the left edge
           (e.initial.position[0]) > collision.maxX() and (e.position[0]) < collision.maxX() #Crossed the right edge
          console.log "Vertical Collision"
          e.position[0] = e.initial.position[0] # Subtract bounce term if < 1
          e.velocity[0] = e.velocity[0] * -1
        else if (e.initial.position[1] + e.height) < collision.minY() and (e.position[1] + e.height) > collision.minY() or #Crossed the top edge
           (e.initial.position[1]) > collision.maxY() and (e.position[1]) < collision.maxY() #Crossed the bottom edge
          console.log "Horizontal Collision"
          e.position[1] = e.initial.position[1] # Subtract bounce term if < 1
          e.velocity[1] = e.velocity[1] * -1


 
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

  
