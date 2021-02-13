//
//  SurfaceDef.swift
//  Jumper
//
//  Created by Maher, Matt on 2/7/21.
//

import SpriteKit

enum SurfaceTypes {
  static let BOUNCY = Range<Int>(1...9)
  static let SLIPPERY = Range<Int>(10...19)
  static let STICKY = Range<Int>(20...29)
}

let DEFAULT_REST = CGFloat(0.2)
let DEFAULT_FRIC = CGFloat(0.2)

class SurfaceDef: CustomStringConvertible, PropertyReflectable {
  var restTop: CGFloat = DEFAULT_REST
  var restRight: CGFloat = DEFAULT_REST
  var restBottom: CGFloat = DEFAULT_REST
  var restLeft: CGFloat = DEFAULT_REST
  
  var fricTop: CGFloat = DEFAULT_FRIC
  var fricRight: CGFloat = DEFAULT_FRIC
  var fricBottom: CGFloat = DEFAULT_FRIC
  var fricLeft: CGFloat = DEFAULT_FRIC


  // Convenience : userData
  convenience init(_ userData: NSMutableDictionary?) {
    self.init()
    
    func getValFor(_ key: String, orDefault: CGFloat) -> CGFloat {
      let val = userData?[key] as? CGFloat ?? orDefault
      return val.clamped(to: 0.0...1.0)
    }
    
    let rest = getValFor("rest", orDefault: DEFAULT_REST)
    let fric = getValFor("fric", orDefault: DEFAULT_FRIC)
    
    restTop = getValFor("restT", orDefault: rest)
    restRight = getValFor("restR", orDefault: rest)
    restBottom = getValFor("restB", orDefault: rest)
    restLeft = getValFor("restL", orDefault: rest)
    
    fricTop = getValFor("fricT", orDefault: fric)
    fricRight = getValFor("fricR", orDefault: fric)
    fricBottom = getValFor("fricB", orDefault: fric)
    fricLeft = getValFor("fricL", orDefault: fric)
    
    // MARK : INVERSE ASSIGNMENT
    // TOP
    if restTop == DEFAULT_REST && fricTop != DEFAULT_FRIC {
      restTop = 1.0 - fricTop
    } else if fricTop == DEFAULT_FRIC && restTop != DEFAULT_REST {
      fricTop = 1.0 - restTop
    }
    
    // RIGHT
    if restRight == DEFAULT_REST && fricRight != DEFAULT_FRIC {
      restRight = 1.0 - fricRight
    } else if fricRight == DEFAULT_FRIC && restRight != DEFAULT_REST {
      fricRight = 1.0 - restRight
    }
    
    // BOTTOM
    if restBottom == DEFAULT_REST && fricBottom != DEFAULT_FRIC {
      restBottom = 1.0 - fricBottom
    } else if fricBottom == DEFAULT_FRIC && restBottom != DEFAULT_REST {
      fricBottom = 1.0 - restBottom
    }
    
    // LEFT
    if restLeft == DEFAULT_REST && fricLeft != DEFAULT_FRIC {
      restLeft = 1.0 - fricLeft
    } else if fricLeft == DEFAULT_FRIC && restLeft != DEFAULT_REST {
      fricLeft = 1.0 - restLeft
    }
  }
  
  func isDefault() -> Bool {
    return restTop == DEFAULT_REST &&
      restRight == DEFAULT_REST &&
      restBottom == DEFAULT_REST &&
      restLeft == DEFAULT_REST &&
      fricTop == DEFAULT_FRIC &&
      fricRight == DEFAULT_FRIC &&
      fricBottom == DEFAULT_FRIC &&
      fricLeft == DEFAULT_FRIC
  }
  
  var description: String {
    return "{\n"
      + "  restTop: \(restTop),\n"
      + "  restRight: \(restRight),\n"
      + "  restBottom: \(restBottom),\n"
      + "  restLeft: \(restLeft),\n"
      
      + "  fricTop: \(fricTop),\n"
      + "  fricRight: \(fricRight),\n"
      + "  fricBottom: \(fricBottom),\n"
      + "  fricLeft: \(fricLeft),\n"
      + "}"
  }

  static func isBouncy(_ value: Int) -> Bool {
    return SurfaceTypes.BOUNCY.contains(value)
  }

  static func isSlippery(_ value: Int) -> Bool {
    return SurfaceTypes.SLIPPERY.contains(value)
  }

  static func isSticky(_ value: Int) -> Bool {
    return SurfaceTypes.STICKY.contains(value)
  }

  static func isNormal(_ value: Int) -> Bool {
    return value < 1 || value > 29
  }
}
