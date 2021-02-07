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
  
  var splop: Splop!
  var worldLayer: Layer!
  var worldNode: SKNode!
  var backgroundLayer: RepeatingLayer!
  var tileMap: SKNode?
  
  var sceneWidth: CGFloat!
  
  var tossIndicatorNode: SKNode?
  var tossIndicatorDot: SKShapeNode?
  var firstTouchPosition: CGPoint?
  var lastTouchPosition: CGPoint?
  
  var tossType = TossType.flick
  var sceneName: String
  var sceneManagerDelegate: SceneManagerDelegate?
    

  init(size: CGSize, sceneName: String, sceneManagerDelegate: SceneManagerDelegate) {
    self.sceneName = sceneName
    self.sceneManagerDelegate = sceneManagerDelegate
    super.init(size: size)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  

  override func didMove(to view: SKView) {
    setup()
    physicsWorld.contactDelegate = self
  }
  
  func _temp(to sprite: SKSpriteNode, with name: String) {
//    let playerIdleFrames = AnimationHelper.loadTextures(fromAtlasFileNamed: C_ANIS.Player.idle.atlasName, withName: C_ANIS.Player.idle.frameKey)
  }

  
}
