//
//  Scene1StairBawah.swift
//  Blackpage
//
//  Created by claudia kenyta on 20/06/19.
//  Copyright © 2019 BobbyPhtr. All rights reserved.
//
import SpriteKit
class Scene1Stair: SKScene {
    
    var tanggaTouch = SKSpriteNode()
//    var sound = SKAction.playSoundFileNamed("step_stair.wav", waitForCompletion: false)
    
    override func didMove(to view: SKView) {
        
        
        tanggaTouch = SKSpriteNode(imageNamed: "panahBawah")
        tanggaTouch.position = CGPoint.init(x: -30, y: 30)
        tanggaTouch.size = CGSize.init(width: 60, height: 60)
        tanggaTouch.zPosition = 1
        self.addChild(tanggaTouch)
    }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

            for touch in touches {
                let touchLocation:CGPoint = touch.location(in: self)
                if tanggaTouch.contains(touchLocation){
                    let sceneTanggaBawah = Scene1StairBawah(fileNamed: "Scene1StairBawah")
                    sceneTanggaBawah?.scaleMode = .aspectFill
                    self.view?.presentScene(sceneTanggaBawah!, transition: SKTransition.fade(withDuration: 2.1))
                    run(SKAction.playSoundFileNamed("step_stair.mp3", waitForCompletion: true))
                }
            }
            
        }
    
    }

