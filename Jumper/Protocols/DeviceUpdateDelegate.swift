//
//  DeviceUpdateDelegate.swift
//  Jumper
//
//  Created by Maher, Matt on 2/14/21.
//

import Foundation
import SpriteKit

protocol DeviceUpdateDelegate {
  func didRotate(to size: CGSize, isLandscape: Bool)
}
