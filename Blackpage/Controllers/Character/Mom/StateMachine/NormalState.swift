//
//  NormalState.swift
//  platformer
//
//  Created by hilmy muktafi on 14/06/19.
//  Copyright © 2019 hilmy muktafi. All rights reserved.
//

import GameplayKit

class NormalState: GKState {
    var cNode: CharacterNode
    var gscene: SKScene
    
    //inisialisasi karakter
    init(with node: CharacterNode, gscene: SKScene) {
        cNode = node
        self.gscene = gscene
    }
    
    // update posisi character
    override func update(deltaTime seconds: TimeInterval) {
        
        var aSpeed: CGFloat = 0.0
        var dSpeed: CGFloat = 0.0
        
        if(cNode.grounded){
            aSpeed = cNode.groundAccel
            dSpeed = cNode.groundDecel
        }else {
            aSpeed = cNode.airAccel
            dSpeed = cNode.airDecel
        }
        
        
        if cNode.left {
            //            cNode.hSpeed = -cNode.walkSpeed
//            cNode.facing = -1.0
            cNode.xScale = -1.0
            cNode.hSpeed = approach(start: cNode.hSpeed, end: -cNode.walkSpeed, shift: aSpeed)
        }else if cNode.right {
//            cNode.facing = 1.0
            cNode.xScale = 1.0
            cNode.hSpeed = approach(start: cNode.hSpeed, end: cNode.walkSpeed, shift: aSpeed)
        } else {
            cNode.hSpeed = approach(start: cNode.hSpeed, end: 0.0, shift: dSpeed)
        }
        
        
        
        cNode.position.x = cNode.position.x + cNode.hSpeed
        
    }
    
    func approach(start: CGFloat, end: CGFloat, shift: CGFloat) -> CGFloat {
        if(start < end) {
            return min(start + shift, end);
        }else {
            return max(start - shift, end);
        }
    }
//
//    func squashAndStretch(xScale: CGFloat, yScale: CGFloat) {
//        cNode.xScale = xScale * cNode.facing
//        cNode.yScale = yScale
//    }
}

