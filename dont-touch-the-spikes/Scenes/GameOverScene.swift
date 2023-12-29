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

