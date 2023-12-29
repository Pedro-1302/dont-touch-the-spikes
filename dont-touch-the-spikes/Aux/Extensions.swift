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
        bottomFloor = SKSpriteNode(color: .brown, size: CGSize(width: screenWidth, height: screenHeight / 10 - 40))
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
        topRoof = SKSpriteNode(color: .brown, size: CGSize(width: screenWidth, height: screenHeight / 10 - 40))
        topRoof.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        topRoof.position = CGPoint(x: 0, y: size.height / 2 - bottomFloor.frame.size.height / 2 + 20)
        topRoof.physicsBody = SKPhysicsBody(rectangleOf: topRoof.size)
        topRoof.physicsBody?.affectedByGravity = false
        topRoof.physicsBody?.isDynamic = false
        topRoof.physicsBody?.categoryBitMask = BitMaskCategories.walls
        topRoof.physicsBody?.contactTestBitMask = BitMaskCategories.bird
        topRoof.physicsBody?.collisionBitMask = BitMaskCategories.walls
        
        addChild(topRoof)
    }
    
    func setupRightWall() {
        rightWall = SKSpriteNode(color: .brown, size: CGSize(width: screenWidth / 10 + 10, height: screenHeight))
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
    }
    
    func setupLeftWall() {
        leftWall = SKSpriteNode(color: .brown, size: CGSize(width: screenWidth / 10 + 10, height: screenHeight))
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

