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
    handleSplopContacts(splopContact: contact.splopContact)
  }

  func handleSplopContacts(splopContact: SplopContact?) {
    
    guard let contact = splopContact else {
      return
    }

    // FURNATURE CONTACT
    if let furnature = contact.furnature {
      // STICKY
      if furnature.surfaceDef.isSticky(contact) && contact.splopWasTravelingHorizonal {
        // slow gravity slide:
//        contact.splop.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
//        contact.splop.physicsBody?.linearDamping = 400
        
        // managed, non-gravity drift
        contact.splop.physicsBody?.velocity = CGVector(dx: 0, dy: -20)
        contact.splop.physicsBody?.affectedByGravity = false
      }
    }
  }

  override func didSimulatePhysics() {
    // noop
  }
}
