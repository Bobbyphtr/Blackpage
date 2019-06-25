//
//  CharacterNode.swift
//  platformer
//
//  Created by hilmy muktafi on 14/06/19.
//  Copyright © 2019 hilmy muktafi. All rights reserved.
//

import GameplayKit
import SpriteKit

//terkoneksi dengan gamescene.sks 'Player'
class ChildrenNode: SKSpriteNode {
    
    var left = false
    var right = false
    var touched = false
    
    //    var changeScene = false
    
    var changeSceneToStairs: ChangeSceneToStairsDelegate?
    var changeSceneToFrontDoor: ChangeSceneToFrontDoorDelegate?
    var changeSceneToBungkuk: ChangeStateToBungkukDelegate?
    
    var grounded = false
    var landed = false
    
    var airAccel: CGFloat = 0.1
    var airDecel: CGFloat = 0.0
    var groundAccel: CGFloat = 0.2
    var groundDecel: CGFloat = 0.5
    
    var facing: CGFloat = 1.0
    
    //horizontal speed
    var hSpeed:CGFloat = 0.0
    
    var walkSpeed: CGFloat = 5
    
    var stateMachine: GKStateMachine?
    
    //memasukkan dan update character ?
    //dijalankan sekali ketika aplikasi dijalankan pertamakali
    func setUpStateMachine(scene: SKScene, mNode: CharacterNode) {
        //membuat state
        let childrenState = ChildrenState(with: self, mNode: mNode, gscene: scene)
        // Initialize the state machine
        stateMachine = GKStateMachine(states: [childrenState])
        //entering the state
        stateMachine?.enter(ChildrenState.self)
    }
    
}

