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
    var jumpY = 280
    var jumpX = 80
    
    override func sceneDidLoad() {
        self.physicsWorld.contactDelegate = self
        
        bird = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 100))
        bird.position = CGPoint(x: 0, y: 0)
        bird.physicsBody = SKPhysicsBody(rectangleOf: bird.size)
        bird.physicsBody?.affectedByGravity = true
        bird.physicsBody?.isDynamic = false
        bird.physicsBody?.categoryBitMask = BitMaskCategories.bird
        bird.physicsBody?.contactTestBitMask = BitMaskCategories.walls
        bird.physicsBody?.collisionBitMask = BitMaskCategories.walls
        bird.name = "Bird"
        
        addChild(bird)
        
        bottomFloor = SKSpriteNode(color: .brown, size: CGSize(width: scene!.size.width, height: scene!.size.height / 10 - 40))
        bottomFloor.position = CGPoint(x: 0, y: -size.height / 2 + bottomFloor.frame.size.height / 2)
        bottomFloor.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bottomFloor.physicsBody = SKPhysicsBody(rectangleOf: bottomFloor.size)
        bottomFloor.physicsBody?.affectedByGravity = true
        bottomFloor.physicsBody?.isDynamic = false
        bottomFloor.physicsBody?.categoryBitMask = BitMaskCategories.walls
        bottomFloor.physicsBody?.contactTestBitMask = BitMaskCategories.bird
        bottomFloor.physicsBody?.collisionBitMask = BitMaskCategories.walls
        
        addChild(bottomFloor)
        
        topRoof = SKSpriteNode(color: .brown, size: CGSize(width: scene!.size.width, height: scene!.size.height / 10 - 40))
        topRoof.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        topRoof.position = CGPoint(x: 0, y: size.height / 2 - bottomFloor.frame.size.height / 2 + 20)
        topRoof.physicsBody = SKPhysicsBody(rectangleOf: topRoof.size)
        topRoof.physicsBody?.affectedByGravity = false
        topRoof.physicsBody?.isDynamic = false
        topRoof.physicsBody?.categoryBitMask = BitMaskCategories.walls
        topRoof.physicsBody?.contactTestBitMask = BitMaskCategories.bird
        topRoof.physicsBody?.collisionBitMask = BitMaskCategories.walls
        
        addChild(topRoof)
        
        rightWall = SKSpriteNode(color: .brown, size: CGSize(width: scene!.size.width / 10 + 10, height: scene!.size.height))
        rightWall.position = CGPoint(x: size.width / 2 - rightWall.frame.size.width / 2 , y: 0)
        rightWall.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        rightWall.physicsBody = SKPhysicsBody(rectangleOf: rightWall.size)
        rightWall.physicsBody?.affectedByGravity = true
        rightWall.physicsBody?.isDynamic = false
        rightWall.physicsBody?.categoryBitMask = BitMaskCategories.walls
        rightWall.physicsBody?.contactTestBitMask = BitMaskCategories.bird
        rightWall.physicsBody?.collisionBitMask = BitMaskCategories.walls
        rightWall.name = "RightWall"
        
        addChild(rightWall)

        leftWall = SKSpriteNode(color: .brown, size: CGSize(width: scene!.size.width / 10 + 10, height: scene!.size.height))
        leftWall.position = CGPoint(x: -size.width / 2 + leftWall.frame.size.width / 2 , y: 0)
        leftWall.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        leftWall.physicsBody = SKPhysicsBody(rectangleOf: leftWall.size)
        leftWall.physicsBody?.affectedByGravity = true
        leftWall.physicsBody?.isDynamic = false
        leftWall.physicsBody?.categoryBitMask = BitMaskCategories.walls
        leftWall.physicsBody?.contactTestBitMask = BitMaskCategories.bird
        leftWall.physicsBody?.collisionBitMask = BitMaskCategories.walls
        leftWall.name = "LeftWall"
        
        addChild(leftWall)
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
                bird.physicsBody?.applyImpulse(CGVector(dx: -jumpX, dy: jumpY))
                side = false
            
            case secondBody.node?.name == "LeftWall":
                bird.physicsBody?.applyImpulse(CGVector(dx: jumpX, dy: jumpY))
                side = true
            
            default:
                scene?.removeAllActions()
                playerLose()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if side && !lose {
                bird.physicsBody?.isDynamic = true
                bird.physicsBody?.applyImpulse(CGVector(dx: jumpX, dy: jumpY))
            } else if !side && !lose {
                bird.physicsBody?.isDynamic = true
                bird.physicsBody?.applyImpulse(CGVector(dx: -jumpX, dy: jumpY))
            }
        }
    }
    
    func playerLose() {
        if let view = self.view {
            let transition = SKTransition.fade(withDuration: 1)
            let scene = SKScene(fileNamed: "GameOverScene")
            scene!.scaleMode = .aspectFill
            view.presentScene(scene!, transition: transition)
        }
    }
}
