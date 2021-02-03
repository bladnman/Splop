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
//    tossHint()
//    return
    // no toss needed
    if firstTouchPosition == nil || lastTouchPosition == nil {
      return
    }
    
    if let splop = self.splop {
      let tossVector = getTossVector(with: firstTouchPosition!, and: lastTouchPosition!)
      toss(node: splop, along: tossVector)
    }
  }
  func tossHint() {
    // no toss needed
    if firstTouchPosition == nil || lastTouchPosition == nil {
      return
    }
    
    if let splop = self.splop {
      let tossVector = getTossVector(with: firstTouchPosition!, and: lastTouchPosition!)
      let node = splop.copy() as! SKSpriteNode
      node.name = "hint"
      node.physicsBody?.contactTestBitMask = C_PHY_CAT.none
      node.removeAllChildren()
      
      node.color = .clear
      let outline = SKShapeNode(rect: CGRect(x: 0, y: 0, width: node.frame.width, height: node.frame.height))
      outline.strokeColor = .white
      outline.fillColor = .clear
      outline.lineWidth = 2.0
      outline.alpha = 0.3
      node.addChild(outline)
      
      self.addChild(node)
      toss(node: node, along: tossVector)
      node.run(SKAction.fadeOut(withDuration: 0.8)) {
        node.removeFromParent()
      }
    }
  }
  func toss(node: SKSpriteNode, along vector: CGVector) {
    node.physicsBody?.linearDamping = 0.1
    node.physicsBody?.affectedByGravity = true
    node.physicsBody?.applyForce(vector)
  }
  func updateTossIndicator() {
    // remove : no toss yet
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

