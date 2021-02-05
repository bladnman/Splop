//
//  GameScene+Update.swift
//  Jumper
//
//  Created by Maher, Matt on 1/31/21.
//

import SpriteKit

extension GameScene {
  // MARK: UPDATE

  override func update(_ currentTime: TimeInterval) {
    if splop != nil, tileMap != nil {
      let maxX: CGFloat = 0
      let minX: CGFloat = (tileMap!.frame.width - self.frame.width) * -1
      let edgeThreshold = 100
      let leftDistance: CGFloat = splop!.position.x
      let rightDistance: CGFloat = frame.width - splop!.position.x
      var toMove: CGFloat = 0.0
      
      // too far right
      if rightDistance < CGFloat(edgeThreshold), !isAtRightEdge() {
        toMove = rightDistance - CGFloat(edgeThreshold)
      }

      // too far left
      else if leftDistance < CGFloat(edgeThreshold), !isAtLeftEdge() {
        toMove = CGFloat(edgeThreshold) - leftDistance
      }
      
      if toMove != 0.0 {
        var newMapX = tileMap!.position.x + toMove
        newMapX = max(min(newMapX, maxX), minX)
        tileMap!.position = CGPoint(x: newMapX, y: tileMap!.position.y)
        splop!.position = CGPoint(x: splop!.position.x + toMove, y: splop!.position.y)
      }
    }
  }
  
  func isAtRightEdge() -> Bool {
    return tileMap!.position.x + tileMap!.frame.width <= frame.width
  }

  func isAtLeftEdge() -> Bool {
    return tileMap!.position.x >= 0
  }
}
