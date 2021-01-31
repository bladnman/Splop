//
//  AnimationHelper.swift
//  Super Indie Runner
//
//  Created by Maher, Matt on 1/23/21.
//

import SpriteKit

class AnimationHelper {
  // Will return all textures (frames) for an atlas sprite
  // These atlas sprites are defines in the asset catalog
  static func loadTextures(from atlas: SKTextureAtlas, withName name: String) -> [SKTexture] {
    var textures = [SKTexture]()
    for index in 0 ..< atlas.textureNames.count {
      let textureName = name + String(index)
      textures.append(atlas.textureNamed(textureName))
    }
    return textures
  }
  static func loadTextures(fromAtlasFileNamed atlasFilename: String, withName name: String) -> [SKTexture] {
    
    let atlas = SKTextureAtlas(named: atlasFilename)
    
    return AnimationHelper.loadTextures(from: atlas, withName: name)
  }
}
