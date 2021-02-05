//
//  GameScene.swift
//  Jumper
//
//  Created by Maher, Matt on 1/30/21.
//

import SpriteKit

enum TossType {
  case flick
  case snap
}

class GameScene: SKScene {
  
  var splop: Splop?
  var mapNode: SKTileMapNode?
  var tossIndicatorNode: SKNode?
  var tossIndicatorDot: SKShapeNode?
  var firstTouchPosition: CGPoint?
  var lastTouchPosition: CGPoint?
  var tossType = TossType.flick
    
  // MARK: DID MOVE

  override func didMove(to view: SKView) {
    setup()
    physicsWorld.contactDelegate = self
  }
  
  func _temp(to sprite: SKSpriteNode, with name: String) {
//    let playerIdleFrames = AnimationHelper.loadTextures(fromAtlasFileNamed: C_ANIS.Player.idle.atlasName, withName: C_ANIS.Player.idle.frameKey)
  }

  
}
