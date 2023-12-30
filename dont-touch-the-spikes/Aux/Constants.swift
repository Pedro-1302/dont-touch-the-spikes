//
//  Constants.swift
//  dont-touch-the-spikes
//
//  Created by Pedro Franco on 29/12/23.
//

import Foundation
import SpriteKit

class Constants {
    // Singleton variable to share Constants
    static let shared = Constants()

    // Constants
    private var birdJumpValueY = 40
    private var birdJumpValueX = 25
    private var screenWidth: CGFloat { return scene?.size.width ?? 0 }
    private var screenHeight: CGFloat { return scene?.size.height ?? 0 }
    
    // Getters
    func getJumpValueY() -> Int {
        return birdJumpValueY
    }
    
    func getJumpValueX()  -> Int {
        return birdJumpValueX
    }
    
    func getScreenWidth() -> CGFloat {
        return screenWidth
    }
    
    func getScreenHeight() -> CGFloat {
        return screenHeight
    }

    private var scene: SKScene?

    private init() {}

    func setScene(_ scene: SKScene) {
        self.scene = scene
    }
}
