//
//  GameScene.swift
//  platformer
//
//  Created by hilmy muktafi on 11/06/19.
//  Copyright © 2019 hilmy muktafi. All rights reserved.
//

import SpriteKit
import GameplayKit

class SceneTwo: SKScene {
    

    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    var player: CharacterNode?
    
    
    private var lastUpdateTime : TimeInterval = 0
    
    override func sceneDidLoad() {
        
        self.lastUpdateTime = 0
        
    }
    
    
    override func didMove(to view: SKView) {
        
        //jika ada childnode(entity?) "Player", jalankan fungsi setupcontrols dari playercontrolcomponent.
        
        if let thePlayer = childNode(withName: "Player2"){
            
            print("scene 2")
            player = thePlayer as? CharacterNode
            if(player != nil) {
                print("setup machine 2")
                player?.setUpStateMachine(scene: self)
            }
            
            // memasukkan logika gerak (state)
            //            (thePlayer as! CharacterNode).setUpStateMachine()
            if let pcComponent = thePlayer.entity?.component(ofType: PlayerControlComponent.self){
                print("setupcontrol")
                pcComponent.setupControls(camera: camera!, scene: self)
            }
        }
    }
    
    //    func centerOnNode(node: SKNode) {
    //        self.camera!.run(SKAction.move(to: CGPoint(x: node.position.x, y: node.position.y), duration: 0.5))
    //    }
    //
    //    override func didFinishUpdate() {
    //        centerOnNode(node: player!)
    //    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        self.lastUpdateTime = currentTime
    }
}

