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
//    if firstTouchPosition != nil { return }
    let firstTouch = touches.first
    firstTouchPosition = firstTouch?.location(in: self)

//    moveSplopToTouch()
  }

  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//    moveSplopToTouch()
  }

  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    let finalTouch = touches.first
    
    if let firstTouchPosition = self.firstTouchPosition {
      if let finalTouchPosition = finalTouch?.location(in: self) {
        let multiplier = CGFloat(12.0)
        let vector = CGVector(dx: (finalTouchPosition.x - firstTouchPosition.x) * multiplier,
                              dy: (finalTouchPosition.y - firstTouchPosition.y) * multiplier)
        
        print("---------")
        print("firstTouchPosition \(firstTouchPosition)")
        print("finalTouchPosition \(finalTouchPosition)")
        print("vector \(vector)")
        
        throwSplop(with: vector)
      }
    }
    


    touchingDone()
  }

  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//    touchingDone()
  }

  func throwSplop(with vector: CGVector) {
    if let splop = self.splop {
      splop.physicsBody?.linearDamping = 0.1
      splop.physicsBody?.affectedByGravity = true
      splop.physicsBody?.applyForce(vector)
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
//      splop.physicsBody?.linearDamping = CGFloat(splop.position.x / 100)
      splop.physicsBody?.affectedByGravity = true
      print("splop.physicsBody?.linearDamping \(String(describing: splop.physicsBody?.linearDamping))")
    }
  }
}
