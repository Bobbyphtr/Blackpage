import SpriteKit
import GameplayKit

struct ColliderType {
    static let PLAYER: UInt32 = 0x1 << 0 // 1
    static let GROUND: UInt32 = 0x1 << 1 // 2
    static let DOOR: UInt32 = 0x1 << 2// 4
    static let STAIR_DOOR_RIGHT: UInt32 = 0x1 << 3 // 8
}


//mendeteksi gesekan antara player dan ground
class PhysicsDetection: NSObject, SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision: UInt32 = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if collision == ColliderType.PLAYER | ColliderType.GROUND {
            if let player = contact.bodyA.node as? CharacterNode {
                player.grounded = true
            }else if let player = contact.bodyB.node as? CharacterNode {
                player.grounded = true
            }
        }else if (collision == ColliderType.PLAYER | ColliderType.DOOR) {
             print("door tersentuh")
            
            if let player = contact.bodyA.node as? CharacterNode {
                
                player.changeSceneToStairs?.changeSceneToStairs()
                
            }else if let player = contact.bodyB.node as? CharacterNode {
                player.changeSceneToStairs?.changeSceneToStairs()

            }
        }else if (collision == ColliderType.PLAYER | ColliderType.STAIR_DOOR_RIGHT) {
            if let player = contact.bodyA.node as? CharacterNode {
                
                player.changeSceneToKitchen?.changeSceneToKitchen()
                
            }else if let player = contact.bodyB.node as? CharacterNode {
                 player.changeSceneToKitchen?.changeSceneToKitchen()
                
            }
        }
        
    }
}
