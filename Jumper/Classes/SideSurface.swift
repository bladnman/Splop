//
//  SideDef.swift
//  Jumper
//
//  Created by Maher, Matt on 2/7/21.
//

import Foundation

class SideSurface {
  var top: C_OBJ_SURF = .none
  var right: C_OBJ_SURF = .none
  var bottom: C_OBJ_SURF = .none
  var left: C_OBJ_SURF = .none
  
  
  init(top: C_OBJ_SURF = .none, right: C_OBJ_SURF = .none, bottom: C_OBJ_SURF = .none, left: C_OBJ_SURF = .none ) {
    self.top = top
    self.right = right
    self.bottom = bottom
    self.left = left
  }
}
