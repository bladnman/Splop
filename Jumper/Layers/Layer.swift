//
//  Layer.swift
//  Super Indie Runner
//
//  Created by Maher, Matt on 1/23/21.
//

import SpriteKit


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

