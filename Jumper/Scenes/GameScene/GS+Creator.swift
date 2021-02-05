//
//  GameScene+Update.swift
//  Jumper
//
//  Created by Maher, Matt on 1/31/21.
//

import SpriteKit

extension GameScene {
  func setup() {
    createMapNode() // first
    createWorld()
    createSplop()
  }
  
  func createSplop() {
    let splop = Splop(color: UIColor.red, size: CGSize(width: 50, height: 50))
    splop.name = C_OBJ_NAME.splop
    splop.position = CGPoint(x: 100, y: 100)
    splop.setScale(0.75)
    splop.physicsBody = SKPhysicsBody(rectangleOf: splop.frame.size)
    splop.physicsBody?.isDynamic = true
    splop.physicsBody?.categoryBitMask = C_PHY_CAT.splop
    splop.physicsBody?.contactTestBitMask = C_PHY_CAT.frame | C_PHY_CAT.ground
    splop.physicsBody?.collisionBitMask = C_PHY_CAT.frame | C_PHY_CAT.ground
    splop.physicsBody?.restitution = 0.0
    splop.physicsBody?.allowsRotation = false
    splop.zPosition = C_ZPOS.splop
    self.addChild(splop)
    
    self.splop = splop
  }

  func createPlatforms() {
//    let platforms = self.children.filter { $0.name == "platform" }
    
    self.enumerateChildNodes(withName: "platform") {
      platform, _ in
      platform.name = C_OBJ_NAME.platform
      platform.physicsBody?.categoryBitMask = C_PHY_CAT.ground
//      platform.physicsBody?.contactTestBitMask = 0x2
      print("node \(platform)")
    }
  }

  func createWorld() {
    self.createPlatforms()

    self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
//    self.physicsBody?.contactTestBitMask = C_PHY_CAT.splop
    self.physicsBody?.restitution = 0.0
    self.physicsBody?.categoryBitMask = C_PHY_CAT.frame

    func handleInteractionToggle(_: String) {
      tossType = (tossType == TossType.flick) ? TossType.snap : TossType.flick
      print("button pressed \(tossType)")
    }
    let interactionTypeButton = SpriteKitButton(defaultButtonImageNamed: "EmptyButton", onPress: handleInteractionToggle, buttonKey: "interactionTypeButton")
    interactionTypeButton.scaleToWidth(frame.width * 0.05)
    interactionTypeButton.position = CGPoint(x: frame.width - interactionTypeButton.size.width, y: frame.height - interactionTypeButton.size.height)
    self.addChild(interactionTypeButton)
  }
  
  func createMapNode() {
    self.mapNode = (self.childNode(withName: C_OBJ_NAME.mapNode) as! SKTileMapNode)
    self.mapNode?.zPosition = C_ZPOS.world
    
  }
}
