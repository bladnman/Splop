//
//  FurnatureNode.swift
//  Jumper
//
//  Created by Maher, Matt on 2/11/21.
//

import SpriteKit

class FurnatureNode: SKSpriteNode {
  let surfaceDef: SurfaceDef
  
  override convenience init(texture: SKTexture?, color: UIColor, size: CGSize) {
    self.init(size: size, userData: nil)
  }
  
  convenience init(size: CGSize, userData: NSMutableDictionary?) {
    self.init(size: size, userData: nil, color: UIColor.clear)
  }

  convenience init(size: CGSize, userData: NSMutableDictionary?, color: UIColor) {
    self.init(size: size, surfaceDef: SurfaceDef(userData), color: color)
  }
  
  convenience init(size: CGSize, surfaceDef: SurfaceDef) {
    self.init(size: size, surfaceDef: surfaceDef, color: UIColor.clear)
  }
  
  // real constructor
  init(size: CGSize, surfaceDef: SurfaceDef, color: UIColor) {
    self.surfaceDef = surfaceDef
    super.init(texture: nil, color: color, size: size)
  }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
