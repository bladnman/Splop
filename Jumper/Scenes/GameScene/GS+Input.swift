//
//  GameScene+Input.swift
//  Jumper
//
//  Created by Maher, Matt on 1/31/21.
//

import SpriteKit

extension GameScene {
  // MARK: TOUCHES

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    let firstTouch = touches.first
    firstTouchPosition = firstTouch?.location(in: self)

    splop?.showTossIndicator(with: CGVector.zero)
  }

  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    if let firstTouchPosition = self.firstTouchPosition {
      if let finalTouchPosition = touches.first?.location(in: self) {
        let tossVector = getTossVector(with: firstTouchPosition, and: finalTouchPosition)
        splop?.showTossIndicator(with: tossVector)
      }
    }
  }

  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    if let firstTouchPosition = self.firstTouchPosition {
      if let finalTouchPosition = touches.first?.location(in: self) {
        let vector = getTossVector(with: firstTouchPosition, and: finalTouchPosition)
        throwSplop(with: vector)
      }
    }
    
    touchingDone()
  }

  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
  }
  func getTossVector(with firstTouchPosition:CGPoint, and finalTouchPosition: CGPoint) -> CGVector {
    let multiplier = CGFloat(12.0)
    let vector = CGVector(dx: (finalTouchPosition.x - firstTouchPosition.x) * multiplier,
                          dy: (finalTouchPosition.y - firstTouchPosition.y) * multiplier)
    
    return vector
  }
  func throwSplop(with vector: CGVector) {
    if let splop = self.splop {
      splop.physicsBody?.linearDamping = 0.1
      splop.physicsBody?.affectedByGravity = true
      splop.physicsBody?.applyForce(vector)
      splop.removeTossIndicator()
    }
  }
  func moveSplopToTouch() {
    if let splop = self.splop {
      if let touchPosition = self.firstTouchPosition {
        splop.position = touchPosition
        splop.physicsBody?.affectedByGravity = false
      }
    }
  }

  func touchingDone() {
    firstTouchPosition = nil
    if let splop = self.splop {
      splop.physicsBody?.affectedByGravity = true
      print("splop.physicsBody?.linearDamping \(String(describing: splop.physicsBody?.linearDamping))")
    }
  }
}
