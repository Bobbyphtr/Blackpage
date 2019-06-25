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

class ChildrenTouchedComponent: GKComponent{
//
    var cNode: ChildrenNode?
//
    func setupControls(camera : SKCameraNode, scene: SKScene) {

               //selecting the character 'in this case adalah box merah'
        if(cNode == nil) {
            if let nodeComponent = self.entity?.component(ofType: GKSKNodeComponent.self) {
                cNode = nodeComponent.node as? ChildrenNode
                cNode?.zPosition = 100
            }
        }
    }
//
//    // update state cNode
//    //kode dijalankan terus2'an ?
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        //        print("bar mangan gak udut paru2 gak smile")
        cNode?.stateMachine?.update(deltaTime: seconds)
    }
    
}


