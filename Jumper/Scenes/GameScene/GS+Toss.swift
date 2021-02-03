//
//  GameScene+Update.swift
//  Jumper
//
//  Created by Maher, Matt on 1/31/21.
//

import SpriteKit

extension GameScene {
  // MARK: Toss Indicator
  func getTossVector(with firstTouchPosition:CGPoint, and finalTouchPosition: CGPoint) -> CGVector {
    var multiplier = CGFloat(12.0)
    
    if tossType == .snap {
      multiplier *= -1
    }
    
    let vector = CGVector(dx: (finalTouchPosition.x - firstTouchPosition.x) * multiplier,
                          dy: (finalTouchPosition.y - firstTouchPosition.y) * multiplier)
    return vector
  }
  func tossSplop() {
    // no toss needed
    if firstTouchPosition == nil || lastTouchPosition == nil {
      return
    }
    
    if let splop = self.splop {
      let tossVector = getTossVector(with: firstTouchPosition!, and: lastTouchPosition!)

      splop.physicsBody?.linearDamping = 0.1
      splop.physicsBody?.affectedByGravity = true
      splop.physicsBody?.applyForce(tossVector)
      
      removeTossIndicator()
    }
  }
  func updateTossIndicator() {
    // no toss yet
    if firstTouchPosition == nil || lastTouchPosition == nil {
      removeTossIndicator()
    }
    
    // show toss indicator
    else {
      let tossVector = getTossVector(with: firstTouchPosition!, and: lastTouchPosition!)
      createTossIndicator(with: tossVector)
    }
  }
  func createTossIndicator(with vector: CGVector) {
    // already good, thanks
    if tossIndicatorNode == nil {
      tossIndicatorNode = SKNode()
      tossIndicatorDot = SKShapeNode(circleOfRadius: 7 )
      tossIndicatorDot!.fillColor = UIColor.yellow
      tossIndicatorNode?.addChild(tossIndicatorDot!)
      splop?.addChild(tossIndicatorNode!)
    }

    // update dot position
    let modifier = CGFloat(20.0)
    let finalPosition = CGPoint(x: vector.dx/modifier, y: vector.dy/modifier)
    tossIndicatorDot!.position = finalPosition
  }
  func removeTossIndicator() {
    tossIndicatorNode?.removeFromParent()
    tossIndicatorNode = nil
  }

}

