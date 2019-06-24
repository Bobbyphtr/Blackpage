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
        self.run(SKAction.run(fadeInFadeOutLabelEnding_1))
    }
    
    func initiateComponents(){
        blackscreen = childNode(withName: "blackscreen") as? SKSpriteNode
        label1 = childNode(withName: "Label 1") as? SKLabelNode
        label2 = childNode(withName: "Label 2") as? SKLabelNode
        label3 = childNode(withName: "Label 3") as? SKLabelNode
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    func fadeInFadeOutLabelEnding_1() -> Void {
        label1?.run(SKAction.fadeAlpha(to: 1, duration: 3)) {
            self.label1?.run(SKAction.fadeAlpha(to: 0, duration: 5),completion: {
                self.label1?.removeFromParent()
                self.fadeInFadeOutLabelEnding_2()
            })
        }
    }
    func fadeInFadeOutLabelEnding_2() -> Void {
        label2?.run(SKAction.fadeAlpha(to: 1, duration: 3)) {
            self.label2?.run(SKAction.fadeAlpha(to: 0, duration: 5),completion: {
                self.label2?.removeFromParent()
                self.fadeInFadeOutLabelEnding_3()
            })
        }
    }
    func fadeInFadeOutLabelEnding_3() -> Void {
        label3?.run(SKAction.fadeAlpha(to: 1, duration: 3)) {
            self.label3?.run(SKAction.fadeAlpha(to: 0, duration: 5),completion: {
                self.label3?.removeFromParent()
                self.backToSplashScreen()
            })
        }
    }
    
    func backToSplashScreen(){
        
    }
}
