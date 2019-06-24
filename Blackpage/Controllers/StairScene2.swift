//
//  StairScene2.swift
//  Blackpage
//
//  Created by claudia kenyta on 24/06/19.
//  Copyright © 2019 BobbyPhtr. All rights reserved.
//

import SpriteKit
class StairScene2: SKScene {
    
    var tanggaTouch = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        tanggaTouch = SKSpriteNode(imageNamed: "panahNaik")
        tanggaTouch.position = CGPoint.init(x: -300, y: 30)
        tanggaTouch.size = CGSize.init(width: 60, height: 60)
        tanggaTouch.zPosition = 1
        self.addChild(tanggaTouch)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let touchLocation:CGPoint = touch.location(in: self)
            if tanggaTouch.contains(touchLocation){
                let sceneTanggaAtas = StairScene(fileNamed: "StairScene")
                sceneTanggaAtas?.scaleMode = .aspectFill
                self.view?.presentScene(sceneTanggaAtas!, transition: SKTransition.fade(withDuration: 2.0))
                run(SKAction.playSoundFileNamed("step_stair.mp3", waitForCompletion: false))
            }
        }
        
    }
}

