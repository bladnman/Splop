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
    let edgeThreshold: CGFloat = 100
    let splotFrameX: CGFloat = splop.position.x + worldNode.position.x
    let leftDistanceFromFrame: CGFloat = splotFrameX
    let rightDistanceFromFrame: CGFloat = frame.width - splotFrameX
    var toMove: CGFloat = 0.0

    // too far right
    if rightDistanceFromFrame < edgeThreshold, !isAtRightEdge() {
      toMove = rightDistanceFromFrame - edgeThreshold
    }

    // too far left
    else if leftDistanceFromFrame < edgeThreshold, !isAtLeftEdge() {
      toMove = edgeThreshold - leftDistanceFromFrame
    }

    if toMove != 0.0 {
      var newMapX = worldNode.position.x + toMove
      newMapX = max(min(newMapX, maxX), minX)
      worldNode.position = CGPoint(x: newMapX, y: worldNode.position.y)
    }
  }

  func isAtRightEdge() -> Bool {
    return worldNode!.position.x + sceneWidth <= frame.width
  }

  func isAtLeftEdge() -> Bool {
    return worldNode!.position.x >= 0
  }
}
