//
//  SpriteKitButton.swift
//  Super Indie Runner
//
//  Created by Maher, Matt on 1/24/21.
//

import SpriteKit

enum SpriteKitButtonState {
  case up, down
}

class SpriteKitButton: SKSpriteNode {

  var defaultButtton: SKSpriteNode
  var onPress: (String) -> ()
  var buttonKey: String
  
  private var state: SpriteKitButtonState = .up {
    willSet {
      switch newValue {
      case .down:
        defaultButtton.alpha = 0.75
      default:
        defaultButtton.alpha = 1.0
      }
    }
  }
  
  init(defaultButtonImageNamed: String, onPress: @escaping (String) -> (), buttonKey: String ) {
    defaultButtton = SKSpriteNode(imageNamed: defaultButtonImageNamed)
    self.onPress = onPress
    self.buttonKey = buttonKey
    
    super.init(texture: nil, color: UIColor.clear, size: defaultButtton.size)
    
    isUserInteractionEnabled = true
    addChild(defaultButtton)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    state = .down
  }
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    let touch: UITouch = touches.first! as UITouch
    let location: CGPoint = touch.location(in: self)
    
    if defaultButtton.contains(location) {
      state = .down
    } else {
      state = .up
    }
  }
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    let touch: UITouch = touches.first! as UITouch
    let location: CGPoint = touch.location(in: self)
    
    // pressed!
    if defaultButtton.contains(location) {
      onPress(buttonKey)
    }
    
    state = .up
  }
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    state = .up
  }
}
