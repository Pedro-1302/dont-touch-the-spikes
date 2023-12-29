//
//  GameOverScene.swift
//  dont-touch-the-spikes
//
//  Created by Pedro Franco on 28/12/23.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
    var gameOverLabel = SKLabelNode()
    var playAgainButton: CustomButton?
    
    override func sceneDidLoad() {
        gameOverLabel = SKLabelNode(text: "You Lose")
        gameOverLabel.position = CGPoint(x: 0, y: getScenePositionY() / 2)
        gameOverLabel.fontSize = 100
        gameOverLabel.fontColor = .white
        addChild(gameOverLabel)
        
        playAgainButton = CustomButton(iconName: "", text: "", onButtonPress: replayGame)
        
        let playAgain = getPlayAgainButton()
        
        playAgain.position = CGPoint(x: 0, y: -(getScenePositionY() / 2) - 100)
        addChild(playAgain)
    }
    
    @objc func replayGame() {
        if let view = self.view {
            let transition = SKTransition.fade(withDuration: 1)
            let scene = SKScene(fileNamed: "GameScene")
            scene!.scaleMode = .aspectFill
            view.presentScene(scene!, transition: transition)
        }
    }
}

extension GameOverScene {
    func getScenePositionY() -> CGFloat {
        guard let scenePositionY = scene?.position.y else { return 0 }
        
        return scenePositionY
    }
    
    func getPlayAgainButton() -> SKNode {
        guard let playAgain = playAgainButton else {
            return SKSpriteNode()
        }
        
        return playAgain
    }
}

