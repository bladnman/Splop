//
//  GameScene+Update.swift
//  Jumper
//
//  Created by Maher, Matt on 1/31/21.
//

import SpriteKit

extension GameScene {
  func setup() {
    // add tile map
    loadSceneFile(sceneName: sceneName)

    // add splop
    createSplop()

    // set world layer properties
    self.scaleMode = SKSceneScaleMode.aspectFill;
    self.size *= 1 / C_SCALE
    self.sceneWidth = max(frame.width, tileMap.frame.width)
  }

  func loadSceneFile(sceneName: String) {
    if let sceneFile = SKNode.unarchiveFromFile(file: sceneName) {
      worldNode = sceneFile.childNode(withName: C_OBJ_NAME.worldNode)
      worldNode.move(toParent: self)
      worldNode.isPaused = false // wait, why would this default to paused exactly?! grr
      loadTileMap(worldNode)
    }
    installScene()
  }

  func loadTileMap(_ sceneNode: SKNode) {
    if let groundTiles = sceneNode.childNode(withName: C_OBJ_NAME.mapNode) as? SKTileMapNode {
      self.tileMap = groundTiles
//      tileMap.scale(to: frame.size, width: false, multiplier: 1.0)
//      PhysicsHelper.addPhysicsBody(to: groundTiles, with: "ground")
//      for child in groundTiles.children {
//        if let sprite = child as? SKSpriteNode, sprite.name != nil {
//          ObjectHelper.handleChild(sprite: sprite, with: sprite.name!)
//        }
//      }
    }
  }

  func createSplop() {
    splop = Splop(color: UIColor.red, size: CGSize(width: 32, height: 32))
    splop.name = C_OBJ_NAME.splop
    splop.position = CGPoint(x: 200, y: 200)
    splop.physicsBody = SKPhysicsBody(rectangleOf: splop.frame.size)
    splop.physicsBody?.isDynamic = true
    splop.physicsBody?.categoryBitMask = C_PHY_CAT.splop
    splop.physicsBody?.contactTestBitMask = C_PHY_CAT.frame | C_PHY_CAT.ground
    splop.physicsBody?.collisionBitMask = C_PHY_CAT.frame | C_PHY_CAT.ground
    splop.physicsBody?.restitution = 0.0
    splop.physicsBody?.allowsRotation = false
    splop.physicsBody?.mass = C_PHY_MASS.splop
    splop.zPosition = C_ZPOS.splop
    worldNode.addChild(splop)
  }

  func installScene() {
    installSceneFurniture()

    tileMap.physicsBody = SKPhysicsBody(edgeLoopFrom: tileMap.frame)
    tileMap.physicsBody?.restitution = 0.0
    tileMap.physicsBody?.categoryBitMask = C_PHY_CAT.frame

    func handleInteractionToggle(_: String) {
      tossType = (tossType == TossType.flick) ? TossType.snap : TossType.flick
      print("button pressed \(tossType)")
    }
    let interactionTypeButton = SpriteKitButton(defaultButtonImageNamed: "EmptyButton", onPress: handleInteractionToggle, buttonKey: "interactionTypeButton")
    interactionTypeButton.scaleToWidth(frame.width * 0.05)
    interactionTypeButton.position = CGPoint(x: frame.width - interactionTypeButton.size.width, y: frame.height - interactionTypeButton.size.height)
    worldNode.addChild(interactionTypeButton)
  }

  func installSceneFurniture() {
    worldNode.enumerateChildNodes(withName: "platform") {
      platform, _ in
      platform.name = C_OBJ_NAME.platform
      platform.physicsBody?.categoryBitMask = C_PHY_CAT.ground
    }
  }
}
