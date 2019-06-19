//
//  ChildIdle.swift
//  Blackpage
//
//  Created by claudia kenyta on 19/06/19.
//  Copyright © 2019 BobbyPhtr. All rights reserved.
//

import SpriteKit
class ChildIdle: SKScene {
    var Anak = SKSpriteNode()
    var textureArray = [SKTexture]()
    
    override func didMove(to view: SKView) {
        for i in 1...2 {
            let textureName = "Group\(i)"
            textureArray.append(SKTexture(imageNamed: textureName))
        }
        
        Anak = SKSpriteNode(imageNamed: "Group1")
        Anak.position = CGPoint.init(x: 260, y: -60)
        Anak.size = CGSize.init(width: 50, height: 150)
        Anak.zPosition = 1
        self.addChild(Anak)
        
        Anak.run(SKAction.repeatForever(SKAction.animate(with: textureArray, timePerFrame: 0.4)))
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//    }
    
}
