//
//  GameViewController.swift
//  Jumper
//
//  Created by Maher, Matt on 1/30/21.
//

import GameplayKit
import SpriteKit
import UIKit

class GameViewController: UIViewController, SceneManagerDelegate {

  
  override func viewDidLoad() {
    super.viewDidLoad()
    presentGameScene(named: C_SCENE)
  }

  
  // MARK Scene Manager Delegate
  func presentGameScene(named sceneName: String) {
    let scene = GameScene(size: view.bounds.size, sceneName: sceneName, sceneManagerDelegate: self)
    scene.scaleMode = .aspectFill
//    scene.size = view.bounds.size // is this still needed?
    present(scene: scene)
  }
  func present(scene: SKScene) {
    if let view = self.view as! SKView? {
      view.presentScene(scene)

      view.ignoresSiblingOrder = true
      view.showsFPS = true
      view.showsPhysics = true
      view.showsNodeCount = true
    }
  }
  func presentLevelScene(for world: Int) {
    // noop
  }
  
  func presentMenuScene() {
    // noop
  }
  
  override var shouldAutorotate: Bool {
    return true
  }

  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    if UIDevice.current.userInterfaceIdiom == .phone {
      return .allButUpsideDown
    } else {
      return .all
    }
  }

  override var prefersStatusBarHidden: Bool {
    return true
  }
}
