//
//  SceneManagerDelegate.swift
//  Super Indie Runner
//
//  Created by Maher, Matt on 1/26/21.
//

import Foundation

protocol SceneManagerDelegate {
  func presentGameScene(named sceneName: String)
  func presentLevelScene(for world: Int)
  func presentMenuScene()
}
