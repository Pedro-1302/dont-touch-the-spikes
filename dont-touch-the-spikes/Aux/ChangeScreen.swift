//
//  ChangeScreen.swift
//  dont-touch-the-spikes
//
//  Created by Pedro Franco on 29/12/23.
//

import Foundation
import SpriteKit

class ChangeScreen {
    static func changeScreen(sceneView: SKView, screen: String) {
        let transition = SKTransition.fade(withDuration: 1)
        if let scene = SKScene(fileNamed: screen) {
            scene.scaleMode = .aspectFill
            sceneView.presentScene(scene, transition: transition)
        }
    }
}


