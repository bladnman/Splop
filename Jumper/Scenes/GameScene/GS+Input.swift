//
//  GameScene+Input.swift
//  Jumper
//
//  Created by Maher, Matt on 1/31/21.
//

import SpriteKit

extension GameScene {
  // MARK: TOUCHES
  func touchDown(atPoint pos: CGPoint) {}
  func touchMoved(toPoint pos: CGPoint) {}
  func touchUp(atPoint pos: CGPoint) {}
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { self.touchDown(atPoint: t.location(in: self)) }
  }

  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
  }

  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { self.touchUp(atPoint: t.location(in: self)) }
  }

  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { self.touchUp(atPoint: t.location(in: self)) }
  }
  

}
