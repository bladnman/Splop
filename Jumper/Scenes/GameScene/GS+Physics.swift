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
    // off the gound
    // temp... not to keep
    if contact.contactPoint.y > 5 {
//      if MUtils.flipIsHeads() {
//        splop?.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
//        splop?.physicsBody?.linearDamping = 400
//      }
    }
    
    // on or below
    // temp... not to keep
    else {
      splop?.physicsBody?.linearDamping = 0.1
      splop?.physicsBody?.affectedByGravity = true
    }
  }

  func doPhysics(for splop: Splop, and furnature: SKSpriteNode) {
    // noop
  }
  override func didSimulatePhysics() {
    // noop
  }
}
