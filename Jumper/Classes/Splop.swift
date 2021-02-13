//
//  Splop.swift
//  Jumper
//
//  Created by Maher, Matt on 1/31/21.
//

import SpriteKit

class Splop: SKSpriteNode {
  
  var isMoving: Bool {
    get {
      if let velocity = physicsBody?.velocity {
        return velocity.dx != 0.0 || velocity.dy != 0.0
      }
      return false
    }
  }
  var isMovingDown: Bool {
    get {
      if let velocity = physicsBody?.velocity {
        return velocity.dy < 0.0
      }
      return false
    }
  }
  var isMovingUp: Bool {
    get {
      if let velocity = physicsBody?.velocity {
        return velocity.dy > 0.0
      }
      return false
    }
  }
  var isMovingLeft: Bool {
    get {
      if let velocity = physicsBody?.velocity {
        return velocity.dx < 0.0
      }
      return false
    }
  }
  var isMovingRight: Bool {
    get {
      if let velocity = physicsBody?.velocity {
        return velocity.dx > 0.0
      }
      return false
    }
  }
}
