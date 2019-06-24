//
//  GameScene.swift
//  Blackpage
//
//  Created by BobbyPhtr on 18/06/19.
//  Copyright © 2019 BobbyPhtr. All rights reserved.
//

import SpriteKit
import GameplayKit

class SplashScreen: SKScene {
    
    private var overlayScreen : SKSpriteNode?
    private var startButton : SKSpriteNode?
    private var continueButton : SKSpriteNode?
    private var gameTitle:SKSpriteNode?
    private var bg:SKSpriteNode?
    
    let ambienceSound = SKAudioNode(fileNamed: "bg_sound.mp3")
    let labelIntro = SKLabelNode(text: "Tom team presents")
    
    private var isSaved : Bool = false
    private var isContinueEnabled = false
    
    override func didMove(to view: SKView) {
        
        initiateComponents()
        bg?.alpha = 1
        overlayScreen?.alpha = 1
        startButton?.alpha = 0
        continueButton?.alpha = 0
        gameTitle?.alpha = 0
        
        labelIntro.fontSize = 24
        labelIntro.alpha = 0
        
        
        let introGroup = SKAction.group([
                SKAction.run(fadeInBgSound), SKAction.run(fadeInFadeOutLabelIntro)])
        
        self.run(introGroup)
        
    }
    
    func fadeInBgSound() -> Void{
        ambienceSound.autoplayLooped = true
        ambienceSound.run(SKAction.stop())
        ambienceSound.run(SKAction.changeVolume(by: 0, duration: 3)) {
            self.ambienceSound.run(SKAction.play())
            self.ambienceSound.run(SKAction.changeVolume(by: 200, duration: 9))
        }
    }
    
    func fadeInFadeOutLabelIntro() -> Void {
        labelIntro.run(SKAction.fadeAlpha(to: 1, duration: 3)) {
            self.labelIntro.run(SKAction.fadeAlpha(to: 0, duration: 3),completion: {
                self.labelIntro.removeFromParent()
                self.viewSplashScreen()
            })
        }
    }
    
    func viewSplashScreen() -> Void {
        gameTitle?.run(SKAction.fadeAlpha(to: 1, duration: 3), completion: {
            self.run(SKAction.wait(forDuration: 3))
            self.overlayScreen?.run(SKAction.fadeAlpha(to: 0.7, duration: 3), completion: {
                self.continueButton?.run(SKAction.fadeAlpha(to: 1, duration: 1.5), completion: {
                    self.startButton?.run(SKAction.fadeAlpha(to: 1, duration: 1.5))
                })
            })
        })
    }
    
    func initiateComponents(){
        overlayScreen = self.childNode(withName: "blacklayer") as? SKSpriteNode
        startButton = self.childNode(withName: "startGame") as? SKSpriteNode
        continueButton = self.childNode(withName: "continue") as? SKSpriteNode
        gameTitle = self.childNode(withName: "gameTitle") as? SKSpriteNode
        bg = self.childNode(withName: "bg") as? SKSpriteNode
        labelIntro.zPosition = 7
        self.addChild(ambienceSound)
        self.addChild(labelIntro)
        
        if self.isSaved {
            self.continueButton?.texture = SKTexture(imageNamed: "continueLabel")
            self.isContinueEnabled = true
        }else{
            self.continueButton?.texture = SKTexture(imageNamed: "continueDisabledLabel")
        }
        //print(gameTitle?.name ?? "not found")
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      for touch in touches {
            let touchLocation : CGPoint = touch.location(in: self)
<<<<<<< HEAD
            if !isButtonPressed {
                if startButton?.contains(touchLocation) ?? false {
                    isButtonPressed = true
                    buttonPressedAction()

                } else if continueButton?.contains(touchLocation) ?? false {
                    isButtonPressed = true
                }
=======
            if startButton?.contains(touchLocation) ?? false {
                //self.scene?.view?.presentScene(SKScene.init(fileNamed: "OpeningScene")!, transition: SKTransition.fade(withDuration: 3.0))
>>>>>>> parent of fe44e06... Merge remote-tracking branch 'origin/master'
            }

        }
        
    }
    
    func buttonPressedAction() -> Void {
        let actionGroup = SKAction.group([SKAction.run {
            self.whiteLayer?.run(SKAction.fadeAlpha(to: 1, duration: 0.1), completion: {
                self.whiteLayer?.run(SKAction.fadeAlpha(to: 0, duration: 1), completion: {
                    self.whiteLayer?.color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    self.whiteLayer?.run(SKAction.fadeAlpha(to: 1, duration: 3), completion: {
                        self.terminateAll()
                        self.changeScene()
                    })
                })
            })}, SKAction.playSoundFileNamed("epic_button_pressed.mp3", waitForCompletion: false),
                 SKAction.run { self.ambienceSound.run(SKAction.stop()) }])
        self.run(actionGroup)
        
    }
    
    func terminateAll(){
        self.removeAllChildren()
    }
    
    func changeScene(){
        print("Change Scene")
    }
}
