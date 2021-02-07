//
//  GameScene+Update.swift
//  Jumper
//
//  Created by Maher, Matt on 1/31/21.
//

import SpriteKit

extension GameScene {
  // MARK: Toss Indicator

  func getTossVector(with firstTouchPosition: CGPoint, and finalTouchPosition: CGPoint) -> CGVector {
    let xMax: CGFloat = C_MOVE.Toss.xMax
    let xMin: CGFloat = xMax * -1
    let yMax: CGFloat = C_MOVE.Toss.yMax
    let yMin: CGFloat = yMax * -1
    var multiplier = C_MOVE.Input.multiplier

    if tossType == .snap {
      multiplier *= -1
    }

    let dxTouch = (finalTouchPosition.x - firstTouchPosition.x)
    let dyTouch = (finalTouchPosition.y - firstTouchPosition.y)
    let dx: CGFloat = max(xMin, min(xMax, dxTouch)) * multiplier
    let dy: CGFloat = max(yMin, min(yMax, dyTouch)) * multiplier

    let vector = CGVector(dx: dx, dy: dy)

    // scale vector to worldLayer scale
//    return vector * C_SCALE
//    let forceScale = splop.physicsBody!.mass / C_PHY_MASS.splop
//    print("[M@] [\(forceScale)] forceScale")
//    return vector * forceScale * 2
    return vector
  }

  func tossSplop() {
    // no toss needed
    if firstTouchPosition == nil || lastTouchPosition == nil {
      return
    }

    let tossVector = getTossVector(with: firstTouchPosition!, and: lastTouchPosition!)
    toss(node: splop, along: tossVector)
  }

  func tossHint() {
    // no toss needed
    if firstTouchPosition == nil || lastTouchPosition == nil {
      return
    }

    let tossVector = getTossVector(with: firstTouchPosition!, and: lastTouchPosition!)
    let hintNode = splop.copy() as! SKSpriteNode

    hintNode.name = "hint"
    hintNode.physicsBody?.contactTestBitMask = C_PHY_CAT.none
    hintNode.physicsBody?.mass = C_PHY_MASS.splop
    hintNode.removeAllChildren()
    hintNode.color = .clear

    let hintIndicator = SKShapeNode(circleOfRadius: 4)
    hintIndicator.fillColor = .white
    hintNode.addChild(hintIndicator)

    worldNode.addChild(hintNode)

    toss(node: hintNode, along: tossVector)
    hintNode.run(SKAction.fadeOut(withDuration: 0.8)) {
      hintNode.removeFromParent()
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
      tossIndicatorDot = SKShapeNode(circleOfRadius: 7)
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
