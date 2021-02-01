//
//  GameScene+Physics.swift
//  Jumper
//
//  Created by Maher, Matt on 1/31/21.
//

import SpriteKit

extension GameScene: SKPhysicsContactDelegate {
  // MARK: PHYSICS
  func didBegin(_ contact: SKPhysicsContact) {
    print("contact point \(contact.contactPoint)")
    if contact.contactPoint.y > 5 {
//      box?.physicsBody?.linearDamping = 10
      splop?.physicsBody?.affectedByGravity = false
      splop?.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
    } else {
//      splop?.physicsBody?.linearDamping = 0.1
      splop?.physicsBody?.affectedByGravity = true
    }
  }

}
