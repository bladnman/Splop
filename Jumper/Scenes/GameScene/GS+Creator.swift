//
//  GameScene+Update.swift
//  Jumper
//
//  Created by Maher, Matt on 1/31/21.
//

import SpriteKit

extension GameScene {
  func setup() {
    // create the scene first
    createScene()
    
    // create the hud
    // createHud()

    // then add splop
    createSplop()

    // and finally set any other world layer properties
    size *= 1 / C_SCALE
    sceneWidth = max(frame.width, tileMap?.frame.width ?? 0)
  }
  
  // MARK: HUD INSTALLERS

  // MARK: CHARACTER INSTALLERS

  func createSplop() {
    splop = Splop(color: UIColor.red, size: CGSize(width: 32, height: 32))
    splop.name = C_OBJ_NAME.splop
    splop.physicsBody = SKPhysicsBody(rectangleOf: splop.frame.size)
    splop.physicsBody?.isDynamic = true
    splop.physicsBody?.categoryBitMask = C_PHY_CAT.splop
    splop.physicsBody?.contactTestBitMask = C_PHY_CAT.frame | C_PHY_CAT.ground | C_PHY_CAT.furnature
    splop.physicsBody?.collisionBitMask = C_PHY_CAT.frame | C_PHY_CAT.ground | C_PHY_CAT.furnature
    splop.physicsBody?.restitution = 0.0
    splop.physicsBody?.allowsRotation = false
    splop.physicsBody?.mass = C_PHY_MASS.splop
    splop.zPosition = C_ZPOS.splop
    worldNode.addChild(splop)
    
    // position splop
    let startPoint = worldNode.childNode(withName: C_OBJ_NAME.startPoint) as! SKReferenceNode
    splop.position = startPoint.position
  }

  // MARK: SCENE INSTALLERS

  func createScene() {
    // add scene file (gives us worldNode)
    installSceneFile(sceneName: sceneName)
    
    // add tile map
    createTileMap()
    
    // create frame physics
    createFrame()
    
    // install all the non tile-map elements
    createFurniture()
  }
  
  func installSceneFile(sceneName: String) {
    if let sceneFile = SKNode.unarchiveFromFile(file: sceneName) {
      worldNode = sceneFile.childNode(withName: C_OBJ_NAME.worldNode)
      worldNode.isPaused = false // wait, why would this default to paused exactly?! grr
      
      // ADD SCENE TO SELF
      worldNode.move(toParent: self)
    }
  }
  
  func createTileMap() {
    // find tilemap
    // TODO: would be nice to be _able_ to have more than 1 tileMap
    if let groundTiles = worldNode.childNode(withName: C_OBJ_NAME.mapNode) as? SKTileMapNode {
      tileMap = groundTiles
      // work each tile for properties
      for child in groundTiles.children {
        if let sprite = child as? SKSpriteNode, sprite.name != nil {
          ObjectHelper.handleChild(sprite: sprite, with: sprite.name!)
        }
      }
    }
  }
  
  func createFrame() {
    let frameNode = tileMap ?? self
    
    physicsBody = SKPhysicsBody(edgeLoopFrom: frameNode.frame)
    physicsBody?.restitution = 0.0
    physicsBody?.categoryBitMask = C_PHY_CAT.frame
  }
  
  func createFurniture() {
    installMaps()
//    installFurnature(inNode: worldNode)
  }
  
  // Install the SKNodes and rules for each tile in all
  // maps found
  func installMaps() {
    for node in worldNode.children {
      // TILE MAPS
      if node is SKTileMapNode {
        let tileMap = node as! SKTileMapNode
        let tileSize = tileMap.tileSize
        
        for row in 0..<tileMap.numberOfRows {
          for col in 0..<tileMap.numberOfColumns {
            let tileDefinition = tileMap.tileDefinition(atColumn: col, row: row)
            let surfaceDef = SurfaceDef(tileDefinition?.userData)
            
            // SKIP NODE -- nothing defined for surface
            if surfaceDef.isDefault() {
              continue
            }
            
            let furnatureNode = FurnatureNode(size: tileSize, surfaceDef: surfaceDef)
            
            print("[M@] [\(surfaceDef)]")
            
            let x = CGFloat(col) * tileSize.width + (tileSize.width / 2)
            let y = CGFloat(row) * tileSize.height + (tileSize.height / 2)
            furnatureNode.position = CGPoint(x: x, y: y)
            furnatureNode.name = C_OBJ_NAME.furnature
            tileMap.addChild(furnatureNode)
            
            // add physics body
            PhysicsHelper.addPhysicsBody(to: furnatureNode)
          }
        }
      }
    }
  }

  func installFurnature(inNode parentNode: SKNode?) {
    if parentNode == nil { return }
    for node in parentNode!.children {
      // TILE MAPS - install furnature in them
      if node is SKTileMapNode {
        installFurnature(inNode: node)
      }
      
      // SPRITE NODES
      else if node is SKSpriteNode {
        PhysicsHelper.addPhysicsBody(to: node as! SKSpriteNode)
      }
      
      // OTHERS
      else {
        print("[M@] [\(node.name ?? "no name node")] doing nothing with him")
      }
    }
  }
}
