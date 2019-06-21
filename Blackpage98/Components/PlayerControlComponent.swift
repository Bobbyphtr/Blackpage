//
//  PlayerControlComponent.swift
//  PShooter
//
//  Created by Ricardo Giron on 9/6/17.
//  Copyright © 2017 Ricardo Giron. All rights reserved.
//

import GameplayKit
import SpriteKit

//komponen player kontrol

class PlayerControlComponent: GKComponent,  ControlInputDelegate{
    
    
    var touchControlNode : TouchControlInputNode?
    var cNode: CharacterNode?
    
    //menambahkan touchcontrol kedalam kamera.
    func setupControls(camera : SKCameraNode, scene: SKScene) {
        
        touchControlNode = TouchControlInputNode(frame: scene.frame)
        
        //koneksi follow dan controller
        touchControlNode?.inputDelegate = self
        
        touchControlNode?.position = CGPoint.zero
        
        camera.addChild(touchControlNode!)
        
        //selecting the character 'in this case adalah box merah'
        if(cNode == nil) {
            if let nodeComponent = self.entity?.component(ofType: GKSKNodeComponent.self) {
                cNode = nodeComponent.node as? CharacterNode
                cNode?.zPosition = 100
            }
        }
    }
    
    func follow(command: String?) {
        
        if(cNode != nil){
            
            switch(command!) {
            case("left"):
                cNode?.left = true
            case "cancel left", "stop left":
                cNode?.left = false
            case "right":
                cNode?.right = true
            case "cancel right", "stop right":
                cNode?.right = false
                
            default:
                print("command:\(String(describing: command))")
            }
            
        }
    }
    
    // update state cNode
    //kode dijalankan terus2'an ?
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        //        print("bar mangan gak udut paru2 gak smile")
        cNode?.stateMachine?.update(deltaTime: seconds)
    }
    
}


