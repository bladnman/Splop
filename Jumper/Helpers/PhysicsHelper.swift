//
//  PhysicsHelper.swift
//  Super Indie Runner
//
//  Created by Maher, Matt on 1/23/21.
//

import SpriteKit

class PhysicsHelper {
  static func addPhysicsBody(to sprite: SKSpriteNode) {
    let physicsBody = SKPhysicsBody(rectangleOf: sprite.size)
    physicsBody.affectedByGravity = false
    physicsBody.allowsRotation = false
    physicsBody.isDynamic = false // so they don't move when hit
    physicsBody.categoryBitMask = C_PHY_CAT.furnature
    physicsBody.restitution = 0.3
    sprite.physicsBody = physicsBody
  }
  static func addPhysicsBody(to furnatureNode: FurnatureNode) {
    let physicsBody = SKPhysicsBody(rectangleOf: furnatureNode.size)
    physicsBody.affectedByGravity = false
    physicsBody.allowsRotation = false
    physicsBody.isDynamic = false // so they don't move when hit
    physicsBody.categoryBitMask = C_PHY_CAT.furnature
    furnatureNode.physicsBody = physicsBody
    physicsBody.restitution = C_PHY.Defaults.restitution
    physicsBody.friction = C_PHY.Defaults.friction

    // change values dependant on surface
    physicsBody.restitution = furnatureNode.surfaceDef.restTop
    physicsBody.friction = furnatureNode.surfaceDef.fricTop
    
  }
}
