//
//  Constants.swift
//  dont-touch-the-spikes
//
//  Created by Pedro Franco on 29/12/23.
//

import Foundation
import SpriteKit

class Constants {
    static let shared = Constants()

    private var birdJumpY = 280.0
    private var birdJumpX = 80.0
    
    func getBirdJumpY() -> CGFloat {
        return birdJumpY
    }
    
    func getBirdJumpX()  -> CGFloat {
        return birdJumpX
    }

    private init() {}
}
