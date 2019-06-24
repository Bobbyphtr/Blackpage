import SpriteKit
import GameplayKit

struct ColliderTypeChildren {
    static let MOM: UInt32 = 0x1 << 0 // 1
    static let GROUND: UInt32 = 0x1 << 1 // 2
    static let CHILDREN: UInt32 = 0x1 << 2// 4
}


//mendeteksi gesekan antara player dan ground
class ChildrenPhysicsDetection: NSObject, SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision: UInt32 = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        print(ColliderTypeChildren.CHILDREN)
        
        if collision == ColliderTypeChildren.CHILDREN | ColliderTypeChildren.GROUND {
            if let player = contact.bodyA.node as? ChildrenNode {
                player.grounded = true
            }else if let player = contact.bodyB.node as? ChildrenNode {
                player.grounded = true
            }
        }
        
        //mom and children bersentuhan
        if collision == ColliderTypeChildren.MOM | ColliderTypeChildren.CHILDREN {
            
            if let player = contact.bodyA.node as? ChildrenNode {
                player.grounded = true
                player.touched = true
            }else if let player = contact.bodyB.node as? ChildrenNode {
                player.touched = true
                player.grounded = true
            }
            
        }
        
        //mom and ground bersentuhan
        if collision == ColliderTypeChildren.MOM | ColliderTypeChildren.GROUND {
            if let player = contact.bodyA.node as? CharacterNode {
                player.grounded = true
            }else if let player = contact.bodyB.node as? CharacterNode {
                player.grounded = true
            }
        }
        
        
        
        
    }
}
