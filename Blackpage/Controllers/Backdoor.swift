//
//  Backdoor.swift
//  Blackpage
//
//  Created by BobbyPhtr on 21/06/19.
//  Copyright © 2019 BobbyPhtr. All rights reserved.
//

import SpriteKit
import GameplayKit

class Backdoor: SKScene {
    
    private var bg:SKSpriteNode?
    private var player : CharacterNode?
    
    let ambienceSound = SKAudioNode(fileNamed: "bg_sound.mp3")
    
    override func didMove(to view: SKView) {
        
        initiateComponents()
        bg?.alpha = 1
        
        if let thePlayer = childNode(withName: "Player"){
            player = thePlayer as? CharacterNode
            if(player != nil) {
                player?.setUpStateMachine(scene: self)
                
            }
            
            // memasukkan logika gerak (state)
            //            (thePlayer as! CharacterNode).setUpStateMachine()
            if let pcComponent = thePlayer.entity?.component(ofType: PlayerControlComponent.self){
                pcComponent.setupControls(camera: camera!, scene: self)
            }
        }
        
    }
    
    
    func initiateComponents(){
        bg = self.childNode(withName: "bg") as? SKSpriteNode

    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch in touches {
//            //let touchLocation : CGPoint = touch.location(in: self)
//        }
        //wawwwwww
    }
}
