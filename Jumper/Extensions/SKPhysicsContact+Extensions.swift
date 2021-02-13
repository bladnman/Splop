//
//  SKNode+Extensions.swift
//  Super Indie Runner
//
//  Created by Maher, Matt on 1/22/21.
//

import SpriteKit

extension SKPhysicsContact {
  var bodyAOrdered: SKPhysicsBody? {
    get {
      // attempt to return splot as A always
      if bodyA.categoryBitMask == C_PHY_CAT.splop {
        return bodyA
      }
      if bodyB.categoryBitMask == C_PHY_CAT.splop {
        return bodyB
      }
      
      // otherwise return lowest category value
      return bodyB.categoryBitMask < bodyA.categoryBitMask ? bodyB : bodyA
    }
  }
  var bodyBOrdered: SKPhysicsBody? {
    get {
      // just opposite of AOrdered
      return bodyA != bodyAOrdered ? bodyA : bodyB
    }
  }
  var isSplopContact: Bool {
    get {
      return bodyAOrdered?.categoryBitMask == C_PHY_CAT.splop
    }
  }
  var bodySplop: SKPhysicsBody? {
    get {
      let aOrdered = bodyAOrdered
      return aOrdered?.categoryBitMask == C_PHY_CAT.splop ? aOrdered : nil
    }
  }
}
