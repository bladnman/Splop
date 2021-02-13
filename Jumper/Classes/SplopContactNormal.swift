//
//  SplopContactNormal.swift
//  Jumper
//
//  Created by Maher, Matt on 2/13/21.
//

import SpriteKit

class SplopContact {
  let normal: CGVector
  let splop: Splop
  let furnature: FurnatureNode
  
  var isTopContact: Bool { return normal.dy < 0 }
  var isRightContact: Bool { return normal.dx < 0 }
  var isBottomContact: Bool { return normal.dy > 0 }
  var isLeftContact: Bool { return normal.dx > 0 }
  
  init(_ contactNormal: CGVector, splop: Splop, furnature: FurnatureNode) {
    self.normal = contactNormal
    self.splop = splop
    self.furnature = furnature
  }
}
