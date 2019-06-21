import SpriteKit
import GameplayKit

class AnimationComponent: GKComponent {
    
    var cNode: CharacterNode?
    
    var idleAnimation:SKAction?
    var walkAnimation:SKAction?
    
    override init() {
        super.init()
        idleAnimation = SKAction(named: "Idle")
        walkAnimation = SKAction(named: "Walk")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        idleAnimation = SKAction(named: "Idle")
        walkAnimation = SKAction(named: "Walk")
        
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        if cNode == nil {
            if let nodeComponent = self.entity?.component(ofType: GKSKNodeComponent.self){
                cNode = nodeComponent.node as? CharacterNode
            }
        }
        
        if cNode?.stateMachine?.currentState is NormalState {
            if (cNode?.grounded)! {
                
                
                if(cNode?.left)! || (cNode?.right)! {
                    if(cNode?.action(forKey: "Walk") == nil){
                        cNode?.removeAllActions()
                        cNode?.run(walkAnimation!, withKey: "Walk")
                    }
                }else {
                    if(cNode?.action(forKey: "Idle") == nil) {
                        cNode?.removeAllActions()
                        cNode?.run(idleAnimation!, withKey: "Idle")
                    }
                }
            }
        }
    }
}
