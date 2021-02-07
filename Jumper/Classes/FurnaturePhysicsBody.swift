//
//  FurnaturePhysicsBody.swift
//  Jumper
//
//  Created by Maher, Matt on 2/7/21.
//

import SpriteKit

class FurnaturePhysicsBody : SKPhysicsBody {
  override init() {
    super.init()
    self.affectedByGravity = false
    self.allowsRotation = false
    self.isDynamic = false
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
