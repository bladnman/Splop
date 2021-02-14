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
  private let bodyB: SKNode
  
  var isTopContact: Bool { return splopWasTravelingDown }
  var isRightContact: Bool { return splopWasTravelingLeft }
  var isBottomContact: Bool { return splopWasTravelingUp }
  var isLeftContact: Bool { return splopWasTravelingRight }

  var splopWasTravelingDown: Bool { return normal.dy < 0 }
  var splopWasTravelingLeft: Bool { return normal.dx < 0 }
  var splopWasTravelingUp: Bool { return normal.dy > 0 }
  var splopWasTravelingRight: Bool { return normal.dx > 0 }
  var splopWasTravelingHorizonal: Bool { return splopWasTravelingLeft || splopWasTravelingRight }
  
  var isFurnatureContact: Bool { return bodyB is FurnatureNode }
  
  var furnature: FurnatureNode? { return bodyB as? FurnatureNode }
  
  init(_ contactNormal: CGVector, splop: Splop, bodyB: SKNode) {
    self.normal = contactNormal
    self.splop = splop
    self.bodyB = bodyB
  }
}
