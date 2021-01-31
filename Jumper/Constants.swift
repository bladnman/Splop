//
//  Constants.swift
//  Jumper
//
//  Created by Maher, Matt on 1/30/21.
//
//  USE ALIASES DEFINED AT END OF FILE

import CoreGraphics
import Foundation

struct Constants {
  struct Objects {
    enum Names {
      static let player = "player"
    }
  }
  
  struct Physics {
    enum Categories {
      static let none: UInt32 = 0
      static let all = UInt32.max
      static let player: UInt32 = 0x1
      static let ground: UInt32 = 0x1 << 1
      static let finish: UInt32 = 0x1 << 2
      static let collectible: UInt32 = 0x1 << 3
      static let enemy: UInt32 = 0x1 << 4
      static let frame: UInt32 = 0x1 << 5
      static let ceiling: UInt32 = 0x1 << 6
    }
  }
  enum ZPositions {
    static let farBGZ: CGFloat = 0
    static let closeBGZ: CGFloat = 1
    static let worldZ: CGFloat = 2
    static let objectZ: CGFloat = 3
    static let playerZ: CGFloat = 4
    static let hudZ: CGFloat = 5
  }
  struct Anis {
    struct Player {
      struct idle {
        static let atlasName = "playerIdleAtlas"
        static let frameKey = "idle_"
      }
    }
  }

}

typealias C = Constants
typealias C_OBJ_NAME = Constants.Objects.Names
typealias C_PHY_CAT = Constants.Physics.Categories
typealias C_ZPOS = Constants.ZPositions
typealias C_ANIS = Constants.Anis
