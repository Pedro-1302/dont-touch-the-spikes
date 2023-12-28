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
    
    override func sceneDidLoad() {
        self.physicsWorld.contactDelegate = self

        bird = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 100))
        bird.position = CGPoint(x: 0, y: 0)
        bird.physicsBody = SKPhysicsBody(rectangleOf: bird.size)
        bird.physicsBody?.affectedByGravity = true
        bird.physicsBody?.isDynamic = false
        addChild(bird)
    }
    
}
