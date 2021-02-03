//
//  GameScene+Update.swift
//  Jumper
//
//  Created by Maher, Matt on 1/31/21.
//

import SpriteKit

extension GameScene {
  func createSplop() {
    let splop = Splop(color: UIColor.red, size: CGSize(width: 50, height: 50))
    splop.position = CGPoint(x: 100, y: 100)
    splop.setScale(0.75)
    splop.physicsBody = SKPhysicsBody.init(rectangleOf: splop.frame.size)
    splop.physicsBody?.isDynamic = true
    splop.physicsBody?.contactTestBitMask = 0x2
    splop.physicsBody?.restitution = 0.0
    splop.physicsBody?.allowsRotation = false

    
    addChild(splop)

    self.splop = splop
    
  }
  func createWorld() {
    self.physicsBody = SKPhysicsBody.init(edgeLoopFrom: self.frame)
    self.physicsBody?.contactTestBitMask = 0x1
    self.physicsBody?.restitution = 0.0
    
    func handleInteractionToggle(_: String) {
      tossType = (tossType == TossType.flick) ? TossType.snap : TossType.flick
      print("button pressed \(tossType)")
    }
    let interactionTypeButton = SpriteKitButton(defaultButtonImageNamed: "EmptyButton", onPress: handleInteractionToggle, buttonKey: "interactionTypeButton")
    interactionTypeButton.scaleToWidth(frame.width * 0.05)
    interactionTypeButton.position = CGPoint(x: frame.width - interactionTypeButton.size.width, y: frame.height - interactionTypeButton.size.height)
    self.addChild(interactionTypeButton)
  }

}

