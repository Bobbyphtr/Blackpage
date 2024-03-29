//
//  GameScene.swift
//  platformer
//
//  Created by hilmy muktafi on 11/06/19.
//  Copyright © 2019 hilmy muktafi. All rights reserved.
//

import SpriteKit
import GameplayKit

class KitchenScene: SKScene, ChangeSceneToStairsDelegate {
    
    func changeSceneToStairs() {
        if let scene = GKScene(fileNamed: "StairWithChild") {
            
            // Get the SKScene from the loaded GKScene
            if let sceneNode = scene.rootNode as! StairWithChild? {
                
                // Copy gameplay related content over to the scene
                sceneNode.entities = scene.entities
                sceneNode.graphs = scene.graphs
                
                // Set the scale mode to scale to fit the window
                sceneNode.scaleMode = .aspectFill
                
                // Present the scene
                if let view = self.view {
                    view.presentScene(sceneNode)
                    
                    view.ignoresSiblingOrder = true
                }
            }
        }
    }
    
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    var physicsDelegate = ChildrenPhysicsDetection()
    var player: CharacterNode?
    var children_node: ChildrenNode?
    
    
    private var lastUpdateTime : TimeInterval = 0
    
    override func sceneDidLoad() {
        
        self.lastUpdateTime = 0
        
    }
    
    
    override func didMove(to view: SKView) {
        
        //jika ada childnode(entity?) "Player", jalankan fungsi setupcontrols dari playercontrolcomponent.
        
        
        
        
        if let theChildren = childNode(withName: "Children") {
            children_node = theChildren as? ChildrenNode
            if(children_node != nil) {
                
                if let thePlayer = childNode(withName: "Mom"){
                
                    player = thePlayer as? CharacterNode
                    if(player != nil) {
                        player?.setUpStateMachine(scene: self)
                        player?.changeSceneToStairs = self
                    }
                    
                    
                    children_node?.setUpStateMachine(scene: self, mNode: player!)
                    children_node?.changeSceneToStairs = self
                    
                    // memasukkan logika gerak (state)
                    //            (thePlayer as! CharacterNode).setUpStateMachine()
                    if let pcComponent = thePlayer.entity?.component(ofType: PlayerControlComponent.self){
                        print("mom mantabs")
                        pcComponent.setupControls(camera: camera!, scene: self)
                        pcComponent.setupChildren(node: children_node)
                    }
                    
                    if let cComponent = theChildren.entity?.component(ofType: ChildrenTouchedComponent.self){
                        print("mantabs")
                        cComponent.setupControls(camera: camera!, scene: self)
                    }
                    
                    
                }
                
            }
        }
        
        self.physicsWorld.contactDelegate = physicsDelegate
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

