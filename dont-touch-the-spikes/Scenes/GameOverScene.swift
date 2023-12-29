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
        createGameOverLabel()
        createPlayAgainButton()
    }
    
    @objc func replayGame() {
        if let view = self.view {
            ChangeScreen.changeScreen(sceneView: view, screen: "GameScene")
        }
    }
}

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

