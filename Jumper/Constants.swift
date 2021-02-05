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
      static let splop = "splop"
      static let platform = "platform"
      static let mapNode = "mapNode"
    }
  }
  
  struct Physics {
    enum Categories {
      static let none: UInt32 = 0
      static let splop: UInt32 = 0x1
      static let ground: UInt32 = 0x1 << 1
      static let frame: UInt32 = 0x1 << 2
      static let all = UInt32.max
    }
  }
  enum ZPositions {
    // backgrounds
    static let farBG: CGFloat = 10
    static let closeBG: CGFloat = 11
    
    // world
    static let world: CGFloat = 20
    static let object: CGFloat = 21
    static let splop: CGFloat = 26
    
    // hud
    static let hud: CGFloat = 100
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
