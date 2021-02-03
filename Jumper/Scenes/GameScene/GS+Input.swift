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
    self.firstTouchPosition = touches.first?.location(in: self)
    updateTossIndicator()
  }

  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.lastTouchPosition = touches.first?.location(in: self)
    updateTossIndicator()
  }

  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    tossSplop()
    touchingDone()
    updateTossIndicator()
  }

  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    touchingDone()
    updateTossIndicator()
  }
  
  func touchingDone() {
    firstTouchPosition = nil
    lastTouchPosition = nil
  }
}
