//
//  EndingScene.swift
//  Blackpage
//
//  Created by BobbyPhtr on 24/06/19.
//  Copyright © 2019 BobbyPhtr. All rights reserved.
//

import SpriteKit
import GameplayKit

class EndingScene: SKScene {
    
    private var blackscreen : SKSpriteNode?
    private var label1 : SKLabelNode?
    private var label2 : SKLabelNode?
    private var label3 : SKLabelNode?
    
    
    override func didMove(to view: SKView) {
        
        initiateComponents()
        
    }
    
    func initiateComponents(){
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // yes
        
    }
    
    private var isButtonPressed = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
   
}
