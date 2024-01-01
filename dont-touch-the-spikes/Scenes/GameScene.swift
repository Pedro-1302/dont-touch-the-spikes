//
//  GameScene.swift
//  dont-touch-the-spikes
//
//  Created by Pedro Franco on 19/12/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    // Nodes
    var bird = SKSpriteNode()
    var spike = SKSpriteNode() 
    var bottomFloor = SKSpriteNode()
    var topRoof = SKSpriteNode()
    var rightWall = SKSpriteNode()
    var leftWall = SKSpriteNode()
    
    // Declare constants
    var jumpValueX = 0
    var jumpValueY = 0
    var screenWidth = 0.0
    var screenHeight = 0.0
    
    // Aux
    var side = true
    var lose = false
    
    override func sceneDidLoad() {
        self.physicsWorld.contactDelegate = self
        
        Constants.shared.setScene(self)
        
        jumpValueX = Constants.shared.getJumpValueX()
        jumpValueY = Constants.shared.getJumpValueY()
        screenWidth = Constants.shared.getScreenWidth()
        screenHeight = Constants.shared.getScreenHeight()
       
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
            setupSpike()
        }
    }
        
    func applyImpulse(positiveX: Bool, positiveY: Bool) {
        var jumpValX = Double(jumpValueX)
        var jumpValY = Double(jumpValueY)
        
        bird.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        let impulseDirection = positiveX ? CGVector(dx: jumpValX, dy: jumpValY) : CGVector(dx: -jumpValX, dy: jumpValY)
        
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
