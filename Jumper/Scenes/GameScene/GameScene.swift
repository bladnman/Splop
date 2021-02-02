//
//  GameScene.swift
//  Jumper
//
//  Created by Maher, Matt on 1/30/21.
//

import SpriteKit

class GameScene: SKScene {
  
  var splop:Splop?
  var firstTouchPosition:CGPoint?
    
  // MARK: DID MOVE

  override func didMove(to view: SKView) {
    createWorld()
    createSplop()
    setup()
  }
  
  func setup() {
    physicsWorld.contactDelegate = self
  }
    
    
  func _temp(to sprite: SKSpriteNode, with name: String) {
//    let playerIdleFrames = AnimationHelper.loadTextures(fromAtlasFileNamed: C_ANIS.Player.idle.atlasName, withName: C_ANIS.Player.idle.frameKey)
  }

  
}
