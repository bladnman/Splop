//
//  PhysicsHelper.swift
//  Super Indie Runner
//
//  Created by Maher, Matt on 1/23/21.
//

import SpriteKit

class PhysicsHelper {
  static func addPhysicsBody(to sprite: SKSpriteNode) {
    
    // FTYPE - Furnature Type
    // if an object has an ftype we use that
    // to produce the physics body
    if let ftypeUD = sprite.userData?["ftype"] as? String {
      if let ftype = C_OBJ_TYPE(rawValue: ftypeUD) {
        addPhysicsBody(to: sprite, forFtype: ftype)
      }
    }
    
    // NAME - Object Name
    // other things simply have a name that we use
    // to add the physics body
    else if let name = sprite.name {
      addPhysicsBody(to: sprite, forName: name)
    }
  }
  
  static func addPhysicsBody(to sprite: SKSpriteNode, forFtype ftype: C_OBJ_TYPE) {
    print("[M@] [\(String(describing: ftype))] ftype")
   
    switch ftype {
    // SOLID
    case .solid:
      let physicsBody = SKPhysicsBody(rectangleOf: sprite.size)
      physicsBody.affectedByGravity = false
      physicsBody.allowsRotation = false
      physicsBody.isDynamic = false
      sprite.physicsBody = physicsBody
      
    // GROUND
    case .ground:
      let surfaceDef = SideSurface(top: .standard, right: .none, bottom: .none, left: .none)
      let physicsBodies = PhysicsHelper.getPhysicsEdges(for: sprite, and: surfaceDef)
      for physicsBody in physicsBodies {
        sprite.physicsBody = physicsBody
      }
      
    // PLATFORM
    case .platform:
      let surfaceDef = SideSurface(top: .standard, right: .none, bottom: .standard, left: .none)
      let physicsBodies = PhysicsHelper.getPhysicsEdges(for: sprite, and: surfaceDef)
//      for physicsBody in physicsBodies {
//        sprite.physicsBody = physicsBody
//      }
      sprite.physicsBody = SKPhysicsBody.init(bodies: physicsBodies)
      sprite.physicsBody?.affectedByGravity = false
      sprite.physicsBody?.allowsRotation = false
      sprite.physicsBody?.isDynamic = false
      
    // CEILING
    case .ceiling:
      let surfaceDef = SideSurface(top: .none, right: .none, bottom: .standard, left: .none)
      let physicsBodies = PhysicsHelper.getPhysicsEdges(for: sprite, and: surfaceDef)
      
      sprite.physicsBody = SKPhysicsBody.init(bodies: physicsBodies)
      sprite.physicsBody?.affectedByGravity = false
      sprite.physicsBody?.allowsRotation = false
      sprite.physicsBody?.isDynamic = false
//      for physicsBody in physicsBodies {
//      }
      
    // OTHERS
    default:
      print("nothing added to me... ")
    }
  }
  
  static func addPhysicsBody(to sprite: SKSpriteNode, forName name: String) {
    print("[M@] [\(String(describing: name))] name")
  }
  
  static func getFurnaturePhysicsBody(for sprite: SKSpriteNode) -> SKPhysicsBody {
    let physicsBody = SKPhysicsBody(rectangleOf: sprite.size)
    physicsBody.affectedByGravity = false
    physicsBody.allowsRotation = false
    physicsBody.isDynamic = false
    return physicsBody
  }

  static func getPhysicsEdges(for sprite: SKSpriteNode, and surfaceDef: SideSurface) -> [SKPhysicsBody] {
    
    var physicsBodies = [SKPhysicsBody]()
    
    // TOP
    if surfaceDef.top != .none {
      let point1 = CGPoint(x: sprite.frame.minX, y: sprite.frame.maxY) - sprite.position
      let point2 = CGPoint(x: sprite.frame.maxX, y: sprite.frame.maxY) - sprite.position
      if let physicsBody = PhysicsHelper.getPhysicsEdges(for: surfaceDef.top, from: point1, to: point2) {
        physicsBodies.append(physicsBody)
      }
    }
    
    // BOTTOM
    if surfaceDef.bottom != .none {
      let point1 = CGPoint(x: sprite.frame.minX, y: sprite.frame.minY) - sprite.position
      let point2 = CGPoint(x: sprite.frame.maxX, y: sprite.frame.minY) - sprite.position
      if let physicsBody = PhysicsHelper.getPhysicsEdges(for: surfaceDef.bottom, from: point1, to: point2) {
        physicsBodies.append(physicsBody)
      }
    }
    
    return physicsBodies
  }

  static func getPhysicsEdges(for type: C_OBJ_SURF, from point1: CGPoint, to point2: CGPoint) -> SKPhysicsBody? {
    
    var physicsBody: SKPhysicsBody?
    
    switch type {
    case .standard:
      physicsBody = SKPhysicsBody.init(edgeFrom: point1, to: point2)
    default:
      print("[M@] nothing to do with this one")
    }
    
    return physicsBody
  }
}
