//
//  Opening Scene.swift
//  Blackpage
//
//  Created by Anthony Gondokusumo on 21/06/19.
//  Copyright © 2019 BobbyPhtr. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class OpeningScene: SKScene {
    
    
    override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
        let title = SKLabelNode(fontNamed: "Helvetica neue")
        title.text = "May 1998"
        title.fontSize = 65
        title.position = CGPoint.init(x: 0 , y: 0)
        title.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let titleanimation = SKAction.sequence([SKAction.hide(),SKAction.wait(forDuration: 1.0),SKAction.unhide(),SKAction.wait(forDuration: 3.0),SKAction.fadeOut(withDuration: 3.0)])
        
        self.addChild(title)
        
        title.run(titleanimation) {
            self.scene?.view?.presentScene(SKScene.init(fileNamed: "openingbedroom")!, transition: SKTransition.fade(withDuration: 3.0))
        }
    
    }
    
    
    
    
}



func update(_ currentTime: TimeInterval) {
    // Called before each frame is rendered
}

