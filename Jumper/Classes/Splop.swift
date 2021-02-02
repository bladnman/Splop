//
//  Splop.swift
//  Jumper
//
//  Created by Maher, Matt on 1/31/21.
//

import SpriteKit

class Splop: SKSpriteNode {
  
  var tossIndicatorNode: SKNode?
  var tossIndicatorDot: SKShapeNode?
  
  
  // MARK: Toss Indicator
  func showTossIndicator(with vector: CGVector) {
    createTossIndicator(with: vector)
  }
  func createTossIndicator(with vector: CGVector) {
    // already good, thanks
    if tossIndicatorNode == nil {
      tossIndicatorNode = SKNode()
      tossIndicatorDot = SKShapeNode(circleOfRadius: 7 )
      tossIndicatorDot!.fillColor = UIColor.yellow
      tossIndicatorNode?.addChild(tossIndicatorDot!)
      self.addChild(tossIndicatorNode!)
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
