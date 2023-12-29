//
//  GameScene.swift
//  dont-touch-the-spikes
//
//  Created by Pedro Franco on 19/12/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var bird = SKSpriteNode()
    
    var bottomFloor = SKSpriteNode()
    var topRoof = SKSpriteNode()
    var rightWall = SKSpriteNode()
    var leftWall = SKSpriteNode()
    var side = true
    var lose = false
    var birdJumpY = 280
    var birdJumpX = 80
    
    override func sceneDidLoad() {
        self.physicsWorld.contactDelegate = self

        setupBird()

        setupBottomFloor()
        
        setupTopRoof()
        
        setupRightWall()
        
        setupLeftWall()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody = SKPhysicsBody()
        var secondBody = SKPhysicsBody()
        
        if contact.bodyA.node?.name == "Bird" {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        switch (firstBody.node?.name == "Bird") {
            case secondBody.node?.name == "RightWall":
                applyImpulse(positiveX: false, positiveY: true)
                changeSide()
            
            case secondBody.node?.name == "LeftWall":
                applyImpulse(positiveX: true, positiveY: true)
                changeSide()
            
            default:
                scene?.removeAllActions()
                runGameOverScene()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !lose else { return }
        
        for touch in touches {
            bird.physicsBody?.isDynamic = true
            
            side ? applyImpulse(positiveX: true, positiveY: true) : applyImpulse(positiveX: false, positiveY: true)
        }
    }
    
    func applyImpulse(positiveX: Bool, positiveY: Bool) {
        let impulseDirection = positiveX ? CGVector(dx: birdJumpX, dy: birdJumpY) : CGVector(dx: -birdJumpX, dy: birdJumpY)
        bird.physicsBody?.applyImpulse(impulseDirection)
    }
    
    func changeSide() {
        side.toggle()
    }
    
    func runGameOverScene() {
        if let view = self.view {
            ChangeScreen.changeScreen(sceneView: view, screen: "GameOverScene")
        }
    }
}
