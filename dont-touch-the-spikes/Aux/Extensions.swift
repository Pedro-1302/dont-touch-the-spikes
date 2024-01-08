//
//  Extensions.swift
//  dont-touch-the-spikes
//
//  Created by Pedro Franco on 29/12/23.
//

import Foundation
import SpriteKit

// MARK: GameScene Extension
extension GameScene {
    func setupSpike() {
        // h / q
        spike1 = SKSpriteNode(color: .blue, size: CGSize(width: 50, height: 50))
        spike2 = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        spike3 = SKSpriteNode(color: .green, size: CGSize(width: 50, height: 50))
        spike4 = SKSpriteNode(color: .gray, size: CGSize(width: 50, height: 50))
        spike5 = SKSpriteNode(color: .purple, size: CGSize(width: 50, height: 50))
        spike6 = SKSpriteNode(color: .cyan, size: CGSize(width: 50, height: 50))
        spike7 = SKSpriteNode(color: .magenta, size: CGSize(width: 50, height: 50))
        spike8 = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        spike9 = SKSpriteNode(color: .green, size: CGSize(width: 50, height: 50))
        spike10 = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        spike11 = SKSpriteNode(color: .black, size: CGSize(width: 50, height: 50))
        spike12 = SKSpriteNode(color: .magenta, size: CGSize(width: 50, height: 50))

        spike1.position = CGPoint(x: rightWall.frame.minX - spike1.size.width / 2, y: CGFloat(bottomFloor.frame.maxY + spike1.frame.width / 2 + 50))
        spike2.position = CGPoint(x: rightWall.frame.minX - spike2.size.width / 2, y: CGFloat(spike1.frame.maxY + spike1.frame.height / 2 + 50))
        spike3.position = CGPoint(x: rightWall.frame.minX - spike3.size.width / 2, y: CGFloat(spike2.frame.maxY + spike2.frame.height / 2 + 50))
        spike4.position = CGPoint(x: rightWall.frame.minX - spike4.size.width / 2, y: CGFloat(spike3.frame.maxY + spike3.frame.height / 2 + 50))
        spike5.position = CGPoint(x: rightWall.frame.minX - spike5.size.width / 2, y: CGFloat(spike4.frame.maxY + spike4.frame.width / 2 + 50))
        spike6.position = CGPoint(x: rightWall.frame.minX - spike6.size.width / 2, y: CGFloat(spike5.frame.maxY + spike5.frame.height / 2 + 50))
        spike7.position = CGPoint(x: rightWall.frame.minX - spike7.size.width / 2, y: CGFloat(spike6.frame.maxY + spike6.frame.height / 2 + 50))
        spike8.position = CGPoint(x: rightWall.frame.minX - spike8.size.width / 2, y: CGFloat(spike7.frame.maxY + spike7.frame.height / 2 + 50))
        
        spike9.position = CGPoint(x: rightWall.frame.minX - spike9.size.width / 2, y: CGFloat(spike8.frame.maxY + spike8.frame.height / 2 + 50))
        
        spike10.position = CGPoint(x: rightWall.frame.minX - spike10.size.width / 2, y: CGFloat(spike9.frame.maxY + spike9.frame.height / 2 + 50))
        
        spike11.position = CGPoint(x: rightWall.frame.minX - spike11.size.width / 2, y: CGFloat(spike10.frame.maxY + spike10.frame.height / 2 + 50))
        spike12.position = CGPoint(x: rightWall.frame.minX - spike12.size.width / 2, y: CGFloat(spike11.frame.maxY + spike11.frame.height / 2 + 50))

        addChild(spike1)
        addChild(spike2)
        addChild(spike3)
        addChild(spike4)
        addChild(spike5)
        addChild(spike6)
        addChild(spike7)
        addChild(spike8)
        addChild(spike9)
        addChild(spike10)
        addChild(spike11)
        addChild(spike12)
    }
    
    func setupBird() {
        bird = SKSpriteNode(color: .red, size: CGSize(width: 40, height: 40))
        bird.position = CGPoint(x: 0, y: 0)
        bird.physicsBody = SKPhysicsBody(rectangleOf: bird.size)
        bird.physicsBody?.affectedByGravity = true
        bird.physicsBody?.isDynamic = false
        bird.physicsBody?.categoryBitMask = BitMaskCategories.bird
        bird.physicsBody?.contactTestBitMask = BitMaskCategories.walls
        bird.physicsBody?.collisionBitMask = BitMaskCategories.walls
        bird.name = "Bird"
        
        addChild(bird)
    }
    
    func setupBottomFloor() {
        if UIDevice.current.userInterfaceIdiom == .pad {
            bottomFloor = SKSpriteNode(color: .brown, size: CGSize(width: screenWidth, height: screenHeight / 6))
        } else {
            bottomFloor = SKSpriteNode(color: .brown, size: CGSize(width: screenWidth, height: screenHeight / 10))
        }
            
        bottomFloor.position = CGPoint(x: 0, y: -size.height / 2 + bottomFloor.frame.size.height / 2)
        bottomFloor.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bottomFloor.physicsBody = SKPhysicsBody(rectangleOf: bottomFloor.size)
        bottomFloor.physicsBody?.affectedByGravity = true
        bottomFloor.physicsBody?.isDynamic = false
        bottomFloor.physicsBody?.categoryBitMask = BitMaskCategories.walls
        bottomFloor.physicsBody?.contactTestBitMask = BitMaskCategories.bird
        bottomFloor.physicsBody?.collisionBitMask = BitMaskCategories.walls
        
        addChild(bottomFloor)
    }
    
    func setupTopRoof() {
        if UIDevice.current.userInterfaceIdiom == .pad {
            topRoof = SKSpriteNode(color: .brown, size: CGSize(width: screenWidth, height: screenHeight / 6))
        } else {
            topRoof = SKSpriteNode(color: .brown, size: CGSize(width: screenWidth, height: screenHeight / 10))
        }
        
        topRoof.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        topRoof.position = CGPoint(x: 0, y: size.height / 2 - topRoof.frame.size.height / 2)
        topRoof.physicsBody = SKPhysicsBody(rectangleOf: topRoof.size)
        topRoof.physicsBody?.affectedByGravity = false
        topRoof.physicsBody?.isDynamic = false
        topRoof.physicsBody?.categoryBitMask = BitMaskCategories.walls
        topRoof.physicsBody?.contactTestBitMask = BitMaskCategories.bird
        topRoof.physicsBody?.collisionBitMask = BitMaskCategories.walls
        
        addChild(topRoof)
    }
    
    func setupRightWall() {
        rightWall = SKSpriteNode(color: .brown, size: CGSize(width: screenWidth / 12, height: screenHeight))
        rightWall.position = CGPoint(x: (size.width / 2 - rightWall.frame.size.width / 2), y: 0)
        rightWall.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        rightWall.physicsBody = SKPhysicsBody(rectangleOf: rightWall.size)
        rightWall.physicsBody?.affectedByGravity = true
        rightWall.physicsBody?.isDynamic = false
        rightWall.physicsBody?.categoryBitMask = BitMaskCategories.walls
        rightWall.physicsBody?.contactTestBitMask = BitMaskCategories.bird
        rightWall.physicsBody?.collisionBitMask = BitMaskCategories.walls
        rightWall.name = "RightWall"
        
        addChild(rightWall)
    }
    
    func setupLeftWall() {
        leftWall = SKSpriteNode(color: .brown, size: CGSize(width: screenWidth / 12, height: screenHeight))
        leftWall.position = CGPoint(x: (-size.width / 2 + leftWall.frame.size.width / 2), y: 0)
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
}

// MARK: GameOverScene Extension
extension GameOverScene {
    func getScenePositionY() -> CGFloat {
        guard let scenePositionY = scene?.position.y else { return 0 }
        
        return scenePositionY
    }
    
    func createPlayAgainButton() {
        playAgainButton = CustomButton(iconName: "", text: "", onButtonPress: replayGame)

        guard let playAgain = playAgainButton else { return }
        
        playAgain.position = CGPoint(x: 0, y: -(getScenePositionY() / 2) - 100)

        addChild(playAgain)
    }
     
    func createGameOverLabel() {
        gameOverLabel = SKLabelNode(text: "You Lose")
        gameOverLabel.position = CGPoint(x: 0, y: getScenePositionY() / 2)
        gameOverLabel.fontSize = 100
        gameOverLabel.fontColor = .white

        addChild(gameOverLabel)
    }
}

