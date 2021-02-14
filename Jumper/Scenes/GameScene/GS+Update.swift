//
//  GameScene+Update.swift
//  Jumper
//
//  Created by Maher, Matt on 1/31/21.
//

import SpriteKit

extension GameScene {
  override func update(_ currentTime: TimeInterval) {
    if splop != nil, worldNode != nil {
      moveWorldIfNeeded()
    }
  }


  // MARK: MOVE WORLD

  func moveWorldIfNeeded() {
    let maxX: CGFloat = 0
    let minX: CGFloat = (sceneWidth - frame.width) * -1
    let maxY: CGFloat = 0
    let minY: CGFloat = (sceneHeight - frame.height) * -1
    let edgeThreshold: CGFloat = 100
    let splotFrameX: CGFloat = splop.position.x + worldNode.position.x
    let splotFrameY: CGFloat = splop.position.y + worldNode.position.y
    let leftDistanceFromFrame: CGFloat = splotFrameX
    let bottomDistanceFromFrame: CGFloat = splotFrameY
    let rightDistanceFromFrame: CGFloat = frame.width - splotFrameX
    let topDistanceFromFrame: CGFloat = frame.height - splotFrameY
    var toMove: CGVector = CGVector.zero

    // too far right
    if rightDistanceFromFrame < edgeThreshold, !isAtRightEdge() {
      toMove.dx = rightDistanceFromFrame - edgeThreshold
    }

    // too far left
    else if leftDistanceFromFrame < edgeThreshold, !isAtLeftEdge() {
      toMove.dx = edgeThreshold - leftDistanceFromFrame
    }
    
    // too far up
    if topDistanceFromFrame < edgeThreshold, !isAtTopEdge() {
      toMove.dy = topDistanceFromFrame - edgeThreshold
    }

    // too far down
    else if bottomDistanceFromFrame < edgeThreshold, !isAtBottomEdge() {
      toMove.dy = edgeThreshold - bottomDistanceFromFrame
    }

    if toMove != CGVector.zero {
      var newMapX = worldNode.position.x + toMove.dx
      newMapX = max(min(newMapX, maxX), minX)
      
      var newMapY = worldNode.position.y + toMove.dy
      newMapY = max(min(newMapY, maxY), minY)
      
      worldNode.position = CGPoint(x: newMapX, y: newMapY)
    }
  }

  func isAtTopEdge() -> Bool {
    return worldNode!.position.y + sceneHeight <= frame.height
  }
  
  func isAtRightEdge() -> Bool {
    return worldNode!.position.x + sceneWidth <= frame.width
  }

  func isAtBottomEdge() -> Bool {
    return worldNode!.position.y >= 0
  }
  
  func isAtLeftEdge() -> Bool {
    return worldNode!.position.x >= 0
  }


}
