//
//  MUtils.swift
//  Jumper
//
//  Created by Maher, Matt on 2/10/21.
//

import SpriteKit

class MUtils {
  static func roll(_ sided:Int) -> Int {
    return Int.random(in: 1...sided)
  }
  static func flipIsHeads() -> Bool {
    return MUtils.roll(2) == 2
  }
}
