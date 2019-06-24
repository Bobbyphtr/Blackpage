
//
//  openingbedroom.swift
//  Blackpage
//
//  Created by Anthony Gondokusumo on 21/06/19.
//  Copyright © 2019 BobbyPhtr. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class openingbedroom: SKScene {
    
    
    override func sceneDidLoad() {
        let knockingsound = SKAudioNode (fileNamed: "Knocked door sound.wav")
        knockingsound.autoplayLooped = false
        self.addChild(knockingsound)
        
        let openingbedroomsequence = SKAction.sequence([SKAction.wait(forDuration: 2.0)])
        self.run(openingbedroomsequence) {
            knockingsound.run(SKAction.play())
        }
        
        let transitionsequence = SKAction.sequence([SKAction.wait(forDuration: 8.0)])
        self.run(transitionsequence) {
            self.scene?.view?.presentScene(SKScene.init(fileNamed: "BedroomScene")!, transition: SKTransition.fade(withDuration: 3.0))
        }
        
        
//      let bedroomsequence = SKAction.wait(forDuration: 2.0)
//    self.run(bedroomsequence) {
//        SKAction.playSoundFileNamed("Knocked door sound.wav", waitForCompletion: false)
//
//           self.scene?.view?.presentScene(SKScene.init(fileNamed: "BedroomScene")!, transition: SKTransition.fade(withDuration: 3.0))
        
        
        
    }
    
    
    
    

    
    
    
}


