//
//  Layer.swift
//  Super Indie Runner
//
//  Created by Maher, Matt on 1/23/21.
//

import SpriteKit


public func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
  return CGPoint(x: point.x * scalar, y: point.y * scalar)
}
public func + (left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x + right.x, y: left.y + right.y)
}
public func += (left: inout CGPoint, right: CGPoint) {
  left = left + right
}

class Layer: SKNode {
  
  func update(_ delta: TimeInterval) {
    for child in children {
      updateNodesGlobal(delta, childNode: child)
    }
  }
  
  func updateNodesGlobal(_ delta: TimeInterval, childNode: SKNode) {
    updateNodes(delta, childNode: childNode)
  }
  
  func updateNodes(_ delta: TimeInterval, childNode: SKNode) {
    // overriden in subclasses
  }
}

