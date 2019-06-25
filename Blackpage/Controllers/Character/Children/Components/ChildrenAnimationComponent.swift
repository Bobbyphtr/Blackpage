import SpriteKit
import GameplayKit

class ChildrenAnimationComponent: GKComponent {
    
    var cNode: ChildrenNode?
    
    var idleAnimation:SKAction?
    var walkAnimation:SKAction?
    
    override init() {
        super.init()
        idleAnimation = SKAction(named: "anak_idle")
        walkAnimation = SKAction(named: "anak_walk")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        idleAnimation = SKAction(named: "anak_idle")
        walkAnimation = SKAction(named: "anak_walk")
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        
        if cNode == nil {
            if let nodeComponent = self.entity?.component(ofType: GKSKNodeComponent.self){
                cNode = nodeComponent.node as? ChildrenNode
            }
        }
        
        if cNode?.stateMachine?.currentState is ChildrenState {
            
//            print("childrenstate")
            
            if (cNode?.grounded)! {
                
                if(cNode?.left)! || (cNode?.right)! {
                    if(cNode?.action(forKey: "anak_walk") == nil){
                        cNode?.removeAllActions()
                        cNode?.run(walkAnimation!, withKey: "anak_walk")
                    }
                }else {
                    if(cNode?.action(forKey: "anak_idle") == nil) {
                        cNode?.removeAllActions()
                        cNode?.run(idleAnimation!, withKey: "anak_idle")
                    }
                }
            }
        }
    }
}
