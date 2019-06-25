import SpriteKit
import GameplayKit

struct ColliderTypeChildren {
    static let MOM: UInt32 = 0x1 << 0 // 1
    static let GROUND: UInt32 = 0x1 << 1 // 2
    static let CHILDREN: UInt32 = 0x1 << 2// 4
    static let CHILDREN_DOOR_LEFT: UInt32 = 0x1 << 3 //8
    static let DOWN_STAIR_DOOR_LEFT: UInt32 = 0x1 << 4 //16
    static let FRONT_DOOR_LEFT: UInt32 = 0x1 << 5 //32
    static let DOWN_STAIR_RIGHT: UInt32 = 0x1 << 6 //64
}


//mendeteksi gesekan antara player dan ground
class ChildrenPhysicsDetection: NSObject, SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision: UInt32 = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        print(ColliderTypeChildren.CHILDREN)
        
        //children and ground bersentuhan
        
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
        
        //children and door_left bersentuhan (kamar children)
        if collision == ColliderTypeChildren.CHILDREN | ColliderTypeChildren.CHILDREN_DOOR_LEFT {
            if let player = contact.bodyA.node as? ChildrenNode {
                player.changeSceneToStairs?.changeSceneToStairs()
            }else if let player = contact.bodyB.node as? ChildrenNode {
                player.changeSceneToStairs?.changeSceneToStairs()
            }
        }
        
        //children and door_left bersentuhan (kamar children)
        if collision == ColliderTypeChildren.CHILDREN | ColliderTypeChildren.DOWN_STAIR_DOOR_LEFT {
            if let player = contact.bodyA.node as? ChildrenNode {
                player.changeSceneToFrontDoor?.changeSceneToFrontDoor()
            }else if let player = contact.bodyB.node as? ChildrenNode {
                player.changeSceneToFrontDoor?.changeSceneToFrontDoor()
            }
        }
        
        
        //children and front_door_left collided
        if collision == ColliderTypeChildren.CHILDREN | ColliderTypeChildren.FRONT_DOOR_LEFT {
            if let player = contact.bodyA.node as? ChildrenNode {
                player.changeSceneToBungkuk?.changeStateToBungkuk()
            }else if let player = contact.bodyB.node as? ChildrenNode {
                player.changeSceneToBungkuk?.changeStateToBungkuk()
            }
        }
        
        if collision == ColliderTypeChildren.CHILDREN | ColliderTypeChildren.DOWN_STAIR_RIGHT {
            if let player = contact.bodyA.node as? ChildrenNode {
                player.changeSceneToEnding?.changeSceneToEnding()
            }else if let player = contact.bodyB.node as? ChildrenNode {
                player.changeSceneToEnding?.changeSceneToEnding()
            }
        }
 
    }
}
