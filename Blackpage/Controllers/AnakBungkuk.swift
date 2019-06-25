//
//  GameScene.swift
//  platformer
//
//  Created by hilmy muktafi on 11/06/19.
//  Copyright © 2019 hilmy muktafi. All rights reserved.
//

import SpriteKit
import GameplayKit

class AnakBungkuk: SKScene {

    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    var children_node: ChildrenNode?
    
    
    private var lastUpdateTime : TimeInterval = 0
    
    override func sceneDidLoad() {
        
        self.lastUpdateTime = 0
        
    }
    
    
    override func didMove(to view: SKView) {
        
        if let theChildren = childNode(withName: "Children") {
            
            var bungkukAnimation: SKAction?
            bungkukAnimation = SKAction(named: "bungkuk")
            
            children_node = theChildren as? ChildrenNode
            if(children_node != nil) {
                    children_node?.removeAllActions()
                    children_node?.run(bungkukAnimation!, withKey: "bungkuk")

                }
                
            }
        }
    
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

