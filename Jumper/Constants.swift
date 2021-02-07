//
//  Constants.swift
//  Jumper
//
//  Created by Maher, Matt on 1/30/21.
//
//  USE ALIASES DEFINED AT END OF FILE

import CoreGraphics
import Foundation

//static let C_SCENE = "GameScene"
let C_SCENE = "PlatformPlayground"
let C_SCALE: CGFloat = 1.0
//let C_SCALE: CGFloat = 0.5

struct Constants {
  
  struct Objects {
    enum Names {
      static let splop = "splop"
      static let platform = "platform"
      static let mapNode = "mapNode"
      static let worldNode = "worldNode"
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
    enum Mass {
      static let splop: CGFloat = 0.1
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
  struct Movement {
    struct Input {
      static let multiplier: CGFloat = 18.0
    }
    struct Toss {
      static let xMax: CGFloat = 75
      static let yMax: CGFloat = 300
    }
    
  }
}

typealias C = Constants
typealias C_OBJ_NAME = Constants.Objects.Names
typealias C_PHY_CAT = Constants.Physics.Categories
typealias C_PHY_MASS = Constants.Physics.Mass
typealias C_ZPOS = Constants.ZPositions
typealias C_ANIS = Constants.Anis
typealias C_MOVE = Constants.Movement

